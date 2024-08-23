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
        $conexion = new mysqli($GLOBALS["servidor"], $GLOBALS["user"], $GLOBALS["password"], $GLOBALS["database"]);
        if ($conexion->connect_error) {
            throw new Exception("Conexión fallida: " . $conexion->connect_error);
        }

        $api = new Binance\API(sqlApiKey(), sqlApiSecret());
        while ($limit <= $tiempo) {
            $api->useServerTime();
            $price = $api->prices();
            $balances = $api->balances();

            if (recordCount("ORDERBINANCE") > 0) {
                $conexion->query("DELETE FROM ORDERBINANCE");
            }

            $consulta = "SELECT * FROM DATOS";
            $resultado = $conexion->query($consulta);
            while ($row = $resultado->fetch_assoc()) {
                $asset = $row['ASSET'];
                $available_mon = $row['MONEDA'];
                $available = $price[$available_mon];
                $axie = readPrices($available_mon);
                $priceArriba = $axie['ARRIBA'];
                $priceAbajo = $axie['ABAJO'];
                updatePrices($available_mon, "ACTUAL={$available}");

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

                if (row_sqlconector("SELECT COUNT(*) AS TOTAL FROM TRADER WHERE MONEDA='{$available_mon}'")['TOTAL'] > 0) {
                    $openorders = $api->openOrders($available_mon);
                    foreach ($openorders as $order) {
                        $conexion->query("INSERT INTO ORDERBINANCE (MONEDA, ORDERID, TIPO, ESTATUS, PRECIO, CANTIDAD) VALUES ('{$order['symbol']}', '{$order['orderId']}', '{$order['side']}', '{$order['status']}', {$order['price']}, {$order['origQty']})");
                    }
                }
                $conexion->query("UPDATE DATOS SET BALANCE_ASSET=" . $balances[$asset]['available'] . " WHERE MONEDA='{$available_mon}'");
            }

            refreshDatos();
            buscarEscalones();
            sleep($dormir);
            $limit++;
        }
    } catch (Exception $e) {
        echo "Error en refreshDataAuto: " . $e->getMessage();
    } finally {
        if (isset($conexion)) {
            $conexion->close();
        }
    }
}

refresh();
?>