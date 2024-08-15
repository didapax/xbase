<?php
require "../modulo.php";

if( isset($_POST['crear']) ){
  $bytes = random_bytes(8);
	$referencia = bin2hex($bytes);
  echo $referencia;
}

if(isset($_POST['reset'])){
  if(!ifMonedaExist($_POST['moneda'])){
    sqlconector("UPDATE DATOS SET ACTIVO=0");
    sqlconector("INSERT INTO DATOS(MONEDA,ACTIVO) VALUES('{$_POST['moneda']}',1)");
  }
  refreshDatos();
}

if(isset($_POST['changue'])){
  sqlconector("UPDATE DATOS SET ACTIVO=0");
  sqlconector("UPDATE DATOS SET ACTIVO=1 WHERE ID={$_POST['moneda']}");
  refreshDatos();
}

if(isset($_POST['autosell'])){
    $estatus =0;
    if(readTrader($_POST['autosell'])['AUTOSELL']==0){
        $estatus =1;
    }
  sqlconector("UPDATE TRADER SET AUTOSELL={$estatus} WHERE ID={$_POST['autosell']}");
  refreshDatos();
}

if(isset($_POST['deletepar'])){
  sqlconector("DELETE FROM DATOS WHERE MONEDA='{$_POST['deletepar']}'");
  sqlconector("DELETE FROM PRICES WHERE MONEDA='{$_POST['deletepar']}'");
  sqlconector("UPDATE DATOS SET ACTIVO=0");
  sqlconector("UPDATE DATOS SET ACTIVO=1 WHERE MONEDA='BTCUSDT'");
}

if(isset($_POST['guardar'])){
  $moneda =  strtoupper($_POST['moneda']);
  $asset =  strtoupper($_POST['asset']);
  $inversion = row_sqlconector("SELECT SUM(COMPRA) AS SUMA FROM TRADER")['SUMA'];
  $invxcompra = number_format($_POST['capital'] / $_POST['escalones'],2,".","");
  $disponible= $_POST['capital'] - $inversion;
  $stoploss = $_POST['stop'];
  $autoshell = $_POST['precio_venta'];

  sqlconector("UPDATE DATOS SET
    MONEDA='{$moneda}',
    ASSET='{$asset}'
     WHERE MONEDA ='{$moneda}'");  

  sqlconector("UPDATE PARAMETROS SET
  CAPITAL={$_POST['capital']},
  ESCALONES={$_POST['escalones']},
  STOPLOSS={$stoploss},
  AUTOSHELL={$autoshell},
  INVXCOMPRA={$invxcompra},
  DISPONIBLE={$disponible},
  IMPUESTO={$_POST['impuesto']}
  "); 
  refreshDatos();
}

if(isset($_GET['resetPerdidas'])){
  sqlconector("UPDATE PARAMETROS SET PERDIDA=0");
}

if(isset($_GET['resetGanancias'])){
  sqlconector("UPDATE PARAMETROS SET GANANCIA=0, PERDIDA=0");
}

if(isset($_POST['borrar'])){
  $trader = readTrader($_POST['borrar']);
  $moneda = $trader['MONEDA'];
  if(strlen($trader['ORDERID']) > 0 &&
  strlen($trader['ORDERVENTA']) == 0){
    $api = new Binance\API(sqlApiKey(), sqlApiSecret());
    $api->useServerTime();
    $openorder = $api->orderStatus($moneda, readTrader($_POST['borrar'])['ORDERID']);
    if($openorder['status'] == "NEW"){
      $api->useServerTime();
      $cancelorder = $api->cancel($moneda, readTrader($_POST['borrar'])['ORDERID']);
    }
  }

  $devolucion = $trader['COMPRA'];
  $disponible = readParametros()['DISPONIBLE'];
  sqlconector("UPDATE PARAMETROS SET DISPONIBLE=".strval($disponible + $devolucion));

  sqlconector("DELETE FROM TRADER WHERE ID={$_POST['borrar']}");

  reordenarEscalones();  
  refreshDatos();
}

if(isset($_POST['negativoBuy'])){ 
  $trader = readTrader($_POST['negativo']);
  $datos = readParametros();
  $pagar = $trader['CANTIDAD'];
  $quantity = quantity($pagar,$trader['MONEDA']);
  
    $api = new Binance\API(sqlApiKey(), sqlApiSecret());
    $api->useServerTime();
    $binance = $api->marketBuy($trader['MONEDA'], $quantity);
  
    sqlconector("DELETE FROM TRADER WHERE ID={$_POST['negativo']}");
  
    $invxcompra = $datos['CAPITAL'] / $datos['ESCALONES'];
    sqlconector("UPDATE PARAMETROS SET INVXCOMPRA={$invxcompra}");
  
    reordenarEscalones();
    refreshDatos();

}

if(isset($_POST['negativo'])){
    $cantidad = $_POST['cantidad'];
    $moneda = $_POST['moneda'];
    $ganancia = 0;
    $datos= readParametros();
    $escalon = recordCount("TRADER") +1;

    if(readParametros()['BINANCE']==1){
      $api = new Binance\API(sqlApiKey(), sqlApiSecret());
      $api->useServerTime();
      $quantity = quantity(($cantidad - ($datos['IMPUESTO']/ readPrices($moneda)['ACTUAL'])),$moneda);
      $api->useServerTime();
      if($_POST['tipo']=="Limit"){
        $order = $api->sell($moneda, $quantity, $price);
      }else{
        $order = $api->marketSell($moneda, $quantity);        
      }
      $price = formatPrice(readPrices($moneda)['ACTUAL'],$moneda);

      $ganancia = $datos['GANANCIA'] + ($cantidad * readPrices($moneda)['ACTUAL']);
      $laventa = $quantity * formatPrice(readPrices($moneda)['ACTUAL'],$moneda);
      sqlconector("UPDATE PARAMETROS SET GANANCIA={$ganancia}");

      sqlconector("INSERT INTO TRADER(MONEDA,TIPO,CANTIDAD,PRECIOVENTA,GANANCIA,NEGATIVO,ESCALON) VALUES(
        '$moneda',
        'SELL',
        $cantidad,
        $price,
        $laventa,
        1,
        $escalon)");

      reordenarEscalones();
      refreshDatos();      
    }
} 

if(isset($_POST['perdida'])){
    $datos = readParametros();
    $trader = readTrader($_POST['perdida']);
    $moneda = $trader['MONEDA'];

    if($datos['BINANCE']==1){
      $escalon = recordCount("TRADER") +1;
      $api = new Binance\API(sqlApiKey(), sqlApiSecret());
      $api->useServerTime();
      $quantity = quantity(($trader['CANTIDAD'] - ($datos['IMPUESTO']/ readPrices($moneda)['ACTUAL'])),$moneda);
      $api->useServerTime();
      $order = $api->marketSell($moneda, $quantity);
    }
    liquidar($_POST['perdida']);
} 

if(isset($_POST['local'])){
  sqlconector("UPDATE PARAMETROS SET LOCAL ={$_POST['local']}");
}

if(isset($_POST['xgraf'])){
  sqlconector("UPDATE PARAMETROS SET GRAFICO ={$_POST['xgraf']}");
}

if(isset($_POST['bina'])){
  sqlconector("UPDATE PARAMETROS SET BINANCE ={$_POST['bina']}");
}

if(isset($_POST['agregar'])){
  $moneda = $_POST['moneda'];
  $datos = readParametros(); 
  $quantity = quantity($_POST['cantidad'],$moneda);
  $price = formatPrice($_POST['preciocompra'],$moneda);
  $escalon = recordCount("TRADER") +1;

  if($datos['BINANCE']==1){
    $api = new Binance\API(sqlApiKey(), sqlApiSecret());
    $api->useServerTime();
    if($_POST['tipo']=="Limit"){
      $binance = $api->buy($moneda, $quantity, $price);
    }else{
      $binance = $api->marketBuy($moneda, $quantity);
      $price = formatPrice(readPrices($moneda)['ACTUAL'],$moneda);
    }    
    if(isset($binance['orderId'])){
      sqlconector("INSERT INTO TRADER(MONEDA,ORDERID,COMPRA,CANTIDAD,PRECIOCOMPRA,ESCALON) VALUES(
        '{$moneda}',
        '{$binance['orderId']}',
        {$_POST['compra']},
        {$quantity},
        {$price},
        {$escalon}
      )");
    }else{
      echo "error: 0001"; 
    }
  }

  $capital = $datos['CAPITAL'];
  $inversion = row_sqlconector("SELECT SUM(COMPRA) AS SUMA FROM TRADER")['SUMA'];
  sqlconector("UPDATE PARAMETROS SET DISPONIBLE=".strval($capital - $inversion));

  refreshDatos();
}

if(isset($_GET['getpante'])){ 
  $row = readDatos(); 
  $moneda=$row['MONEDA'];
  $precio = $_GET['nprice'];
  $puntos = readParametros()['STOPLOSS'];
  $pante = price(calcularMargenPerdida($precio,$puntos)); 
  $obj = array('pante' => $pante,'moneda' => $moneda,'puntos' => $puntos); 
  
  echo json_encode($obj);   
}

if(isset($_GET['getPriceBinance'])){
  if( isset($_GET['auto']) ){
    if(readParametros()['LOCAL']==1){
      refreshDataAuto();
    }
  }
    
  echo readParametros()['DATOS']; 
}

if( isset($_GET['binancex']) ){
  $api = new Binance\API(sqlApiKey(), sqlApiSecret());
      $api->useServerTime();
      $balances = $api->balances();
      echo "BNB owned: ".$balances['BNB']['available']."\n";
      echo "Estimated Value: ".$api->btc_value." BTC\n";

      $openorders = $api->openOrders("HNTUSDT");
      print_r($openorders);
}

if( isset($_POST['info']) ){
  $moneda =  readTrader($_POST['info'])['MONEDA'];
  $precio = readPrices($moneda)['ACTUAL'];

  $obj = array('asset' => $moneda, 'price' => $precio);
  echo json_encode($obj);   
}
?>
