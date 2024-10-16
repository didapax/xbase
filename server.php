<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE');
header('Allow: GET, POST, OPTIONS, PUT, DELETE');
header('Content-Type: application/json');
header("Content-Security-Policy: default-src 'self'; script-src 'self' https://apis.google.com");
header("X-Content-Type-Options: nosniff");
header("X-Frame-Options: DENY");
header("Strict-Transport-Security: max-age=31536000; includeSubDomains");

// Conexión a la base de datos
/*
$host = "localhost";
$username = "root";
$pass = "";
$dbname = "jfb";
$conn = new mysqli($host, $username, $pass, $dbname);
*/

require "modulo.php";
$method = $_SERVER['REQUEST_METHOD'];

// Verificar conexión
/*if ($conn->connect_error) {
    die("Error: No se pudo conectar a MySQL. " . $conn->connect_error);
}*/

// Métodos de comunicación con el front
if ($method == "OPTIONS") {
    die();
}

if ($method == "POST") {
    try {
        $jsonData = file_get_contents('php://input');
        $data = json_decode($jsonData, true);

        if (isset($data['example'])) {

        }

    } catch (Exception $e) {
        $response = array('Error' => $e->getMessage());
        echo json_encode($response);
    }
}

if ($method == "GET") {
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
        echo json_encode (array_sqlconector("SELECT DATOS.ID, DATOS.MONEDA,DATOS.ASSET,DATOS.PAR,  prices.ACTUAL FROM DATOS INNER JOIN prices ON DATOS.MONEDA = prices.MONEDA WHERE prices.FECHA = CURRENT_DATE"));
    }    
    
    if(isset($_GET['resetPerdidas'])){
        $usuario = $_GET['usuario'];  
        sqlconector("UPDATE PARAMETROS SET PERDIDA=0 WHERE USUARIO='$usuario'");
      }
      
      if(isset($_GET['resetGanancias'])){
        $usuario = $_GET['usuario'];
        sqlconector("UPDATE PARAMETROS SET GANANCIA=0, PERDIDA=0 WHERE USUARIO='$usuario'");
      }
      
      if(isset($_GET['getPriceBinance'])){
        echo readParametros($_GET['usuario'])['DATOS'];
      }
      
      if(isset($_GET['actualizarData'])){
        $obj = array("result" => "true");
        refreshDataAuto($_GET['usuario']);
        echo json_encode($obj);
      }
      
      if(isset($_GET['getGraf'])){
        echo readParametros($_GET['usuario'])['DATOSGRAF'];
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

}

// Cerrar la conexión
//$conn->close();
