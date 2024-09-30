-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-09-2024 a las 05:16:08
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fortunar_xbase`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos`
--

CREATE TABLE `datos` (
  `ID` int(11) NOT NULL,
  `MONEDA` varchar(10) DEFAULT 'BTCUSDT',
  `ASSET` varchar(10) DEFAULT 'BTC',
  `PAR` varchar(10) DEFAULT 'USDT',
  `BALANCE_ASSET` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `PRECIO_VENTA` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `PANTE` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `ACTIVO` int(11) DEFAULT 0,
  `ULTIMAVENTA` decimal(16,5) NOT NULL DEFAULT 0.00000,
  `DATOS` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`DATOS`)),
  `DECIMALS` int(11) NOT NULL DEFAULT 0,
  `STEPSIZE` decimal(20,10) DEFAULT 0.0000000000,
  `MINQTY` decimal(20,10) DEFAULT 0.0000000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `datos`
--

INSERT INTO `datos` (`ID`, `MONEDA`, `ASSET`, `PAR`, `BALANCE_ASSET`, `PRECIO_VENTA`, `PANTE`, `ACTIVO`, `ULTIMAVENTA`, `DATOS`, `DECIMALS`, `STEPSIZE`, `MINQTY`) VALUES
(1, 'BTCUSDT', 'BTC', 'USDT', 0.00000000, 60000.00000000, 18987.00000000, 0, 0.00000, '{\"balance_asset\":\"0.00000000\",\"par\":\"USDT\",\"asset\":\"BTC\",\"price\":\"64340.00\",\"btc\":\"64340.00\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:0deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"BTCUSDT\",\"tendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"65973.15\",\"mindia\":\"64274.01\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"utc\":\"3:13 AM\",\"techo\":\"63765.870666666667\",\"piso\":\"61917.464666666667\",\"ant\":\"66082.00000000\",\"nivel\":\"<div class=odometros style=--data:0deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:0deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"4%\",\"totalpromedio\":62841.66766666667,\"grafico\":[{\"date\":\"2024-09-29\",\"open\":\"65816.39\",\"high\":\"65973.15\",\"low\":\"64274.01\",\"close\":\"64340.00\",\"prm\":\"64892.00\"},{\"date\":\"2024-09-28\",\"open\":\"66052.62\",\"high\":\"66082.00\",\"low\":\"65444.00\",\"close\":\"65816.39\",\"prm\":\"65630.20\"},{\"date\":\"2024-09-27\",\"open\":\"65244.88\",\"high\":\"66225.44\",\"low\":\"65683.02\",\"close\":\"66052.62\",\"prm\":\"65748.31\"},{\"date\":\"2024-09-26\",\"open\":\"63491.99\",\"high\":\"65461.75\",\"low\":\"63353.77\",\"close\":\"65244.88\",\"prm\":\"65344.44\"},{\"date\":\"2024-09-25\",\"open\":\"64461.94\",\"high\":\"64458.00\",\"low\":\"62689.99\",\"close\":\"63491.99\",\"prm\":\"64468.00\"},{\"date\":\"2024-09-24\",\"open\":\"63127.99\",\"high\":\"64763.99\",\"low\":\"62739.91\",\"close\":\"64461.94\",\"prm\":\"64952.97\"},{\"date\":\"2024-09-23\",\"open\":\"64367.80\",\"high\":\"64455.13\",\"low\":\"62748.00\",\"close\":\"63127.99\",\"prm\":\"64286.00\"},{\"date\":\"2024-09-22\",\"open\":\"63106.00\",\"high\":\"64681.99\",\"low\":\"62390.01\",\"close\":\"64367.80\",\"prm\":\"64905.90\"},{\"date\":\"2024-09-21\",\"open\":\"62889.58\",\"high\":\"63518.01\",\"low\":\"62772.00\",\"close\":\"63106.00\",\"prm\":\"64275.00\"},{\"date\":\"2024-09-20\",\"open\":\"63715.80\",\"high\":\"64099.19\",\"low\":\"62582.83\",\"close\":\"62889.58\",\"prm\":\"64166.79\"},{\"date\":\"2024-09-19\",\"open\":\"62117.99\",\"high\":\"63848.89\",\"low\":\"61816.00\",\"close\":\"63715.80\",\"prm\":\"64579.90\"},{\"date\":\"2024-09-18\",\"open\":\"60509.99\",\"high\":\"62503.99\",\"low\":\"59218.06\",\"close\":\"62117.99\",\"prm\":\"63781.00\"},{\"date\":\"2024-09-17\",\"open\":\"58060.00\",\"high\":\"61288.00\",\"low\":\"58046.12\",\"close\":\"60509.99\",\"prm\":\"62977.00\"},{\"date\":\"2024-09-13\",\"open\":\"57845.97\",\"high\":\"60624.54\",\"low\":\"57632.63\",\"close\":\"60319.87\",\"prm\":\"62881.94\"},{\"date\":\"2024-09-12\",\"open\":\"58234.46\",\"high\":\"58503.99\",\"low\":\"57371.62\",\"close\":\"57845.97\",\"prm\":\"61644.99\"}],\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"1\",\"alert\":\"yellow\",\"labelpricebitcoin\":\"64340.00\",\"labelpricemoneda\":\"64340.00\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:80deg;--color2:#F6465D;--data2:220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}', 2, 0.0000100000, 0.0000100000),
(6, 'BNBUSDT', 'BNB', 'USDT', 0.00120338, 600.00000000, 260.00000000, 0, 348.90000, '{\"balance_asset\":\"0.00120338\",\"par\":\"USDT\",\"asset\":\"BNB\",\"price\":\"574.5\",\"btc\":\"64340.00\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:0deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"BNBUSDT\",\"tendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"color\":\"#F37A8B\",\"maxdia\":\"600.9\",\"mindia\":\"573.1\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"utc\":\"3:13 AM\",\"techo\":\"588.800000000000\",\"piso\":\"569.146666666667\",\"ant\":\"612.60000000\",\"nivel\":\"<div class=odometros style=--data:0deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:0deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"5%\",\"totalpromedio\":578.9733333333335,\"grafico\":[{\"date\":\"2024-09-29\",\"open\":\"600.4\",\"high\":\"600.9\",\"low\":\"573.1\",\"close\":\"574.5\",\"prm\":\"584.7\"},{\"date\":\"2024-09-28\",\"open\":\"612.1\",\"high\":\"612.6\",\"low\":\"594.8\",\"close\":\"600.4\",\"prm\":\"597.6\"},{\"date\":\"2024-09-27\",\"open\":\"605.1\",\"high\":\"616.1\",\"low\":\"605.5\",\"close\":\"612.1\",\"prm\":\"603.5\"},{\"date\":\"2024-09-26\",\"open\":\"587.8\",\"high\":\"605.1\",\"low\":\"587.4\",\"close\":\"605.1\",\"prm\":\"600.0\"},{\"date\":\"2024-09-25\",\"open\":\"607.1\",\"high\":\"607.1\",\"low\":\"580.9\",\"close\":\"587.8\",\"prm\":\"591.3\"},{\"date\":\"2024-09-24\",\"open\":\"606.5\",\"high\":\"613.0\",\"low\":\"599.7\",\"close\":\"607.1\",\"prm\":\"601.0\"},{\"date\":\"2024-09-23\",\"open\":\"596.9\",\"high\":\"615.8\",\"low\":\"588.5\",\"close\":\"606.5\",\"prm\":\"600.7\"},{\"date\":\"2024-09-22\",\"open\":\"584.0\",\"high\":\"599.4\",\"low\":\"576.7\",\"close\":\"596.9\",\"prm\":\"595.9\"},{\"date\":\"2024-09-21\",\"open\":\"567.8\",\"high\":\"589.9\",\"low\":\"567.7\",\"close\":\"584.0\",\"prm\":\"589.4\"},{\"date\":\"2024-09-20\",\"open\":\"571.0\",\"high\":\"577.1\",\"low\":\"564.7\",\"close\":\"567.8\",\"prm\":\"581.3\"},{\"date\":\"2024-09-19\",\"open\":\"560.1\",\"high\":\"571.9\",\"low\":\"553.2\",\"close\":\"571.0\",\"prm\":\"582.9\"},{\"date\":\"2024-09-18\",\"open\":\"547.4\",\"high\":\"562.6\",\"low\":\"536.9\",\"close\":\"560.1\",\"prm\":\"577.5\"},{\"date\":\"2024-09-17\",\"open\":\"534.9\",\"high\":\"552.6\",\"low\":\"534.9\",\"close\":\"547.4\",\"prm\":\"571.1\"},{\"date\":\"2024-09-13\",\"open\":\"542.8\",\"high\":\"559.4\",\"low\":\"538.8\",\"close\":\"556.2\",\"prm\":\"575.5\"},{\"date\":\"2024-09-12\",\"open\":\"543.0\",\"high\":\"548.5\",\"low\":\"534.4\",\"close\":\"542.8\",\"prm\":\"568.8\"}],\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"6\",\"alert\":\"yellow\",\"labelpricebitcoin\":\"64340.00\",\"labelpricemoneda\":\"574.5\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:80deg;--color2:#F6465D;--data2:220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}', 1, 0.0010000000, 0.0010000000),
(7, 'ETHUSDT', 'ETH', 'USDT', 0.00000000, 3000.00000000, 1484.00000000, 0, 1266.00000, '{\"balance_asset\":\"0.00000000\",\"par\":\"USDT\",\"asset\":\"ETH\",\"price\":\"2616.00\",\"btc\":\"64340.00\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:0deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"ETHUSDT\",\"tendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"2673.95\",\"mindia\":\"2607.50\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"utc\":\"3:13 AM\",\"techo\":\"2587.566666666667\",\"piso\":\"2499.500000000000\",\"ant\":\"2699.06000000\",\"nivel\":\"<div class=odometros style=--data:0deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:0deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"13%\",\"totalpromedio\":2543.5333333333338,\"grafico\":[{\"date\":\"2024-09-29\",\"open\":\"2675.01\",\"high\":\"2673.95\",\"low\":\"2607.50\",\"close\":\"2616.00\",\"prm\":\"2634.38\"},{\"date\":\"2024-09-28\",\"open\":\"2690.26\",\"high\":\"2699.06\",\"low\":\"2652.76\",\"close\":\"2675.01\",\"prm\":\"2663.89\"},{\"date\":\"2024-09-27\",\"open\":\"2643.73\",\"high\":\"2703.07\",\"low\":\"2690.01\",\"close\":\"2690.26\",\"prm\":\"2671.51\"},{\"date\":\"2024-09-26\",\"open\":\"2601.63\",\"high\":\"2658.00\",\"low\":\"2593.40\",\"close\":\"2643.73\",\"prm\":\"2648.25\"},{\"date\":\"2024-09-25\",\"open\":\"2646.89\",\"high\":\"2646.86\",\"low\":\"2557.51\",\"close\":\"2601.63\",\"prm\":\"2627.20\"},{\"date\":\"2024-09-24\",\"open\":\"2627.40\",\"high\":\"2670.41\",\"low\":\"2591.87\",\"close\":\"2646.89\",\"prm\":\"2649.83\"},{\"date\":\"2024-09-23\",\"open\":\"2677.02\",\"high\":\"2698.99\",\"low\":\"2609.43\",\"close\":\"2627.40\",\"prm\":\"2640.08\"},{\"date\":\"2024-09-22\",\"open\":\"2594.72\",\"high\":\"2685.28\",\"low\":\"2526.69\",\"close\":\"2677.02\",\"prm\":\"2664.89\"},{\"date\":\"2024-09-21\",\"open\":\"2544.67\",\"high\":\"2631.21\",\"low\":\"2529.60\",\"close\":\"2594.72\",\"prm\":\"2623.74\"},{\"date\":\"2024-09-20\",\"open\":\"2519.72\",\"high\":\"2586.49\",\"low\":\"2516.24\",\"close\":\"2544.67\",\"prm\":\"2598.72\"},{\"date\":\"2024-09-19\",\"open\":\"2403.68\",\"high\":\"2519.72\",\"low\":\"2399.71\",\"close\":\"2519.72\",\"prm\":\"2586.24\"},{\"date\":\"2024-09-18\",\"open\":\"2334.79\",\"high\":\"2410.86\",\"low\":\"2279.45\",\"close\":\"2403.68\",\"prm\":\"2528.22\"},{\"date\":\"2024-09-17\",\"open\":\"2284.18\",\"high\":\"2391.65\",\"low\":\"2282.70\",\"close\":\"2334.79\",\"prm\":\"2493.78\"},{\"date\":\"2024-09-13\",\"open\":\"2356.04\",\"high\":\"2460.55\",\"low\":\"2337.36\",\"close\":\"2432.60\",\"prm\":\"2542.68\"},{\"date\":\"2024-09-12\",\"open\":\"2369.49\",\"high\":\"2377.40\",\"low\":\"2318.27\",\"close\":\"2356.04\",\"prm\":\"2504.40\"}],\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"7\",\"alert\":\"yellow\",\"labelpricebitcoin\":\"64340.00\",\"labelpricemoneda\":\"2616.00\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:80deg;--color2:#F6465D;--data2:220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}', 2, 0.0001000000, 0.0001000000),
(9, 'ATOMUSDT', 'ATOM', 'USDT', 0.00000000, 17.00000000, 9.00000000, 0, 14.15600, '{\"balance_asset\":\"0.00000000\",\"par\":\"USDT\",\"asset\":\"ATOM\",\"price\":\"4.903\",\"btc\":\"64340.00\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:0deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"ATOMUSDT\",\"tendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"5.119\",\"mindia\":\"4.896\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"utc\":\"3:13 AM\",\"techo\":\"4.719187500000\",\"piso\":\"4.500625000000\",\"ant\":\"5.13300000\",\"nivel\":\"<div class=odometros style=--data:0deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:0deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"3%\",\"totalpromedio\":4.60990625,\"grafico\":[{\"date\":\"2024-09-29\",\"open\":\"5.049\",\"high\":\"5.119\",\"low\":\"4.896\",\"close\":\"4.903\",\"prm\":\"4.921\"},{\"date\":\"2024-09-28\",\"open\":\"5.137\",\"high\":\"5.133\",\"low\":\"4.938\",\"close\":\"5.049\",\"prm\":\"4.994\"},{\"date\":\"2024-09-27\",\"open\":\"5.078\",\"high\":\"5.162\",\"low\":\"5.105\",\"close\":\"5.137\",\"prm\":\"5.038\"},{\"date\":\"2024-09-26\",\"open\":\"4.829\",\"high\":\"5.078\",\"low\":\"4.803\",\"close\":\"5.078\",\"prm\":\"5.008\"},{\"date\":\"2024-09-25\",\"open\":\"4.968\",\"high\":\"4.964\",\"low\":\"4.702\",\"close\":\"4.829\",\"prm\":\"4.884\"},{\"date\":\"2024-09-24\",\"open\":\"4.557\",\"high\":\"4.968\",\"low\":\"4.513\",\"close\":\"4.968\",\"prm\":\"4.953\"},{\"date\":\"2024-09-23\",\"open\":\"4.670\",\"high\":\"4.687\",\"low\":\"4.497\",\"close\":\"4.557\",\"prm\":\"4.748\"},{\"date\":\"2024-09-22\",\"open\":\"4.650\",\"high\":\"4.719\",\"low\":\"4.485\",\"close\":\"4.670\",\"prm\":\"4.804\"},{\"date\":\"2024-09-21\",\"open\":\"4.496\",\"high\":\"4.726\",\"low\":\"4.463\",\"close\":\"4.650\",\"prm\":\"4.794\"},{\"date\":\"2024-09-20\",\"open\":\"4.546\",\"high\":\"4.590\",\"low\":\"4.470\",\"close\":\"4.496\",\"prm\":\"4.717\"},{\"date\":\"2024-09-19\",\"open\":\"4.445\",\"high\":\"4.614\",\"low\":\"4.421\",\"close\":\"4.546\",\"prm\":\"4.742\"},{\"date\":\"2024-09-19\",\"open\":\"4.445\",\"high\":\"4.614\",\"low\":\"4.421\",\"close\":\"4.546\",\"prm\":\"4.742\"},{\"date\":\"2024-09-18\",\"open\":\"4.197\",\"high\":\"4.472\",\"low\":\"4.102\",\"close\":\"4.445\",\"prm\":\"4.692\"},{\"date\":\"2024-09-17\",\"open\":\"4.000\",\"high\":\"4.238\",\"low\":\"3.999\",\"close\":\"4.197\",\"prm\":\"4.568\"},{\"date\":\"2024-09-13\",\"open\":\"4.133\",\"high\":\"4.255\",\"low\":\"4.136\",\"close\":\"4.218\",\"prm\":\"4.578\"},{\"date\":\"2024-09-12\",\"open\":\"4.142\",\"high\":\"4.168\",\"low\":\"4.059\",\"close\":\"4.133\",\"prm\":\"4.536\"}],\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"9\",\"alert\":\"yellow\",\"labelpricebitcoin\":\"64340.00\",\"labelpricemoneda\":\"4.903\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:80deg;--color2:#F6465D;--data2:220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}', 3, 0.0100000000, 0.0100000000),
(15, 'NEARUSDT', 'NEAR', 'USDT', 0.00000000, 0.00000000, 0.00000000, 0, 2.04000, '{\"balance_asset\":\"0.00000000\",\"par\":\"USDT\",\"asset\":\"NEAR\",\"price\":\"5.299\",\"btc\":\"64340.00\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:0deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"NEARUSDT\",\"tendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"5.623\",\"mindia\":\"5.299\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"utc\":\"3:13 AM\",\"techo\":\"4.979466666667\",\"piso\":\"4.629533333333\",\"ant\":\"5.57600000\",\"nivel\":\"<div class=odometros style=--data:0deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:0deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"0%\",\"totalpromedio\":4.8045,\"grafico\":[{\"date\":\"2024-09-29\",\"open\":\"5.492\",\"high\":\"5.623\",\"low\":\"5.299\",\"close\":\"5.299\",\"prm\":\"5.323\"},{\"date\":\"2024-09-28\",\"open\":\"5.503\",\"high\":\"5.576\",\"low\":\"5.347\",\"close\":\"5.492\",\"prm\":\"5.420\"},{\"date\":\"2024-09-27\",\"open\":\"5.830\",\"high\":\"5.529\",\"low\":\"5.436\",\"close\":\"5.503\",\"prm\":\"5.425\"},{\"date\":\"2024-09-26\",\"open\":\"5.278\",\"high\":\"5.849\",\"low\":\"5.245\",\"close\":\"5.830\",\"prm\":\"5.589\"},{\"date\":\"2024-09-25\",\"open\":\"5.353\",\"high\":\"5.370\",\"low\":\"5.112\",\"close\":\"5.278\",\"prm\":\"5.313\"},{\"date\":\"2024-09-24\",\"open\":\"5.249\",\"high\":\"5.455\",\"low\":\"5.089\",\"close\":\"5.353\",\"prm\":\"5.350\"},{\"date\":\"2024-09-23\",\"open\":\"4.723\",\"high\":\"5.269\",\"low\":\"4.641\",\"close\":\"5.249\",\"prm\":\"5.298\"},{\"date\":\"2024-09-22\",\"open\":\"4.608\",\"high\":\"4.745\",\"low\":\"4.385\",\"close\":\"4.723\",\"prm\":\"5.035\"},{\"date\":\"2024-09-21\",\"open\":\"4.326\",\"high\":\"4.685\",\"low\":\"4.287\",\"close\":\"4.608\",\"prm\":\"4.978\"},{\"date\":\"2024-09-20\",\"open\":\"4.407\",\"high\":\"4.504\",\"low\":\"4.302\",\"close\":\"4.326\",\"prm\":\"4.837\"},{\"date\":\"2024-09-19\",\"open\":\"4.534\",\"high\":\"4.581\",\"low\":\"4.258\",\"close\":\"4.407\",\"prm\":\"4.877\"},{\"date\":\"2024-09-18\",\"open\":\"4.092\",\"high\":\"4.563\",\"low\":\"3.937\",\"close\":\"4.534\",\"prm\":\"4.941\"},{\"date\":\"2024-09-17\",\"open\":\"3.894\",\"high\":\"4.300\",\"low\":\"3.893\",\"close\":\"4.092\",\"prm\":\"4.720\"},{\"date\":\"2024-09-13\",\"open\":\"4.216\",\"high\":\"4.344\",\"low\":\"4.118\",\"close\":\"4.241\",\"prm\":\"4.794\"},{\"date\":\"2024-09-12\",\"open\":\"4.103\",\"high\":\"4.299\",\"low\":\"4.094\",\"close\":\"4.216\",\"prm\":\"4.782\"}],\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"15\",\"alert\":\"black\",\"labelpricebitcoin\":\"64340.00\",\"labelpricemoneda\":\"5.299\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:-80deg;--color2:#F6465D;--data2:-220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}', 3, 0.1000000000, 0.1000000000),
(16, 'INJUSDT', 'INJ', 'USDT', 0.00000000, 0.00000000, 0.00000000, 0, 2.50400, '{\"balance_asset\":\"0.00000000\",\"par\":\"USDT\",\"asset\":\"INJ\",\"price\":\"22.52\",\"btc\":\"64340.00\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:0deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"INJUSDT\",\"tendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"23.74\",\"mindia\":\"22.25\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"utc\":\"3:13 AM\",\"techo\":\"21.965625000000\",\"piso\":\"20.661250000000\",\"ant\":\"23.95000000\",\"nivel\":\"<div class=odometros style=--data:0deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:0deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"18%\",\"totalpromedio\":21.3134375,\"grafico\":[{\"date\":\"2024-09-29\",\"open\":\"22.86\",\"high\":\"23.74\",\"low\":\"22.25\",\"close\":\"22.52\",\"prm\":\"22.55\"},{\"date\":\"2024-09-28\",\"open\":\"23.90\",\"high\":\"23.95\",\"low\":\"22.58\",\"close\":\"22.86\",\"prm\":\"22.72\"},{\"date\":\"2024-09-27\",\"open\":\"23.39\",\"high\":\"23.96\",\"low\":\"23.53\",\"close\":\"23.90\",\"prm\":\"23.24\"},{\"date\":\"2024-09-26\",\"open\":\"22.76\",\"high\":\"23.75\",\"low\":\"22.73\",\"close\":\"23.39\",\"prm\":\"22.99\"},{\"date\":\"2024-09-25\",\"open\":\"21.83\",\"high\":\"23.18\",\"low\":\"21.23\",\"close\":\"22.76\",\"prm\":\"22.67\"},{\"date\":\"2024-09-24\",\"open\":\"22.28\",\"high\":\"22.76\",\"low\":\"21.47\",\"close\":\"21.83\",\"prm\":\"22.21\"},{\"date\":\"2024-09-23\",\"open\":\"21.74\",\"high\":\"22.59\",\"low\":\"21.50\",\"close\":\"22.28\",\"prm\":\"22.43\"},{\"date\":\"2024-09-22\",\"open\":\"21.15\",\"high\":\"22.13\",\"low\":\"20.64\",\"close\":\"21.74\",\"prm\":\"22.16\"},{\"date\":\"2024-09-21\",\"open\":\"20.69\",\"high\":\"21.65\",\"low\":\"20.48\",\"close\":\"21.15\",\"prm\":\"21.87\"},{\"date\":\"2024-09-20\",\"open\":\"20.94\",\"high\":\"21.39\",\"low\":\"20.45\",\"close\":\"20.69\",\"prm\":\"21.64\"},{\"date\":\"2024-09-19\",\"open\":\"20.38\",\"high\":\"21.04\",\"low\":\"20.09\",\"close\":\"20.94\",\"prm\":\"21.76\"},{\"date\":\"2024-09-19\",\"open\":\"20.38\",\"high\":\"21.04\",\"low\":\"20.09\",\"close\":\"20.94\",\"prm\":\"21.76\"},{\"date\":\"2024-09-18\",\"open\":\"19.35\",\"high\":\"20.72\",\"low\":\"18.20\",\"close\":\"20.38\",\"prm\":\"21.48\"},{\"date\":\"2024-09-17\",\"open\":\"18.04\",\"high\":\"19.96\",\"low\":\"18.03\",\"close\":\"19.35\",\"prm\":\"20.97\"},{\"date\":\"2024-09-13\",\"open\":\"19.10\",\"high\":\"20.11\",\"low\":\"18.49\",\"close\":\"19.62\",\"prm\":\"21.10\"},{\"date\":\"2024-09-12\",\"open\":\"19.06\",\"high\":\"19.48\",\"low\":\"18.82\",\"close\":\"19.10\",\"prm\":\"20.84\"}],\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"16\",\"alert\":\"yellow\",\"labelpricebitcoin\":\"64340.00\",\"labelpricemoneda\":\"22.52\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:80deg;--color2:#F6465D;--data2:220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}', 2, 0.0100000000, 0.0100000000),
(17, 'LTCUSDT', 'LTC', 'USDT', 0.00000000, 0.00000000, 0.00000000, 0, 0.00000, '{\"balance_asset\":\"0.00000000\",\"par\":\"USDT\",\"asset\":\"LTC\",\"price\":\"67.75\",\"btc\":\"64340.00\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:0deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"LTCUSDT\",\"tendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"70.24\",\"mindia\":\"67.69\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"utc\":\"3:13 AM\",\"techo\":\"67.479333333333\",\"piso\":\"65.392000000000\",\"ant\":\"71.47000000\",\"nivel\":\"<div class=odometros style=--data:0deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:0deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"2%\",\"totalpromedio\":66.43566666666649,\"grafico\":[{\"date\":\"2024-09-29\",\"open\":\"69.58\",\"high\":\"70.24\",\"low\":\"67.69\",\"close\":\"67.75\",\"prm\":\"68.39\"},{\"date\":\"2024-09-28\",\"open\":\"71.32\",\"high\":\"71.47\",\"low\":\"69.03\",\"close\":\"69.58\",\"prm\":\"69.31\"},{\"date\":\"2024-09-27\",\"open\":\"68.40\",\"high\":\"71.44\",\"low\":\"70.90\",\"close\":\"71.32\",\"prm\":\"70.18\"},{\"date\":\"2024-09-26\",\"open\":\"66.43\",\"high\":\"68.40\",\"low\":\"66.47\",\"close\":\"68.40\",\"prm\":\"68.72\"},{\"date\":\"2024-09-25\",\"open\":\"66.99\",\"high\":\"67.84\",\"low\":\"65.64\",\"close\":\"66.43\",\"prm\":\"67.73\"},{\"date\":\"2024-09-24\",\"open\":\"66.61\",\"high\":\"67.15\",\"low\":\"65.75\",\"close\":\"66.99\",\"prm\":\"68.01\"},{\"date\":\"2024-09-23\",\"open\":\"68.70\",\"high\":\"67.99\",\"low\":\"66.25\",\"close\":\"66.61\",\"prm\":\"67.82\"},{\"date\":\"2024-09-22\",\"open\":\"67.35\",\"high\":\"69.30\",\"low\":\"66.51\",\"close\":\"68.70\",\"prm\":\"68.87\"},{\"date\":\"2024-09-21\",\"open\":\"65.31\",\"high\":\"67.37\",\"low\":\"64.83\",\"close\":\"67.35\",\"prm\":\"68.19\"},{\"date\":\"2024-09-20\",\"open\":\"65.93\",\"high\":\"66.45\",\"low\":\"64.41\",\"close\":\"65.31\",\"prm\":\"67.17\"},{\"date\":\"2024-09-19\",\"open\":\"64.93\",\"high\":\"66.05\",\"low\":\"64.71\",\"close\":\"65.93\",\"prm\":\"67.48\"},{\"date\":\"2024-09-18\",\"open\":\"64.19\",\"high\":\"65.41\",\"low\":\"62.43\",\"close\":\"64.93\",\"prm\":\"66.98\"},{\"date\":\"2024-09-17\",\"open\":\"63.22\",\"high\":\"64.34\",\"low\":\"62.24\",\"close\":\"64.19\",\"prm\":\"66.61\"},{\"date\":\"2024-09-13\",\"open\":\"62.50\",\"high\":\"65.62\",\"low\":\"62.46\",\"close\":\"65.32\",\"prm\":\"67.18\"},{\"date\":\"2024-09-12\",\"open\":\"62.37\",\"high\":\"63.12\",\"low\":\"61.56\",\"close\":\"62.50\",\"prm\":\"65.77\"}],\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"17\",\"alert\":\"yellow\",\"labelpricebitcoin\":\"64340.00\",\"labelpricemoneda\":\"67.75\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:80deg;--color2:#F6465D;--data2:220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}', 2, 0.0010000000, 0.0010000000),
(18, 'PAXGUSDT', 'PAXG', 'USDT', 0.00000000, 0.00000000, 0.00000000, 0, 1748.00000, '{\"balance_asset\":\"0.00000000\",\"par\":\"USDT\",\"asset\":\"PAXG\",\"price\":\"2654\",\"btc\":\"64340.00\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:360deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"PAXGUSDT\",\"tendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"2668\",\"mindia\":\"2653\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"utc\":\"3:13 AM\",\"techo\":\"2633.000000000000\",\"piso\":\"2605.866666666667\",\"ant\":\"2668.00000000\",\"nivel\":\"<div class=odometros style=--data:0deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:0deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"7%\",\"totalpromedio\":2619.4333333333334,\"grafico\":[{\"date\":\"2024-09-29\",\"open\":\"2667\",\"high\":\"2668\",\"low\":\"2653\",\"close\":\"2654\",\"prm\":\"2652\"},{\"date\":\"2024-09-28\",\"open\":\"2652\",\"high\":\"2668\",\"low\":\"2650\",\"close\":\"2667\",\"prm\":\"2659\"},{\"date\":\"2024-09-27\",\"open\":\"2658\",\"high\":\"2657\",\"low\":\"2650\",\"close\":\"2652\",\"prm\":\"2651\"},{\"date\":\"2024-09-26\",\"open\":\"2659\",\"high\":\"2677\",\"low\":\"2653\",\"close\":\"2658\",\"prm\":\"2654\"},{\"date\":\"2024-09-25\",\"open\":\"2658\",\"high\":\"2666\",\"low\":\"2648\",\"close\":\"2659\",\"prm\":\"2655\"},{\"date\":\"2024-09-24\",\"open\":\"2631\",\"high\":\"2665\",\"low\":\"2626\",\"close\":\"2658\",\"prm\":\"2654\"},{\"date\":\"2024-09-23\",\"open\":\"2630\",\"high\":\"2632\",\"low\":\"2615\",\"close\":\"2631\",\"prm\":\"2641\"},{\"date\":\"2024-09-22\",\"open\":\"2618\",\"high\":\"2634\",\"low\":\"2611\",\"close\":\"2630\",\"prm\":\"2640\"},{\"date\":\"2024-09-21\",\"open\":\"2620\",\"high\":\"2632\",\"low\":\"2613\",\"close\":\"2618\",\"prm\":\"2634\"},{\"date\":\"2024-09-20\",\"open\":\"2598\",\"high\":\"2629\",\"low\":\"2595\",\"close\":\"2620\",\"prm\":\"2635\"},{\"date\":\"2024-09-19\",\"open\":\"2571\",\"high\":\"2598\",\"low\":\"2566\",\"close\":\"2598\",\"prm\":\"2624\"},{\"date\":\"2024-09-18\",\"open\":\"2582\",\"high\":\"2608\",\"low\":\"2556\",\"close\":\"2571\",\"prm\":\"2611\"},{\"date\":\"2024-09-17\",\"open\":\"2588\",\"high\":\"2614\",\"low\":\"2572\",\"close\":\"2582\",\"prm\":\"2616\"},{\"date\":\"2024-09-13\",\"open\":\"2560\",\"high\":\"2584\",\"low\":\"2560\",\"close\":\"2575\",\"prm\":\"2613\"},{\"date\":\"2024-09-12\",\"open\":\"2521\",\"high\":\"2563\",\"low\":\"2520\",\"close\":\"2560\",\"prm\":\"2605\"}],\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"18\",\"alert\":\"yellow\",\"labelpricebitcoin\":\"64340.00\",\"labelpricemoneda\":\"2654\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:80deg;--color2:#F6465D;--data2:220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}', 0, 0.0001000000, 0.0001000000),
(19, 'RUNEUSDC', 'RUNE', 'USDC', 0.00000000, 0.00000000, 0.00000000, 1, 0.00000, '{\"balance_asset\":\"0.00000000\",\"par\":\"USDC\",\"asset\":\"RUNE\",\"price\":\"5.049\",\"btc\":\"64340.00\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:0deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"RUNEUSDC\",\"tendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"5.129\",\"mindia\":\"5.037\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"utc\":\"3:13 AM\",\"techo\":\"4.816133333333\",\"piso\":\"4.500400000000\",\"ant\":\"5.48600000\",\"nivel\":\"<div class=odometros style=--data:0deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:0deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"13%\",\"totalpromedio\":4.6582666666665,\"grafico\":[{\"date\":\"2024-09-29\",\"open\":\"5.369\",\"high\":\"5.129\",\"low\":\"5.037\",\"close\":\"5.049\",\"prm\":\"5.171\"},{\"date\":\"2024-09-28\",\"open\":\"5.403\",\"high\":\"5.486\",\"low\":\"5.293\",\"close\":\"5.369\",\"prm\":\"5.331\"},{\"date\":\"2024-09-27\",\"open\":\"5.615\",\"high\":\"5.455\",\"low\":\"5.363\",\"close\":\"5.403\",\"prm\":\"5.348\"},{\"date\":\"2024-09-26\",\"open\":\"5.105\",\"high\":\"5.698\",\"low\":\"5.087\",\"close\":\"5.615\",\"prm\":\"5.454\"},{\"date\":\"2024-09-25\",\"open\":\"5.081\",\"high\":\"5.141\",\"low\":\"4.906\",\"close\":\"5.105\",\"prm\":\"5.199\"},{\"date\":\"2024-09-24\",\"open\":\"4.601\",\"high\":\"5.091\",\"low\":\"4.546\",\"close\":\"5.081\",\"prm\":\"5.187\"},{\"date\":\"2024-09-23\",\"open\":\"4.710\",\"high\":\"4.800\",\"low\":\"4.523\",\"close\":\"4.601\",\"prm\":\"4.947\"},{\"date\":\"2024-09-22\",\"open\":\"4.629\",\"high\":\"4.735\",\"low\":\"4.384\",\"close\":\"4.710\",\"prm\":\"5.002\"},{\"date\":\"2024-09-21\",\"open\":\"4.445\",\"high\":\"4.703\",\"low\":\"4.399\",\"close\":\"4.629\",\"prm\":\"4.961\"},{\"date\":\"2024-09-20\",\"open\":\"4.525\",\"high\":\"4.585\",\"low\":\"4.347\",\"close\":\"4.445\",\"prm\":\"4.869\"},{\"date\":\"2024-09-19\",\"open\":\"4.371\",\"high\":\"4.587\",\"low\":\"4.336\",\"close\":\"4.525\",\"prm\":\"4.909\"},{\"date\":\"2024-09-18\",\"open\":\"4.058\",\"high\":\"4.418\",\"low\":\"3.814\",\"close\":\"4.371\",\"prm\":\"4.832\"},{\"date\":\"2024-09-17\",\"open\":\"3.837\",\"high\":\"4.150\",\"low\":\"3.837\",\"close\":\"4.058\",\"prm\":\"4.676\"},{\"date\":\"2024-09-13\",\"open\":\"3.873\",\"high\":\"4.181\",\"low\":\"3.829\",\"close\":\"4.135\",\"prm\":\"4.714\"},{\"date\":\"2024-09-12\",\"open\":\"4.025\",\"high\":\"4.083\",\"low\":\"3.805\",\"close\":\"3.873\",\"prm\":\"4.583\"}],\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"19\",\"alert\":\"yellow\",\"labelpricebitcoin\":\"64340.00\",\"labelpricemoneda\":\"5.049\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:80deg;--color2:#F6465D;--data2:220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}', 3, 0.1000000000, 0.1000000000),
(20, 'SHIBUSDC', 'SHIB', 'USDC', 0.00000000, 0.00000000, 0.00000000, 0, 0.00000, '{\"balance_asset\":\"0.00000000\",\"par\":\"USDC\",\"asset\":\"SHIB\",\"price\":\"0.00001847\",\"btc\":\"64340.00\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:0deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"SHIBUSDC\",\"tendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"0.00002009\",\"mindia\":\"0.00001837\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"utc\":\"3:13 AM\",\"techo\":\"0.000016034667\",\"piso\":\"0.000015020000\",\"ant\":\"0.00002106\",\"nivel\":\"<div class=odometros style=--data:0deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:0deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"6%\",\"totalpromedio\":1.55273335e-5,\"grafico\":[{\"date\":\"2024-09-29\",\"open\":\"0.00002017\",\"high\":\"0.00002009\",\"low\":\"0.00001837\",\"close\":\"0.00001847\",\"prm\":\"0.00001877\"},{\"date\":\"2024-09-28\",\"open\":\"0.00002103\",\"high\":\"0.00002106\",\"low\":\"0.00001907\",\"close\":\"0.00002017\",\"prm\":\"0.00001962\"},{\"date\":\"2024-09-27\",\"open\":\"0.00001795\",\"high\":\"0.00002141\",\"low\":\"0.00002019\",\"close\":\"0.00002103\",\"prm\":\"0.00002005\"},{\"date\":\"2024-09-26\",\"open\":\"0.00001559\",\"high\":\"0.00001819\",\"low\":\"0.00001544\",\"close\":\"0.00001795\",\"prm\":\"0.00001851\"},{\"date\":\"2024-09-25\",\"open\":\"0.00001501\",\"high\":\"0.00001574\",\"low\":\"0.00001474\",\"close\":\"0.00001559\",\"prm\":\"0.00001733\"},{\"date\":\"2024-09-24\",\"open\":\"0.00001446\",\"high\":\"0.00001505\",\"low\":\"0.00001434\",\"close\":\"0.00001501\",\"prm\":\"0.00001704\"},{\"date\":\"2024-09-23\",\"open\":\"0.00001476\",\"high\":\"0.00001480\",\"low\":\"0.00001427\",\"close\":\"0.00001446\",\"prm\":\"0.00001677\"},{\"date\":\"2024-09-22\",\"open\":\"0.00001475\",\"high\":\"0.00001485\",\"low\":\"0.00001416\",\"close\":\"0.00001476\",\"prm\":\"0.00001692\"},{\"date\":\"2024-09-21\",\"open\":\"0.00001425\",\"high\":\"0.00001507\",\"low\":\"0.00001412\",\"close\":\"0.00001475\",\"prm\":\"0.00001691\"},{\"date\":\"2024-09-20\",\"open\":\"0.00001433\",\"high\":\"0.00001450\",\"low\":\"0.00001405\",\"close\":\"0.00001425\",\"prm\":\"0.00001666\"},{\"date\":\"2024-09-19\",\"open\":\"0.00001385\",\"high\":\"0.00001456\",\"low\":\"0.00001382\",\"close\":\"0.00001433\",\"prm\":\"0.00001670\"},{\"date\":\"2024-09-18\",\"open\":\"0.00001337\",\"high\":\"0.00001399\",\"low\":\"0.00001297\",\"close\":\"0.00001385\",\"prm\":\"0.00001646\"},{\"date\":\"2024-09-17\",\"open\":\"0.00001320\",\"high\":\"0.00001357\",\"low\":\"0.00001317\",\"close\":\"0.00001337\",\"prm\":\"0.00001622\"},{\"date\":\"2024-09-13\",\"open\":\"0.00001342\",\"high\":\"0.00001410\",\"low\":\"0.00001339\",\"close\":\"0.00001400\",\"prm\":\"0.00001654\"},{\"date\":\"2024-09-12\",\"open\":\"0.00001342\",\"high\":\"0.00001354\",\"low\":\"0.00001320\",\"close\":\"0.00001342\",\"prm\":\"0.00001625\"}],\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"20\",\"alert\":\"yellow\",\"labelpricebitcoin\":\"64340.00\",\"labelpricemoneda\":\"0.00001847\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:80deg;--color2:#F6465D;--data2:220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}', 8, 1.0000000000, 1.0000000000),
(21, 'DOGEUSDC', 'DOGE', 'USDC', 0.00000000, 0.00000000, 0.00000000, 0, 0.00000, '{\"balance_asset\":\"0.00000000\",\"par\":\"USDC\",\"asset\":\"DOGE\",\"price\":\"0.12122\",\"btc\":\"64340.00\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:334.8deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"DOGEUSDC\",\"tendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"0.12923\",\"mindia\":\"0.12096\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"utc\":\"3:13 AM\",\"techo\":\"0.112647333333\",\"piso\":\"0.107390666667\",\"ant\":\"0.13142000\",\"nivel\":\"<div class=odometros style=--data:0deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:0deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"3%\",\"totalpromedio\":0.110019,\"grafico\":[{\"date\":\"2024-09-29\",\"open\":\"0.12959\",\"high\":\"0.12923\",\"low\":\"0.12096\",\"close\":\"0.12122\",\"prm\":\"0.12082\"},{\"date\":\"2024-09-28\",\"open\":\"0.12610\",\"high\":\"0.13142\",\"low\":\"0.12041\",\"close\":\"0.12959\",\"prm\":\"0.12500\"},{\"date\":\"2024-09-27\",\"open\":\"0.11786\",\"high\":\"0.12665\",\"low\":\"0.12357\",\"close\":\"0.12610\",\"prm\":\"0.12326\"},{\"date\":\"2024-09-26\",\"open\":\"0.10894\",\"high\":\"0.11850\",\"low\":\"0.10856\",\"close\":\"0.11786\",\"prm\":\"0.11914\"},{\"date\":\"2024-09-25\",\"open\":\"0.11057\",\"high\":\"0.11072\",\"low\":\"0.10700\",\"close\":\"0.10894\",\"prm\":\"0.11468\"},{\"date\":\"2024-09-24\",\"open\":\"0.10818\",\"high\":\"0.11091\",\"low\":\"0.10694\",\"close\":\"0.11057\",\"prm\":\"0.11549\"},{\"date\":\"2024-09-23\",\"open\":\"0.10817\",\"high\":\"0.10883\",\"low\":\"0.10609\",\"close\":\"0.10818\",\"prm\":\"0.11430\"},{\"date\":\"2024-09-22\",\"open\":\"0.10808\",\"high\":\"0.10911\",\"low\":\"0.10381\",\"close\":\"0.10817\",\"prm\":\"0.11429\"},{\"date\":\"2024-09-21\",\"open\":\"0.10480\",\"high\":\"0.11040\",\"low\":\"0.10431\",\"close\":\"0.10808\",\"prm\":\"0.11425\"},{\"date\":\"2024-09-20\",\"open\":\"0.10602\",\"high\":\"0.10744\",\"low\":\"0.10397\",\"close\":\"0.10480\",\"prm\":\"0.11261\"},{\"date\":\"2024-09-19\",\"open\":\"0.10407\",\"high\":\"0.10712\",\"low\":\"0.10364\",\"close\":\"0.10602\",\"prm\":\"0.11322\"},{\"date\":\"2024-09-18\",\"open\":\"0.10119\",\"high\":\"0.10552\",\"low\":\"0.09950\",\"close\":\"0.10407\",\"prm\":\"0.11224\"},{\"date\":\"2024-09-17\",\"open\":\"0.09983\",\"high\":\"0.10257\",\"low\":\"0.09960\",\"close\":\"0.10119\",\"prm\":\"0.11080\"},{\"date\":\"2024-09-13\",\"open\":\"0.10185\",\"high\":\"0.10836\",\"low\":\"0.10185\",\"close\":\"0.10721\",\"prm\":\"0.11381\"},{\"date\":\"2024-09-12\",\"open\":\"0.10238\",\"high\":\"0.10293\",\"low\":\"0.10065\",\"close\":\"0.10185\",\"prm\":\"0.11113\"}],\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"21\",\"alert\":\"yellow\",\"labelpricebitcoin\":\"64340.00\",\"labelpricemoneda\":\"0.12122\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:80deg;--color2:#F6465D;--data2:220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}', 5, 1.0000000000, 1.0000000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datosusuarios`
--

CREATE TABLE `datosusuarios` (
  `ID` int(11) NOT NULL,
  `USUARIO` varchar(255) DEFAULT NULL,
  `MONEDA` varchar(10) DEFAULT 'BTCUSDT',
  `ASSET` varchar(10) DEFAULT 'BTC',
  `PAR` varchar(10) DEFAULT 'USDT',
  `BALANCE_ASSET` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `PRECIO_VENTA` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `PANTE` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `ACTIVO` int(11) DEFAULT 0,
  `ULTIMAVENTA` decimal(16,5) NOT NULL DEFAULT 0.00000,
  `DATOS` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`DATOS`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `datosusuarios`
--

INSERT INTO `datosusuarios` (`ID`, `USUARIO`, `MONEDA`, `ASSET`, `PAR`, `BALANCE_ASSET`, `PRECIO_VENTA`, `PANTE`, `ACTIVO`, `ULTIMAVENTA`, `DATOS`) VALUES
(1, 'dd77b701661c5b55', 'BTCUSDT', 'BTC', 'USDT', 0.00000000, 60000.00000000, 18987.00000000, 0, 0.00000, NULL),
(6, 'dd77b701661c5b55', 'BNBUSDT', 'BNB', 'USDT', 0.00211086, 600.00000000, 260.00000000, 1, 348.90000, NULL),
(7, 'dd77b701661c5b55', 'ETHUSDT', 'ETH', 'USDT', 0.00000000, 3000.00000000, 1484.00000000, 0, 1266.00000, NULL),
(9, 'dd77b701661c5b55', 'ATOMUSDT', 'ATOM', 'USDT', 0.00000000, 17.00000000, 9.00000000, 0, 14.15600, NULL),
(15, 'dd77b701661c5b55', 'NEARUSDT', 'NEAR', 'USDT', 0.00000000, 0.00000000, 0.00000000, 0, 2.04000, NULL),
(22, 'cf804109f32fb39a', 'BTCUSDT', 'BTC', 'USDT', 0.00000000, 0.00000000, 0.00000000, 1, 0.00000, NULL),
(28, 'dd77b701661c5b55', 'INJUSDT', 'INJ', 'USDT', 0.00000000, 0.00000000, 0.00000000, 0, 0.00000, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orderbinance`
--

CREATE TABLE `orderbinance` (
  `ID` int(11) NOT NULL,
  `USUARIO` varchar(255) DEFAULT NULL,
  `MONEDA` varchar(10) DEFAULT NULL,
  `ORDERID` varchar(255) DEFAULT NULL,
  `TIPO` varchar(14) DEFAULT NULL,
  `ESTATUS` varchar(14) DEFAULT NULL,
  `CANTIDAD` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `PRECIO` decimal(16,8) NOT NULL DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

CREATE TABLE `parametros` (
  `ID` int(11) NOT NULL,
  `USUARIO` varchar(255) DEFAULT NULL,
  `ESTABLECOIN` varchar(34) NOT NULL DEFAULT 'USDT',
  `CAPITAL` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `ESCALONES` int(11) DEFAULT 4,
  `INVXCOMPRA` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `DISPONIBLE` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `GANANCIA` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `PERDIDA` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `IMPUESTO` decimal(16,8) NOT NULL DEFAULT 0.02000000,
  `LOCAL` int(11) DEFAULT 1,
  `BINANCE` int(11) DEFAULT 0,
  `APIKEY` varchar(255) DEFAULT NULL,
  `SECRET` varchar(255) DEFAULT NULL,
  `STOPLOSS` int(11) NOT NULL DEFAULT 1,
  `AUTOSHELL` int(11) NOT NULL DEFAULT 2,
  `DATOS` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`DATOS`)),
  `GRAFICO` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `parametros`
--

INSERT INTO `parametros` (`ID`, `USUARIO`, `ESTABLECOIN`, `CAPITAL`, `ESCALONES`, `INVXCOMPRA`, `DISPONIBLE`, `GANANCIA`, `PERDIDA`, `IMPUESTO`, `LOCAL`, `BINANCE`, `APIKEY`, `SECRET`, `STOPLOSS`, `AUTOSHELL`, `DATOS`, `GRAFICO`) VALUES
(1, 'dd77b701661c5b55', 'USDT', 10.20344660, 1, 10.00000000, 10.20344660, 0.00000000, 0.00000000, 0.02000000, 0, 1, 'Dt7T5bPCyEfhX8XabI9F4k9KYzdycVJPYXZSak5CQTBXWkhydGwrQ1lDaXF5TGFSMlpRM0JFL1k0SUtsc2c2dDJZZDJFQVJuejNMY2xLQ1FjNldWOGFRUURGSHJhMlBaWHgyYWdUMlU4dFBUbzBBZ0duZ255aHN3ZGlnPQ==', 'AdaCX7LKVBpr6gDgOWVR9TVQbjMrVWF3RjNVSi9tTDM5RnJBREJucVFzbVNGSVpVOC95dS8zUWhuNFU0bk16Rk0vNGF0MW4xWnc0L1RsTUdyUVZndWVFMWwwMTFGVHA1Z0lnM1BiKzRYdTl6djZLcEZxa241cFZrS044PQ==', 1, 2, '{\"tipografico\":\"0\",\"balance_asset\":\"0.00211086\",\"par\":\"USDT\",\"asset\":\"BNB\",\"ultimaventa\":\"348.9\",\"price\":\"574.5\",\"btc\":\"64340.00\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:0deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"BNBUSDT\",\"tendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"color\":\"#F37A8B\",\"maxdia\":\"600.9\",\"mindia\":\"573.1\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"utc\":\"3:16 AM\",\"techo\":\"588.800000000000\",\"piso\":\"569.146666666667\",\"totalmoneda\":\"<div style=width:100%;padding:3px;background:#372127;border-radius:3px;color:#F37A8B;>0.0000 BNB <span style=color:#F37A8B;>&#9660;</span></div>\",\"ant\":\"612.60000000\",\"nivel\":\"<div class=odometros style=--data:0deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:0deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"5%\",\"ganancia\":\"0.0000\",\"perdida\":\"0.0000\",\"capital\":\"10.20\",\"disponible\":\"10.20\",\"escalones\":\"1\",\"invxcompra\":\"10.00000000\",\"totalpromedio\":578.9733333333335,\"xdisponible\":\"10.20\",\"grafico\":[{\"date\":\"2024-09-29\",\"open\":\"600.4\",\"high\":\"600.9\",\"low\":\"573.1\",\"close\":\"574.5\",\"prm\":\"584.7\"},{\"date\":\"2024-09-28\",\"open\":\"612.1\",\"high\":\"612.6\",\"low\":\"594.8\",\"close\":\"600.4\",\"prm\":\"597.6\"},{\"date\":\"2024-09-27\",\"open\":\"605.1\",\"high\":\"616.1\",\"low\":\"605.5\",\"close\":\"612.1\",\"prm\":\"603.5\"},{\"date\":\"2024-09-26\",\"open\":\"587.8\",\"high\":\"605.1\",\"low\":\"587.4\",\"close\":\"605.1\",\"prm\":\"600.0\"},{\"date\":\"2024-09-25\",\"open\":\"607.1\",\"high\":\"607.1\",\"low\":\"580.9\",\"close\":\"587.8\",\"prm\":\"591.3\"},{\"date\":\"2024-09-24\",\"open\":\"606.5\",\"high\":\"613.0\",\"low\":\"599.7\",\"close\":\"607.1\",\"prm\":\"601.0\"},{\"date\":\"2024-09-23\",\"open\":\"596.9\",\"high\":\"615.8\",\"low\":\"588.5\",\"close\":\"606.5\",\"prm\":\"600.7\"},{\"date\":\"2024-09-22\",\"open\":\"584.0\",\"high\":\"599.4\",\"low\":\"576.7\",\"close\":\"596.9\",\"prm\":\"595.9\"},{\"date\":\"2024-09-21\",\"open\":\"567.8\",\"high\":\"589.9\",\"low\":\"567.7\",\"close\":\"584.0\",\"prm\":\"589.4\"},{\"date\":\"2024-09-20\",\"open\":\"571.0\",\"high\":\"577.1\",\"low\":\"564.7\",\"close\":\"567.8\",\"prm\":\"581.3\"},{\"date\":\"2024-09-19\",\"open\":\"560.1\",\"high\":\"571.9\",\"low\":\"553.2\",\"close\":\"571.0\",\"prm\":\"582.9\"},{\"date\":\"2024-09-18\",\"open\":\"547.4\",\"high\":\"562.6\",\"low\":\"536.9\",\"close\":\"560.1\",\"prm\":\"577.5\"},{\"date\":\"2024-09-17\",\"open\":\"534.9\",\"high\":\"552.6\",\"low\":\"534.9\",\"close\":\"547.4\",\"prm\":\"571.1\"},{\"date\":\"2024-09-13\",\"open\":\"542.8\",\"high\":\"559.4\",\"low\":\"538.8\",\"close\":\"556.2\",\"prm\":\"575.5\"},{\"date\":\"2024-09-12\",\"open\":\"543.0\",\"high\":\"548.5\",\"low\":\"534.4\",\"close\":\"542.8\",\"prm\":\"568.8\"}],\"auto\":\"0\",\"bina\":\"1\",\"impuesto\":\"0.0200\",\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"6\",\"recordCount\":\"0\",\"colordisp\":\"#4BC883\",\"checkMesGrafico\":true,\"recupera\":\"575.07\",\"alert\":\"yellow\",\"checkAnoGrafico\":false,\"verescalones\":\"<table style=width:100%;><th>Stop</th><th>Tipo</th><th>Price</th><th>Moneda</th><th style=text-align:right;>Ganancia</th><th>Opciones</th></table>\",\"verbinance\":\"<table style=width:100%;><th>Estatus</th><th>Moneda</th><th>Cant.</th><th>Orden Id</th><th>Tipo</th><th>Opciones</th></table>\",\"labelpricebitcoin\":\"64340.00\",\"labelpricemoneda\":\"574.5\",\"precio_venta\":\"2\",\"listasset\":\"<table style=text-align:right;width:100%;><th></th><th></th><tr><td><span onclick=moneyChangue(1) style=cursor:pointer;color:#4BC883;>BTC</span></td><td><span style=color:#4BC883;font-weight:bold;>64340.00</span></td><td><span class=bolita style=color:yellow;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(6) style=cursor:pointer;color:#F37A8B;>BNB</span></td><td><span style=color:#F37A8B;font-weight:bold;>574.5</span></td><td><span class=bolita style=color:yellow;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(7) style=cursor:pointer;color:#4BC883;>ETH</span></td><td><span style=color:#4BC883;font-weight:bold;>2616.00</span></td><td><span class=bolita style=color:yellow;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(9) style=cursor:pointer;color:#4BC883;>ATOM</span></td><td><span style=color:#4BC883;font-weight:bold;>4.903</span></td><td><span class=bolita style=color:yellow;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(15) style=cursor:pointer;color:#4BC883;>NEAR</span></td><td><span style=color:#4BC883;font-weight:bold;>5.299</span></td><td><span class=bolita style=color:black;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(28) style=cursor:pointer;color:#4BC883;>INJ</span></td><td><span style=color:#4BC883;font-weight:bold;>22.52</span></td><td><span class=bolita style=color:yellow;>&#9679;</span></td></tr></table>\",\"stop\":\"1\",\"balance\":\"0.00211086\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:80deg;--color2:#F6465D;--data2:220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}', 0),
(2, 'cf804109f32fb39a', 'USDT', 0.00000000, 4, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.02000000, 1, 0, 'n//BUwujCe5poUyBnMy/MWZENlFwbE9GYktUZkRKbG9jNFFnbkx2UE13WVFGdlZXVHprem1YblJpUGg5VXJTVWxVelhZRnY3MGx3ZDB6MFg=', 'yMq+4VXzhr5b3ytCQpRQAWRNZTNoWDJsakV6alJkWjFHQmt1dHBSUk00L3ZROTJoM0VualIreXpkdi9Id3FOZFNKRnRhRlhSUWNGWVk1NUM=', 1, 2, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prices`
--

CREATE TABLE `prices` (
  `ID` int(11) NOT NULL,
  `FECHA` date DEFAULT curdate(),
  `MONEDA` varchar(10) DEFAULT 'BTCUSDC',
  `ACTUAL` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `ARRIBA` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `ABAJO` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `OPEN` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `CLOSE` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `BAJISTA` int(11) DEFAULT 0,
  `ALCISTA` int(11) DEFAULT 0,
  `VERDE` int(11) DEFAULT 0,
  `NARANJA` int(11) DEFAULT 0,
  `ROJO` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prices`
--

INSERT INTO `prices` (`ID`, `FECHA`, `MONEDA`, `ACTUAL`, `ARRIBA`, `ABAJO`, `OPEN`, `CLOSE`, `BAJISTA`, `ALCISTA`, `VERDE`, `NARANJA`, `ROJO`) VALUES
(34, '2024-09-12', 'BTCUSDT', 57845.97000000, 58503.99000000, 57371.62000000, 58234.46000000, 57845.97000000, 0, 1, 0, 0, 0),
(35, '2024-09-12', 'BNBUSDT', 542.80000000, 548.50000000, 534.40000000, 543.00000000, 542.80000000, 0, 1, 0, 0, 0),
(36, '2024-09-12', 'ETHUSDT', 2356.04000000, 2377.40000000, 2318.27000000, 2369.49000000, 2356.04000000, 1, 0, 0, 0, 0),
(37, '2024-09-12', 'ATOMUSDT', 4.13300000, 4.16800000, 4.05900000, 4.14200000, 4.13300000, 1, 0, 0, 0, 0),
(38, '2024-09-12', 'NEARUSDT', 4.21600000, 4.29900000, 4.09400000, 4.10300000, 4.21600000, 0, 1, 0, 0, 0),
(39, '2024-09-12', 'INJUSDT', 19.10000000, 19.48000000, 18.82000000, 19.06000000, 19.10000000, 0, 1, 0, 0, 0),
(40, '2024-09-12', 'LTCUSDT', 62.50000000, 63.12000000, 61.56000000, 62.37000000, 62.50000000, 0, 1, 0, 0, 0),
(41, '2024-09-12', 'PAXGUSDT', 2560.00000000, 2563.00000000, 2520.00000000, 2521.00000000, 2560.00000000, 0, 1, 0, 0, 0),
(42, '2024-09-12', 'RUNEUSDC', 3.87300000, 4.08300000, 3.80500000, 4.02500000, 3.87300000, 1, 0, 0, 0, 0),
(43, '2024-09-12', 'SHIBUSDC', 0.00001342, 0.00001354, 0.00001320, 0.00001342, 0.00001342, 0, 1, 0, 0, 0),
(44, '2024-09-12', 'DOGEUSDC', 0.10185000, 0.10293000, 0.10065000, 0.10238000, 0.10185000, 0, 1, 0, 0, 0),
(45, '2024-09-13', 'PAXGUSDT', 2575.00000000, 2584.00000000, 2560.00000000, 2560.00000000, 2575.00000000, 0, 1, 0, 0, 0),
(46, '2024-09-13', 'BTCUSDT', 60319.87000000, 60624.54000000, 57632.63000000, 57845.97000000, 60319.87000000, 0, 1, 0, 0, 0),
(47, '2024-09-13', 'BNBUSDT', 556.20000000, 559.40000000, 538.80000000, 542.80000000, 556.20000000, 0, 1, 0, 0, 0),
(48, '2024-09-13', 'ETHUSDT', 2432.60000000, 2460.55000000, 2337.36000000, 2356.04000000, 2432.60000000, 0, 1, 0, 0, 0),
(49, '2024-09-13', 'ATOMUSDT', 4.21800000, 4.25500000, 4.13600000, 4.13300000, 4.21800000, 0, 1, 0, 0, 0),
(50, '2024-09-13', 'NEARUSDT', 4.24100000, 4.34400000, 4.11800000, 4.21600000, 4.24100000, 0, 1, 0, 0, 0),
(51, '2024-09-13', 'RUNEUSDC', 4.13500000, 4.18100000, 3.82900000, 3.87300000, 4.13500000, 0, 1, 0, 0, 0),
(52, '2024-09-13', 'SHIBUSDC', 0.00001400, 0.00001410, 0.00001339, 0.00001342, 0.00001400, 0, 1, 0, 0, 0),
(53, '2024-09-13', 'DOGEUSDC', 0.10721000, 0.10836000, 0.10185000, 0.10185000, 0.10721000, 0, 1, 0, 0, 0),
(54, '2024-09-13', 'INJUSDT', 19.62000000, 20.11000000, 18.49000000, 19.10000000, 19.62000000, 0, 1, 0, 0, 0),
(55, '2024-09-13', 'LTCUSDT', 65.32000000, 65.62000000, 62.46000000, 62.50000000, 65.32000000, 0, 1, 0, 0, 0),
(78, '2024-09-17', 'ATOMUSDT', 4.19700000, 4.23800000, 3.99900000, 4.00000000, 4.19700000, 0, 1, 0, 0, 0),
(79, '2024-09-17', 'NEARUSDT', 4.09200000, 4.30000000, 3.89300000, 3.89400000, 4.09200000, 0, 1, 0, 0, 0),
(80, '2024-09-17', 'BNBUSDT', 547.40000000, 552.60000000, 534.90000000, 534.90000000, 547.40000000, 0, 1, 0, 0, 0),
(81, '2024-09-17', 'ETHUSDT', 2334.79000000, 2391.65000000, 2282.70000000, 2284.18000000, 2334.79000000, 0, 1, 0, 0, 0),
(82, '2024-09-17', 'BTCUSDT', 60509.99000000, 61288.00000000, 58046.12000000, 58060.00000000, 60509.99000000, 0, 1, 0, 0, 0),
(83, '2024-09-17', 'INJUSDT', 19.35000000, 19.96000000, 18.03000000, 18.04000000, 19.35000000, 0, 1, 0, 0, 0),
(84, '2024-09-17', 'LTCUSDT', 64.19000000, 64.34000000, 62.24000000, 63.22000000, 64.19000000, 0, 1, 0, 0, 0),
(85, '2024-09-17', 'PAXGUSDT', 2582.00000000, 2614.00000000, 2572.00000000, 2588.00000000, 2582.00000000, 0, 1, 0, 0, 0),
(86, '2024-09-17', 'RUNEUSDC', 4.05800000, 4.15000000, 3.83700000, 3.83700000, 4.05800000, 0, 1, 0, 0, 0),
(87, '2024-09-17', 'SHIBUSDC', 0.00001337, 0.00001357, 0.00001317, 0.00001320, 0.00001337, 0, 1, 0, 0, 0),
(88, '2024-09-17', 'DOGEUSDC', 0.10119000, 0.10257000, 0.09960000, 0.09983000, 0.10119000, 0, 1, 0, 0, 0),
(89, '2024-09-18', 'LTCUSDT', 64.93000000, 65.41000000, 62.43000000, 64.19000000, 64.93000000, 0, 1, 0, 0, 0),
(90, '2024-09-18', 'BTCUSDT', 62117.99000000, 62503.99000000, 59218.06000000, 60509.99000000, 62117.99000000, 0, 1, 0, 0, 0),
(91, '2024-09-18', 'BNBUSDT', 560.10000000, 562.60000000, 536.90000000, 547.40000000, 560.10000000, 0, 1, 0, 0, 0),
(92, '2024-09-18', 'ETHUSDT', 2403.68000000, 2410.86000000, 2279.45000000, 2334.79000000, 2403.68000000, 0, 1, 0, 0, 0),
(93, '2024-09-18', 'ATOMUSDT', 4.44500000, 4.47200000, 4.10200000, 4.19700000, 4.44500000, 0, 1, 0, 0, 0),
(94, '2024-09-18', 'NEARUSDT', 4.53400000, 4.56300000, 3.93700000, 4.09200000, 4.53400000, 0, 1, 0, 0, 0),
(95, '2024-09-18', 'INJUSDT', 20.38000000, 20.72000000, 18.20000000, 19.35000000, 20.38000000, 0, 1, 0, 0, 0),
(96, '2024-09-18', 'PAXGUSDT', 2571.00000000, 2608.00000000, 2556.00000000, 2582.00000000, 2571.00000000, 1, 0, 0, 0, 0),
(97, '2024-09-18', 'RUNEUSDC', 4.37100000, 4.41800000, 3.81400000, 4.05800000, 4.37100000, 0, 1, 0, 0, 0),
(98, '2024-09-18', 'SHIBUSDC', 0.00001385, 0.00001399, 0.00001297, 0.00001337, 0.00001385, 0, 1, 0, 0, 0),
(99, '2024-09-18', 'DOGEUSDC', 0.10407000, 0.10552000, 0.09950000, 0.10119000, 0.10407000, 0, 1, 0, 0, 0),
(100, '2024-09-19', 'RUNEUSDC', 4.52500000, 4.58700000, 4.33600000, 4.37100000, 4.52500000, 0, 1, 0, 0, 0),
(101, '2024-09-19', 'NEARUSDT', 4.40700000, 4.58100000, 4.25800000, 4.53400000, 4.40700000, 0, 1, 0, 0, 0),
(102, '2024-09-19', 'BTCUSDT', 63715.80000000, 63848.89000000, 61816.00000000, 62117.99000000, 63715.80000000, 0, 1, 0, 0, 0),
(103, '2024-09-19', 'BNBUSDT', 571.00000000, 571.90000000, 553.20000000, 560.10000000, 571.00000000, 0, 1, 0, 0, 0),
(104, '2024-09-19', 'ETHUSDT', 2519.72000000, 2519.72000000, 2399.71000000, 2403.68000000, 2519.72000000, 0, 1, 0, 0, 0),
(105, '2024-09-19', 'ATOMUSDT', 4.54600000, 4.61400000, 4.42100000, 4.44500000, 4.54600000, 0, 1, 0, 0, 0),
(106, '2024-09-19', 'ATOMUSDT', 4.54600000, 4.61400000, 4.42100000, 4.44500000, 4.54600000, 0, 1, 0, 0, 0),
(107, '2024-09-19', 'INJUSDT', 20.94000000, 21.04000000, 20.09000000, 20.38000000, 20.94000000, 0, 1, 0, 0, 0),
(108, '2024-09-19', 'INJUSDT', 20.94000000, 21.04000000, 20.09000000, 20.38000000, 20.94000000, 0, 1, 0, 0, 0),
(109, '2024-09-19', 'SHIBUSDC', 0.00001433, 0.00001456, 0.00001382, 0.00001385, 0.00001433, 0, 1, 0, 0, 0),
(110, '2024-09-19', 'LTCUSDT', 65.93000000, 66.05000000, 64.71000000, 64.93000000, 65.93000000, 0, 1, 0, 0, 0),
(111, '2024-09-19', 'DOGEUSDC', 0.10602000, 0.10712000, 0.10364000, 0.10407000, 0.10602000, 0, 1, 0, 0, 0),
(112, '2024-09-19', 'PAXGUSDT', 2598.00000000, 2598.00000000, 2566.00000000, 2571.00000000, 2598.00000000, 1, 0, 0, 0, 0),
(113, '2024-09-20', 'RUNEUSDC', 4.44500000, 4.58500000, 4.34700000, 4.52500000, 4.44500000, 1, 0, 0, 0, 0),
(114, '2024-09-20', 'BTCUSDT', 62889.58000000, 64099.19000000, 62582.83000000, 63715.80000000, 62889.58000000, 0, 1, 0, 0, 0),
(115, '2024-09-20', 'BNBUSDT', 567.80000000, 577.10000000, 564.70000000, 571.00000000, 567.80000000, 0, 1, 0, 0, 0),
(116, '2024-09-20', 'ETHUSDT', 2544.67000000, 2586.49000000, 2516.24000000, 2519.72000000, 2544.67000000, 0, 1, 0, 0, 0),
(117, '2024-09-20', 'ATOMUSDT', 4.49600000, 4.59000000, 4.47000000, 4.54600000, 4.49600000, 1, 0, 0, 0, 0),
(118, '2024-09-20', 'NEARUSDT', 4.32600000, 4.50400000, 4.30200000, 4.40700000, 4.32600000, 1, 0, 0, 0, 0),
(119, '2024-09-20', 'INJUSDT', 20.69000000, 21.39000000, 20.45000000, 20.94000000, 20.69000000, 0, 1, 0, 0, 0),
(120, '2024-09-20', 'SHIBUSDC', 0.00001425, 0.00001450, 0.00001405, 0.00001433, 0.00001425, 1, 0, 0, 0, 0),
(121, '2024-09-20', 'DOGEUSDC', 0.10480000, 0.10744000, 0.10397000, 0.10602000, 0.10480000, 0, 1, 0, 0, 0),
(122, '2024-09-20', 'LTCUSDT', 65.31000000, 66.45000000, 64.41000000, 65.93000000, 65.31000000, 0, 1, 0, 0, 0),
(123, '2024-09-20', 'PAXGUSDT', 2620.00000000, 2629.00000000, 2595.00000000, 2598.00000000, 2620.00000000, 0, 1, 0, 0, 0),
(124, '2024-09-21', 'BTCUSDT', 63106.00000000, 63518.01000000, 62772.00000000, 62889.58000000, 63106.00000000, 1, 0, 0, 0, 0),
(125, '2024-09-21', 'BNBUSDT', 584.00000000, 589.90000000, 567.70000000, 567.80000000, 584.00000000, 0, 1, 0, 0, 0),
(126, '2024-09-21', 'ETHUSDT', 2594.72000000, 2631.21000000, 2529.60000000, 2544.67000000, 2594.72000000, 0, 1, 0, 0, 0),
(127, '2024-09-21', 'ATOMUSDT', 4.65000000, 4.72600000, 4.46300000, 4.49600000, 4.65000000, 0, 1, 0, 0, 0),
(128, '2024-09-21', 'NEARUSDT', 4.60800000, 4.68500000, 4.28700000, 4.32600000, 4.60800000, 0, 1, 0, 0, 0),
(129, '2024-09-21', 'INJUSDT', 21.15000000, 21.65000000, 20.48000000, 20.69000000, 21.15000000, 0, 1, 0, 0, 0),
(130, '2024-09-21', 'LTCUSDT', 67.35000000, 67.37000000, 64.83000000, 65.31000000, 67.35000000, 0, 1, 0, 0, 0),
(131, '2024-09-21', 'PAXGUSDT', 2618.00000000, 2632.00000000, 2613.00000000, 2620.00000000, 2618.00000000, 0, 1, 0, 0, 0),
(132, '2024-09-21', 'RUNEUSDC', 4.62900000, 4.70300000, 4.39900000, 4.44500000, 4.62900000, 0, 1, 0, 0, 0),
(133, '2024-09-21', 'SHIBUSDC', 0.00001475, 0.00001507, 0.00001412, 0.00001425, 0.00001475, 0, 1, 0, 0, 0),
(134, '2024-09-21', 'DOGEUSDC', 0.10808000, 0.11040000, 0.10431000, 0.10480000, 0.10808000, 0, 1, 0, 0, 0),
(135, '2024-09-22', 'BTCUSDT', 64367.80000000, 64681.99000000, 62390.01000000, 63106.00000000, 64367.80000000, 0, 1, 0, 0, 0),
(136, '2024-09-22', 'BNBUSDT', 596.90000000, 599.40000000, 576.70000000, 584.00000000, 596.90000000, 0, 1, 0, 0, 0),
(137, '2024-09-22', 'ETHUSDT', 2677.02000000, 2685.28000000, 2526.69000000, 2594.72000000, 2677.02000000, 0, 1, 0, 0, 0),
(138, '2024-09-22', 'ATOMUSDT', 4.67000000, 4.71900000, 4.48500000, 4.65000000, 4.67000000, 1, 0, 0, 0, 0),
(139, '2024-09-22', 'NEARUSDT', 4.72300000, 4.74500000, 4.38500000, 4.60800000, 4.72300000, 0, 1, 0, 0, 0),
(140, '2024-09-22', 'INJUSDT', 21.74000000, 22.13000000, 20.64000000, 21.15000000, 21.74000000, 0, 1, 0, 0, 0),
(141, '2024-09-22', 'LTCUSDT', 68.70000000, 69.30000000, 66.51000000, 67.35000000, 68.70000000, 0, 1, 0, 0, 0),
(142, '2024-09-22', 'PAXGUSDT', 2630.00000000, 2634.00000000, 2611.00000000, 2618.00000000, 2630.00000000, 0, 1, 0, 0, 0),
(143, '2024-09-22', 'RUNEUSDC', 4.71000000, 4.73500000, 4.38400000, 4.62900000, 4.71000000, 0, 1, 0, 0, 0),
(144, '2024-09-22', 'SHIBUSDC', 0.00001476, 0.00001485, 0.00001416, 0.00001475, 0.00001476, 1, 0, 0, 0, 0),
(145, '2024-09-22', 'DOGEUSDC', 0.10817000, 0.10911000, 0.10381000, 0.10808000, 0.10817000, 1, 0, 0, 0, 0),
(146, '2024-09-23', 'BNBUSDT', 606.50000000, 615.80000000, 588.50000000, 596.90000000, 606.50000000, 0, 1, 0, 0, 0),
(147, '2024-09-23', 'ETHUSDT', 2627.40000000, 2698.99000000, 2609.43000000, 2677.02000000, 2627.40000000, 0, 1, 0, 0, 0),
(148, '2024-09-23', 'BTCUSDT', 63127.99000000, 64455.13000000, 62748.00000000, 64367.80000000, 63127.99000000, 1, 0, 0, 0, 0),
(149, '2024-09-23', 'ATOMUSDT', 4.55700000, 4.68700000, 4.49700000, 4.67000000, 4.55700000, 1, 0, 0, 0, 0),
(150, '2024-09-23', 'NEARUSDT', 5.24900000, 5.26900000, 4.64100000, 4.72300000, 5.24900000, 0, 1, 0, 0, 0),
(151, '2024-09-23', 'INJUSDT', 22.28000000, 22.59000000, 21.50000000, 21.74000000, 22.28000000, 0, 1, 0, 0, 0),
(153, '2024-09-23', 'PAXGUSDT', 2631.00000000, 2632.00000000, 2615.00000000, 2630.00000000, 2631.00000000, 1, 0, 0, 0, 0),
(154, '2024-09-23', 'RUNEUSDC', 4.60100000, 4.80000000, 4.52300000, 4.71000000, 4.60100000, 0, 1, 0, 0, 0),
(155, '2024-09-23', 'SHIBUSDC', 0.00001446, 0.00001480, 0.00001427, 0.00001476, 0.00001446, 1, 0, 0, 0, 0),
(156, '2024-09-23', 'DOGEUSDC', 0.10818000, 0.10883000, 0.10609000, 0.10817000, 0.10818000, 1, 0, 0, 0, 0),
(157, '2024-09-23', 'LTCUSDT', 66.61000000, 67.99000000, 66.25000000, 68.70000000, 66.61000000, 1, 0, 0, 0, 0),
(158, '2024-09-24', 'INJUSDT', 21.83000000, 22.76000000, 21.47000000, 22.28000000, 21.83000000, 0, 1, 0, 0, 0),
(159, '2024-09-24', 'BTCUSDT', 64461.94000000, 64763.99000000, 62739.91000000, 63127.99000000, 64461.94000000, 0, 1, 0, 0, 0),
(160, '2024-09-24', 'PAXGUSDT', 2658.00000000, 2665.00000000, 2626.00000000, 2631.00000000, 2658.00000000, 0, 1, 0, 0, 0),
(161, '2024-09-24', 'RUNEUSDC', 5.08100000, 5.09100000, 4.54600000, 4.60100000, 5.08100000, 0, 1, 0, 0, 0),
(162, '2024-09-24', 'BNBUSDT', 607.10000000, 613.00000000, 599.70000000, 606.50000000, 607.10000000, 1, 0, 0, 0, 0),
(163, '2024-09-24', 'ETHUSDT', 2646.89000000, 2670.41000000, 2591.87000000, 2627.40000000, 2646.89000000, 1, 0, 0, 0, 0),
(164, '2024-09-24', 'ATOMUSDT', 4.96800000, 4.96800000, 4.51300000, 4.55700000, 4.96800000, 0, 1, 0, 0, 0),
(165, '2024-09-24', 'NEARUSDT', 5.35300000, 5.45500000, 5.08900000, 5.24900000, 5.35300000, 0, 1, 0, 0, 0),
(166, '2024-09-24', 'SHIBUSDC', 0.00001501, 0.00001505, 0.00001434, 0.00001446, 0.00001501, 0, 1, 0, 0, 0),
(167, '2024-09-24', 'DOGEUSDC', 0.11057000, 0.11091000, 0.10694000, 0.10818000, 0.11057000, 0, 1, 0, 0, 0),
(168, '2024-09-24', 'LTCUSDT', 66.99000000, 67.15000000, 65.75000000, 66.61000000, 66.99000000, 1, 0, 0, 0, 0),
(169, '2024-09-25', 'INJUSDT', 22.76000000, 23.18000000, 21.23000000, 21.83000000, 22.76000000, 0, 1, 0, 0, 0),
(170, '2024-09-25', 'BTCUSDT', 63491.99000000, 64458.00000000, 62689.99000000, 64461.94000000, 63491.99000000, 1, 0, 0, 0, 0),
(171, '2024-09-25', 'BNBUSDT', 587.80000000, 607.10000000, 580.90000000, 607.10000000, 587.80000000, 1, 0, 0, 0, 0),
(172, '2024-09-25', 'ETHUSDT', 2601.63000000, 2646.86000000, 2557.51000000, 2646.89000000, 2601.63000000, 1, 0, 0, 0, 0),
(173, '2024-09-25', 'ATOMUSDT', 4.82900000, 4.96400000, 4.70200000, 4.96800000, 4.82900000, 1, 0, 0, 0, 0),
(174, '2024-09-25', 'NEARUSDT', 5.27800000, 5.37000000, 5.11200000, 5.35300000, 5.27800000, 1, 0, 0, 0, 0),
(175, '2024-09-25', 'LTCUSDT', 66.43000000, 67.84000000, 65.64000000, 66.99000000, 66.43000000, 0, 1, 0, 0, 0),
(176, '2024-09-25', 'PAXGUSDT', 2659.00000000, 2666.00000000, 2648.00000000, 2658.00000000, 2659.00000000, 0, 1, 0, 0, 0),
(177, '2024-09-25', 'RUNEUSDC', 5.10500000, 5.14100000, 4.90600000, 5.08100000, 5.10500000, 0, 1, 0, 0, 0),
(178, '2024-09-25', 'SHIBUSDC', 0.00001559, 0.00001574, 0.00001474, 0.00001501, 0.00001559, 0, 1, 0, 0, 0),
(179, '2024-09-25', 'DOGEUSDC', 0.10894000, 0.11072000, 0.10700000, 0.11057000, 0.10894000, 1, 0, 0, 0, 0),
(180, '2024-09-26', 'NEARUSDT', 5.83000000, 5.84900000, 5.24500000, 5.27800000, 5.83000000, 0, 1, 0, 0, 0),
(181, '2024-09-26', 'BTCUSDT', 65244.88000000, 65461.75000000, 63353.77000000, 63491.99000000, 65244.88000000, 0, 1, 0, 0, 0),
(182, '2024-09-26', 'BNBUSDT', 605.10000000, 605.10000000, 587.40000000, 587.80000000, 605.10000000, 1, 0, 0, 0, 0),
(183, '2024-09-26', 'ETHUSDT', 2643.73000000, 2658.00000000, 2593.40000000, 2601.63000000, 2643.73000000, 0, 1, 0, 0, 0),
(184, '2024-09-26', 'ATOMUSDT', 5.07800000, 5.07800000, 4.80300000, 4.82900000, 5.07800000, 0, 1, 0, 0, 0),
(185, '2024-09-26', 'INJUSDT', 23.39000000, 23.75000000, 22.73000000, 22.76000000, 23.39000000, 0, 1, 0, 0, 0),
(186, '2024-09-26', 'LTCUSDT', 68.40000000, 68.40000000, 66.47000000, 66.43000000, 68.40000000, 0, 1, 0, 0, 0),
(187, '2024-09-26', 'PAXGUSDT', 2658.00000000, 2677.00000000, 2653.00000000, 2659.00000000, 2658.00000000, 0, 1, 0, 0, 0),
(188, '2024-09-26', 'RUNEUSDC', 5.61500000, 5.69800000, 5.08700000, 5.10500000, 5.61500000, 0, 1, 0, 0, 0),
(189, '2024-09-26', 'SHIBUSDC', 0.00001795, 0.00001819, 0.00001544, 0.00001559, 0.00001795, 0, 1, 0, 0, 0),
(190, '2024-09-26', 'DOGEUSDC', 0.11786000, 0.11850000, 0.10856000, 0.10894000, 0.11786000, 0, 1, 0, 0, 0),
(191, '2024-09-27', 'BTCUSDT', 66052.62000000, 66225.44000000, 65683.02000000, 65244.88000000, 66052.62000000, 0, 1, 0, 0, 0),
(192, '2024-09-27', 'BNBUSDT', 612.10000000, 616.10000000, 605.50000000, 605.10000000, 612.10000000, 0, 1, 0, 0, 0),
(193, '2024-09-27', 'ETHUSDT', 2690.26000000, 2703.07000000, 2690.01000000, 2643.73000000, 2690.26000000, 0, 1, 0, 0, 0),
(194, '2024-09-27', 'ATOMUSDT', 5.13700000, 5.16200000, 5.10500000, 5.07800000, 5.13700000, 0, 1, 0, 0, 0),
(195, '2024-09-27', 'NEARUSDT', 5.50300000, 5.52900000, 5.43600000, 5.83000000, 5.50300000, 1, 0, 0, 0, 0),
(196, '2024-09-27', 'INJUSDT', 23.90000000, 23.96000000, 23.53000000, 23.39000000, 23.90000000, 0, 1, 0, 0, 0),
(197, '2024-09-27', 'LTCUSDT', 71.32000000, 71.44000000, 70.90000000, 68.40000000, 71.32000000, 0, 1, 0, 0, 0),
(198, '2024-09-27', 'PAXGUSDT', 2652.00000000, 2657.00000000, 2650.00000000, 2658.00000000, 2652.00000000, 1, 0, 0, 0, 0),
(199, '2024-09-27', 'RUNEUSDC', 5.40300000, 5.45500000, 5.36300000, 5.61500000, 5.40300000, 1, 0, 0, 0, 0),
(200, '2024-09-27', 'SHIBUSDC', 0.00002103, 0.00002141, 0.00002019, 0.00001795, 0.00002103, 0, 1, 0, 0, 0),
(201, '2024-09-27', 'DOGEUSDC', 0.12610000, 0.12665000, 0.12357000, 0.11786000, 0.12610000, 0, 1, 0, 0, 0),
(202, '2024-09-28', 'ATOMUSDT', 5.04900000, 5.13300000, 4.93800000, 5.13700000, 5.04900000, 1, 0, 0, 0, 0),
(203, '2024-09-28', 'NEARUSDT', 5.49200000, 5.57600000, 5.34700000, 5.50300000, 5.49200000, 0, 1, 0, 0, 0),
(204, '2024-09-28', 'INJUSDT', 22.86000000, 23.95000000, 22.58000000, 23.90000000, 22.86000000, 1, 0, 0, 0, 0),
(205, '2024-09-28', 'BTCUSDT', 65816.39000000, 66082.00000000, 65444.00000000, 66052.62000000, 65816.39000000, 1, 0, 0, 0, 0),
(206, '2024-09-28', 'BNBUSDT', 600.40000000, 612.60000000, 594.80000000, 612.10000000, 600.40000000, 1, 0, 0, 0, 0),
(207, '2024-09-28', 'ETHUSDT', 2675.01000000, 2699.06000000, 2652.76000000, 2690.26000000, 2675.01000000, 1, 0, 0, 0, 0),
(208, '2024-09-28', 'LTCUSDT', 69.58000000, 71.47000000, 69.03000000, 71.32000000, 69.58000000, 0, 1, 0, 0, 0),
(209, '2024-09-28', 'PAXGUSDT', 2667.00000000, 2668.00000000, 2650.00000000, 2652.00000000, 2667.00000000, 0, 1, 0, 0, 0),
(210, '2024-09-28', 'RUNEUSDC', 5.36900000, 5.48600000, 5.29300000, 5.40300000, 5.36900000, 0, 1, 0, 0, 0),
(211, '2024-09-28', 'SHIBUSDC', 0.00002017, 0.00002106, 0.00001907, 0.00002103, 0.00002017, 1, 0, 0, 0, 0),
(212, '2024-09-28', 'DOGEUSDC', 0.12959000, 0.13142000, 0.12041000, 0.12610000, 0.12959000, 0, 1, 0, 0, 0),
(213, '2024-09-29', 'ETHUSDT', 2616.00000000, 2673.95000000, 2607.50000000, 2675.01000000, 2616.00000000, 1, 0, 0, 0, 0),
(214, '2024-09-29', 'ATOMUSDT', 4.90300000, 5.11900000, 4.89600000, 5.04900000, 4.90300000, 1, 0, 0, 0, 0),
(215, '2024-09-29', 'NEARUSDT', 5.29900000, 5.62300000, 5.29900000, 5.49200000, 5.29900000, 0, 1, 0, 0, 0),
(216, '2024-09-29', 'INJUSDT', 22.52000000, 23.74000000, 22.25000000, 22.86000000, 22.52000000, 1, 0, 0, 0, 0),
(217, '2024-09-29', 'BNBUSDT', 574.50000000, 600.90000000, 573.10000000, 600.40000000, 574.50000000, 1, 0, 0, 0, 0),
(218, '2024-09-29', 'BTCUSDT', 64340.00000000, 65973.15000000, 64274.01000000, 65816.39000000, 64340.00000000, 1, 0, 0, 0, 0),
(219, '2024-09-29', 'LTCUSDT', 67.75000000, 70.24000000, 67.69000000, 69.58000000, 67.75000000, 1, 0, 0, 0, 0),
(220, '2024-09-29', 'PAXGUSDT', 2654.00000000, 2668.00000000, 2653.00000000, 2667.00000000, 2654.00000000, 1, 0, 0, 0, 0),
(221, '2024-09-29', 'RUNEUSDC', 5.04900000, 5.12900000, 5.03700000, 5.36900000, 5.04900000, 1, 0, 0, 0, 0),
(222, '2024-09-29', 'SHIBUSDC', 0.00001847, 0.00002009, 0.00001837, 0.00002017, 0.00001847, 1, 0, 0, 0, 0),
(223, '2024-09-29', 'DOGEUSDC', 0.12122000, 0.12923000, 0.12096000, 0.12959000, 0.12122000, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trader`
--

CREATE TABLE `trader` (
  `ID` int(11) NOT NULL,
  `USUARIO` varchar(255) DEFAULT NULL,
  `FECHA` timestamp NOT NULL DEFAULT current_timestamp(),
  `TIPO` varchar(15) NOT NULL DEFAULT 'BUY',
  `MONEDA` varchar(10) DEFAULT NULL,
  `ORDERID` varchar(255) DEFAULT NULL,
  `ORDERVENTA` varchar(255) DEFAULT NULL,
  `COMPRA` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `CANTIDAD` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `PRECIOCOMPRA` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `VENTA` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `GANANCIA` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `PRECIOVENTA` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `PORCENVENTA` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `MARGEN` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `ESCALON` int(11) DEFAULT 0,
  `LIQUIDAR` int(11) DEFAULT 0,
  `ACTIVO` int(11) DEFAULT 1,
  `ELIMINADO` int(11) DEFAULT 0,
  `XGANANCIA` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `NEGATIVO` int(11) DEFAULT 0,
  `AUTOSELL` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `USUARIO` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `SALDO` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `RATE` int(11) DEFAULT 1,
  `BLOQUEADO` int(11) DEFAULT 0,
  `IP` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`ID`, `USUARIO`, `PASSWORD`, `SALDO`, `RATE`, `BLOQUEADO`, `IP`) VALUES
(1, 'dd77b701661c5b55', '$2y$10$iVJlxPAEPTxDDGXm2VnHmeUBy64jqv.wXlPL4lYxk7e36XTws38Ry', 0.00000000, 1, 0, '::1'),
(3, 'cf804109f32fb39a', '$2y$10$uWwdibe6E876XlflUDzGD.2ZjCmLIYtVtPjD9NU4Q8SEsdH4KFbsa', 0.00000000, 1, 0, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `datos`
--
ALTER TABLE `datos`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `datosusuarios`
--
ALTER TABLE `datosusuarios`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `orderbinance`
--
ALTER TABLE `orderbinance`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `parametros`
--
ALTER TABLE `parametros`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `trader`
--
ALTER TABLE `trader`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `datos`
--
ALTER TABLE `datos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `datosusuarios`
--
ALTER TABLE `datosusuarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `orderbinance`
--
ALTER TABLE `orderbinance`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `parametros`
--
ALTER TABLE `parametros`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `prices`
--
ALTER TABLE `prices`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;

--
-- AUTO_INCREMENT de la tabla `trader`
--
ALTER TABLE `trader`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
