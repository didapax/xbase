<?php

session_start(); // Iniciar la sesión

//$GLOBALS['database']$database = "fortunar_".$_SESSION['usuario'];
$GLOBALS['servidor'] = "localhost";
$GLOBALS['user'] = "root";
$GLOBALS['password'] = "";
$GLOBALS['database'] = "fortunar_xbase";
$GLOBALS['data'] = "fortunar_xbase";
$GLOBALS['tokenadmin'] = "dd77b701661c5b55";
$GLOBALS['encryptionKey'] = "dd77b701661c5b55";

date_default_timezone_set("UTC");

function new_sqlconector($consulta, $params = []) {
  try {
    $pdo = new PDO('mysql:host=' . $GLOBALS["servidor"] . ';dbname=' . $GLOBALS["database"], $GLOBALS["user"], $GLOBALS["password"]);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->exec("SET NAMES 'utf8mb4'");
    
    $stmt = $pdo->prepare($consulta);
    $stmt->execute($params);
    
    return $stmt;
  } catch (PDOException $e) {
    die("Error in query: " . $e->getMessage());
  }
}

function new_row_sqlconector($consulta, $params = []) {
  try {
    $pdo = new PDO('mysql:host=' . $GLOBALS["servidor"] . ';dbname=' . $GLOBALS["database"], $GLOBALS["user"], $GLOBALS["password"]);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->exec("SET NAMES 'utf8mb4'");
    
    $stmt = $pdo->prepare($consulta);
    $stmt->execute($params);
    
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    
    return $row;
  } catch (PDOException $e) {
    echo "Error in query: " . $e->getMessage();
    exit();
  }
}

function new_array_sqlconector($consulta, $params = []) {
  $obj = [];
  $stmt = sqlconector($consulta, $params);
  if ($stmt) {
    $obj = $stmt->fetchAll(PDO::FETCH_ASSOC);
  }
  return $obj;
}

function sqlconector($consulta) {
  $conexion = mysqli_connect($GLOBALS["servidor"], $GLOBALS["user"], $GLOBALS["password"], $GLOBALS["database"]);
  if (!$conexion) {
    die("Failed to connect to Data: " . mysqli_connect_error());
  }
  mysqli_set_charset($conexion, "utf8mb4");
  $resultado = mysqli_query($conexion, $consulta);
  
  if (!$resultado) {
      die("Error in query: " . mysqli_error($conexion));
  }
  
  mysqli_close($conexion);
  return $resultado;
}

function row_sqlconector($consulta) {
  $row = array();
	$conexion = @mysqli_connect($GLOBALS["servidor"],$GLOBALS["user"],$GLOBALS["password"],$GLOBALS["database"]);
  if (!$conexion) {
    echo "Refresh page, Failed to connect to Data: " . mysqli_connect_error();
    exit();
  }else{
    mysqli_set_charset($conexion, "utf8mb4");
    $resultado = mysqli_query($conexion, $consulta);
    if($resultado){
  		$row = mysqli_fetch_assoc($resultado);
  	}
  	mysqli_close($conexion);
  }
	return $row;
}

function array_sqlconector($consulta){
  $obj= array();
  $resultado = sqlconector($consulta);
  if($resultado){
    while($row = mysqli_fetch_assoc($resultado)){
      $obj[]=$row;
    }
  }
  return $obj;
}

if( isset($_GET['install']) ){
  
  $conexion = mysqli_connect($GLOBALS["servidor"],$GLOBALS["user"],$GLOBALS["password"]);
  @mysqli_query($conexion, "CREATE DATABASE IF NOT EXISTS ".$GLOBALS["database"]);
  mysqli_close($conexion);

}
?>
