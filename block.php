<?php

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE');
header('Allow: GET, POST, OPTIONS, PUT, DELETE');
//header('Content-Type: application/json');
header("Content-Security-Policy: default-src 'self'; script-src 'self' https://apis.google.com");
header("X-Content-Type-Options: nosniff");
header("X-Frame-Options: DENY");
header("Strict-Transport-Security: max-age=31536000; includeSubDomains");

require "modulo.php";

if(isset($_GET['cerrarSesion'])){
// Destruir todas las variables de sesión
$_SESSION = array();

// Si se desea destruir la sesión completamente, también se debe destruir la cookie de sesión
if (ini_get("session.use_cookies")) {
    $params = session_get_cookie_params();
    setcookie(session_name(), '', time() - 42000,
        $params["path"], $params["domain"],
        $params["secure"], $params["httponly"]
    );
}

// Finalmente, destruir la sesión
session_destroy();
}

if( isset($_GET['crear-token']) ){
  $llave=$_GET['llave'];
  if($llave == "dd77b701661c5b55"){
    $bytes = random_bytes(8);
    $referencia = bin2hex($bytes);
    if(!ifUsuarioExist($referencia)){
      sqlconector("INSERT INTO USER (USUARIO) VALUES('$referencia')");
      sqlconector("INSERT INTO DATOSUSUARIOS (USUARIO,ACTIVO) VALUES('$referencia',1)");
      sqlconector("INSERT INTO PARAMETROS (USUARIO) VALUES('$referencia')");
      echo "Usuario creado con exito el token asignado es: $referencia";
    }
  }
  else{
    exit();
  }
}


if(isset($_GET['list_assets'])){
  echo json_encode (array_sqlconector("SELECT * FROM DATOS"));
}

if (isset($_POST['reset'])) {
  $usuario = $_POST['usuario'];
  $moneda = $_POST['moneda'];
  $asset = $_POST['asset'];
  $par = $_POST['par'];

  if (!ifMonedaUserExist($moneda, $usuario)) {
      // Usar consultas preparadas para evitar inyecciones SQL
      $updateQuery = "UPDATE DATOSUSUARIOS SET ACTIVO = 0 WHERE USUARIO = ?";
      $insertQuery = "INSERT INTO DATOSUSUARIOS (USUARIO, MONEDA, ASSET, PAR, ACTIVO) VALUES (?, ?, ?, ?, 1)";

      $conexion = @mysqli_connect($GLOBALS["servidor"], $GLOBALS["user"], $GLOBALS["password"], $GLOBALS["database"]);
      if (!$conexion) {
          throw new Exception("Failed to connect to Data: " . mysqli_connect_error());
      }

      // Preparar y ejecutar la consulta de actualización
      $stmt = $conexion->prepare($updateQuery);
      $stmt->bind_param("s", $usuario);
      $stmt->execute();

      // Preparar y ejecutar la consulta de inserción
      $stmt = $conexion->prepare($insertQuery);
      $stmt->bind_param("ssss", $usuario, $moneda, $asset, $par);
      $stmt->execute();

      mysqli_close($conexion);
  }

  refreshDatos($usuario);
}

if(isset($_POST['changue'])){
  $usuario = $_POST['usuario'];
  sqlconector("UPDATE DATOSUSUARIOS SET ACTIVO=0 WHERE USUARIO='$usuario'");
  sqlconector("UPDATE DATOSUSUARIOS SET ACTIVO=1 WHERE USUARIO='$usuario' AND ID={$_POST['moneda']}");
  refreshDatos($usuario);
}

if(isset($_POST['autosell'])){
  $usuario = $_POST['usuario'];
  $estatus =0;
  if(readTrader($_POST['autosell'])['AUTOSELL'] == 0){
    $estatus =1;
  }
  sqlconector("UPDATE TRADER SET AUTOSELL={$estatus} WHERE USUARIO='$usuario' AND ID={$_POST['autosell']}");
  refreshDatos($usuario);
}

if(isset($_POST['autostop'])){
  $usuario = $_POST['usuario'];
  $estatus =0;
  if(readTrader($_POST['autostop'])['AUTOSTOP'] == 0){
    $estatus =1;
  }
  sqlconector("UPDATE TRADER SET AUTOSTOP={$estatus} WHERE USUARIO='$usuario' AND ID={$_POST['autostop']}");
  refreshDatos($usuario);
}

if(isset($_POST['deletepar'])){
  $usuario = $_POST['usuario'];
  if($_POST['deletepar'] != "BTCUSDT"){
    sqlconector("DELETE FROM DATOSUSUARIOS WHERE USUARIO='$usuario' AND MONEDA='{$_POST['deletepar']}'");
    sqlconector("UPDATE DATOSUSUARIOS SET ACTIVO=0 WHERE USUARIO='$usuario'");
    sqlconector("UPDATE DATOSUSUARIOS SET ACTIVO=1 WHERE USUARIO='$usuario' AND MONEDA='BTCUSDT'");
  }
}

if(isset($_POST['guardar'])){
  $usuario = $_POST['usuario'];
  $moneda =  strtoupper($_POST['moneda']);
  $asset =  strtoupper($_POST['asset']);
  $inversion = row_sqlconector("SELECT SUM(COMPRA) AS SUMA FROM TRADER")['SUMA'];
  $invxcompra = number_format($_POST['capital'] / $_POST['escalones'],2,".","");  
  $stoploss = $_POST['stop'];
  $autoshell = $_POST['precio_venta'];
  $par = $_POST['par'];

  sqlconector("UPDATE DATOSUSUARIOS SET
    MONEDA='{$moneda}',
    ASSET='{$asset}',
    PAR='{$par}'
     WHERE USUARIO='$usuario' AND MONEDA ='{$moneda}'");

  sqlconector("UPDATE PARAMETROS SET
  CAPITAL={$_POST['capital']},
  ESCALONES={$_POST['escalones']},
  STOPLOSS={$stoploss},
  AUTOSHELL={$autoshell},
  INVXCOMPRA={$invxcompra},
  IMPUESTO={$_POST['impuesto']} WHERE USUARIO='$usuario'"); 
  refreshDatos($usuario);
}

if(isset($_GET['resetPerdidas'])){
  $usuario = $_GET['usuario'];  
  sqlconector("UPDATE PARAMETROS SET PERDIDA=0 WHERE USUARIO='$usuario'");
}

if(isset($_GET['resetGanancias'])){
  $usuario = $_GET['usuario'];
  sqlconector("UPDATE PARAMETROS SET GANANCIA=0, PERDIDA=0 WHERE USUARIO='$usuario'");
}

if(isset($_POST['borrar'])){
  $usuario = $_POST['usuario'];
  $trader = readTrader($_POST['borrar']);
  $moneda = $trader['MONEDA'];

  /*
  if(strlen($trader['ORDERID']) > 0 &&
  strlen($trader['ORDERVENTA']) == 0){
    $api = new Binance\API(sqlApiKey($usuario), sqlApiSecret($usuario));
    $api->useServerTime();
    $openorder = $api->orderStatus($moneda, readTrader($_POST['borrar'])['ORDERID']);
    if($openorder['status'] == "NEW"){
      $api->useServerTime();
      $cancelorder = $api->cancel($moneda, readTrader($_POST['borrar'])['ORDERID']);
    }
  }
  */
  sqlconector("DELETE FROM TRADER WHERE ID={$_POST['borrar']}");

  reordenarEscalones($usuario);  
  refreshDatos($usuario);
}

if(isset($_POST['negativoBuy'])){
  $usuario = $_POST['usuario'];
  $trader = readTrader($_POST['negativo']);
  $datos = readParametros($usuario);
  $operacion = descontarImpuesto($usuario, $trader['CANTIDAD']);
  $asset = readDatosMoneda($trader['MONEDA']);
  $quantity = quantity($operacion,$asset['ASSET'],$asset['PAR']);  
  
    $api = new Binance\API(sqlApiKey($usuario), sqlApiSecret($usuario));
    $api->useServerTime();
    $binance = $api->marketBuy($trader['MONEDA'], $quantity);    
  
    sqlconector("DELETE FROM TRADER WHERE ID={$_POST['negativo']}");

    reordenarEscalones($usuario);
    refreshDatos($usuario);
}

if(isset($_POST['negativo'])){
  $usuario = $_POST['usuario'];
  $cantidad = $_POST['cantidad'];
  $moneda = $_POST['moneda'];
  $ganancia = 0;
  $datos= readParametros($usuario);
  $escalon = recordCountUser($usuario,"TRADER") +1;
  $asset = readDatosMoneda($moneda);
  $price = formatPrice(readPrices($moneda)['ACTUAL'],$asset['ASSET'],$asset['PAR']);
  $order ="";
  $venta = $price * $cantidad;

  $api = new Binance\API(sqlApiKey($usuario), sqlApiSecret($usuario));
    $api->useServerTime();
    $operacion = descontarImpuesto($usuario, $cantidad);
    $quantity = quantity($operacion,$asset['ASSET'],$asset['PAR']);
    $api->useServerTime();
    if($_POST['tipo']=="Limit"){
      $order = $api->sell($moneda, $quantity, $price);
    }
    else{
      $order = $api->marketSell($moneda, $quantity);        
    }    

    if(isset($order['orderId'])){ 
      sqlconector("INSERT INTO TRADER(USUARIO,MONEDA,ORDERID,TIPO,CANTIDAD,VENTA,PRECIOVENTA,NEGATIVO,ESCALON) VALUES(
        '$usuario',
        '$moneda',
        '{$order['orderId']}',
        'SELL',
        $cantidad,
        $venta,
        $price,
        1,
        $escalon)");
    }else{
      echo "error: 0001"; 
    }

    reordenarEscalones($usuario);
    refreshDatos($usuario);
} 

if(isset($_POST['perdida'])){ 
  $usuario = $_POST['usuario'];
  $datos = readParametros($usuario);
  $trader = readTrader($_POST['perdida']);
  $moneda = $trader['MONEDA'];
  $asset = readDatosMoneda($moneda);
  $operacion = descontarImpuesto($usuario, $trader['CANTIDAD']);
  $quantity = quantity($operacion,$asset['ASSET'],$asset['PAR']);
  $escalon = recordCountUser($usuario,"TRADER") +1;
  $api = new Binance\API(sqlApiKey($usuario), sqlApiSecret($usuario));
  $api->useServerTime();
  $order = $api->marketSell($moneda, $quantity);

  liquidar($_POST['perdida']);
} 

if(isset($_POST['local'])){ 
  $usuario = $_POST['usuario'];
  sqlconector("UPDATE PARAMETROS SET LOCAL ={$_POST['local']} WHERE USUARIO='$usuario'");
}

if(isset($_POST['xgraf'])){
  $usuario = $_POST['usuario'];
  sqlconector("UPDATE PARAMETROS SET GRAFICO ={$_POST['xgraf']} WHERE USUARIO='$usuario'");
}

if(isset($_POST['bina'])){
  $usuario = $_POST['usuario'];
  sqlconector("UPDATE PARAMETROS SET BINANCE ={$_POST['bina']} WHERE USUARIO='$usuario'");
}

if(isset($_POST['agregar'])){
  $usuario = $_POST['usuario'];
  $moneda = $_POST['moneda'];
  $asset = readDatosMoneda($moneda);
  $datos = readParametros($usuario); 
  $quantity = quantity($_POST['cantidad'],$asset['ASSET'],$asset['PAR']);
  $price = formatPrice($_POST['preciocompra'],$asset['ASSET'],$asset['PAR']);
  $escalon = recordCountUser($usuario,"TRADER") +1;
  $binance = "";

  $api = new Binance\API(sqlApiKey($usuario), sqlApiSecret($usuario));
  $api->useServerTime();
  if($_POST['tipo']=="Limit"){
    $binance = $api->buy($moneda, $quantity, $price);
  }else{
    $binance = $api->marketBuy($moneda, $quantity);
    $price = formatPrice(readPrices($moneda)['ACTUAL'],$asset['ASSET'],$asset['PAR']);
  }    
  if(isset($binance['orderId'])){
    sqlconector("INSERT INTO TRADER(USUARIO,MONEDA,ORDERID,COMPRA,CANTIDAD,PRECIOCOMPRA,ESCALON) VALUES(
      '$usuario',
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

  reordenarEscalones($usuario);
  refreshDatos($usuario);
}

if(isset($_GET['getpante'])){
  $usuario = $_GET['usuario'];
  $row = readDatos($_GET['usuario']); 
  $moneda=$row['MONEDA'];
  $precio = $_GET['nprice'];
  $puntos = readParametros($usuario)['STOPLOSS'];
  $pante = price(calcularMargenPerdida($precio,$puntos)); 
  $obj = array('pante' => $pante,'moneda' => $moneda,'puntos' => $puntos); 
  
  echo json_encode($obj);   
}

if(isset($_GET['getPriceBinance'])){  
  if( isset($_GET['auto']) ){
      refreshDataAuto($_GET['usuario']);
  }  
  echo readParametros($_GET['usuario'])['DATOS'];
} 

if( isset($_GET['binancex']) ){
  $api = new Binance\API(sqlApiKey($usuario), sqlApiSecret($usuario));
      $api->useServerTime();
      $balances = $api->balances();
      echo "BNB owned: ".$balances['BNB']['available']."\n";
      echo "Estimated Value: ".$api->btc_value." BTC\n";

      $openorders = $api->openOrders("BTCUSDT");
      print_r($openorders);
}

if( isset($_POST['info']) ){
  $moneda =  readTrader($_POST['info'])['MONEDA'];
  $precio = readPrices($moneda)['ACTUAL'];

  $obj = array('asset' => $moneda, 'price' => $precio);
  echo json_encode($obj);   
}
?>
