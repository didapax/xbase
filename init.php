<?php
$servidor = "localhost";
$user = "root";
$password = "";
$database = "fortunar_dd77b701661c5b55";
$data = "fortunar_xbase";

date_default_timezone_set("UTC");

function createDataBase(){
  $conexion = mysqli_connect($GLOBALS["servidor"],$GLOBALS["user"],$GLOBALS["password"]);
  @mysqli_query($conexion, "CREATE DATABASE IF NOT EXISTS ".$GLOBALS["data"]);
  mysqli_close($conexion);
}

function sqlconector2($consulta) {
  $conexion = @mysqli_connect($GLOBALS["servidor"],$GLOBALS["user"],$GLOBALS["password"],$GLOBALS["data"]);
  if (!$conexion) {
    echo "Refresh page, Failed to connect to Data: " . mysqli_connect_error();
    exit();
  }else{
    $resultado = mysqli_query( $conexion, $consulta );
    mysqli_close($conexion);
  }
}

function row_sqlconector2($consulta) {
 $row=0;
 $conexion = @mysqli_connect($GLOBALS["servidor"],$GLOBALS["user"],$GLOBALS["password"],$GLOBALS["data"]);
 if (!$conexion) {
   echo "Refresh page, Failed to connect to Data: " . mysqli_connect_error();
   exit();
 }else{
   if($resultado = mysqli_query( $conexion, $consulta )){
     $row = mysqli_fetch_array($resultado);
   }
   mysqli_close($conexion);
 }
 return $row;
}

function sqlconector($consulta) {
   $conexion = @mysqli_connect($GLOBALS["servidor"],$GLOBALS["user"],$GLOBALS["password"],$GLOBALS["database"]);
   if (!$conexion) {
     echo "Refresh page, Failed to connect to Data: " . mysqli_connect_error();
     exit();
   }else{
     $resultado = mysqli_query( $conexion, $consulta );
     mysqli_close($conexion);
   }
}

function row_sqlconector($consulta) {
	$row=0;
	$conexion = @mysqli_connect($GLOBALS["servidor"],$GLOBALS["user"],$GLOBALS["password"],$GLOBALS["database"]);
  if (!$conexion) {
    echo "Refresh page, Failed to connect to Data: " . mysqli_connect_error();
    exit();
  }else{
    if($resultado = mysqli_query( $conexion, $consulta )){
  		$row = mysqli_fetch_array($resultado);
  	}
  	mysqli_close($conexion);
  }
	return $row;
}

if( isset($_GET['install']) ){
  
  $conexion = mysqli_connect($GLOBALS["servidor"],$GLOBALS["user"],$GLOBALS["password"]);
  @mysqli_query($conexion, "CREATE DATABASE IF NOT EXISTS ".$GLOBALS["database"]);
  mysqli_close($conexion);

  sqlconector("CREATE TABLE IF NOT EXISTS TRADER (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    FECHA TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    TIPO VARCHAR(15) NOT NULL DEFAULT 'BUY',
    MONEDA VARCHAR(10),
    ORDERID VARCHAR(255),
    ORDERVENTA VARCHAR(255),
    COMPRA DECIMAL(16,8) NOT NULL DEFAULT 0.00,
    CANTIDAD DECIMAL(16,8) NOT NULL DEFAULT 0.00,
    PRECIOCOMPRA DECIMAL(16,8) NOT NULL DEFAULT 0.00,
    VENTA DECIMAL(16,8) NOT NULL DEFAULT 0.00,
    GANANCIA DECIMAL(16,8) NOT NULL DEFAULT 0.00,
    PRECIOVENTA DECIMAL(16,8) NOT NULL DEFAULT 0.00,
    PORCENVENTA DECIMAL(16,8) NOT NULL DEFAULT 0.00,
    MARGEN DECIMAL(16,8) NOT NULL DEFAULT 0.00,
    ESCALON INT DEFAULT 0,
    LIQUIDAR INT DEFAULT 0,
    ACTIVO INT DEFAULT 1,
    ELIMINADO INT DEFAULT 0,
    XGANANCIA DECIMAL(16,8) NOT NULL DEFAULT 0.00,
    NEGATIVO INT DEFAULT 0,
	  AUTOSELL int(11) NOT NULL DEFAULT '0'	
  )");

  sqlconector("CREATE TABLE IF NOT EXISTS DATOS (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    MONEDA VARCHAR(10) DEFAULT 'BTCUSDT',
    ASSET VARCHAR(10) DEFAULT 'BTC',
    PAR VARCHAR(10) DEFAULT 'USDT',
    BALANCE_ASSET DECIMAL(16,8) NOT NULL DEFAULT 0.00,
    PRECIO_VENTA DECIMAL(16,8) NOT NULL DEFAULT 0.00,
    PANTE DECIMAL(16,8) NOT NULL DEFAULT 0.00,
    ACTIVO INT DEFAULT 0,
	ULTIMAVENTA decimal(16,5) NOT NULL DEFAULT '0.00000'
  )");

sqlconector("CREATE TABLE IF NOT EXISTS PARAMETROS (
  ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  CAPITAL DECIMAL(16,8) NOT NULL DEFAULT 0.00,
  ESCALONES INT DEFAULT 4,
  INVXCOMPRA DECIMAL(16,8) NOT NULL DEFAULT 0.00,
  DISPONIBLE DECIMAL(16,8) NOT NULL DEFAULT 0.00,
  GANANCIA DECIMAL(16,8) NOT NULL DEFAULT 0.00,
  PERDIDA DECIMAL(16,8) NOT NULL DEFAULT 0.00,
  IMPUESTO DECIMAL(16,8) NOT NULL DEFAULT 0.02,
  LOCAL INT DEFAULT 1,
  BINANCE INT DEFAULT 0,
  APIKEY VARCHAR(255),
  SECRET VARCHAR(255),
  STOPLOSS INT(11) NOT NULL DEFAULT 1,
  AUTOSHELL INT(11) NOT NULL DEFAULT 2,
  DATOS JSON,
  GRAFICO int(11) DEFAULT '0'  
)");

sqlconector("CREATE TABLE IF NOT EXISTS PRICES (
  ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  FECHA DATE DEFAULT CURRENT_DATE,
  MONEDA VARCHAR(10) DEFAULT 'BTCUSDC',
  ACTUAL DECIMAL(16,8) NOT NULL DEFAULT 0.00,
  ARRIBA DECIMAL(16,8) NOT NULL DEFAULT 0.00,
  ABAJO DECIMAL(16,8) NOT NULL DEFAULT 0.00,
  BAJISTA INT DEFAULT 0,
  ALCISTA INT DEFAULT 0,
  VERDE INT DEFAULT 0,
  NARANJA INT DEFAULT 0,
  ROJO INT DEFAULT 0  
)");

sqlconector("CREATE TABLE ORDERBINANCE (
  ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  MONEDA VARCHAR(10),
  ORDERID VARCHAR(255),
  TIPO VARCHAR(14),
  ESTATUS VARCHAR(14),
  CANTIDAD DECIMAL(16,8) NOT NULL DEFAULT 0.00,
  PRECIO DECIMAL(16,8) NOT NULL DEFAULT 0.00
)");  

  echo "<br>Data Base Create...";
}
?>
