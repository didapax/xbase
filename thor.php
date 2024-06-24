<?php
require 'modulo.php';
date_default_timezone_set("UTC");

function buscarEscalones(){
  if(recordCount("TRADER")>0){ 
    $conexion = mysqli_connect($GLOBALS["servidor"],$GLOBALS["user"],$GLOBALS["password"],$GLOBALS["database"]);
    $consulta = "select * from TRADER ORDER BY ESCALON DESC";
    $resultado = mysqli_query( $conexion, $consulta );
    while($row = mysqli_fetch_array($resultado)){
      if(strlen($row['ORDERID']) > 0){
        sellOrder($row['ORDERID']);
      }
      autoLiquida($row['ID']);
    }    
    mysqli_close($conexion);
  }
}

$tiempo = 10;
$limit = 1;
$dormir = 2;

$conexion = mysqli_connect($GLOBALS["servidor"],$GLOBALS["user"],$GLOBALS["password"],$GLOBALS["database"]);
if(!$conexion){
  echo "Refresh page, Failed to connect to Data...";
  exit();
}
else{
  $api = new Binance\API(sqlApiKey(), sqlApiSecret());
  while ($limit <= $tiempo)
  {
    echo $limit;
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
      $priceArriba = $axie['ARRIBA'];
      $priceAbajo = $axie['ABAJO'];
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
    
    refreshDatos();
    buscarEscalones();
    sleep($dormir);
    $limit++;
  }
}
mysqli_close($conexion);
?>
