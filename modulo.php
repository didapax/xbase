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

function ifTransactionExist($moneda,$usuario) {
  $consulta = "select COUNT(*) AS TOTAL from TRADER where MONEDA='{$moneda}' AND USUARIO='{$usuario}'";
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
            $bytes = random_bytes(5);
            $referencia = bin2hex($bytes);
            sqlconector("UPDATE TRADER SET ORDERVENTA='{$referencia}', LIQUIDAR=1 WHERE ID={$row['ID']}");
            
        }          
      } catch (Exception $e) {
          // Manejo de errores
          error_log("Error al obtener el estado de la orden: " . $e->getMessage());
          return;
      }
  }
}

function autoSell($usuario,$moneda){
  $datos= readParametros($usuario);
  $cantidad = readDatosMonedaUser($usuario,$moneda)['BALANCE_ASSET'];
  $escalon = recordCountUser($usuario,"TRADER") +1;
  $asset = readDatosMoneda($moneda);
  $price = formatPrice(readPrices($moneda)['ACTUAL'],$asset['ASSET'],$asset['PAR']);
  $order ="";
  $venta = $price * $cantidad;

  if($venta > 9){
    $api = new Binance\API(sqlApiKey($usuario), sqlApiSecret($usuario));
    $api->useServerTime();
    $operacion = descontarImpuesto($usuario, $cantidad);
    $quantity = quantity($operacion,$asset['ASSET'],$asset['PAR']);
    $api->useServerTime();
    $order = $api->marketSell($moneda, $quantity);        

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
}

function autoBuy($usuario,$moneda){
  $autoBuy = readParametros($usuario)['AUTOBUY'];  
  $invxcompra = readParametros($usuario)['INVXCOMPRA'];
  $precioMarket = readPrices($moneda)['ACTUAL'];
  $totalCompra = $invxcompra / $precioMarket;
  $asset = readDatosMoneda($moneda);
  $quantity = quantity($totalCompra,$asset['ASSET'],$asset['PAR']);
  $escalon = recordCountUser($usuario,"TRADER") +1;

  if($autoBuy == 1 && $invxcompra > 9){
    $api = new Binance\API(sqlApiKey($usuario), sqlApiSecret($usuario));
    $api->useServerTime();

    $binance = $api->marketBuy($moneda, $quantity);
    if(isset($binance['orderId'])){
      sqlconector("INSERT INTO TRADER(USUARIO,MONEDA,ORDERID,COMPRA,CANTIDAD,PRECIOCOMPRA,ESCALON) VALUES(
        '$usuario',
        '{$moneda}',
        '{$binance['orderId']}',
        {$invxcompra},
        {$quantity},
        {$precioMarket},
        {$escalon}
      )");
    }else{
      echo "error: 0001"; 
    }
  
    reordenarEscalones($usuario);
    refreshDatos($usuario);    
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
      //echo "\noperacion sin impuesto= {$row['CANTIDAD']}\nquantity= $quantity";

      $api = new Binance\API(sqlApiKey($row['USUARIO']), sqlApiSecret($row['USUARIO']));
      $api->useServerTime();

      try {
          if ($row['TIPO'] == "BUY") {
              $priceBuy = $row['PRECIOCOMPRA'];
              $precioActual = readPrices($moneda)['ACTUAL'];
              $stopPrice = calcularMargenPerdida($priceBuy, $param['STOPLOSS']);
              //echo "\n stop a = $stopPrice";
              if($precioActual > 0){
                if ($precioActual <= $stopPrice && $row['AUTOSTOP'] == 1) {
                  $order = $api->marketSell($moneda, $quantity);
                  if (isset($order['orderId'])) {
                      liquidar($id);
                  }
              } 
              else {
                  if ($row['AUTOSELL'] == 1) {
                      $autoSell = calcularMargenGanancia($priceBuy, $param['AUTOSHELL']);
                      //echo "\n  Venta a = $autoSell";
                      if ($precioActual > $autoSell) {
                          $order = $api->marketSell($moneda, $quantity);
                          if (isset($order['orderId'])) {
                              liquidar($id);
                          }
                      }
                  }
              }
            }
          } 
          else {
              $priceSell = $row['PRECIOVENTA'];
              $priceActual = readPrices($moneda)['ACTUAL'];
              $stopPrice = calcularMargenGanancia($priceSell, $param['STOPLOSS']);
              if($priceActual > 0){
                if ($priceActual >= $stopPrice && $row['AUTOSTOP'] == 1) {
                  $order = $api->marketBuy($moneda, $quantity);
                  if (isset($order['orderId'])) {
                      liquidar($id);
                  }
                } 
                else {
                  if ($row['AUTOSELL'] == 1) {
                      $autoSell = calcularMargenPerdida($priceSell, $param['AUTOSHELL']);
                      if ($priceActual < $autoSell) {
                          $order = $api->marketBuy($moneda, $quantity);
                          if (isset($order['orderId'])) {
                              liquidar($id);
                          }
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
  $moneda = $row['MONEDA'];
  if($row['TIPO'] == "BUY"){
    $datos= readParametros($row['USUARIO']);    
    $precioVenta = readPrices($moneda)['ACTUAL'];
    $precioCompra = $row['PRECIOCOMPRA'];
    $compra = $row['COMPRA'];    
    $cantidad = $row['CANTIDAD'];
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
    
    sqlconector("UPDATE PARAMETROS SET GANANCIA = $ganancia, PERDIDA = $perdida WHERE USUARIO='".$row['USUARIO']."'");
    sqlconector("UPDATE DATOSUSUARIOS SET ULTIMACOMPRA= $precioCompra, ULTIMAVENTA = $precioVenta WHERE MONEDA = '$moneda' AND USUARIO='".$row['USUARIO']."'");
    sqlconector("DELETE FROM TRADER WHERE ID = $id");
  }
  else{
    $precioVenta = $row['PRECIOVENTA']; 
    $precioCompra = readPrices($moneda)['ACTUAL'];
    sqlconector("UPDATE DATOSUSUARIOS SET ULTIMACOMPRA= $precioCompra, ULTIMAVENTA = $precioVenta WHERE MONEDA = '$moneda' AND USUARIO='".$row['USUARIO']."'");
    sqlconector("DELETE FROM TRADER WHERE ID = $id");
  }
  reordenarEscalones($row['USUARIO']);
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

function animoTrader($usuario){
  $tendencia = "";
  $ganancias = readParametros($usuario)['GANANCIA'];
  $perdidas = readParametros($usuario)['PERDIDA'];
  if($ganancias > $perdidas){
    $tendencia = "<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>";
  }else{
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
  
  $vela_red_1 = readMinAnterior_Interval($moneda, 1);
  $vela_red_2 = readMinAnterior_Interval($moneda, 2);
  $vela_red_3 = readMinAnterior_Interval($moneda, 3);
  
  $min_value = min($vela_red_1, $vela_red_2, $vela_red_3);

  $porcenmax = porcenConjunto($min_value, $priceArriba, $precio);
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

    $totalMoneda = price(row_sqlconector("SELECT SUM(CANTIDAD) AS SUMA FROM TRADER WHERE TIPO='BUY' AND USUARIO='$usuario' AND MONEDA='{$moneda}' AND LENGTH(ORDERVENTA) > 0")['SUMA']);
    $totalInversion = price(row_sqlconector("SELECT SUM(COMPRA) AS SUMA FROM TRADER WHERE TIPO='BUY' AND  USUARIO='$usuario' AND MONEDA='{$moneda}' AND LENGTH(ORDERVENTA) > 0")['SUMA']);

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
    $m_balance = $totalMoneda - $datos['BALANCE_ASSET'];
  }else{
    $m_balance = $datos['BALANCE_ASSET'] - $totalMoneda;
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

      $consulta = "SELECT * FROM DATOSUSUARIOS WHERE USUARIO='$usuario'";
      $stmt = $conexion->query($consulta);

      while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
          $asset = $row['ASSET'];
          $available_mon = $row['MONEDA'];
          $axie = readPrices($available_mon);

          $updateBalance = $conexion->prepare("UPDATE DATOSUSUARIOS SET BALANCE_ASSET = :balance WHERE USUARIO=:usuario AND MONEDA = :moneda");
          $updateBalance->execute([
              ':usuario' => $usuario,
              ':balance' => $balances[$asset]['available'],
              ':moneda' => $available_mon
          ]);
      }

      $capitalinvertido = row_sqlconector("SELECT COALESCE(SUM(VENTA), 0) AS TOTAL FROM TRADER WHERE USUARIO ='$usuario' AND TIPO='SELL'")['TOTAL'];
      $balanceUsd = $balances[$estableCoin]['available'] - $capitalinvertido;
      $updateEstableCoin = $conexion->prepare("UPDATE PARAMETROS SET CAPITAL = :balanceUsd, DISPONIBLE = :balanceUsd  WHERE USUARIO=:usuario");
      $updateEstableCoin->execute([
        ':usuario' => $usuario,
        ':balanceUsd' => $balanceUsd
    ]);      

  } catch (PDOException $e) {
      echo "Error en la conexión a la base de datos: " . $e->getMessage();
  } catch (Exception $e) {
      echo "Error en la conexión a la API de Binance: " . $e->getMessage();
  } finally {
      if (isset($conexion)) {
          $conexion = null;
      }
      return refreshDatos($usuario);
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
      //$balances = $api->balances();

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
  }
  else{
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
  $style_ckecked_auto = "";
  $style_ckecked_stop = "";
  $fecha = "";
  $color = "#CFCFD3";
  $bk="transparent";
  $symbol = "&#9660;";
  $colorRow = "transparent";  
  $miganancia = 0;  
  $precioActual = 0;  
  $botones = "";
  $t_moneda = "<div style=width:100%;padding:3px;background:{$bk};border-radius:3px;color:{$color};>".currency(0.00)." MONEY</div>";
  $cadena = "<table style=width:100%;><th></th><th>Dias</th><th>Tipo</th><th>Precio</th><th>Moneda</th><th style=text-align:right;>Ganancia</th><th>Opciones</th>";  
  
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
          $color = "#CFCFD3"; 
          $colorRow = "transparent";
          $available = readPrices($row['MONEDA']);  
          $datos = readDatosMoneda($row['MONEDA']);
          $precioActual = formatPrice($available['ACTUAL'], $datos['ASSET'], $datos['PAR']);
          $precioMoneda = formatPrice($precioActual, $datos['ASSET'], $datos['PAR']);
          $precioVenta = formatPrice($row['PRECIOVENTA'], $datos['ASSET'], $datos['PAR']);
          $stopPrice = calcularMargenPerdida($row['PRECIOCOMPRA'], $puntos);
          $precioAbajo = $available['ABAJO'];
          $porcenmax = (porcenConjunto(price($stopPrice), price($row['PRECIOCOMPRA']), $precioActual) * 3.6) . "deg";
          $dias = "1";

          if (strlen($row['ORDERVENTA']) > 0) {
            $miganancia = ($row['CANTIDAD'] * $precioActual) - ($row['CANTIDAD'] * $row['PRECIOCOMPRA']);            
            $didable_button = "";
            $didable_cancel_button = "";

            $style_ckecked_auto = ($row['AUTOSELL'] == 1) ? "style=background-color:#4caf50;color:white;" : "";
            $style_ckecked_stop = ($row['AUTOSTOP'] == 1) ? "style=background-color:#4caf50;color:white;" : ""; 
            $dias = calcularDiasEntreFechas($row['FECHA'], date('Y-m-d'));
          }
          else {
            $miganancia = 0;
            $color = "#CFCFD3";
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
              $botones = "<button type=button id=btnstop{$row['ID']} onclick=autostop({$row['ID']}) class=btn-label1 {$style_ckecked_stop}>Stop</button><button type=button id=btnauto{$row['ID']} onclick=autosell({$row['ID']}) class=btn-label2 {$style_ckecked_auto}>Auto</button><button class=btn-label1 style=background:green; onclick=negativoBuy({$row['ID']})>Buy</button><button {$didable_cancel_button}  title=eliminar class=btn-label2 style=background:#EAB92B; onclick=borrar({$row['ID']})>x</button>";
              $cadena .= "<tr style=background:transparent;color:white;><td><div class=odometro style=--data:{$porcenMaxNeg};></div></td><td>$dias</td><td style=color:white;>{$row['TIPO']}</td><td>{$precioVenta}$</td><td style=text-align:right;>{$wall}</td><td style=text-align:right;><span style=font-weight:bold;color:{$fg};>".number_format($real_ganancia, 8, ".", ",")."{$datos['ASSET']}</span></td><td style=text-align:right;>{$botones}</td></tr>";
          }
          else {
            if($precioActual < $row['PRECIOCOMPRA']){
              $color = "#F37A8B";
              $bk = "#372127";
              $symbol = "&#9660;"; 
            }
            else{
              $color = "#4BC883";
              $bk = "#15342D";
              $symbol = "&#9650;";
            }          

            $t_moneda = "<div style=width:100%;padding:3px;background:{$bk};border-radius:3px;color:{$color};>".formatPrice($row['CANTIDAD'], $datos['ASSET'], $datos['PAR']) . " " . $datos['ASSET']." <span style=color:{$color};>{$symbol}</span></div>";
            $precioCompra = formatPrice($row['PRECIOCOMPRA'], $datos['ASSET'], $datos['PAR']);
            
            if ($didable_cancel_button == "disabled") {
                  $botones = "";              
            }
            else {
                  $botones = "<button type=button id=btnstop{$row['ID']} onclick=autostop({$row['ID']}) class=btn-label1 {$style_ckecked_stop}>Stop</button><button type=button id=btnauto{$row['ID']} onclick=autosell({$row['ID']}) class=btn-label2 {$style_ckecked_auto}>Auto</button><button {$didable_button} class=btn-label1 style=background:#EA465C; onclick=perdida({$row['ID']})>Sell</button><button {$didable_cancel_button} class=btn-label1 title=eliminar style=background:#EAB92B; onclick=borrar({$row['ID']})>x</button>";
            }
            $cadena .= "<tr style=background:{$colorRow};><td><div class=odometro style=--data:{$porcenmax};></div></td><td>$dias</td><td style=color:white;>{$row['TIPO']}</td><td style=color:white;>{$precioCompra}$</td><td style=text-align:right;>".$t_moneda."</td><td style=text-align:right;><span style=font-weight:bold;color:{$color}>".number_format($miganancia, 2, ".", ",")."$</span></td><td style=text-align:right;>{$botones}</td></tr>";
          }        
       }

      mysqli_close($conexion);      
  }

  $cadena .= "</table>";
  return $cadena;
}

function calcularDiasEntreFechas($fechaInicial, $fechaFinal) {
  $fechaInicio = new DateTime($fechaInicial);
  $fechaFin = new DateTime($fechaFinal);

  $diferencia = $fechaInicio->diff($fechaFin);

  return $diferencia->format('%a');
}

function getpante($usuario){ 
  $row = readDatos($usuario); 
  $moneda=$row['MONEDA'];
  $precio = formatPrice(readPrices($moneda)['ACTUAL'],$row['ASSET'],$row['PAR']);
  $puntos = readParametros($usuario)['STOPLOSS'];
  $pante = calcularMargenPerdida($precio,$puntos); 
  return formatPrice($pante,$row['ASSET'],$row['PAR']);
}
 
function refreshDatos($usuario){
  try {
    $row = readDatos($usuario);
    $row2 = readParametros($usuario);
    $rowBtc = readDatosAsset("BTC");
    $moneda=$row['MONEDA'];
    $auto = $row2['AUTOBUY'];

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
    $invxcompra = floor(formatPrice(($capital / $row2['ESCALONES']),$row['ASSET'],$row['PAR']));

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
      'pante' => getpante($usuario),      
      'animotrader' => animoTrader($usuario),
      'balance_asset'=>$row['BALANCE_ASSET'],
      'par'=>$row['PAR'],
      'tipografico' => readParametros($usuario)['GRAFICO'],
      'asset' => $row['ASSET'], 
      'ultimaventa' => formatPrice($row['ULTIMAVENTA'],$row['ASSET'],$row['PAR']), 
      'ultimacompra' => formatPrice($row['ULTIMACOMPRA'],$row['ASSET'],$row['PAR']), 
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
      'totalpromedio' => formatPrice($totalPromedio,$row['ASSET'],$row['PAR']),
      'xdisponible' => $xdisponible,      
      'auto' => $auto,
      'bina' => $bina,
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
      'labelpricebitcoin' => $labelPriceBitcoin,
      'labelpricemoneda' => $labelPriceMoneda,
      'precio_venta' => $row2['AUTOSHELL'],
      'listasset' => listAsset($usuario),
      'stop' => $row2['STOPLOSS'],
      'balance' => $row['BALANCE_ASSET'],
      'nivelcompra' => nivelCompra($moneda) 
    ); 

    $objGraf = array(
      'grafico' => returnGrafica($usuario,$moneda)
    );

    $result = sqlconector("UPDATE PARAMETROS SET INVXCOMPRA=$invxcompra,DATOSGRAF='".json_encode($objGraf)."', DATOS='".json_encode($obj)."' WHERE USUARIO = '$usuario'");

    if($result){
      return TRUE;
    }
  }catch (Exception $e){
    return FALSE;
  }  
}

function refreshDatosMon($mon){
  //$usuario= $GLOBALS['tokenadmin'];
  $row = readDatosMoneda($mon);
  $rowBtc = readDatosAsset("BTC");
  $moneda=$row['MONEDA'];

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
      'techo' => $promedioFlotante,
      'piso' => $promedioUndante,
      'ant' => readFlotadorAnterior($moneda),
      'nivel' => nivel($moneda),
      'nivelbtc' => nivelBtc(),
      'porcenmax' => $porcenmax,
      'totalpromedio' => $totalPromedio,      
      'mercado' =>$mercado, 
      'id' => $row['ID'],
      'alert' =>returnAlertas($moneda),
      'labelpricebitcoin' => $labelPriceBitcoin,
      'labelpricemoneda' => $labelPriceMoneda,
      'nivelcompra' => nivelCompra($moneda)
    ); 

    sqlconector("UPDATE DATOS SET DATOS='".json_encode($obj)."' WHERE MONEDA='$moneda'");

}
?>
