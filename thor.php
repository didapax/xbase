<?php
require 'modulo.php';
date_default_timezone_set("UTC");

function buscarEscalones() {
    try {
        if (recordCount("TRADER") > 0) {            
            $conexion = new mysqli($GLOBALS["servidor"], $GLOBALS["user"], $GLOBALS["password"], $GLOBALS["database"]);
            if ($conexion->connect_error) {
                throw new Exception("Conexión fallida: " . $conexion->connect_error);
            }
            $consulta = "SELECT * FROM TRADER ORDER BY FECHA DESC";
            $resultado = $conexion->query($consulta);
            while ($row = $resultado->fetch_assoc()) {
                if (strlen($row['ORDERID']) > 0) {
                    sellOrder($row['ORDERID']);
                    autoLiquida($row['ORDERID']);
                    echo "\norder: ".$row['ORDERID'] ;
                }                
            }
        }
    } catch (Exception $e) {
        echo "Error en buscarEscalones: " . $e->getMessage();
    } finally {
        if (isset($conexion)) {
            $conexion->close();
        }
    }
}

//updateDecimals();
//updateStepSize();
buscarEscalones();
refreshDataThor();
?>