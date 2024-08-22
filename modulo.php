<?php
require "init.php"; 
require "php-binance-api.php";
date_default_timezone_set("UTC");

function getRealIpAddr(){
  $ipaddress = '';
  if (getenv('HTTP_CLIENT_IP'))
    $ipaddress = getenv('HTTP_CLIENT_IP');
  else if(getenv('HTTP_X_FORWARDED_FOR'))
    $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
  else if(getenv('HTTP_X_FORWARDED'))
    $ipaddress = getenv('HTTP_X_FORWARDED');
  else if(getenv('HTTP_FORWARDED_FOR'))
    $ipaddress = getenv('HTTP_FORWARDED_FOR');
  else if(getenv('HTTP_FORWARDED'))
    $ipaddress = getenv('HTTP_FORWARDED');
  else if(getenv('REMOTE_ADDR'))
    $ipaddress = getenv('REMOTE_ADDR');
  else
    $ipaddress = 'UNKNOWN';
  return $ipaddress;
}

function getSession($usuario){
  $row;
  $consulta = "SELECT * FROM USER WHERE USUARIO='{$usuario}'";
  $conexion = mysqli_connect($GLOBALS["servidor"],$GLOBALS["user"],$GLOBALS["password"],$GLOBALS["data"]);
  if (!$conexion) {
    echo "Refresh page, Failed to connect to Data: " . mysqli_connect_error();
    exit();
  }else{
    if($resultado = mysqli_query( $conexion, $consulta )){
      $row = mysqli_fetch_array($resultado);
      mysqli_close($conexion);
    }
    return $row;    
  }    
}

function latinFecha($fecha){
  $date=date_create($fecha);
  return date_format($date,"d/M h:ia");
}

function readDatos(){
 return row_sqlconector("select * from DATOS WHERE ACTIVO=1");
}

function readDatosMoneda($moneda){
  return row_sqlconector("select * from DATOS WHERE MONEDA='{$moneda}'");
}

function readDatosMonedaId($id){
  return row_sqlconector("select * from DATOS WHERE ID={$id}");
}

function readDatosAsset($asset){
  return row_sqlconector("select * from DATOS WHERE ASSET='{$asset}'");
}

function readParametros(){
  return row_sqlconector("select * from PARAMETROS");
}

function redo($valor){
  return number_format($valor,0,"","");
} 

function price($price){
  if($price >= 1)
    return number_format($price,2,".","");
  return number_format($price,4,".","");
}

function formatPrice($valor, $asset, $par) {
  // Verificar si $par es "USDT" o "USDC"
  if ($par == "USDT" || $par == "USDC") {
      // Seleccionar el formato basado en el valor de $asset
      switch ($asset) {
          case "ADA":
          case "MATIC":
              return number_format($valor, 4, ".", "");
          case "TRX":
          case "DOGE":
              return number_format($valor, 5, ".", "");
          case "RUNE":
          case "ATOM":
          case "NEAR":
          case "INJ":
              return number_format($valor, 3, ".", "");
          case "BTC":
          case "ETH":
          case "LTC":
              return number_format($valor, 2, ".", "");
          case "BNB":
              return number_format($valor, 1, ".", "");
          case "PAXG":
              return number_format($valor, 0, ".", "");
          default:
              return $valor; // Manejar el caso por defecto
      }
  } else {
      // Manejar el caso cuando $par no es "USDT" o "USDC"
      return $valor;
  }
}

function  quantity($valor,$asset,$par){
    // Verificar si $par es "USDT" o "USDC"
    if ($par == "USDT" || $par == "USDC") {
      // Seleccionar el formato basado en el valor de $asset
      switch ($asset) {
        case "BTC":
          return number_format($valor,5,".","");
        case "ETH":
        case "PAXG":        
          return number_format($valor,4,".","");
        case "BNB":
        case "LTC":
          return number_format($valor,3,".","");
        case "MATIC":
        case "TRX":
        case "RUNE":        
        case "ADA":
        case "NEAR":
        case "INJ":
          return number_format($valor,1,".","");
        case "DOGE":
        case "SHIB":
          return number_format($valor,0,"","");
        default:
          return number_format($valor,2,".","");
      }
  } else {
      // Manejar el caso cuando $par no es "USDT" o "USDC"
      return $valor;
  }
}

function currency($price){
  if($price >= 1)
    return number_format($price,2,".",",");
  return number_format($price,4,".",",");
}

function porcenConjunto($min, $max, $variable) {
  $maxcien = $max - $min; 
  $conjunto = $variable - $min; 
  if($conjunto < 0) $conjunto = 0;
  if($maxcien == 0) $maxcien = 1;
  $resultado = ($conjunto * 100) / $maxcien;
  if($resultado > 100) $resultado = 100;
  if($min > $max) $resultado = 100;
  return number_format($resultado,0,"","");
}

function recordCount($table){
  return row_sqlconector("SELECT Count(*) as SUMA FROM ".$table)['SUMA'];
}

function recordCountInterval($table,$moneda){
  return row_sqlconector("SELECT Count(*) as SUMA FROM {$table} WHERE MONEDA ='{$moneda}'")['SUMA'];
}

function reordenarEscalones(){
  $i=1;
  $precioPante="";
  if(recordCount("TRADER")>0){
    $conexion = mysqli_connect($GLOBALS["servidor"],$GLOBALS["user"],$GLOBALS["password"],$GLOBALS["database"]);
    if (!$conexion) {
      echo "Refresh page, Failed to connect to Data...";
      exit();
    }else{
      $consulta = "select * from TRADER ORDER BY FECHA";
      $resultado = mysqli_query( $conexion, $consulta );
      while($row = mysqli_fetch_array($resultado)){
        sqlconector("UPDATE TRADER SET ESCALON={$i} WHERE ID={$row['ID']}");
        $i++;        
      }
      mysqli_close($conexion);
    }
  }
}

// Función para calcular el margen de ganancia
function calcularMargenGanancia($precioActual, $margen) {
  $precioGanancia = $precioActual * (1 + $margen / 100);
  return $precioGanancia;
}

// Función para calcular el margen de pérdida
function calcularMargenPerdida($precioActual, $margen) {
  $precioPerdida = $precioActual * (1 - $margen / 100);
  return $precioPerdida;
}

function ifOrderExist($order) {
  if(row_sqlconector("select COUNT(*) AS TOTAL from TRADER where ORDERID='{$order}' AND LIQUIDAR=0")['TOTAL']==1 )
  return TRUE;
  return FALSE;
}

function ifMonedaExist($moneda) {
if(row_sqlconector("select COUNT(*) AS TOTAL from DATOS where MONEDA='{$moneda}'")['TOTAL']==1 )
return TRUE;
return FALSE;
}

function readOrderCompraTrader($order){
return row_sqlconector("select * from TRADER where ORDERID='{$order}'");
}

function sellOrder($order){
  if(ifOrderExist($order)){
    $row = readOrderCompraTrader($order);
    $api = new Binance\API(sqlApiKey(), sqlApiSecret());
    $moneda = $row['MONEDA'];
    $api->useServerTime();
    $openorder = $api->orderStatus($moneda, $order);
    if($openorder['status'] == "FILLED"){
      $bytes = random_bytes(5);
      $referencia = bin2hex($bytes);
      sqlconector("UPDATE TRADER SET ORDERVENTA='{$referencia}', LIQUIDAR=1 WHERE ID={$row['ID']}");
      refreshDatos();
    }
  }
}

function autoLiquida($id){
  $row = row_sqlconector("SELECT * FROM TRADER WHERE ID={$id}");
  $param = readParametros();
  $moneda = $row['MONEDA'];
  $price = $row['PRECIOCOMPRA'];
  $datos = readDatosMoneda($moneda);
  $operacion = ($row['CANTIDAD'] - $param['IMPUESTO']) / readPrices($moneda)['ACTUAL'];
  $quantity = quantity($operacion,$datos['ASSET'],$datos['PAR']);

  if($row['TIPO'] == "BUY"){
      $stopPrice = calcularMargenPerdida($price,$param['STOPLOSS']);      
      $api = new Binance\API(sqlApiKey(), sqlApiSecret());
      //AQUI VA LA LOGICA DEL STOPLOS QUE NO PIDE PERMISOS SINO QUE VENDE RAPIDAMENTE
      if(readPrices($moneda)['ACTUAL'] <= $stopPrice){
        $api->useServerTime();
        $api->useServerTime();
        $order = $api->marketSell($moneda, $quantity);
        if(isset($order['orderId'])){
          liquidar($id);
        }
      }    
  }
  else{
      $stopPrice = calcularMargenGanancia($price,$param['STOPLOSS']);      
      $api = new Binance\API(sqlApiKey(), sqlApiSecret());
      //AQUI VA LA LOGICA DEL STOPLOS QUE NO PIDE PERMISOS SINO QUE COMPRA RAPIDAMENTE
      if(readPrices($moneda)['ACTUAL'] >= $stopPrice){
        $api->useServerTime();
        $api->useServerTime();
        $order = $api->marketBuy($moneda, $quantity);
        if(isset($order['orderId'])){
          liquidar($id);
        }
      }    
  }

  //AQUI VA LA LOGICA SI LA VENTA O LA COMPRA ESTA AUTOMATICA O MANUAL
  if($row['AUTOSELL']==1){
    if($row['TIPO'] == "BUY"){
        $autoSell = calcularMargenGanancia($price,$param['AUTOSHELL']);
        if(readPrices($moneda)['ACTUAL'] > $autoSell){
          $api->useServerTime();
          $order = $api->marketSell($moneda, $quantity);
          if(isset($order['orderId'])){
              liquidar($id);
          }            
      }
    }
    else{
        $autoSell = calcularMargenPerdida($price,$param['AUTOSHELL']);
        if(readPrices($moneda)['ACTUAL'] < $autoSell){
          $api->useServerTime();
          $order = $api->marketBuy($moneda, $quantity);
          if(isset($order['orderId'])){
              liquidar($id);
          }            
        }
    }
  }
}

function liquidar($id){  
  $row = row_sqlconector("SELECT * FROM TRADER WHERE ID={$id}");
  $asset = readDatosMoneda($row['MONEDA']);
  if($row['TIPO'] == "BUY"){
    $datos= readParametros();
    $moneda = $row['MONEDA'];
    $precioVenta = readPrices($moneda)['ACTUAL'];
    $compra = $row['COMPRA'];
    $operacion = ($row['CANTIDAD'] - $datos['IMPUESTO']) / readPrices($moneda)['ACTUAL'];
    $cantidad = quantity($operacion,$asset['ASSET'],$asset['PAR']);
    $newventa =  $cantidad * $precioVenta;
    $newganancia = 0;
    $newperdida = 0;
  
    if($newventa < $compra){
      $newperdida = $compra - $newventa;
    }
    else{
      $newganancia = $newventa - $compra;
    }
  
    $capital = $datos['CAPITAL'];
    $ganancia = $datos['GANANCIA'] + $newganancia;
    $perdida = $datos['PERDIDA'] + $newperdida;
    $ajuste = $ganancia - $perdida;
  
    if($ajuste < 0){
      $ganancia=0;
      $perdida=0;
      $capital = $datos['CAPITAL'] + $ajuste;
    }
    
    sqlconector("UPDATE PARAMETROS SET GANANCIA={$ganancia},PERDIDA={$perdida},CAPITAL={$capital}");
    sqlconector("UPDATE DATOS SET ULTIMAVENTA={$precioVenta} WHERE MONEDA='{$moneda}'");
    sqlconector("DELETE FROM TRADER WHERE ID={$id}");
  
    $inversion = row_sqlconector("SELECT SUM(COMPRA) AS SUMA FROM TRADER")['SUMA'];
    sqlconector("UPDATE PARAMETROS SET DISPONIBLE=".strval($capital - $inversion));
  
    $invxcompra = $capital / $datos['ESCALONES'];
    sqlconector("UPDATE PARAMETROS SET INVXCOMPRA={$invxcompra}");
  }
  reordenarEscalones();
  refreshDatos();
}

function readTrader($id){
  return row_sqlconector("select * from TRADER where ID=".$id);
}

function ifNotDayExists($tabla,$moneda){
    $interval = row_sqlconector("SELECT DAY(NOW()) AS DIA, MONTH(NOW()) AS MES, YEAR(NOW()) AS ANO");
    $fecha1 = "{$interval['ANO']}-{$interval['MES']}-{$interval['DIA']} 00:00";
    $fecha2 = "{$interval['ANO']}-{$interval['MES']}-{$interval['DIA']} 23:59";
    if (row_sqlconector("select COUNT(*) AS TOTAL from {$tabla} WHERE MONEDA='{$moneda}' AND FECHA BETWEEN '{$fecha1}' AND '{$fecha2}'")['TOTAL'] == 0)
    return TRUE;
    return FALSE;
}

function updatePrices($moneda,$valores){
  sqlconector("UPDATE PRICES SET {$valores} WHERE MONEDA='{$moneda}' AND DAY(FECHA)= DAY(CURRENT_TIMESTAMP()) AND MONTH(FECHA)= MONTH(CURRENT_TIMESTAMP()) AND YEAR(FECHA)= YEAR(CURRENT_TIMESTAMP())");
}

function readPrices($moneda){
  if(ifNotDayExists("PRICES",$moneda)){
    if(strlen($moneda)>0){
      sqlconector("INSERT INTO PRICES(MONEDA) VALUES('{$moneda}')");
    }
  }
  return row_sqlconector("select * from PRICES WHERE MONEDA='{$moneda}' AND DAY(FECHA)= DAY(CURRENT_TIMESTAMP()) AND MONTH(FECHA)= MONTH(CURRENT_TIMESTAMP()) AND YEAR(FECHA)= YEAR(CURRENT_TIMESTAMP())");
}

function readFlotadorAnterior($moneda){
  if(isset(row_sqlconector("select ARRIBA from PRICES WHERE MONEDA='{$moneda}' AND DAY(FECHA)= DAY(CURRENT_TIMESTAMP()  - INTERVAL 1 DAY) AND MONTH(FECHA)= MONTH(CURRENT_TIMESTAMP()) AND YEAR(FECHA)= YEAR(CURRENT_TIMESTAMP())")['ARRIBA'])){
    return row_sqlconector("select ARRIBA from PRICES WHERE MONEDA='{$moneda}' AND DAY(FECHA)= DAY(CURRENT_TIMESTAMP()  - INTERVAL 1 DAY) AND MONTH(FECHA)= MONTH(CURRENT_TIMESTAMP()) AND YEAR(FECHA)= YEAR(CURRENT_TIMESTAMP())")['ARRIBA'];
  }
  else{
    return row_sqlconector("select ARRIBA from PRICES WHERE MONEDA='{$moneda}' AND DAY(FECHA)= DAY(CURRENT_TIMESTAMP()) AND MONTH(FECHA)= MONTH(CURRENT_TIMESTAMP()) AND YEAR(FECHA)= YEAR(CURRENT_TIMESTAMP())")['ARRIBA'];
  }  
}

function readMinAnterior($moneda){
  if(isset(row_sqlconector("select ABAJO from PRICES WHERE MONEDA='{$moneda}' AND DAY(FECHA)= DAY(CURRENT_TIMESTAMP()  - INTERVAL 1 DAY) AND MONTH(FECHA)= MONTH(CURRENT_TIMESTAMP()) AND YEAR(FECHA)= YEAR(CURRENT_TIMESTAMP())")['ABAJO'])){
    return row_sqlconector("select ABAJO from PRICES WHERE MONEDA='{$moneda}' AND DAY(FECHA)= DAY(CURRENT_TIMESTAMP()  - INTERVAL 1 DAY) AND MONTH(FECHA)= MONTH(CURRENT_TIMESTAMP()) AND YEAR(FECHA)= YEAR(CURRENT_TIMESTAMP())")['ABAJO'];
  }
  else{
    return row_sqlconector("select ABAJO from PRICES WHERE MONEDA='{$moneda}' AND DAY(FECHA)= DAY(CURRENT_TIMESTAMP()) AND MONTH(FECHA)= MONTH(CURRENT_TIMESTAMP()) AND YEAR(FECHA)= YEAR(CURRENT_TIMESTAMP())")['ABAJO'];
  }  
}

function readMinAnterior_Interval($moneda,$interval){
  if(isset(row_sqlconector("select ABAJO from PRICES WHERE MONEDA='{$moneda}' AND DAY(FECHA)= DAY(CURRENT_TIMESTAMP()  - INTERVAL {$interval} DAY) AND MONTH(FECHA)= MONTH(CURRENT_TIMESTAMP()) AND YEAR(FECHA)= YEAR(CURRENT_TIMESTAMP())")['ABAJO'])){
    return row_sqlconector("select ABAJO from PRICES WHERE MONEDA='{$moneda}' AND DAY(FECHA)= DAY(CURRENT_TIMESTAMP()  - INTERVAL {$interval} DAY) AND MONTH(FECHA)= MONTH(CURRENT_TIMESTAMP()) AND YEAR(FECHA)= YEAR(CURRENT_TIMESTAMP())")['ABAJO'];
  }
  else{
    return row_sqlconector("select ABAJO from PRICES WHERE MONEDA='{$moneda}' AND DAY(FECHA)= DAY(CURRENT_TIMESTAMP()) AND MONTH(FECHA)= MONTH(CURRENT_TIMESTAMP()) AND YEAR(FECHA)= YEAR(CURRENT_TIMESTAMP())")['ABAJO'];
  }  
}

function dayTendencia($moneda){
  $tendencia = "";
  $priceArriba = readPrices($moneda)['ARRIBA'];
  if($priceArriba > readFlotadorAnterior($moneda)){
    updateTendenciaAlcista($moneda);
    $tendencia = "<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>";
  }else{
    updateTendenciaBajista($moneda);
    $tendencia = "<span style=color:#EA465C;font-weight:bold;>&#9660;</span>";
  }
  return $tendencia;
}

function dayTendenciaAnalog($moneda){
  $tendencia = "0";
  $priceArriba = readPrices($moneda)['ARRIBA'];
  if($priceArriba > readFlotadorAnterior($moneda)){
    $tendencia = "1";
  }else{
    $tendencia = "0";
  }
  return $tendencia;
}

function totalTendencia($moneda){
  $bajista = row_sqlconector("select SUM(BAJISTA) AS ROJO from PRICES WHERE MONEDA='{$moneda}'")['ROJO'];
  $alcista = row_sqlconector("select SUM(ALCISTA) AS VERDE from PRICES WHERE MONEDA='{$moneda}'")['VERDE'];
  $tendencia = "";
  if($alcista > $bajista){
    $tendencia = "<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>";
  }else{
    $tendencia = "<span style=color:#EA465C;font-weight:bold;>&#9660;</span>";
  }
  return $tendencia;
}

function updateTendenciaBajista($moneda){ 
  if(!ifNotDayExists("PRICES",$moneda)){
    updatePrices($moneda,"BAJISTA = 1, ALCISTA=0");
  }
}

function updateTendenciaAlcista($moneda){
  if(!ifNotDayExists("PRICES",$moneda)){
    updatePrices($moneda,"BAJISTA = 0, ALCISTA=1");
  }
}

function nivel($moneda){
  $nprice = readPrices($moneda);
  $asset = "SELL"; 
  $min= 0;
  $max= 0;
  $actual = $nprice['ACTUAL'];

  if($nprice['ARRIBA'] < readFlotadorAnterior($moneda)){
    $min = $nprice['ARRIBA'];
    $max = readFlotadorAnterior($moneda);
  }else{
    $min = readFlotadorAnterior($moneda);
    $max = $nprice['ARRIBA'];
  }

  $porcenmax = (porcenConjunto($min,$max,$actual)*3.6)."deg";  
  $nivel = "<div class=odometros style=--data:{$porcenmax};><div id=grad2>{$asset}</div></div>";

  return $nivel;
}

function nivelCompra($moneda){  
  $alerta = returnAlertas($moneda);
  $asset = "BUY";
  $nivel="<div class=odometroalert style=--color1:#F6465D;--data1:-80deg;--color2:#F6465D;--data2:-220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>{$asset}</div></div>";
/*  if($alerta == "yellow"){
    $nivel="<div class=odometroalert style=--color1:#F6465D;--data1:80deg;--color2:#F6465D;--data2:-220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>{$asset}</div></div>";
  }*/
  if($alerta == "yellow"){
    $nivel="<div class=odometroalert style=--color1:#F6465D;--data1:80deg;--color2:#F6465D;--data2:220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>{$asset}</div></div>";
  }
  if($alerta == "red"){
    $nivel="<div class=odometroalert style=--color1:#F6465D;--data1:80deg;--color2:#F6465D;--data2:220deg;--color3:#F6465D;--data3:360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>{$asset}</div></div>";
  }

  return $nivel; 
}

function returnAlertas($moneda){
  $readPrice = readPrices($moneda);
  $precio = $readPrice['ACTUAL'];
  $priceArriba= $readPrice['ARRIBA'];
  $priceAbajo= $readPrice['ABAJO']; 
  
  $variable = "black"; //sin alerta
  
  $porcenmax = porcenConjunto($priceAbajo, $priceArriba, $precio);
  $stop=0; 
  if($priceAbajo < readMinAnterior($moneda)){
    $stop=1; //stop de alerta de compra
    $variable = "red";
  }

  //logica de las alerta de venta y sus niveles de posible compras de acuerdo a su posicion. 
  if($porcenmax > 33 && $porcenmax < 89 && $stop==0){
    $variable = "green"; //alerta de venta
  }

  if( $porcenmax > 12 && $porcenmax < 34 && $stop==0 ){
    $variable = "orange"; //intension de subir
  }
  
  if($porcenmax > 1 && $porcenmax < 13 && $stop==0){
    $variable = "yellow"; //se puede comprar
  }

  return $variable;  
}

function nivelBtc(){
  $asset =  readDatosAsset("BTC");
  $nprice = readPrices($asset['MONEDA']);
  $min= 0;
  $max= 0;

  if($nprice['ARRIBA'] < readFlotadorAnterior($asset['MONEDA'])){
    $min = $nprice['ARRIBA'];
    $max = readFlotadorAnterior($asset['MONEDA']);
  }else{
    $min = readFlotadorAnterior($asset['MONEDA']);
    $max = $nprice['ARRIBA'];
  }

  $porcenmax = (porcenConjunto(price($min), price($max), $nprice['ACTUAL']) *3.6 )."deg";
  $nivel = "<div class=odometrosBtc style=--data:{$porcenmax};><div id=grad2>BTC</div></div>";

  return $nivel;
}

function nivelAnterior($moneda){
  $nprice = readPrices($moneda);
  $asset = "BUY";
  $min= 0;
  $max= 0;

  if($nprice['ABAJO'] < readMinAnterior($moneda)){
    $min = $nprice['ABAJO'];
    $max = readMinAnterior($moneda);
  }else{
    $min = readMinAnterior($moneda);
    $max = $nprice['ABAJO'];
  }

  $porcenmax = (porcenConjunto(price($min), price($max), $nprice['ABAJO']) *3.6 )."deg";
  $nivel = "<div class=odometros style=--data:{$porcenmax};><div id=grad2>{$asset}</div></div>";

  return $nivel; 
}

function sqlApiKey(){
  return readParametros()['APIKEY'];
}

function sqlApiSecret(){
  return readParametros()['SECRET'];
}

function totalmoneda($moneda){
  $totalMoneda="0";
  $totalInversion="0";
  $datos =readDatosMoneda($moneda);
  $price = readPrices($moneda)['ACTUAL'];
  $estado = "";
  $bk="";
  
  if(row_sqlconector("select COUNT(*) AS TOTAL from TRADER where MONEDA='{$moneda}'")['TOTAL'] > 0){

    $totalMoneda = price(row_sqlconector("SELECT SUM(CANTIDAD) AS SUMA FROM TRADER WHERE MONEDA='{$moneda}' AND LENGTH(ORDERVENTA) > 0")['SUMA']);
    $totalInversion = price(row_sqlconector("SELECT SUM(COMPRA) AS SUMA FROM TRADER WHERE MONEDA='{$moneda}' AND LENGTH(ORDERVENTA) > 0")['SUMA']);

    if($totalMoneda == 0){
      $estado = "Buy";
      $totalMoneda = 0;
    }else{
      $estado = "Sell";      
    }

    $totalFiat = price($totalMoneda *  $price);
  }
  else{
    $estado = "Buy";
    $totalMoneda = 0;
    $totalFiat = price($totalMoneda *  $price);
  }

  $symbol = "&#9660;";
  if($totalInversion < $totalFiat){
    $color = "#4BC883";
    $bk = "#15342D";
    $symbol = "&#9650;";
  }
  else{
    $color = "#F37A8B";
    $bk = "#372127";
    $symbol = "&#9660;"; 
  }

  $t_balance = currency($totalMoneda);

  if($t_balance > $datos['BALANCE_ASSET']){
    $m_balance = currency($totalMoneda - $datos['BALANCE_ASSET']);
  }else{
    $m_balance = currency($datos['BALANCE_ASSET'] - $totalMoneda);
  }

  $t_moneda = "<div style=width:100%;padding:3px;background:{$bk};border-radius:3px;color:{$color};>".currency($totalMoneda)." {$datos['ASSET']} <span style=color:{$color};>{$symbol}</span></div>";

  return array('total' => $t_moneda,'t_balance' => $t_balance,'m_balance' => $m_balance,'fiat' => currency($totalFiat));
}

function totales($moneda){
  $price = readPrices($moneda)['ACTUAL'];
  $total = number_format(row_sqlconector("SELECT SUM(CANTIDAD) AS SUMA FROM TRADER WHERE MONEDA='{$moneda}' AND LENGTH(ORDERVENTA) > 0")['SUMA'],2,".","");
 
  $capital = number_format(readParametros()['CAPITAL'],2,".","");
  $disponible = number_format(readParametros()['DISPONIBLE'],2,".","");
  $recupera = 0;
  $color = "#4DCB85";
  for($i = 0.1; $i <= 100; $i++){
    if(($total * calcularMargenGanancia($price,$i)+$disponible) >= $capital){
      $recupera = number_format(calcularMargenGanancia($price,$i),2,".","");
      break;
    }
  }
  if($recupera > $price) $color = "#EA465C";
  return array('cripto' => $total,'recupera' => $recupera,'color' => $color );
}

function refreshDataAuto(){
  $conexion = mysqli_connect($GLOBALS["servidor"],$GLOBALS["user"],$GLOBALS["password"],$GLOBALS["database"]);
  if (!$conexion) {
    echo "Refresh page, Failed to connect to Data...";
    exit();
  }else{
    $api = new Binance\API(sqlApiKey(), sqlApiSecret());
    $api->useServerTime();
    $price = $api->prices();
    $api->useServerTime();
    $balances = $api->balances();

    if(recordCount("ORDERBINANCE")>0){
      $foraneo = mysqli_query( $conexion, "DELETE FROM ORDERBINANCE" );
    }
    
    $consulta = "select * from DATOS";
    $resultado = mysqli_query( $conexion, $consulta );
    while($row = mysqli_fetch_array($resultado)){        
      $asset = $row['ASSET'];    
      $available_mon=$row['MONEDA'];
      $available = $price[$available_mon];
      $axie = readPrices($available_mon);
      $priceArriba = formatPrice($axie['ARRIBA'],$row['ASSET'],$row['PAR']);
      $priceAbajo = formatPrice($axie['ABAJO'],$row['ASSET'],$row['PAR']);
      updatePrices($available_mon,"ACTUAL={$available}");

      if( $priceArriba == 0){
        updatePrices($available_mon,"ARRIBA={$available}");
      }
    
      if( $priceAbajo == 0){
        updatePrices($available_mon,"ABAJO={$available}");
      }
      
      if( $priceArriba <  $available){
        updatePrices($available_mon,"ARRIBA={$available}");
      }
       
      if( $priceAbajo >  $available){
        updatePrices($available_mon,"ABAJO={$available}");
      }

      if(row_sqlconector("select COUNT(*) AS TOTAL from TRADER where MONEDA='{$available_mon}'")['TOTAL'] > 0){
        $api->useServerTime();
        $openorders = $api->openOrders($available_mon);
              
        foreach ($openorders as &$order) {
          $foraneo = mysqli_query( $conexion, "INSERT INTO ORDERBINANCE(MONEDA,ORDERID,TIPO,ESTATUS,PRECIO,CANTIDAD) VALUES('{$order['symbol']}','{$order['orderId']}','{$order['side']}','{$order['status']}',{$order['price']},{$order['origQty']})");
        }
        unset($order);   
      }
      $foraneo = mysqli_query( $conexion, "UPDATE DATOS SET BALANCE_ASSET=".$balances[$asset]['available']." WHERE MONEDA='{$available_mon}'");
    }
    mysqli_close($conexion);
    refreshDatos();    
  }
}

function returnGrafica($moneda){
  $conexion = mysqli_connect($GLOBALS["servidor"],$GLOBALS["user"],$GLOBALS["password"],$GLOBALS["database"]);
  if (!$conexion) {
    echo "Refresh page, Failed to connect to Data...";
    exit();
  }else{
    $tiger = "";
    $interval = 30;
    if(recordCountInterval("PRICES",$moneda) > $interval){
      $ofset = recordCountInterval("PRICES",$moneda) - $interval;
      $tiger = "LIMIT {$ofset},{$interval}";
    }
    
    if(readParametros()['GRAFICO'] == 0){
      $consulta = "select * from PRICES WHERE MONEDA = '{$moneda}' ORDER BY FECHA ASC {$tiger}";
    }else{
      $consulta = "select * from PRICES WHERE MONEDA = '{$moneda}' ORDER BY FECHA ASC";
    }
    
    $resultado = mysqli_query( $conexion, $consulta );
    $grafica= array(array());
    $grafica[0][0]="Min";
    $grafica[1][0]="Max";
    $i=1;
    while($row = mysqli_fetch_array($resultado)){
      $miVar = "".$row['ABAJO']."-".$row['ARRIBA'];
      if($miVar != "0-0"){
        $grafica[0][$i] = $row['ABAJO'];
        $grafica[1][$i] = $row['ARRIBA'];
        $i++;
      }
    }

    mysqli_close($conexion);
    return $grafica;
  }  
}

function listAsset(){
  $cadena="";
  $conexion = mysqli_connect($GLOBALS["servidor"],$GLOBALS["user"],$GLOBALS["password"],$GLOBALS["database"]);
  if (!$conexion) {
    echo "Refresh page, Failed to connect to Data...";
    exit();
  }else{
    $consulta = "select * from DATOS";
    $resultado = mysqli_query( $conexion, $consulta );
    $cadena = "<table style=text-align:right;width:100%;><th></th><th></th>";
    while($row = mysqli_fetch_array($resultado)){
      $moneda = $row['MONEDA'];
      $promedioFlotante = row_sqlconector("SELECT (SUM(ARRIBA) / COUNT(*)) AS PROMEDIO FROM  PRICES WHERE MONEDA='{$moneda}'")['PROMEDIO'];
      $color = "red";
      $colorAlerta = returnAlertas($moneda);
      $asset = $row['ASSET'];
      $elid = $row['ID'];
      $price = formatPrice(readPrices($moneda)['ACTUAL'],$row['ASSET'],$row['PAR']);
      if($price < $promedioFlotante){
        $color = "#F37A8B";
      }
      else{
          $color = "#4BC883";
      }     
      
      $cadena = $cadena ."<tr><td><span onclick=moneyChangue({$elid}) style=cursor:pointer;color:{$color};>{$asset}</span></td><td><span style=color:{$color};font-weight:bold;>".formatPrice($price,$row['ASSET'],$row['PAR'])."</span></td><td><span class=bolita style=color:{$colorAlerta};>&#9679;</span></td></tr>";
    }
    $cadena = $cadena ."</table>";
  }
    mysqli_close($conexion);    
    return $cadena; 
}

function findEscalones(){
  $didable_button="";
  $didable_cancel_button="";
  $fecha = "";
  $colorAlert = "transparent";
  $colorRow = "transparent";
  $miganancia = 0;  
  $precioActual = 0;
  $botones = "";
  $cadena = "<table style=width:100%;><th>Stop</th><th>Compra</th><th>Price</th><th>Wallet</th><th style=text-align:right;>Ganancia</th><th>Opciones</th>";  
  if(recordCount("TRADER")>0){
    $conexion = mysqli_connect($GLOBALS["servidor"],$GLOBALS["user"],$GLOBALS["password"],$GLOBALS["database"]);
    if (!$conexion) {
      echo "Refresh page, Failed to connect to Data...";
      exit();
    }else{      
      $consulta = "select * from TRADER ORDER BY ESCALON";
      $resultado = mysqli_query( $conexion, $consulta );
      $puntos = readParametros()['STOPLOSS'];
      while($row = mysqli_fetch_array($resultado)){
        $colorAlert = "#CFCFD3";
        $colorRow = "transparent";
        $available = readPrices($row['MONEDA']);
        $datos = readDatosMoneda($row['MONEDA']);
        $precioActual = formatPrice($available['ACTUAL'],$datos['ASSET'],$datos['PAR']);
        $precioMoneda = formatPrice($precioActual,$datos['ASSET'],$datos['PAR']);
        $stopPrice = calcularMargenPerdida($row['PRECIOCOMPRA'],$puntos);
        $precioAbajo = $available['ABAJO'];
        $porcenmax = (porcenConjunto(price($stopPrice), price($row['PRECIOCOMPRA']), $precioActual) *3.6 )."deg";

        if($row['PRECIOCOMPRA'] > $precioActual){
          $colorAlert = "#F37A8B";
        }
        else{
          $colorAlert = "#4BC883";
        }

        if(readParametros()['BINANCE']==1){
          if(strlen($row['ORDERVENTA'])>0){
            $miganancia = ($row['CANTIDAD'] * $precioActual) - ($row['CANTIDAD'] * $row['PRECIOCOMPRA']);            
            $didable_button="";
            $didable_cancel_button = "disabled";
            if($row['AUTOSELL']==1){
                $didable_ckecked_button = "checked";
            }
            else {
                $didable_ckecked_button = "";
            }
          }
          else{
            $miganancia = 0;
            $colorAlert = "#CFCFD3";
            $didable_button="disabled";
            $didable_cancel_button = "";
          }
        }

        if(readParametros()['LOCAL']==1){
          if(strlen($row['ORDERID']) > 0){
            sellOrder($row['ORDERID']);
          }
          autoLiquida($row['ID']);
          $miganancia = ($row['CANTIDAD'] * $precioActual) - $row['COMPRA'];
        }

        if($row['NEGATIVO']==1){
            $laventa = $row['CANTIDAD'] * $row['PRECIOVENTA'];
          $real_ganancia = currency($laventa -($row['CANTIDAD'] * $precioMoneda) );
          if($real_ganancia > 0){
            $bk=  "#15342D";
            $fg= "#4BC883";
            $sy= "&#9650;";
            $porcenMaxNeg = "360deg";
          }else{
            $bk=  "#372127";
            $fg= "#F37A8B";
            $sy= "&#9660;";
            $porcenMaxNeg = "0deg";
          }
          $wall = "<div style=width:100%;padding:3px;background:{$bk};border-radius:3px;color:{$fg};>".quantity($row['CANTIDAD'],$datos['ASSET'],$datos['PAR'])." ".$datos['ASSET']."<span style=color:{$fg};> {$sy}</span></div>";
          $botones = "<input title='Auto' type=checkbox {$didable_ckecked_button} class=escalbutton style=background:#EAB92B;width:21px; onclick=autosell(".$row['ID'].")><button type=button class=escalbutton style=background:green;color:white; onclick=negativoBuy(".$row['ID'].")>Buy</button>";
          $cadena = $cadena . "<tr style=background:transparent;color:white;><td><div class=odometro style=--data:{$porcenMaxNeg};></div></td><td style=color:white;>".formatPrice($row['PRECIOVENTA'],$datos['ASSET'],$datos['PAR'])."$</td><td>{$precioMoneda}$</td><td style=text-align:right;>{$wall}</td><td style=text-align:right;><span style=font-weight:bold;color:{$fg}>{$real_ganancia}$</span></td><td style=text-align:right;>{$botones}</td></tr>";
        }
        else{
          $precioCompra = formatPrice($row['PRECIOCOMPRA'],$datos['ASSET'],$datos['PAR']);
          if($didable_cancel_button == "disabled"){
            $botones= "<input type=checkbox {$didable_ckecked_button} class=escalbutton style=background:#EAB92B;width:21px; onclick=autosell(".$row['ID'].")><button {$didable_button} type=button class=escalbutton style=background:#EA465C; onclick=perdida(".$row['ID'].")>Sell</button>";              
          }
          else{
            $botones= "<button {$didable_cancel_button} type=button class=escalbutton style=background:#EAB92B;width:21px; onclick=borrar(".$row['ID'].")>&#10006;</button><button {$didable_button} type=button class=escalbutton style=background:#EA465C; onclick=perdida(".$row['ID'].")>Sell</button>";   
          }
          $cadena = $cadena . "<tr style=background:{$colorRow};color:{$colorAlert};><td><div class=odometro style=--data:{$porcenmax};></div></td><td style=color:white;>{$precioCompra}$</td><td style=color:white;>{$precioMoneda}$</td><td style=text-align:right;>".totalmoneda($row['MONEDA'])['total']."</td><td style=text-align:right;><span style=font-weight:bold;>".number_format($miganancia,2,".",",")."</span>$</td><td style=text-align:right;>{$botones}</td></tr>";
        }        
      }
      mysqli_close($conexion);      
    }
  } 
  $cadena = $cadena."</table>";
  return $cadena;
}

function findBinance(){
  $cadena = "<table style=width:100%;><th>Estatus</th><th>Moneda</th><th>Cant.</th><th>Orden Id</th><th>Tipo</th><th>Opciones</th>";
  $conexion = mysqli_connect($GLOBALS["servidor"],$GLOBALS["user"],$GLOBALS["password"],$GLOBALS["database"]);
  if (!$conexion) {
    echo "Refresh page, Failed to connect to Data...";
    exit();
  }else{
      $consulta = "select * from ORDERBINANCE";
      $resultado = mysqli_query( $conexion, $consulta );
      while($row = mysqli_fetch_array($resultado)){
        $colorRow = "transparent";

        if($row['TIPO'] == "SELL"){
          $colorRow = "#F37A8B";
        }
        else{
          $colorRow = "#4BC883";
        }

        $cadena = $cadena . "<tr style=color:{$colorRow};><td><span>".$row['ESTATUS']."</span></td><td><span>{$row['MONEDA']}</span></td><td><span>".price($row['CANTIDAD'])."</span></td><td><span>".$row['ORDERID']."</span></td><td><span>".$row['TIPO']."</span></td><td><button type=button class=escalbutton style=background:#EAB92B; onclick=cancelOrdenBinance(".$row['ORDERID'].")>&#10006;</button></td></tr>";
      }
      mysqli_close($conexion);      
  }

  $cadena = $cadena."</table>";
  return $cadena;
}

function refreshDatos(){
  $row = readDatos();
  $row2 = readParametros();
  $rowBtc = readDatosAsset("BTC");
  $moneda=$row['MONEDA'];
  $auto = $row2['LOCAL'];
  if(strlen($moneda) > 0){
    $readPrice = readPrices($moneda);
    $bitcoin = formatPrice(readPrices($rowBtc['MONEDA'])['ACTUAL'],$rowBtc['ASSET'],$rowBtc['PAR']);
    $priceMoneda = formatPrice($readPrice['ACTUAL'],$row['ASSET'],$row['PAR']);
    $priceArriba= formatPrice($readPrice['ARRIBA'],$row['ASSET'],$row['PAR']);
    $priceAbajo= formatPrice($readPrice['ABAJO'],$row['ASSET'],$row['PAR']);
    $labelPriceMoneda = formatPrice($priceMoneda,$row['ASSET'],$row['PAR']);
    $labelPriceBitcoin = formatPrice($bitcoin,$rowBtc['ASSET'],$rowBtc['PAR']);
    $color = "red";
    $colorbtc = "red";
    $colorDisp = "red";
    $symbol = "&#9660;";
    $promedioUndante = row_sqlconector("SELECT (SUM(ABAJO) / COUNT(*)) AS PROMEDIO FROM  PRICES WHERE MONEDA='{$moneda}'")['PROMEDIO'];
    $promedioFlotante = row_sqlconector("SELECT (SUM(ARRIBA) / COUNT(*)) AS PROMEDIO FROM  PRICES WHERE MONEDA='{$moneda}'")['PROMEDIO'];
    $promedioFlotanteBtc = row_sqlconector("SELECT (SUM(ARRIBA) / COUNT(*)) AS PROMEDIO FROM  PRICES WHERE MONEDA='".$rowBtc['MONEDA']."'")['PROMEDIO'];
    $totalPromedio = ($promedioFlotante + $promedioUndante) /2;  
    $porcenmax = porcenConjunto($priceAbajo, $priceArriba, $priceMoneda)."%";  
    $capital = price($row2['CAPITAL']);
    $inversion = row_sqlconector("SELECT SUM(COMPRA) AS SUMA FROM TRADER")['SUMA'];
    $xdisponible =   price($capital - $inversion);
    $bina = $row2['BINANCE'];
    $recordCount = recordCount("TRADER");
    $sumMoneda = totalmoneda($moneda);
    $symbol = nivelAnterior($moneda);
    $mercado = totalTendencia($rowBtc['MONEDA']);
        
    if($priceMoneda < $promedioFlotante){
        $color = "#F37A8B";
    }
    else{
        $color = "#4BC883";
    }

    if($row2['DISPONIBLE'] < $row2['INVXCOMPRA']){
      $colorDisp = "#F37A8B";
    }
    else{
      $colorDisp = "#4BC883";
    }    
  
    if($bitcoin < $promedioFlotanteBtc){
      $colorbtc = "#F37A8B";
    }
    else{
      $colorbtc = "#4BC883";
    }  
    
    $obj = array('balance_asset'=>$row['BALANCE_ASSET'],'par'=>$row['PAR'],'asset' => $row['ASSET'], 'ultimaventa' => quantity($row['ULTIMAVENTA'],$row['ASSET'],$row['PAR']), 'price' => $priceMoneda,'btc' => $bitcoin, 
    'colorbtc' => $colorbtc, 'symbol' => $symbol, 'moneda' => $moneda,'tendencia' => dayTendencia($moneda),'color' => $color,
    'maxdia' => $priceArriba,'mindia' => $priceAbajo, 'totalTendencia' => totalTendencia($moneda),
    'utc' => date('g:i A'),'techo' => $promedioFlotante,'piso' => $promedioUndante,'totalmoneda' => $sumMoneda['total'], 
    'ant' => readFlotadorAnterior($moneda),'nivel' => nivel($moneda),'nivelbtc' => nivelBtc(),
    'porcenmax' => $porcenmax,'ganancia' => price($row2['GANANCIA']),'perdida' => price($row2['PERDIDA']),'capital' => price($row2['CAPITAL']),
    'disponible' => price($row2['DISPONIBLE']), 'escalones' => $row2['ESCALONES'],'invxcompra' => $row2['INVXCOMPRA'],
    'totalpromedio' => $totalPromedio,'xdisponible' => $xdisponible, 'grafico' => returnGrafica($moneda),
    'auto' => $auto,'bina' => $bina,'impuesto' => price($row2['IMPUESTO']), 'mercado' =>$mercado, 
    'id' => $row['ID'],'recordCount' => $recordCount,'colordisp' => $colorDisp,
    'recupera' => totales($moneda)['recupera'],'alert' =>returnAlertas($moneda),
    'verescalones' => findEscalones(),'verbinance' => findBinance(),'labelpricebitcoin' => $labelPriceBitcoin,
    'labelpricemoneda' => $labelPriceMoneda,'precio_venta' => $row2['AUTOSHELL'],'listasset' => listAsset(),
    'stop' => $row2['STOPLOSS'],'balance' => quantity($sumMoneda['m_balance'],$row['ASSET'],$row['PAR']),'nivelcompra' => nivelCompra($moneda) ); 

    sqlconector("UPDATE PARAMETROS SET DATOS='".json_encode($obj)."'");
  }  
}
?>
