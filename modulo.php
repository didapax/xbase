<?php
require "init.php"; 
require "php-binance-api.php";
date_default_timezone_set("UTC");

//session_start(); // Iniciar la sesión

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

function readDatos($usuario){
 return row_sqlconector("select * from DATOSUSUARIOS WHERE USUARIO='$usuario' AND ACTIVO=1");
}

function readDatosMoneda($moneda){
  return row_sqlconector("select * from DATOS WHERE MONEDA='{$moneda}'");
}

function readDatosMonedaUser($usuario,$moneda){
  return row_sqlconector("select * from DATOSUSUARIOS WHERE USUARIO='$usuario' AND MONEDA='{$moneda}'");
}

function readDatosMonedaId($id){
  return row_sqlconector("select * from DATOS WHERE ID={$id}");
}

function readDatosAsset($asset){
  return row_sqlconector("select * from DATOS WHERE ASSET='{$asset}'");
}

function readParametros($usuario){
  return row_sqlconector("select * from PARAMETROS WHERE USUARIO='$usuario'");
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
  // Construir el símbolo
  $symbol = $asset . $par;  
  // Obtener el número de decimales desde la base de datos
  $decimals = readDatosMoneda($symbol)['DECIMALS'];

  // Verificar si se encontró el número de decimales
  if ($decimals === null) {
      echo "Error: No se pudo obtener el número de decimales para el símbolo $symbol.\n";
      return null;
  }

  // Formatear el precio con el número de decimales adecuado
  return number_format($valor, $decimals, ".", "");
}

function updateDecimals() {
  $api = new Binance\API(sqlApiKeyAdmin(), sqlApiSecretAdmin());
  $api->useServerTime();
  $exchangeInfo = $api->exchangeInfo();
  $symbols = $exchangeInfo['symbols'];

  foreach ($symbols as $s) {
      $symbol = $s['symbol'];
      foreach ($s['filters'] as $filter) {
          if ($filter['filterType'] == 'PRICE_FILTER') {
              $tickSize = $filter['tickSize'];
              $decimals = strlen(substr(strrchr(rtrim($tickSize, '0'), '.'), 1));
              // Actualizar la base de datos con el número de decimales
              $query = "UPDATE DATOS SET DECIMALS = $decimals WHERE MONEDA = '$symbol'";
              // Ejecutar la consulta (asegúrate de tener una conexión a la base de datos configurada)
              sqlconector($query);
              break;
          }
      }
  }
}

function updateStepSize() {
  $api = new Binance\API(sqlApiKeyAdmin(), sqlApiSecretAdmin());
  $api->useServerTime();
  $exchangeInfo = $api->exchangeInfo();
  $symbols = $exchangeInfo['symbols'];

  foreach ($symbols as $s) {
      $symbol = $s['symbol'];
      foreach ($s['filters'] as $filter) {
          if ($filter['filterType'] == 'LOT_SIZE') {
              $stepSize = $filter['stepSize'];
              $minQty = $filter['minQty'];
              // Actualizar la base de datos con el valor de stepSize
              $query = "UPDATE DATOS SET STEPSIZE = $stepSize, MINQTY= $minQty WHERE MONEDA = '$symbol'";
              // Ejecutar la consulta (asegúrate de tener una conexión a la base de datos configurada)
              sqlconector($query);
              break;
          }
      }
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

function recordCountUser($usuario, $table){
  return row_sqlconector("SELECT Count(*) as SUMA FROM $table WHERE USUARIO='$usuario'")['SUMA'];
}

function recordCountInterval($table,$moneda){
  return row_sqlconector("SELECT Count(*) as SUMA FROM {$table} WHERE MONEDA ='{$moneda}'")['SUMA'];
}

function reordenarEscalones($usuario){
  $i=1;
  $precioPante="";
  if(recordCountUser($usuario,"TRADER")>0){
    $conexion = mysqli_connect($GLOBALS["servidor"],$GLOBALS["user"],$GLOBALS["password"],$GLOBALS["database"]);
    if (!$conexion) {
      echo "Refresh page, Failed to connect to Data...";
      exit();
    }else{
      $consulta = "select * from TRADER WHERE USUARIO='$usuario' ORDER BY FECHA";
      $resultado = mysqli_query( $conexion, $consulta );
      while($row = mysqli_fetch_array($resultado)){
        sqlconector("UPDATE TRADER SET ESCALON={$i} WHERE ID={$row['ID']} AND USUARIO='$usuario'");
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
  $consulta = "select COUNT(*) AS TOTAL from TRADER where ORDERID='{$order}'";
  $resultado = row_sqlconector($consulta);
  
  return $resultado['TOTAL'] == 1;  
}

function ifMonedaExist($moneda) {
  $consulta = "SELECT COUNT(*) AS TOTAL FROM DATOS WHERE MONEDA = '$moneda'";
  $resultado = row_sqlconector($consulta);
  
  return $resultado['TOTAL'] == 1;
}

function ifMonedaUserExist($moneda, $usuario) {
  $consulta = "SELECT COUNT(*) AS TOTAL FROM DATOSUSUARIOS WHERE USUARIO = '$usuario' AND MONEDA = '$moneda'";
  $resultado = row_sqlconector($consulta);
  
  return $resultado['TOTAL'] == 1;
}

function ifUsuarioExist($usuario) {
  if(row_sqlconector("select COUNT(*) AS TOTAL from USER where USUARIO='$usuario'")['TOTAL']==1 )
  return TRUE;
  return FALSE;
}

function ifDatColum($token, $tabla, $colum) {
  // Consulta SQL para verificar si el campo especificado no está vacío o nulo
  $query = "SELECT COUNT(*) AS TOTAL FROM $tabla WHERE USUARIO = '{$token}' AND $colum IS NOT NULL AND $colum != ''";
  
  // Ejecutar la consulta y obtener el resultado
  $result = row_sqlconector($query);
  
  // Verificar si el total es mayor que 0
  
  if ($result['TOTAL'] > 0) {
      return TRUE;
  }
  return FALSE;
}

function encryptApiKey($apiKey, $encryptionKey) {
  $iv = openssl_random_pseudo_bytes(openssl_cipher_iv_length('aes-256-cbc'));
  $encrypted = openssl_encrypt($apiKey, 'aes-256-cbc', $encryptionKey, 0, $iv);
  return base64_encode($iv . $encrypted);
}

function decryptApiKey($encryptedApiKey, $encryptionKey) {
  $data = base64_decode($encryptedApiKey);
  $iv = substr($data, 0, openssl_cipher_iv_length('aes-256-cbc'));
  $encrypted = substr($data, openssl_cipher_iv_length('aes-256-cbc'));
  return openssl_decrypt($encrypted, 'aes-256-cbc', $encryptionKey, 0, $iv);
}

function readOrderCompraTrader($order){
return row_sqlconector("select * from TRADER where ORDERID='{$order}'");
}

function sellOrder($order) {
  if (ifOrderExist($order)) {
      $row = readOrderCompraTrader($order);
      $usuario= $row['USUARIO'];
      $api = new Binance\API(sqlApiKey($usuario), sqlApiSecret($usuario));
      $moneda = $row['MONEDA'];
      $api->useServerTime();

      try {
          $openorder = $api->orderStatus($moneda, $order);
          if ($openorder['status'] === "FILLED") {
            echo "\nestatus order= ".$openorder['status'];
            $bytes = random_bytes(5);
            $referencia = bin2hex($bytes);
            sqlconector("UPDATE TRADER SET ORDERVENTA='{$referencia}', LIQUIDAR=1 WHERE ID={$row['ID']}");
            refreshDatos($usuario);
        }          
      } catch (Exception $e) {
          // Manejo de errores
          error_log("Error al obtener el estado de la orden: " . $e->getMessage());
          return;
      }
  }
}

function descontarImpuesto($usuario,$cantidad) {
  $impuesto = readParametros($usuario)['IMPUESTO']; // 0.02% expresado como decimal
  $cantidadConDescuento = $cantidad - ($cantidad * $impuesto);
  return $cantidadConDescuento;
}

function quantity($valor, $asset, $par) {
  // Construir el símbolo
  $symbol = $asset . $par;
  $datos = readDatosMoneda($symbol);
  // Obtener el valor de stepSize desde la base de datos
  $stepSize = $datos['STEPSIZE'];

  // Verificar si se encontró el valor de stepSize
  if ($stepSize === null) {
      echo "Error: No se pudo obtener el 'stepSize' para el símbolo $symbol.\n";
      return null;
  }

  // Ajustar la cantidad según el stepSize
  $adjustedQuantity = floor($valor / $stepSize) * $stepSize;

  // Obtener el valor de minQty desde la base de datos (si es necesario)
  $minQty = $datos['MINQTY'];

  // Asegurarse de que la cantidad ajustada es mayor o igual a minQty
  if ($adjustedQuantity < $minQty) {
      echo "Error: La cantidad ajustada $adjustedQuantity es menor que la cantidad mínima $minQty.\n";
      return null;
  }

  return $adjustedQuantity;
}

function autoLiquida($order) {
  // Validar el parámetro de entrada
  $row = readOrderCompraTrader($order);
  if ($row['LIQUIDAR'] == 1) {
      $id = $row['ID'];
      $param = readParametros($row['USUARIO']);
      $moneda = $row['MONEDA'];      
      $datos = readDatosMoneda($moneda);
      $operacion = descontarImpuesto($row['USUARIO'], $row['CANTIDAD']);
      $quantity = quantity($operacion, $datos['ASSET'], $datos['PAR']);
      echo "\noperacion sin impuesto= {$row['CANTIDAD']}\nquantity= $quantity";

      $api = new Binance\API(sqlApiKey($row['USUARIO']), sqlApiSecret($row['USUARIO']));
      $api->useServerTime();

      try {
          if ($row['TIPO'] == "BUY") {
              $price = $row['PRECIOCOMPRA'];
              $stopPrice = calcularMargenPerdida($price, $param['STOPLOSS']);
              echo "\n stop a = $stopPrice";
              if (readPrices($moneda)['ACTUAL'] <= $stopPrice) {
                  $order = $api->marketSell($moneda, $quantity);
                  if (isset($order['orderId'])) {
                      liquidar($id);
                  }
              } else {
                  if ($row['AUTOSELL'] == 1) {
                      $autoSell = calcularMargenGanancia($price, $param['AUTOSHELL']);
                      echo "\n  Venta a = $autoSell";
                      if (readPrices($moneda)['ACTUAL'] > $autoSell) {
                          $order = $api->marketSell($moneda, $quantity);
                          if (isset($order['orderId'])) {
                              liquidar($id);
                          }
                      }
                  }
              }
          } 
          else {
              $price = $row['PRECIOVENTA'];
              $stopPrice = calcularMargenGanancia($price, $param['STOPLOSS']);
              if (readPrices($moneda)['ACTUAL'] >= $stopPrice) {
                  $order = $api->marketBuy($moneda, $quantity);
                  if (isset($order['orderId'])) {
                      liquidar($id);
                  }
              } else {
                  if ($row['AUTOSELL'] == 1) {
                      $autoSell = calcularMargenPerdida($price, $param['AUTOSHELL']);
                      if (readPrices($moneda)['ACTUAL'] < $autoSell) {
                          $order = $api->marketBuy($moneda, $quantity);
                          if (isset($order['orderId'])) {
                              liquidar($id);
                          }
                      }
                  }
              }
          }
      } catch (Exception $e) {
          error_log("Error en la operación de auto liquidación: " . $e->getMessage());
      }
  }
}

function liquidar($id){
  $row = row_sqlconector("SELECT * FROM TRADER WHERE ID={$id}");
  $asset = readDatosMoneda($row['MONEDA']);
  if($row['TIPO'] == "BUY"){
    $datos= readParametros($row['USUARIO']);
    $moneda = $row['MONEDA'];
    $precioVenta = readPrices($moneda)['ACTUAL'];
    $compra = $row['COMPRA'];
    $operacion = descontarImpuesto($row['USUARIO'],$row['CANTIDAD']);
    $cantidad = $operacion;
    $newventa =  $cantidad * $precioVenta;
    $newganancia = 0;
    $newperdida = 0;
  
    if($newventa < $compra){
      $newperdida = $compra - $newventa;
    }
    else{
      $newganancia = $newventa - $compra;
    }
  
    $ganancia = $datos['GANANCIA'] + $newganancia;
    $perdida = $datos['PERDIDA'] + $newperdida;
    $ajuste = $ganancia - $perdida;
  
    if($ajuste < 0){
      $ganancia=0;
      //$perdida=0;
    }
    
    sqlconector("UPDATE PARAMETROS SET GANANCIA = $ganancia, PERDIDA = $perdida WHERE USUARIO='".$row['USUARIO']."'");
    sqlconector("UPDATE DATOSUSUARIOS SET ULTIMAVENTA = $precioVenta WHERE MONEDA = '$moneda' AND USUARIO='".$row['USUARIO']."'");
    sqlconector("DELETE FROM TRADER WHERE ID = $id");
  }
  else{
    sqlconector("DELETE FROM TRADER WHERE ID = $id");
  }
  reordenarEscalones($row['USUARIO']);
  refreshDatos($row['USUARIO']);
}

function readTrader($id){
  return row_sqlconector("select * from TRADER where ID=".$id);
}

function ifNotDayExists($tabla, $moneda) {
  $query = "SELECT COUNT(*) AS TOTAL FROM {$tabla} WHERE MONEDA = :moneda AND DATE(FECHA) = CURDATE()";
  $params = ['moneda' => $moneda];
  $result = new_row_sqlconector($query, $params);
  
  return $result['TOTAL'] == 0;
}

function updatePrices($moneda,$valores){
  sqlconector("UPDATE PRICES SET {$valores} WHERE MONEDA='{$moneda}' AND DATE(FECHA) = CURDATE()");
}

function updatePricesClose($moneda,$valores){
  sqlconector("UPDATE PRICES SET {$valores} WHERE MONEDA='{$moneda}' AND DATE(FECHA) = CURDATE() - INTERVAL 1 DAY");
}

function readPrices($moneda) {
  // Validar que la moneda no esté vacía
  if (strlen($moneda) > 0) {
      // Verificar si no existe un registro para el día actual
      if (ifNotDayExists("PRICES", $moneda)) {
          // Insertar un nuevo registro
          sqlconector("INSERT INTO PRICES (MONEDA) VALUES ('{$moneda}')");

          //La logica para el precio de cierre y apertura.
          $open = readPriceIntervar($moneda,1)['ACTUAL'];
          updatePrices($moneda,"OPEN={$open}");
          /*updatePricesClose($moneda,"CLOSE={$open}");
            cierra en refreshData.... con updatePrices indicando el precio actual en la columna CLOSE
          */
      }
      
      // Obtener los precios del día actual
      $query = "SELECT * FROM PRICES WHERE MONEDA = '{$moneda}' AND DATE(FECHA) = CURDATE()";
      return row_sqlconector($query);
  }
  
  // Retornar null si la moneda está vacía
  return null;
}

function readPriceIntervar($moneda,$num_day){
  $query = "SELECT * FROM PRICES WHERE MONEDA = '$moneda' AND DATE(FECHA) = CURDATE() - INTERVAL $num_day DAY";
  return row_sqlconector($query);
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
  if(isset(row_sqlconector("select ABAJO from PRICES WHERE MONEDA='{$moneda}' AND DAY(FECHA)= DAY(CURRENT_TIMESTAMP()  - INTERVAL $interval DAY) AND MONTH(FECHA)= MONTH(CURRENT_TIMESTAMP()) AND YEAR(FECHA)= YEAR(CURRENT_TIMESTAMP())")['ABAJO'])){
    return row_sqlconector("select ABAJO from PRICES WHERE MONEDA='{$moneda}' AND DAY(FECHA)= DAY(CURRENT_TIMESTAMP()  - INTERVAL $interval DAY) AND MONTH(FECHA)= MONTH(CURRENT_TIMESTAMP()) AND YEAR(FECHA)= YEAR(CURRENT_TIMESTAMP())")['ABAJO'];
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

function nivelPorcentual_Venta($moneda){
  $nprice = readPrices($moneda);
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

  return porcenConjunto($min,$max,$actual);
}

function nivelCompra($moneda){  
  $alerta = returnAlertas($moneda);
  $asset = "BUY";
  $nivel="<div class=odometroalert style=--color1:#F6465D;--data1:-80deg;--color2:#F6465D;--data2:-220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>{$asset}</div></div>";
  if($alerta == "orange"){
    $nivel="<div class=odometroalert style=--color1:#F6465D;--data1:80deg;--color2:#F6465D;--data2:-220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>{$asset}</div></div>";
  }
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
  
  $vela_red_1 = $priceAbajo;
  $vela_red_2 = readMinAnterior_Interval($moneda, 1);
  $vela_red_3 = readMinAnterior_Interval($moneda, 2);
  
  $min_value = min($vela_red_1, $vela_red_2, $vela_red_3);

  $porcenmax = porcenConjunto($vela_red_1, $priceArriba, $precio);
  $stop=0; 

  //Nivel mas Bajo Alerta Roja
  if($priceAbajo < $min_value){
    $stop=1; //stop de alerta de compra
    $variable = "red";
  }

  //Nivel mas alto de venta  Alerta Verde
  if (nivelPorcentual_Venta($moneda)>90){
    $variable = "green"; //alerta de venta
  }

  //Nivel alto que Indicaria Posible alza
  if($porcenmax > 55 && $porcenmax < 89 && $stop==0){
    $variable = "olive"; //alerta de venta
  }

  //Nivel Medio que indica podria ir al alza
  if( $porcenmax > 21 && $porcenmax < 55 && $stop==0 ){
    $variable = "orange"; //intension de subir
  }
  
  //Nivel de Fondo entre la baja y el alza
  if($porcenmax > 1 && $porcenmax < 21 && $stop==0){
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

function sqlApiKey($usuario){
  $encryptedApiKey = row_sqlconector("SELECT APIKEY FROM PARAMETROS WHERE USUARIO='$usuario'")['APIKEY'];
  $decryptedApiKey = decryptApiKey($encryptedApiKey, $GLOBALS['encryptionKey']);
  return $decryptedApiKey;
}

function sqlApiSecret($usuario){
  $encryptedSecret = row_sqlconector("SELECT SECRET FROM PARAMETROS WHERE USUARIO='$usuario'")['SECRET'];
  $decryptedSecret = decryptApiKey($encryptedSecret, $GLOBALS['encryptionKey']);
  return $decryptedSecret;
}

function sqlApiKeyAdmin(){
  $encryptedApiKey = row_sqlconector("SELECT APIKEY FROM PARAMETROS WHERE USUARIO='".$GLOBALS['tokenadmin']."'")['APIKEY'];
  $decryptedApiKey = decryptApiKey($encryptedApiKey, $GLOBALS['encryptionKey']);
  return $decryptedApiKey;
}

function sqlApiSecretAdmin(){
  $encryptedSecret = row_sqlconector("SELECT SECRET FROM PARAMETROS WHERE USUARIO='".$GLOBALS['tokenadmin']."'")['SECRET'];
  $decryptedSecret = decryptApiKey($encryptedSecret, $GLOBALS['encryptionKey']);
  return $decryptedSecret;
}

function totalmoneda($usuario,$moneda){ 
  $totalMoneda="0";
  $totalInversion="0";
  $datos =readDatosMonedaUser($usuario,$moneda);
  $price = readPrices($moneda)['ACTUAL'];
  $estado = "";
  $bk="";
  
  if(row_sqlconector("select COUNT(*) AS TOTAL from TRADER where USUARIO='$usuario' AND MONEDA='{$moneda}'")['TOTAL'] > 0){

    $totalMoneda = price(row_sqlconector("SELECT SUM(CANTIDAD) AS SUMA FROM TRADER WHERE USUARIO='$usuario' AND MONEDA='{$moneda}' AND LENGTH(ORDERVENTA) > 0")['SUMA']);
    $totalInversion = price(row_sqlconector("SELECT SUM(COMPRA) AS SUMA FROM TRADER WHERE USUARIO='$usuario' AND MONEDA='{$moneda}' AND LENGTH(ORDERVENTA) > 0")['SUMA']);

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

function totales($usuario,$moneda){
  $price = readPrices($moneda)['ACTUAL'];
  $total = number_format(row_sqlconector("SELECT SUM(CANTIDAD) AS SUMA FROM TRADER WHERE USUARIO='$usuario' AND MONEDA='{$moneda}' AND LENGTH(ORDERVENTA) > 0")['SUMA'],2,".","");

  $capital = number_format(readParametros($usuario)['CAPITAL'],2,".","");
  $disponible = number_format(readParametros($usuario)['DISPONIBLE'],2,".","");
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

function refreshDataAuto($usuario) {
  try {
      $estableCoin = readParametros($usuario)['ESTABLECOIN'];
      $dsn = "mysql:host={$GLOBALS['servidor']};dbname={$GLOBALS['database']};charset=utf8";
      $conexion = new PDO($dsn, $GLOBALS['user'], $GLOBALS['password']);
      $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

      $api = new Binance\API(sqlApiKey($usuario), sqlApiSecret($usuario));
      $api->useServerTime();
      $balances = $api->balances();

      if (recordCountUser($usuario,"ORDERBINANCE") > 0) {
          $conexion->exec("DELETE FROM ORDERBINANCE WHERE USUARIO='$usuario'");
      }

      $consulta = "SELECT * FROM DATOSUSUARIOS WHERE USUARIO='$usuario'";
      $stmt = $conexion->query($consulta);

      while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
          $asset = $row['ASSET'];
          $available_mon = $row['MONEDA'];
          $axie = readPrices($available_mon);

          if (row_sqlconector("SELECT COUNT(*) AS TOTAL FROM TRADER WHERE USUARIO='$usuario' AND  MONEDA='{$available_mon}'")['TOTAL'] > 0) {
              $openorders = $api->openOrders($available_mon);

              $insertOrder = $conexion->prepare("INSERT INTO ORDERBINANCE (USUARIO, MONEDA, ORDERID, TIPO, ESTATUS, PRECIO, CANTIDAD) VALUES (:usuario, :moneda, :orderid, :tipo, :estatus, :precio, :cantidad)");
              foreach ($openorders as $order) {
                  $insertOrder->execute([
                      ':usuario' => $usuario,
                      ':moneda' => $order['symbol'],
                      ':orderid' => $order['orderId'],
                      ':tipo' => $order['side'],
                      ':estatus' => $order['status'],
                      ':precio' => $order['price'],
                      ':cantidad' => $order['origQty']
                  ]);
              }
          }

          $updateBalance = $conexion->prepare("UPDATE DATOSUSUARIOS SET BALANCE_ASSET = :balance WHERE USUARIO=:usuario AND MONEDA = :moneda");
          $updateBalance->execute([
              ':usuario' => $usuario,
              ':balance' => $balances[$asset]['available'],
              ':moneda' => $available_mon
          ]);

          $updateEstableCoin = $conexion->prepare("UPDATE PARAMETROS SET CAPITAL = :balanceUsd, DISPONIBLE = :balanceUsd  WHERE USUARIO=:usuario");
          $updateEstableCoin->execute([
            ':usuario' => $usuario,
            ':balanceUsd' => $balances[$estableCoin]['available']
        ]);
      }

      refreshDatos($usuario);
  } catch (PDOException $e) {
      echo "Error en la conexión a la base de datos: " . $e->getMessage();
  } catch (Exception $e) {
      echo "Error en la conexión a la API de Binance: " . $e->getMessage();
  } finally {
      if (isset($conexion)) {
          $conexion = null;
      }
  }
}

function refreshDataThor() {
  try {
      $dsn = "mysql:host={$GLOBALS['servidor']};dbname={$GLOBALS['database']};charset=utf8";
      $conexion = new PDO($dsn, $GLOBALS['user'], $GLOBALS['password']);
      $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

      $api = new Binance\API(sqlApiKeyAdmin(), sqlApiSecretAdmin());
      $api->useServerTime();
      $price = $api->prices();
      $balances = $api->balances();

      $consulta = "SELECT * FROM DATOS";
      $stmt = $conexion->query($consulta);

      while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
          $asset = $row['ASSET'];
          $available_mon = $row['MONEDA'];
          $available = $price[$available_mon];
          $axie = readPrices($available_mon);
          $priceArriba = formatPrice($axie['ARRIBA'], $row['ASSET'], $row['PAR']);
          $priceAbajo = formatPrice($axie['ABAJO'], $row['ASSET'], $row['PAR']);
          
          updatePrices($available_mon, "ACTUAL={$available}");
          updatePrices($available_mon, "CLOSE={$available}");
          if ($priceArriba == 0) {
              updatePrices($available_mon, "ARRIBA={$available}");
          }

          if ($priceAbajo == 0) {
              updatePrices($available_mon, "ABAJO={$available}");
          }

          if ($priceArriba < $available) {
              updatePrices($available_mon, "ARRIBA={$available}");
          }

          if ($priceAbajo > $available) {
              updatePrices($available_mon, "ABAJO={$available}");
          }

          refreshDatosMon($available_mon);
      }
  } catch (PDOException $e) {
      echo "Error en la conexión a la base de datos: " . $e->getMessage();
  } catch (Exception $e) {
      echo "Error en la conexión a la API de Binance: " . $e->getMessage();
  } finally {
      if (isset($conexion)) {
          $conexion = null;
      }
  }
}

function returnGrafica($usuario,$moneda) {
  $datos = readDatosMoneda($moneda);
  $conexion = mysqli_connect($GLOBALS["servidor"], $GLOBALS["user"], $GLOBALS["password"], $GLOBALS["database"]);
  if (!$conexion) {
      echo "Refresh page, Failed to connect to Data...";
      exit();
  } 
  else {
      $consulta = "SELECT * FROM PRICES WHERE MONEDA = '{$moneda}' AND YEAR(FECHA) = YEAR(CURDATE()) ORDER BY FECHA DESC LIMIT 30";

      $resultado = mysqli_query($conexion, $consulta);
      $obj = array();

      while ($row = mysqli_fetch_array($resultado)) {          
          if ($row['ABAJO'] > 0 && $row['ARRIBA'] > 0) {
              $minAnterior = readMinAnterior($row["MONEDA"]);
              $promedio = ($minAnterior + $row["ACTUAL"]) /2;
              $timestamp = strtotime($row['FECHA']);
              $obj[] = array(
                'date' => date("Y-m-d", $timestamp), 
                'open' => formatPrice($row['OPEN'], $datos['ASSET'], $datos['PAR']), 
                'high'=> formatPrice($row['ARRIBA'], $datos['ASSET'], $datos['PAR']),
                'low' => formatPrice($row['ABAJO'], $datos['ASSET'], $datos['PAR']),
                'close' => formatPrice($row['CLOSE'], $datos['ASSET'], $datos['PAR']),
                'prm' => formatPrice($promedio, $datos['ASSET'], $datos['PAR']));              
          }
      }

      mysqli_close($conexion);
      return $obj ;
  }
}

function listAsset($usuario){
  $cadena="";
  $conexion = mysqli_connect($GLOBALS["servidor"],$GLOBALS["user"],$GLOBALS["password"],$GLOBALS["database"]);
  if (!$conexion) {
    echo "Refresh page, Failed to connect to Data...";
    exit();
  }else{
    $consulta = "select * from DATOSUSUARIOS WHERE USUARIO='$usuario'";
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

function findEscalones($usuario) {
  $didable_button = ""; 
  $didable_cancel_button = ""; 
  $didable_ckecked_button ="";
  $fecha = "";
  $colorAlert = "transparent";  
  $colorRow = "transparent";  
  $miganancia = 0;  
  $precioActual = 0;  
  $botones = "";
  $cadena = "<table style=width:100%;><th>Stop</th><th>Tipo</th><th>Compra/Venta</th><th>Moneda</th><th style=text-align:right;>Ganancia</th><th>Opciones</th>";  
  
  if (recordCountUser($usuario,"TRADER") > 0) {
      $conexion = mysqli_connect($GLOBALS["servidor"], $GLOBALS["user"], $GLOBALS["password"], $GLOBALS["database"]);
      
      if (!$conexion) {
          error_log("Failed to connect to database: " . mysqli_connect_error());
          return "Refresh page, Failed to connect to Data...";
      }

      $consulta = "SELECT * FROM TRADER WHERE USUARIO='$usuario' ORDER BY ESCALON";
      $resultado = mysqli_query($conexion, $consulta);
      
      if (!$resultado) {
          error_log("Error in query: " . mysqli_error($conexion));
          mysqli_close($conexion);
          return "Error retrieving data.";
      }      
      
      while ($row = mysqli_fetch_array($resultado)) {
          $puntos = readParametros($usuario)['STOPLOSS'];
          $colorAlert = "#CFCFD3"; 
          $colorRow = "transparent";
          $available = readPrices($row['MONEDA']);  
          $datos = readDatosMoneda($row['MONEDA']);
          $precioActual = formatPrice($available['ACTUAL'], $datos['ASSET'], $datos['PAR']);
          $precioMoneda = formatPrice($precioActual, $datos['ASSET'], $datos['PAR']);
          $precioVenta = formatPrice($row['PRECIOVENTA'], $datos['ASSET'], $datos['PAR']);
          $stopPrice = calcularMargenPerdida($row['PRECIOCOMPRA'], $puntos);
          $precioAbajo = $available['ABAJO'];
          $porcenmax = (porcenConjunto(price($stopPrice), price($row['PRECIOCOMPRA']), $precioActual) * 3.6) . "deg";

          $colorAlert = ($row['PRECIOCOMPRA'] > $precioActual) ? "#F37A8B" : "#4BC883";
          
          if (strlen($row['ORDERVENTA']) > 0) {
            $miganancia = ($row['CANTIDAD'] * $precioActual) - ($row['CANTIDAD'] * $row['PRECIOCOMPRA']);            
            $didable_button = "";
            $didable_cancel_button = "disabled";
            $didable_ckecked_button = ($row['AUTOSELL'] == 1) ? "checked" : "";
          }
          else {
            $miganancia = 0;
            $colorAlert = "#CFCFD3";
            $didable_button = "disabled";
            $didable_cancel_button = "disabled";
          }
          
          if ($row['NEGATIVO'] == 1) {
              $totalMonedaObtenida = $row['CANTIDAD'];
              $totalMonedaActual = $row['VENTA'] / $precioActual;
              $real_ganancia = $totalMonedaActual - $totalMonedaObtenida;
              if ($real_ganancia > 0) {
                  $bk = "#15342D"; 
                  $fg = "#4BC883";
                  $sy = "&#9650;"; 
                  $porcenMaxNeg = "360deg";
              } 
              else {
                  $bk = "#372127"; 
                  $fg = "#F37A8B";
                  $sy = "&#9660;"; 
                  $porcenMaxNeg = "0deg";
              }
              $wall = "<div style=width:100%;padding:3px;background:{$bk};border-radius:3px;color:{$fg};>" . quantity($row['CANTIDAD'], $datos['ASSET'], $datos['PAR']) . " " . $datos['ASSET'] . "<span style=color:{$fg};> {$sy}</span></div>";
              $botones = "<input title=Auto type=checkbox {$didable_ckecked_button} class=escalbutton style=background:#EAB92B;width:21px; onclick=autosell({$row['ID']})><button type=button class=escalbutton style=background:green;color:white; onclick=negativoBuy({$row['ID']})>Buy</button>";
              $cadena .= "<tr style=background:transparent;color:white;><td><div class=odometro style=--data:{$porcenMaxNeg};></div></td><td style=color:white;>{$row['TIPO']}</td><td>{$precioVenta}$</td><td style=text-align:right;>{$wall}</td><td style=text-align:right;><span style=font-weight:bold;color:{$fg};>".number_format($real_ganancia, 8, ".", ",")."{$datos['ASSET']}</span></td><td style=text-align:right;>{$botones}</td></tr>";
          } 
          else {
              $precioCompra = formatPrice($row['PRECIOCOMPRA'], $datos['ASSET'], $datos['PAR']);
              if ($didable_cancel_button == "disabled") {
                  $botones = "<input title=auto type=checkbox {$didable_ckecked_button} class=escalbutton style=background:#EAB92B;width:21px; onclick=autosell({$row['ID']})><button {$didable_button} type=button class=escalbutton style=background:#EA465C; onclick=perdida({$row['ID']})>Sell</button>";              
              } else {
                  $botones = "<button {$didable_cancel_button} type=button class=escalbutton style=background:#EAB92B;width:21px; onclick=borrar({$row['ID']})>&#10006;</button><button {$didable_button} type=button class=escalbutton style=background:#EA465C; onclick=perdida({$row['ID']})>Sell</button>";   
              }
              $cadena .= "<tr style=background:{$colorRow};color:{$colorAlert};><td><div class=odometro style=--data:{$porcenmax};></div></td><td style=color:white;>{$row['TIPO']}</td><td style=color:white;>{$precioCompra}$</td><td style=text-align:right;>" . totalmoneda($usuario,$row['MONEDA'])['total'] . "</td><td style=text-align:right;><span style=font-weight:bold;>" . number_format($miganancia, 2, ".", ",") . "</span>$</td><td style=text-align:right;>{$botones}</td></tr>";
          }        
       }

      mysqli_close($conexion);      
  }

  $cadena .= "</table>";
  return $cadena;
}

function findBinance($usuario) { 
  $cadena = "<table style=width:100%;><th>Estatus</th><th>Moneda</th><th>Cant.</th><th>Orden Id</th><th>Tipo</th><th>Opciones</th>";
  $conexion = mysqli_connect($GLOBALS["servidor"], $GLOBALS["user"], $GLOBALS["password"], $GLOBALS["database"]);

  if (!$conexion) {
      error_log("Failed to connect to database: " . mysqli_connect_error());
      return "Refresh page, Failed to connect to Data...";
  }

  $consulta = "SELECT * FROM ORDERBINANCE WHERE USUARIO='$usuario'";
  $resultado = mysqli_query($conexion, $consulta);

  if (!$resultado) {
      error_log("Error in query: " . mysqli_error($conexion));
      mysqli_close($conexion);
      return "Error retrieving data.";
  }

  while ($row = mysqli_fetch_array($resultado)) {
      $colorRow = ($row['TIPO'] == "SELL") ? "#F37A8B" : "#4BC883";

      $cadena .= "<tr style=color:{$colorRow};><td><span>{$row['ESTATUS']}</span></td><td><span>{$row['MONEDA']}</span></td><td><span>" . price($row['CANTIDAD']) . "</span></td><td><span>{$row['ORDERID']}</span></td><td><span>{$row['TIPO']}</span></td><td><button type=button class=escalbutton style=background:#EAB92B; onclick=cancelOrdenBinance({$row['ORDERID']})'>&#10006;</button></td></tr>";
  }

  mysqli_close($conexion);
  $cadena .= "</table>";
  return $cadena;
}

function refreshDatos($usuario){
  $row = readDatos($usuario);
  $row2 = readParametros($usuario);
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
    $xdisponible =   price($capital);
    $bina = $row2['BINANCE'];
    $recordCount = recordCount("TRADER");
    $sumMoneda = totalmoneda($usuario,$moneda);
    $symbol = nivelAnterior($moneda);
    $mercado = totalTendencia($rowBtc['MONEDA']);
    $checkMesGrafico = true;
    $checkAnoGrafico = false;
    $invxcompra = formatPrice(($capital / $row2['ESCALONES']),$row['ASSET'],$row['PAR']);

    if($row2["GRAFICO"]==1){
      $checkMesGrafico = false;
      $checkAnoGrafico = true;
    }
    
    if($priceMoneda < $promedioFlotante){
        $color = "#F37A8B";
    }
    else{
        $color = "#4BC883";
    }

    if($row2['DISPONIBLE'] < $invxcompra){
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
    
    $obj = array(
      'tipografico' => readParametros($usuario)['GRAFICO'],
      'balance_asset'=>$row['BALANCE_ASSET'],
      'par'=>$row['PAR'],
      'asset' => $row['ASSET'], 
      'ultimaventa' => formatPrice($row['ULTIMAVENTA'],$row['ASSET'],$row['PAR']), 
      'price' => $priceMoneda,
      'btc' => $bitcoin,
      'colorbtc' => $colorbtc, 
      'symbol' => $symbol, 
      'moneda' => $moneda,
      'tendencia' => dayTendencia($moneda),
      'color' => $color,
      'maxdia' => $priceArriba,
      'mindia' => $priceAbajo,
      'totalTendencia' => totalTendencia($moneda),
      'utc' => date('g:i A'),
      'techo' => $promedioFlotante,
      'piso' => $promedioUndante,
      'totalmoneda' => $sumMoneda['total'], 
      'm_balance' => $sumMoneda['m_balance'],
      'ant' => readFlotadorAnterior($moneda),
      'nivel' => nivel($moneda),
      'nivelbtc' => nivelBtc(),
      'porcenmax' => $porcenmax,
      'ganancia' => price($row2['GANANCIA']),
      'perdida' => price($row2['PERDIDA']),
      'capital' => price($row2['CAPITAL']),
      'disponible' => price($row2['DISPONIBLE']),
      'escalones' => $row2['ESCALONES'],
      'invxcompra' => $invxcompra,
      'totalpromedio' => $totalPromedio,
      'xdisponible' => $xdisponible,
      'grafico' => returnGrafica($usuario,$moneda),
      'auto' => $auto,'bina' => $bina,
      'impuesto' => price($row2['IMPUESTO']),
      'mercado' =>$mercado, 
      'id' => $row['ID'],
      'recordCount' => $recordCount,
      'colordisp' => $colorDisp,
      'checkMesGrafico'=>$checkMesGrafico,
      'recupera' => totales($usuario,$moneda)['recupera'],
      'alert' =>returnAlertas($moneda),
      'checkAnoGrafico'=>$checkAnoGrafico,
      'verescalones' => findEscalones($usuario),
      'verbinance' => findBinance($usuario),
      'labelpricebitcoin' => $labelPriceBitcoin,
      'labelpricemoneda' => $labelPriceMoneda,
      'precio_venta' => $row2['AUTOSHELL'],
      'listasset' => listAsset($usuario),
      'stop' => $row2['STOPLOSS'],
      'balance' => $row['BALANCE_ASSET'],
      'nivelcompra' => nivelCompra($moneda) ); 

    sqlconector("UPDATE PARAMETROS SET INVXCOMPRA=$invxcompra, DATOS='".json_encode($obj)."' WHERE USUARIO = '$usuario'");

  }
}

function refreshDatosMon($mon){
  $usuario= $GLOBALS['tokenadmin'];
  $row = readDatosMoneda($mon);
  $rowBtc = readDatosAsset("BTC");
  $moneda=$row['MONEDA'];
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

    $symbol = nivelAnterior($moneda);
    $mercado = totalTendencia($rowBtc['MONEDA']);
    
    if($priceMoneda < $promedioFlotante){
        $color = "#F37A8B";
    }
    else{
        $color = "#4BC883";
    }

    if($bitcoin < $promedioFlotanteBtc){
      $colorbtc = "#F37A8B";
    }
    else{
      $colorbtc = "#4BC883";
    }  
    
    $obj = array(
      'balance_asset'=>$row['BALANCE_ASSET'],
      'par'=>$row['PAR'],
      'asset' => $row['ASSET'],
      'price' => $priceMoneda,'btc' => $bitcoin, 
      'colorbtc' => $colorbtc, 
      'symbol' => $symbol, 
      'moneda' => $moneda,
      'tendencia' => dayTendencia($moneda),
      'color' => $color,
      'maxdia' => $priceArriba,
      'mindia' => $priceAbajo, 
      'totalTendencia' => totalTendencia($moneda),
      'utc' => date('g:i A'),
      'techo' => $promedioFlotante,
      'piso' => $promedioUndante,
      'ant' => readFlotadorAnterior($moneda),
      'nivel' => nivel($moneda),
      'nivelbtc' => nivelBtc(),
      'porcenmax' => $porcenmax,
      'totalpromedio' => $totalPromedio,
      'grafico' => returnGrafica($usuario,$moneda),
      'mercado' =>$mercado, 
      'id' => $row['ID'],
      'alert' =>returnAlertas($moneda),
      'labelpricebitcoin' => $labelPriceBitcoin,
      'labelpricemoneda' => $labelPriceMoneda,
      'nivelcompra' => nivelCompra($moneda)); 

    sqlconector("UPDATE DATOS SET DATOS='".json_encode($obj)."' WHERE MONEDA='$moneda'");
  }
}
?>
