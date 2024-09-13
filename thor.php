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
            $consulta = "SELECT * FROM TRADER ORDER BY ESCALON DESC";
            $resultado = $conexion->query($consulta);
            while ($row = $resultado->fetch_assoc()) {
                if (strlen($row['ORDERID']) > 0) {
                    sellOrder($row['ORDERID']);
                }
                autoLiquida($row['ID']);
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

function refresh() {
    $tiempo = 10;
    $limit = 1;
    $dormir = 2;

    try {
        while ($limit <= $tiempo) {
            refreshDataThor();
            buscarEscalones();
            sleep($dormir);
            $limit++;
        }
    } catch (Exception $e) {
        echo "Error en refreshDataAuto: " . $e->getMessage();
    } finally {

    }
}

refresh();
?>