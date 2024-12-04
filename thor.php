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

function buscarAlertas() { 
    try {      
        $conexion = new mysqli($GLOBALS["servidor"], $GLOBALS["user"], $GLOBALS["password"], $GLOBALS["database"]);
        if ($conexion->connect_error) {
            throw new Exception("Conexión fallida: " . $conexion->connect_error);
        }
        $consulta = "SELECT * FROM DATOSUSUARIOS";
        $resultado = $conexion->query($consulta);
        while ($row = $resultado->fetch_assoc()) {
            $colorAlerta = returnAlertas($row['MONEDA']);
            if (readParametros($row['USUARIO'])['AUTOBUY'] == 1) {
                if(!ifTransactionExist($row['MONEDA'],$row['USUARIO'])){                    
                    if($colorAlerta == "yellow" || $colorAlerta == "gold"){
                        autoBuy($row['USUARIO'],$row['MONEDA']);
                    }
                }
            }
            if (readParametros($row['USUARIO'])['BINANCE'] == 1) {
                if(!ifTransactionExist($row['MONEDA'],$row['USUARIO'])){
                    if($colorAlerta == "lime"){
                        autoSell($row['USUARIO'],$row['MONEDA']);
                    }
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
refreshDataThor();
buscarEscalones();
buscarAlertas();
?>