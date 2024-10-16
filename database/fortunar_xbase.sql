-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-10-2024 a las 18:16:10
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
(1, 'BTCUSDT', 'BTC', 'USDT', 0.00000000, 60000.00000000, 18987.00000000, 0, 0.00000, '{\"par\":\"USDT\",\"asset\":\"BTC\",\"price\":\"68458.02\",\"btc\":\"68458.02\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:360deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"BTCUSDT\",\"tendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"68836.35\",\"mindia\":\"67569.67\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"techo\":\"64100.684285714286\",\"piso\":\"62231.249714285714\",\"ant\":\"68167.70000000\",\"nivel\":\"<div class=odometros style=--data:154.8deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:154.8deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"70%\",\"totalpromedio\":63165.967000000004,\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"1\",\"alert\":\"olive\",\"labelpricebitcoin\":\"68458.02\",\"labelpricemoneda\":\"68458.02\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:-80deg;--color2:#F6465D;--data2:-220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}', 2, 0.0000100000, 0.0000100000),
(6, 'BNBUSDT', 'BNB', 'USDT', 0.00120338, 600.00000000, 260.00000000, 0, 348.90000, '{\"par\":\"USDT\",\"asset\":\"BNB\",\"price\":\"598.8\",\"btc\":\"68458.02\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:360deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"BNBUSDT\",\"tendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"601.6\",\"mindia\":\"594.0\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"techo\":\"584.482352941176\",\"piso\":\"566.085294117647\",\"ant\":\"605.30000000\",\"nivel\":\"<div class=odometros style=--data:0deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:154.8deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"63%\",\"totalpromedio\":575.2838235294115,\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"6\",\"alert\":\"olive\",\"labelpricebitcoin\":\"68458.02\",\"labelpricemoneda\":\"598.8\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:-80deg;--color2:#F6465D;--data2:-220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}', 1, 0.0010000000, 0.0010000000),
(7, 'ETHUSDT', 'ETH', 'USDT', 0.00000000, 3000.00000000, 1484.00000000, 0, 1266.00000, '{\"par\":\"USDT\",\"asset\":\"ETH\",\"price\":\"2633.89\",\"btc\":\"68458.02\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:360deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"ETHUSDT\",\"tendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"2661.79\",\"mindia\":\"2610.64\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"techo\":\"2558.721764705882\",\"piso\":\"2469.899117647059\",\"ant\":\"2650.97000000\",\"nivel\":\"<div class=odometros style=--data:0deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:154.8deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"45%\",\"totalpromedio\":2514.3104411764707,\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"7\",\"alert\":\"orange\",\"labelpricebitcoin\":\"68458.02\",\"labelpricemoneda\":\"2633.89\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:80deg;--color2:#F6465D;--data2:-220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}', 2, 0.0001000000, 0.0001000000),
(9, 'ATOMUSDT', 'ATOM', 'USDT', 0.00000000, 17.00000000, 9.00000000, 0, 14.15600, '{\"par\":\"USDT\",\"asset\":\"ATOM\",\"price\":\"4.357\",\"btc\":\"68458.02\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:338.4deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"ATOMUSDT\",\"tendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"color\":\"#F37A8B\",\"maxdia\":\"4.389\",\"mindia\":\"4.315\",\"totalTendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"techo\":\"4.631114285714\",\"piso\":\"4.415457142857\",\"ant\":\"4.44800000\",\"nivel\":\"<div class=odometros style=--data:0deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:154.8deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"57%\",\"totalpromedio\":4.5232857142855,\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"9\",\"alert\":\"olive\",\"labelpricebitcoin\":\"68458.02\",\"labelpricemoneda\":\"4.357\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:-80deg;--color2:#F6465D;--data2:-220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}', 3, 0.0100000000, 0.0100000000),
(15, 'NEARUSDT', 'NEAR', 'USDT', 0.00000000, 0.00000000, 0.00000000, 0, 2.04000, '{\"par\":\"USDT\",\"asset\":\"NEAR\",\"price\":\"4.841\",\"btc\":\"68458.02\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:360deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"NEARUSDT\",\"tendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"color\":\"#F37A8B\",\"maxdia\":\"4.883\",\"mindia\":\"4.741\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"techo\":\"5.010794117647\",\"piso\":\"4.679117647059\",\"ant\":\"4.99500000\",\"nivel\":\"<div class=odometros style=--data:0deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:154.8deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"70%\",\"totalpromedio\":4.844955882353,\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"15\",\"alert\":\"olive\",\"labelpricebitcoin\":\"68458.02\",\"labelpricemoneda\":\"4.841\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:-80deg;--color2:#F6465D;--data2:-220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}', 3, 0.1000000000, 0.1000000000),
(16, 'INJUSDT', 'INJ', 'USDT', 0.00000000, 0.00000000, 0.00000000, 0, 2.50400, '{\"par\":\"USDT\",\"asset\":\"INJ\",\"price\":\"21.89\",\"btc\":\"68458.02\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:360deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"INJUSDT\",\"tendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"22.31\",\"mindia\":\"21.19\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"techo\":\"21.769142857143\",\"piso\":\"20.298857142857\",\"ant\":\"23.28000000\",\"nivel\":\"<div class=odometros style=--data:0deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:154.8deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"63%\",\"totalpromedio\":21.034,\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"16\",\"alert\":\"olive\",\"labelpricebitcoin\":\"68458.02\",\"labelpricemoneda\":\"21.89\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:-80deg;--color2:#F6465D;--data2:-220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}', 2, 0.0100000000, 0.0100000000),
(17, 'LTCUSDT', 'LTC', 'USDT', 0.00000000, 0.00000000, 0.00000000, 0, 0.00000, '{\"par\":\"USDT\",\"asset\":\"LTC\",\"price\":\"72.98\",\"btc\":\"68458.02\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:360deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"LTCUSDT\",\"tendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"73.34\",\"mindia\":\"71.91\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"techo\":\"67.710588235294\",\"piso\":\"65.373529411765\",\"ant\":\"74.73000000\",\"nivel\":\"<div class=odometros style=--data:0deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:154.8deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"75%\",\"totalpromedio\":66.5420588235295,\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"17\",\"alert\":\"olive\",\"labelpricebitcoin\":\"68458.02\",\"labelpricemoneda\":\"72.98\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:-80deg;--color2:#F6465D;--data2:-220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}', 2, 0.0010000000, 0.0010000000),
(18, 'PAXGUSDT', 'PAXG', 'USDT', 0.00000000, 0.00000000, 0.00000000, 0, 1748.00000, '{\"par\":\"USDT\",\"asset\":\"PAXG\",\"price\":\"2728\",\"btc\":\"68458.02\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:360deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"PAXGUSDT\",\"tendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"2729\",\"mindia\":\"2707\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"techo\":\"2659.628571428571\",\"piso\":\"2633.028571428571\",\"ant\":\"2717.00000000\",\"nivel\":\"<div class=odometros style=--data:331.2deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:154.8deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"95%\",\"totalpromedio\":2646.328571428571,\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"18\",\"alert\":\"green\",\"labelpricebitcoin\":\"68458.02\",\"labelpricemoneda\":\"2728\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:-80deg;--color2:#F6465D;--data2:-220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}', 0, 0.0001000000, 0.0001000000),
(19, 'RUNEUSDC', 'RUNE', 'USDC', 0.00000000, 0.00000000, 0.00000000, 1, 0.00000, '{\"par\":\"USDC\",\"asset\":\"RUNE\",\"price\":\"4.930\",\"btc\":\"68458.02\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:356.4deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"RUNEUSDC\",\"tendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"color\":\"#F37A8B\",\"maxdia\":\"4.976\",\"mindia\":\"4.838\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"techo\":\"4.965588235294\",\"piso\":\"4.643588235294\",\"ant\":\"5.11100000\",\"nivel\":\"<div class=odometros style=--data:0deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:154.8deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"67%\",\"totalpromedio\":4.804588235294,\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"19\",\"alert\":\"olive\",\"labelpricebitcoin\":\"68458.02\",\"labelpricemoneda\":\"4.930\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:-80deg;--color2:#F6465D;--data2:-220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}', 3, 0.1000000000, 0.1000000000),
(20, 'SHIBUSDC', 'SHIB', 'USDC', 0.00000000, 0.00000000, 0.00000000, 0, 0.00000, '{\"par\":\"USDC\",\"asset\":\"SHIB\",\"price\":\"0.00001878\",\"btc\":\"68458.02\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:0deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"SHIBUSDC\",\"tendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"0.00001898\",\"mindia\":\"0.00001848\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"techo\":\"0.000017259118\",\"piso\":\"0.000016139706\",\"ant\":\"0.00001923\",\"nivel\":\"<div class=odometros style=--data:0deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:154.8deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"60%\",\"totalpromedio\":1.6699412e-5,\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"20\",\"alert\":\"olive\",\"labelpricebitcoin\":\"68458.02\",\"labelpricemoneda\":\"0.00001878\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:-80deg;--color2:#F6465D;--data2:-220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}', 8, 1.0000000000, 1.0000000000),
(21, 'DOGEUSDC', 'DOGE', 'USDC', 0.00000000, 0.00000000, 0.00000000, 0, 0.00000, '{\"par\":\"USDC\",\"asset\":\"DOGE\",\"price\":\"0.13643\",\"btc\":\"68458.02\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:360deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"DOGEUSDC\",\"tendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"0.13810\",\"mindia\":\"0.13152\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"techo\":\"0.114880588235\",\"piso\":\"0.108661176471\",\"ant\":\"0.13613000\",\"nivel\":\"<div class=odometros style=--data:54deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:154.8deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"75%\",\"totalpromedio\":0.111770882353,\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"21\",\"alert\":\"olive\",\"labelpricebitcoin\":\"68458.02\",\"labelpricemoneda\":\"0.13643\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:-80deg;--color2:#F6465D;--data2:-220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}', 5, 1.0000000000, 1.0000000000);

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
  `ULTIMAVENTA` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `ULTIMACOMPRA` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `DATOS` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`DATOS`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `datosusuarios`
--

INSERT INTO `datosusuarios` (`ID`, `USUARIO`, `MONEDA`, `ASSET`, `PAR`, `BALANCE_ASSET`, `PRECIO_VENTA`, `PANTE`, `ACTIVO`, `ULTIMAVENTA`, `ULTIMACOMPRA`, `DATOS`) VALUES
(1, 'dd77b701661c5b55', 'BTCUSDT', 'BTC', 'USDT', 0.00000000, 60000.00000000, 18987.00000000, 0, 0.00000000, 0.00000000, NULL),
(6, 'dd77b701661c5b55', 'BNBUSDT', 'BNB', 'USDT', 0.00044289, 600.00000000, 260.00000000, 0, 575.50000000, 0.00000000, NULL),
(7, 'dd77b701661c5b55', 'ETHUSDT', 'ETH', 'USDT', 0.00000000, 3000.00000000, 1484.00000000, 0, 1266.00000000, 0.00000000, NULL),
(9, 'dd77b701661c5b55', 'ATOMUSDT', 'ATOM', 'USDT', 0.00000000, 17.00000000, 9.00000000, 0, 4.73800000, 0.00000000, NULL),
(15, 'dd77b701661c5b55', 'NEARUSDT', 'NEAR', 'USDT', 4.15110311, 0.00000000, 0.00000000, 1, 4.87200000, 4.62200000, NULL),
(22, 'cf804109f32fb39a', 'BTCUSDT', 'BTC', 'USDT', 0.00000000, 0.00000000, 0.00000000, 1, 0.00000000, 0.00000000, NULL),
(28, 'dd77b701661c5b55', 'INJUSDT', 'INJ', 'USDT', 0.00000000, 0.00000000, 0.00000000, 0, 20.58000000, 0.00000000, NULL),
(29, 'dd77b701661c5b55', 'RUNEUSDC', 'RUNE', 'USDC', 0.00000000, 0.00000000, 0.00000000, 0, 0.00000000, 0.00000000, NULL);

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
  `GRAFICO` int(11) DEFAULT 0,
  `DATOS` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '{"valor":"null"}',
  `DATOSGRAF` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '{"valor":"null"}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `parametros`
--

INSERT INTO `parametros` (`ID`, `USUARIO`, `ESTABLECOIN`, `CAPITAL`, `ESCALONES`, `INVXCOMPRA`, `DISPONIBLE`, `GANANCIA`, `PERDIDA`, `IMPUESTO`, `LOCAL`, `BINANCE`, `APIKEY`, `SECRET`, `STOPLOSS`, `AUTOSHELL`, `GRAFICO`, `DATOS`, `DATOSGRAF`) VALUES
(1, 'dd77b701661c5b55', 'USDT', 0.29763530, 1, 0.29800000, 0.29763530, 0.00000000, 0.00000000, 0.02000000, 0, 1, 'Dt7T5bPCyEfhX8XabI9F4k9KYzdycVJPYXZSak5CQTBXWkhydGwrQ1lDaXF5TGFSMlpRM0JFL1k0SUtsc2c2dDJZZDJFQVJuejNMY2xLQ1FjNldWOGFRUURGSHJhMlBaWHgyYWdUMlU4dFBUbzBBZ0duZ255aHN3ZGlnPQ==', 'AdaCX7LKVBpr6gDgOWVR9TVQbjMrVWF3RjNVSi9tTDM5RnJBREJucVFzbVNGSVpVOC95dS8zUWhuNFU0bk16Rk0vNGF0MW4xWnc0L1RsTUdyUVZndWVFMWwwMTFGVHA1Z0lnM1BiKzRYdTl6djZLcEZxa241cFZrS044PQ==', 5, 3, 0, '{\"pante\":\"4.599\",\"animotrader\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"balance_asset\":\"4.15110311\",\"par\":\"USDT\",\"tipografico\":\"0\",\"asset\":\"NEAR\",\"ultimaventa\":\"4.872\",\"ultimacompra\":\"4.622\",\"price\":\"4.841\",\"btc\":\"68458.02\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:360deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"NEARUSDT\",\"tendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"color\":\"#F37A8B\",\"maxdia\":\"4.883\",\"mindia\":\"4.741\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"utc\":\"4:16 PM\",\"techo\":\"5.010794117647\",\"piso\":\"4.679117647059\",\"totalmoneda\":\"<div style=width:100%;padding:3px;background:#372127;border-radius:3px;color:#F37A8B;>2.00 NEAR <span style=color:#F37A8B;>&#9660;</span></div>\",\"m_balance\":2.15110311,\"ant\":\"4.99500000\",\"nivel\":\"<div class=odometros style=--data:0deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:154.8deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"70%\",\"ganancia\":\"0.0000\",\"perdida\":\"0.0000\",\"capital\":\"0.2976\",\"disponible\":\"0.2976\",\"escalones\":\"1\",\"invxcompra\":\"0.298\",\"totalpromedio\":\"4.845\",\"xdisponible\":\"0.2976\",\"auto\":\"0\",\"bina\":\"1\",\"impuesto\":\"0.0200\",\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"15\",\"recordCount\":\"1\",\"colordisp\":\"#F37A8B\",\"checkMesGrafico\":true,\"recupera\":\"4.85\",\"alert\":\"olive\",\"checkAnoGrafico\":false,\"verescalones\":\"<table style=width:100%;><th>Stop</th><th>Tipo</th><th>Compra/Venta</th><th>Moneda</th><th style=text-align:right;>Ganancia</th><th>Opciones</th><tr style=background:transparent;><td><div class=odometro style=--data:255.6deg;></div></td><td style=color:white;>BUY</td><td style=color:white;>4.912$</td><td style=text-align:right;><div style=width:100%;padding:3px;background:#372127;border-radius:3px;color:#F37A8B;>2.000 NEAR <span style=color:#F37A8B;>&#9660;</span></div></td><td style=text-align:right;><span style=font-weight:bold;color:#F37A8B>-0.14$</span></td><td style=text-align:right;><input type=checkbox  id=toggle1 onclick=autostop(23)><label class=btn-label1  for=toggle1>Stop</label><input type=checkbox checked id=toggle2 onclick=autosell(23)><label class=btn-label2 style=background-color:#4caf50;color:white; for=toggle2>Auto</label><label  class=escalbutton style=background:#EA465C; onclick=perdida(23)>Sell</label><label  class=escalbutton title=eliminar style=background:#EAB92B; onclick=borrar(23)>x</label></td></tr></table>\",\"labelpricebitcoin\":\"68458.02\",\"labelpricemoneda\":\"4.841\",\"precio_venta\":\"3\",\"listasset\":\"<table style=text-align:right;width:100%;><th></th><th></th><tr><td><span onclick=moneyChangue(1) style=cursor:pointer;color:#4BC883;>BTC</span></td><td><span style=color:#4BC883;font-weight:bold;>68458.02</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(6) style=cursor:pointer;color:#4BC883;>BNB</span></td><td><span style=color:#4BC883;font-weight:bold;>598.8</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(7) style=cursor:pointer;color:#4BC883;>ETH</span></td><td><span style=color:#4BC883;font-weight:bold;>2633.89</span></td><td><span class=bolita style=color:orange;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(9) style=cursor:pointer;color:#F37A8B;>ATOM</span></td><td><span style=color:#F37A8B;font-weight:bold;>4.357</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(15) style=cursor:pointer;color:#F37A8B;>NEAR</span></td><td><span style=color:#F37A8B;font-weight:bold;>4.841</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(28) style=cursor:pointer;color:#4BC883;>INJ</span></td><td><span style=color:#4BC883;font-weight:bold;>21.89</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(29) style=cursor:pointer;color:#F37A8B;>RUNE</span></td><td><span style=color:#F37A8B;font-weight:bold;>4.930</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr></table>\",\"stop\":\"5\",\"balance\":\"4.15110311\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:-80deg;--color2:#F6465D;--data2:-220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}', '{\"grafico\":[{\"date\":\"2024-10-18\",\"open\":\"4.788\",\"high\":\"4.883\",\"low\":\"4.741\",\"close\":\"4.841\",\"prm\":\"4.749\"},{\"date\":\"2024-10-17\",\"open\":\"4.992\",\"high\":\"4.995\",\"low\":\"4.656\",\"close\":\"4.788\",\"prm\":\"4.722\"},{\"date\":\"2024-10-16\",\"open\":\"5.007\",\"high\":\"5.058\",\"low\":\"4.888\",\"close\":\"4.992\",\"prm\":\"4.824\"},{\"date\":\"2024-10-15\",\"open\":\"4.913\",\"high\":\"5.271\",\"low\":\"4.889\",\"close\":\"5.007\",\"prm\":\"4.832\"},{\"date\":\"2024-10-14\",\"open\":\"4.827\",\"high\":\"5.076\",\"low\":\"4.746\",\"close\":\"4.913\",\"prm\":\"4.785\"},{\"date\":\"2024-10-13\",\"open\":\"4.754\",\"high\":\"4.836\",\"low\":\"4.565\",\"close\":\"4.827\",\"prm\":\"4.742\"},{\"date\":\"2024-10-12\",\"open\":\"4.700\",\"high\":\"4.912\",\"low\":\"4.704\",\"close\":\"4.754\",\"prm\":\"4.705\"},{\"date\":\"2024-10-11\",\"open\":\"4.609\",\"high\":\"4.805\",\"low\":\"4.586\",\"close\":\"4.700\",\"prm\":\"4.678\"},{\"date\":\"2024-10-10\",\"open\":\"4.648\",\"high\":\"4.674\",\"low\":\"4.440\",\"close\":\"4.609\",\"prm\":\"4.633\"},{\"date\":\"2024-10-09\",\"open\":\"4.891\",\"high\":\"4.969\",\"low\":\"4.561\",\"close\":\"4.648\",\"prm\":\"4.652\"},{\"date\":\"2024-10-08\",\"open\":\"5.127\",\"high\":\"5.149\",\"low\":\"4.862\",\"close\":\"4.891\",\"prm\":\"4.774\"},{\"date\":\"2024-10-07\",\"open\":\"5.203\",\"high\":\"5.312\",\"low\":\"5.018\",\"close\":\"5.127\",\"prm\":\"4.892\"},{\"date\":\"2024-10-06\",\"open\":\"4.748\",\"high\":\"5.276\",\"low\":\"4.720\",\"close\":\"5.203\",\"prm\":\"4.930\"},{\"date\":\"2024-10-05\",\"open\":\"4.727\",\"high\":\"4.834\",\"low\":\"4.639\",\"close\":\"4.748\",\"prm\":\"4.702\"},{\"date\":\"2024-10-04\",\"open\":\"4.664\",\"high\":\"4.860\",\"low\":\"4.652\",\"close\":\"4.727\",\"prm\":\"4.692\"},{\"date\":\"2024-10-03\",\"open\":\"4.765\",\"high\":\"4.739\",\"low\":\"4.489\",\"close\":\"4.664\",\"prm\":\"4.660\"},{\"date\":\"2024-10-02\",\"open\":\"4.930\",\"high\":\"4.997\",\"low\":\"4.544\",\"close\":\"4.765\",\"prm\":\"4.711\"},{\"date\":\"2024-10-01\",\"open\":\"5.398\",\"high\":\"5.562\",\"low\":\"4.718\",\"close\":\"4.930\",\"prm\":\"4.793\"},{\"date\":\"2024-09-30\",\"open\":\"5.345\",\"high\":\"5.467\",\"low\":\"5.236\",\"close\":\"5.398\",\"prm\":\"5.027\"},{\"date\":\"2024-09-29\",\"open\":\"5.492\",\"high\":\"5.623\",\"low\":\"5.292\",\"close\":\"5.345\",\"prm\":\"5.001\"},{\"date\":\"2024-09-28\",\"open\":\"5.503\",\"high\":\"5.576\",\"low\":\"5.347\",\"close\":\"5.492\",\"prm\":\"5.074\"},{\"date\":\"2024-09-27\",\"open\":\"5.830\",\"high\":\"5.529\",\"low\":\"5.436\",\"close\":\"5.503\",\"prm\":\"5.080\"},{\"date\":\"2024-09-26\",\"open\":\"5.278\",\"high\":\"5.849\",\"low\":\"5.245\",\"close\":\"5.830\",\"prm\":\"5.243\"},{\"date\":\"2024-09-25\",\"open\":\"5.353\",\"high\":\"5.370\",\"low\":\"5.112\",\"close\":\"5.278\",\"prm\":\"4.967\"},{\"date\":\"2024-09-24\",\"open\":\"5.249\",\"high\":\"5.455\",\"low\":\"5.089\",\"close\":\"5.353\",\"prm\":\"5.005\"},{\"date\":\"2024-09-23\",\"open\":\"4.723\",\"high\":\"5.269\",\"low\":\"4.641\",\"close\":\"5.249\",\"prm\":\"4.953\"},{\"date\":\"2024-09-22\",\"open\":\"4.608\",\"high\":\"4.745\",\"low\":\"4.385\",\"close\":\"4.723\",\"prm\":\"4.690\"},{\"date\":\"2024-09-21\",\"open\":\"4.326\",\"high\":\"4.685\",\"low\":\"4.287\",\"close\":\"4.608\",\"prm\":\"4.632\"},{\"date\":\"2024-09-20\",\"open\":\"4.407\",\"high\":\"4.504\",\"low\":\"4.302\",\"close\":\"4.326\",\"prm\":\"4.491\"},{\"date\":\"2024-09-19\",\"open\":\"4.534\",\"high\":\"4.581\",\"low\":\"4.258\",\"close\":\"4.407\",\"prm\":\"4.532\"}]}'),
(2, 'cf804109f32fb39a', 'USDT', 0.00000000, 4, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.02000000, 1, 0, 'n//BUwujCe5poUyBnMy/MWZENlFwbE9GYktUZkRKbG9jNFFnbkx2UE13WVFGdlZXVHprem1YblJpUGg5VXJTVWxVelhZRnY3MGx3ZDB6MFg=', 'yMq+4VXzhr5b3ytCQpRQAWRNZTNoWDJsakV6alJkWjFHQmt1dHBSUk00L3ZROTJoM0VualIreXpkdi9Id3FOZFNKRnRhRlhSUWNGWVk1NUM=', 1, 2, 0, NULL, NULL);

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
  `ALCISTA` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prices`
--

INSERT INTO `prices` (`ID`, `FECHA`, `MONEDA`, `ACTUAL`, `ARRIBA`, `ABAJO`, `OPEN`, `CLOSE`, `BAJISTA`, `ALCISTA`) VALUES
(34, '2024-09-12', 'BTCUSDT', 57845.97000000, 58503.99000000, 57371.62000000, 58234.46000000, 57845.97000000, 0, 1),
(35, '2024-09-12', 'BNBUSDT', 542.80000000, 548.50000000, 534.40000000, 543.00000000, 542.80000000, 0, 1),
(36, '2024-09-12', 'ETHUSDT', 2356.04000000, 2377.40000000, 2318.27000000, 2369.49000000, 2356.04000000, 1, 0),
(37, '2024-09-12', 'ATOMUSDT', 4.13300000, 4.16800000, 4.05900000, 4.14200000, 4.13300000, 1, 0),
(38, '2024-09-12', 'NEARUSDT', 4.21600000, 4.29900000, 4.09400000, 4.10300000, 4.21600000, 0, 1),
(39, '2024-09-12', 'INJUSDT', 19.10000000, 19.48000000, 18.82000000, 19.06000000, 19.10000000, 0, 1),
(40, '2024-09-12', 'LTCUSDT', 62.50000000, 63.12000000, 61.56000000, 62.37000000, 62.50000000, 0, 1),
(41, '2024-09-12', 'PAXGUSDT', 2560.00000000, 2563.00000000, 2520.00000000, 2521.00000000, 2560.00000000, 0, 1),
(42, '2024-09-12', 'RUNEUSDC', 3.87300000, 4.08300000, 3.80500000, 4.02500000, 3.87300000, 1, 0),
(43, '2024-09-12', 'SHIBUSDC', 0.00001342, 0.00001354, 0.00001320, 0.00001342, 0.00001342, 0, 1),
(44, '2024-09-12', 'DOGEUSDC', 0.10185000, 0.10293000, 0.10065000, 0.10238000, 0.10185000, 0, 1),
(45, '2024-09-13', 'PAXGUSDT', 2575.00000000, 2584.00000000, 2560.00000000, 2560.00000000, 2575.00000000, 0, 1),
(46, '2024-09-13', 'BTCUSDT', 60319.87000000, 60624.54000000, 57632.63000000, 57845.97000000, 60319.87000000, 0, 1),
(47, '2024-09-13', 'BNBUSDT', 556.20000000, 559.40000000, 538.80000000, 542.80000000, 556.20000000, 0, 1),
(48, '2024-09-13', 'ETHUSDT', 2432.60000000, 2460.55000000, 2337.36000000, 2356.04000000, 2432.60000000, 0, 1),
(49, '2024-09-13', 'ATOMUSDT', 4.21800000, 4.25500000, 4.13600000, 4.13300000, 4.21800000, 0, 1),
(50, '2024-09-13', 'NEARUSDT', 4.24100000, 4.34400000, 4.11800000, 4.21600000, 4.24100000, 0, 1),
(51, '2024-09-13', 'RUNEUSDC', 4.13500000, 4.18100000, 3.82900000, 3.87300000, 4.13500000, 0, 1),
(52, '2024-09-13', 'SHIBUSDC', 0.00001400, 0.00001410, 0.00001339, 0.00001342, 0.00001400, 0, 1),
(53, '2024-09-13', 'DOGEUSDC', 0.10721000, 0.10836000, 0.10185000, 0.10185000, 0.10721000, 0, 1),
(54, '2024-09-13', 'INJUSDT', 19.62000000, 20.11000000, 18.49000000, 19.10000000, 19.62000000, 0, 1),
(55, '2024-09-13', 'LTCUSDT', 65.32000000, 65.62000000, 62.46000000, 62.50000000, 65.32000000, 0, 1),
(78, '2024-09-17', 'ATOMUSDT', 4.19700000, 4.23800000, 3.99900000, 4.00000000, 4.19700000, 0, 1),
(79, '2024-09-17', 'NEARUSDT', 4.09200000, 4.30000000, 3.89300000, 3.89400000, 4.09200000, 0, 1),
(80, '2024-09-17', 'BNBUSDT', 547.40000000, 552.60000000, 534.90000000, 534.90000000, 547.40000000, 0, 1),
(81, '2024-09-17', 'ETHUSDT', 2334.79000000, 2391.65000000, 2282.70000000, 2284.18000000, 2334.79000000, 0, 1),
(82, '2024-09-17', 'BTCUSDT', 60509.99000000, 61288.00000000, 58046.12000000, 58060.00000000, 60509.99000000, 0, 1),
(83, '2024-09-17', 'INJUSDT', 19.35000000, 19.96000000, 18.03000000, 18.04000000, 19.35000000, 0, 1),
(84, '2024-09-17', 'LTCUSDT', 64.19000000, 64.34000000, 62.24000000, 63.22000000, 64.19000000, 0, 1),
(85, '2024-09-17', 'PAXGUSDT', 2582.00000000, 2614.00000000, 2572.00000000, 2588.00000000, 2582.00000000, 0, 1),
(86, '2024-09-17', 'RUNEUSDC', 4.05800000, 4.15000000, 3.83700000, 3.83700000, 4.05800000, 0, 1),
(87, '2024-09-17', 'SHIBUSDC', 0.00001337, 0.00001357, 0.00001317, 0.00001320, 0.00001337, 0, 1),
(88, '2024-09-17', 'DOGEUSDC', 0.10119000, 0.10257000, 0.09960000, 0.09983000, 0.10119000, 0, 1),
(89, '2024-09-18', 'LTCUSDT', 64.93000000, 65.41000000, 62.43000000, 64.19000000, 64.93000000, 0, 1),
(90, '2024-09-18', 'BTCUSDT', 62117.99000000, 62503.99000000, 59218.06000000, 60509.99000000, 62117.99000000, 0, 1),
(91, '2024-09-18', 'BNBUSDT', 560.10000000, 562.60000000, 536.90000000, 547.40000000, 560.10000000, 0, 1),
(92, '2024-09-18', 'ETHUSDT', 2403.68000000, 2410.86000000, 2279.45000000, 2334.79000000, 2403.68000000, 0, 1),
(93, '2024-09-18', 'ATOMUSDT', 4.44500000, 4.47200000, 4.10200000, 4.19700000, 4.44500000, 0, 1),
(94, '2024-09-18', 'NEARUSDT', 4.53400000, 4.56300000, 3.93700000, 4.09200000, 4.53400000, 0, 1),
(95, '2024-09-18', 'INJUSDT', 20.38000000, 20.72000000, 18.20000000, 19.35000000, 20.38000000, 0, 1),
(96, '2024-09-18', 'PAXGUSDT', 2571.00000000, 2608.00000000, 2556.00000000, 2582.00000000, 2571.00000000, 1, 0),
(97, '2024-09-18', 'RUNEUSDC', 4.37100000, 4.41800000, 3.81400000, 4.05800000, 4.37100000, 0, 1),
(98, '2024-09-18', 'SHIBUSDC', 0.00001385, 0.00001399, 0.00001297, 0.00001337, 0.00001385, 0, 1),
(99, '2024-09-18', 'DOGEUSDC', 0.10407000, 0.10552000, 0.09950000, 0.10119000, 0.10407000, 0, 1),
(100, '2024-09-19', 'RUNEUSDC', 4.52500000, 4.58700000, 4.33600000, 4.37100000, 4.52500000, 0, 1),
(101, '2024-09-19', 'NEARUSDT', 4.40700000, 4.58100000, 4.25800000, 4.53400000, 4.40700000, 0, 1),
(102, '2024-09-19', 'BTCUSDT', 63715.80000000, 63848.89000000, 61816.00000000, 62117.99000000, 63715.80000000, 0, 1),
(103, '2024-09-19', 'BNBUSDT', 571.00000000, 571.90000000, 553.20000000, 560.10000000, 571.00000000, 0, 1),
(104, '2024-09-19', 'ETHUSDT', 2519.72000000, 2519.72000000, 2399.71000000, 2403.68000000, 2519.72000000, 0, 1),
(105, '2024-09-19', 'ATOMUSDT', 4.54600000, 4.61400000, 4.42100000, 4.44500000, 4.54600000, 0, 1),
(106, '2024-09-19', 'ATOMUSDT', 4.54600000, 4.61400000, 4.42100000, 4.44500000, 4.54600000, 0, 1),
(107, '2024-09-19', 'INJUSDT', 20.94000000, 21.04000000, 20.09000000, 20.38000000, 20.94000000, 0, 1),
(108, '2024-09-19', 'INJUSDT', 20.94000000, 21.04000000, 20.09000000, 20.38000000, 20.94000000, 0, 1),
(109, '2024-09-19', 'SHIBUSDC', 0.00001433, 0.00001456, 0.00001382, 0.00001385, 0.00001433, 0, 1),
(110, '2024-09-19', 'LTCUSDT', 65.93000000, 66.05000000, 64.71000000, 64.93000000, 65.93000000, 0, 1),
(111, '2024-09-19', 'DOGEUSDC', 0.10602000, 0.10712000, 0.10364000, 0.10407000, 0.10602000, 0, 1),
(112, '2024-09-19', 'PAXGUSDT', 2598.00000000, 2598.00000000, 2566.00000000, 2571.00000000, 2598.00000000, 1, 0),
(113, '2024-09-20', 'RUNEUSDC', 4.44500000, 4.58500000, 4.34700000, 4.52500000, 4.44500000, 1, 0),
(114, '2024-09-20', 'BTCUSDT', 62889.58000000, 64099.19000000, 62582.83000000, 63715.80000000, 62889.58000000, 0, 1),
(115, '2024-09-20', 'BNBUSDT', 567.80000000, 577.10000000, 564.70000000, 571.00000000, 567.80000000, 0, 1),
(116, '2024-09-20', 'ETHUSDT', 2544.67000000, 2586.49000000, 2516.24000000, 2519.72000000, 2544.67000000, 0, 1),
(117, '2024-09-20', 'ATOMUSDT', 4.49600000, 4.59000000, 4.47000000, 4.54600000, 4.49600000, 1, 0),
(118, '2024-09-20', 'NEARUSDT', 4.32600000, 4.50400000, 4.30200000, 4.40700000, 4.32600000, 1, 0),
(119, '2024-09-20', 'INJUSDT', 20.69000000, 21.39000000, 20.45000000, 20.94000000, 20.69000000, 0, 1),
(120, '2024-09-20', 'SHIBUSDC', 0.00001425, 0.00001450, 0.00001405, 0.00001433, 0.00001425, 1, 0),
(121, '2024-09-20', 'DOGEUSDC', 0.10480000, 0.10744000, 0.10397000, 0.10602000, 0.10480000, 0, 1),
(122, '2024-09-20', 'LTCUSDT', 65.31000000, 66.45000000, 64.41000000, 65.93000000, 65.31000000, 0, 1),
(123, '2024-09-20', 'PAXGUSDT', 2620.00000000, 2629.00000000, 2595.00000000, 2598.00000000, 2620.00000000, 0, 1),
(124, '2024-09-21', 'BTCUSDT', 63106.00000000, 63518.01000000, 62772.00000000, 62889.58000000, 63106.00000000, 1, 0),
(125, '2024-09-21', 'BNBUSDT', 584.00000000, 589.90000000, 567.70000000, 567.80000000, 584.00000000, 0, 1),
(126, '2024-09-21', 'ETHUSDT', 2594.72000000, 2631.21000000, 2529.60000000, 2544.67000000, 2594.72000000, 0, 1),
(127, '2024-09-21', 'ATOMUSDT', 4.65000000, 4.72600000, 4.46300000, 4.49600000, 4.65000000, 0, 1),
(128, '2024-09-21', 'NEARUSDT', 4.60800000, 4.68500000, 4.28700000, 4.32600000, 4.60800000, 0, 1),
(129, '2024-09-21', 'INJUSDT', 21.15000000, 21.65000000, 20.48000000, 20.69000000, 21.15000000, 0, 1),
(130, '2024-09-21', 'LTCUSDT', 67.35000000, 67.37000000, 64.83000000, 65.31000000, 67.35000000, 0, 1),
(131, '2024-09-21', 'PAXGUSDT', 2618.00000000, 2632.00000000, 2613.00000000, 2620.00000000, 2618.00000000, 0, 1),
(132, '2024-09-21', 'RUNEUSDC', 4.62900000, 4.70300000, 4.39900000, 4.44500000, 4.62900000, 0, 1),
(133, '2024-09-21', 'SHIBUSDC', 0.00001475, 0.00001507, 0.00001412, 0.00001425, 0.00001475, 0, 1),
(134, '2024-09-21', 'DOGEUSDC', 0.10808000, 0.11040000, 0.10431000, 0.10480000, 0.10808000, 0, 1),
(135, '2024-09-22', 'BTCUSDT', 64367.80000000, 64681.99000000, 62390.01000000, 63106.00000000, 64367.80000000, 0, 1),
(136, '2024-09-22', 'BNBUSDT', 596.90000000, 599.40000000, 576.70000000, 584.00000000, 596.90000000, 0, 1),
(137, '2024-09-22', 'ETHUSDT', 2677.02000000, 2685.28000000, 2526.69000000, 2594.72000000, 2677.02000000, 0, 1),
(138, '2024-09-22', 'ATOMUSDT', 4.67000000, 4.71900000, 4.48500000, 4.65000000, 4.67000000, 1, 0),
(139, '2024-09-22', 'NEARUSDT', 4.72300000, 4.74500000, 4.38500000, 4.60800000, 4.72300000, 0, 1),
(140, '2024-09-22', 'INJUSDT', 21.74000000, 22.13000000, 20.64000000, 21.15000000, 21.74000000, 0, 1),
(141, '2024-09-22', 'LTCUSDT', 68.70000000, 69.30000000, 66.51000000, 67.35000000, 68.70000000, 0, 1),
(142, '2024-09-22', 'PAXGUSDT', 2630.00000000, 2634.00000000, 2611.00000000, 2618.00000000, 2630.00000000, 0, 1),
(143, '2024-09-22', 'RUNEUSDC', 4.71000000, 4.73500000, 4.38400000, 4.62900000, 4.71000000, 0, 1),
(144, '2024-09-22', 'SHIBUSDC', 0.00001476, 0.00001485, 0.00001416, 0.00001475, 0.00001476, 1, 0),
(145, '2024-09-22', 'DOGEUSDC', 0.10817000, 0.10911000, 0.10381000, 0.10808000, 0.10817000, 1, 0),
(146, '2024-09-23', 'BNBUSDT', 606.50000000, 615.80000000, 588.50000000, 596.90000000, 606.50000000, 0, 1),
(147, '2024-09-23', 'ETHUSDT', 2627.40000000, 2698.99000000, 2609.43000000, 2677.02000000, 2627.40000000, 0, 1),
(148, '2024-09-23', 'BTCUSDT', 63127.99000000, 64455.13000000, 62748.00000000, 64367.80000000, 63127.99000000, 1, 0),
(149, '2024-09-23', 'ATOMUSDT', 4.55700000, 4.68700000, 4.49700000, 4.67000000, 4.55700000, 1, 0),
(150, '2024-09-23', 'NEARUSDT', 5.24900000, 5.26900000, 4.64100000, 4.72300000, 5.24900000, 0, 1),
(151, '2024-09-23', 'INJUSDT', 22.28000000, 22.59000000, 21.50000000, 21.74000000, 22.28000000, 0, 1),
(153, '2024-09-23', 'PAXGUSDT', 2631.00000000, 2632.00000000, 2615.00000000, 2630.00000000, 2631.00000000, 1, 0),
(154, '2024-09-23', 'RUNEUSDC', 4.60100000, 4.80000000, 4.52300000, 4.71000000, 4.60100000, 0, 1),
(155, '2024-09-23', 'SHIBUSDC', 0.00001446, 0.00001480, 0.00001427, 0.00001476, 0.00001446, 1, 0),
(156, '2024-09-23', 'DOGEUSDC', 0.10818000, 0.10883000, 0.10609000, 0.10817000, 0.10818000, 1, 0),
(157, '2024-09-23', 'LTCUSDT', 66.61000000, 67.99000000, 66.25000000, 68.70000000, 66.61000000, 1, 0),
(158, '2024-09-24', 'INJUSDT', 21.83000000, 22.76000000, 21.47000000, 22.28000000, 21.83000000, 0, 1),
(159, '2024-09-24', 'BTCUSDT', 64461.94000000, 64763.99000000, 62739.91000000, 63127.99000000, 64461.94000000, 0, 1),
(160, '2024-09-24', 'PAXGUSDT', 2658.00000000, 2665.00000000, 2626.00000000, 2631.00000000, 2658.00000000, 0, 1),
(161, '2024-09-24', 'RUNEUSDC', 5.08100000, 5.09100000, 4.54600000, 4.60100000, 5.08100000, 0, 1),
(162, '2024-09-24', 'BNBUSDT', 607.10000000, 613.00000000, 599.70000000, 606.50000000, 607.10000000, 1, 0),
(163, '2024-09-24', 'ETHUSDT', 2646.89000000, 2670.41000000, 2591.87000000, 2627.40000000, 2646.89000000, 1, 0),
(164, '2024-09-24', 'ATOMUSDT', 4.96800000, 4.96800000, 4.51300000, 4.55700000, 4.96800000, 0, 1),
(165, '2024-09-24', 'NEARUSDT', 5.35300000, 5.45500000, 5.08900000, 5.24900000, 5.35300000, 0, 1),
(166, '2024-09-24', 'SHIBUSDC', 0.00001501, 0.00001505, 0.00001434, 0.00001446, 0.00001501, 0, 1),
(167, '2024-09-24', 'DOGEUSDC', 0.11057000, 0.11091000, 0.10694000, 0.10818000, 0.11057000, 0, 1),
(168, '2024-09-24', 'LTCUSDT', 66.99000000, 67.15000000, 65.75000000, 66.61000000, 66.99000000, 1, 0),
(169, '2024-09-25', 'INJUSDT', 22.76000000, 23.18000000, 21.23000000, 21.83000000, 22.76000000, 0, 1),
(170, '2024-09-25', 'BTCUSDT', 63491.99000000, 64458.00000000, 62689.99000000, 64461.94000000, 63491.99000000, 1, 0),
(171, '2024-09-25', 'BNBUSDT', 587.80000000, 607.10000000, 580.90000000, 607.10000000, 587.80000000, 1, 0),
(172, '2024-09-25', 'ETHUSDT', 2601.63000000, 2646.86000000, 2557.51000000, 2646.89000000, 2601.63000000, 1, 0),
(173, '2024-09-25', 'ATOMUSDT', 4.82900000, 4.96400000, 4.70200000, 4.96800000, 4.82900000, 1, 0),
(174, '2024-09-25', 'NEARUSDT', 5.27800000, 5.37000000, 5.11200000, 5.35300000, 5.27800000, 1, 0),
(175, '2024-09-25', 'LTCUSDT', 66.43000000, 67.84000000, 65.64000000, 66.99000000, 66.43000000, 0, 1),
(176, '2024-09-25', 'PAXGUSDT', 2659.00000000, 2666.00000000, 2648.00000000, 2658.00000000, 2659.00000000, 0, 1),
(177, '2024-09-25', 'RUNEUSDC', 5.10500000, 5.14100000, 4.90600000, 5.08100000, 5.10500000, 0, 1),
(178, '2024-09-25', 'SHIBUSDC', 0.00001559, 0.00001574, 0.00001474, 0.00001501, 0.00001559, 0, 1),
(179, '2024-09-25', 'DOGEUSDC', 0.10894000, 0.11072000, 0.10700000, 0.11057000, 0.10894000, 1, 0),
(180, '2024-09-26', 'NEARUSDT', 5.83000000, 5.84900000, 5.24500000, 5.27800000, 5.83000000, 0, 1),
(181, '2024-09-26', 'BTCUSDT', 65244.88000000, 65461.75000000, 63353.77000000, 63491.99000000, 65244.88000000, 0, 1),
(182, '2024-09-26', 'BNBUSDT', 605.10000000, 605.10000000, 587.40000000, 587.80000000, 605.10000000, 1, 0),
(183, '2024-09-26', 'ETHUSDT', 2643.73000000, 2658.00000000, 2593.40000000, 2601.63000000, 2643.73000000, 0, 1),
(184, '2024-09-26', 'ATOMUSDT', 5.07800000, 5.07800000, 4.80300000, 4.82900000, 5.07800000, 0, 1),
(185, '2024-09-26', 'INJUSDT', 23.39000000, 23.75000000, 22.73000000, 22.76000000, 23.39000000, 0, 1),
(186, '2024-09-26', 'LTCUSDT', 68.40000000, 68.40000000, 66.47000000, 66.43000000, 68.40000000, 0, 1),
(187, '2024-09-26', 'PAXGUSDT', 2658.00000000, 2677.00000000, 2653.00000000, 2659.00000000, 2658.00000000, 0, 1),
(188, '2024-09-26', 'RUNEUSDC', 5.61500000, 5.69800000, 5.08700000, 5.10500000, 5.61500000, 0, 1),
(189, '2024-09-26', 'SHIBUSDC', 0.00001795, 0.00001819, 0.00001544, 0.00001559, 0.00001795, 0, 1),
(190, '2024-09-26', 'DOGEUSDC', 0.11786000, 0.11850000, 0.10856000, 0.10894000, 0.11786000, 0, 1),
(191, '2024-09-27', 'BTCUSDT', 66052.62000000, 66225.44000000, 65683.02000000, 65244.88000000, 66052.62000000, 0, 1),
(192, '2024-09-27', 'BNBUSDT', 612.10000000, 616.10000000, 605.50000000, 605.10000000, 612.10000000, 0, 1),
(193, '2024-09-27', 'ETHUSDT', 2690.26000000, 2703.07000000, 2690.01000000, 2643.73000000, 2690.26000000, 0, 1),
(194, '2024-09-27', 'ATOMUSDT', 5.13700000, 5.16200000, 5.10500000, 5.07800000, 5.13700000, 0, 1),
(195, '2024-09-27', 'NEARUSDT', 5.50300000, 5.52900000, 5.43600000, 5.83000000, 5.50300000, 1, 0),
(196, '2024-09-27', 'INJUSDT', 23.90000000, 23.96000000, 23.53000000, 23.39000000, 23.90000000, 0, 1),
(197, '2024-09-27', 'LTCUSDT', 71.32000000, 71.44000000, 70.90000000, 68.40000000, 71.32000000, 0, 1),
(198, '2024-09-27', 'PAXGUSDT', 2652.00000000, 2657.00000000, 2650.00000000, 2658.00000000, 2652.00000000, 1, 0),
(199, '2024-09-27', 'RUNEUSDC', 5.40300000, 5.45500000, 5.36300000, 5.61500000, 5.40300000, 1, 0),
(200, '2024-09-27', 'SHIBUSDC', 0.00002103, 0.00002141, 0.00002019, 0.00001795, 0.00002103, 0, 1),
(201, '2024-09-27', 'DOGEUSDC', 0.12610000, 0.12665000, 0.12357000, 0.11786000, 0.12610000, 0, 1),
(202, '2024-09-28', 'ATOMUSDT', 5.04900000, 5.13300000, 4.93800000, 5.13700000, 5.04900000, 1, 0),
(203, '2024-09-28', 'NEARUSDT', 5.49200000, 5.57600000, 5.34700000, 5.50300000, 5.49200000, 0, 1),
(204, '2024-09-28', 'INJUSDT', 22.86000000, 23.95000000, 22.58000000, 23.90000000, 22.86000000, 1, 0),
(205, '2024-09-28', 'BTCUSDT', 65816.39000000, 66082.00000000, 65444.00000000, 66052.62000000, 65816.39000000, 1, 0),
(206, '2024-09-28', 'BNBUSDT', 600.40000000, 612.60000000, 594.80000000, 612.10000000, 600.40000000, 1, 0),
(207, '2024-09-28', 'ETHUSDT', 2675.01000000, 2699.06000000, 2652.76000000, 2690.26000000, 2675.01000000, 1, 0),
(208, '2024-09-28', 'LTCUSDT', 69.58000000, 71.47000000, 69.03000000, 71.32000000, 69.58000000, 0, 1),
(209, '2024-09-28', 'PAXGUSDT', 2667.00000000, 2668.00000000, 2650.00000000, 2652.00000000, 2667.00000000, 0, 1),
(210, '2024-09-28', 'RUNEUSDC', 5.36900000, 5.48600000, 5.29300000, 5.40300000, 5.36900000, 0, 1),
(211, '2024-09-28', 'SHIBUSDC', 0.00002017, 0.00002106, 0.00001907, 0.00002103, 0.00002017, 1, 0),
(212, '2024-09-28', 'DOGEUSDC', 0.12959000, 0.13142000, 0.12041000, 0.12610000, 0.12959000, 0, 1),
(213, '2024-09-29', 'ETHUSDT', 2628.35000000, 2673.95000000, 2607.50000000, 2675.01000000, 2628.35000000, 1, 0),
(214, '2024-09-29', 'ATOMUSDT', 4.91900000, 5.11900000, 4.89600000, 5.04900000, 4.91900000, 1, 0),
(215, '2024-09-29', 'NEARUSDT', 5.34500000, 5.62300000, 5.29200000, 5.49200000, 5.34500000, 0, 1),
(216, '2024-09-29', 'INJUSDT', 22.85000000, 23.74000000, 22.25000000, 22.86000000, 22.85000000, 1, 0),
(217, '2024-09-29', 'BNBUSDT', 577.90000000, 600.90000000, 573.10000000, 600.40000000, 577.90000000, 1, 0),
(218, '2024-09-29', 'BTCUSDT', 64534.00000000, 65973.15000000, 64274.01000000, 65816.39000000, 64534.00000000, 1, 0),
(219, '2024-09-29', 'LTCUSDT', 67.82000000, 70.24000000, 67.69000000, 69.58000000, 67.82000000, 1, 0),
(220, '2024-09-29', 'PAXGUSDT', 2651.00000000, 2668.00000000, 2651.00000000, 2667.00000000, 2651.00000000, 1, 0),
(221, '2024-09-29', 'RUNEUSDC', 5.14300000, 5.14500000, 5.03700000, 5.36900000, 5.14300000, 1, 0),
(222, '2024-09-29', 'SHIBUSDC', 0.00001875, 0.00002009, 0.00001837, 0.00002017, 0.00001875, 1, 0),
(223, '2024-09-29', 'DOGEUSDC', 0.12236000, 0.12923000, 0.12096000, 0.12959000, 0.12236000, 1, 0),
(224, '2024-09-30', 'BNBUSDT', 577.00000000, 582.90000000, 564.50000000, 577.90000000, 577.00000000, 1, 0),
(225, '2024-09-30', 'ETHUSDT', 2630.84000000, 2642.87000000, 2580.99000000, 2628.35000000, 2630.84000000, 1, 0),
(226, '2024-09-30', 'ATOMUSDT', 4.84800000, 5.00300000, 4.69100000, 4.91900000, 4.84800000, 1, 0),
(227, '2024-09-30', 'NEARUSDT', 5.39800000, 5.46700000, 5.23600000, 5.34500000, 5.39800000, 1, 0),
(228, '2024-09-30', 'INJUSDT', 24.87000000, 24.88000000, 22.58000000, 22.85000000, 24.87000000, 0, 1),
(229, '2024-09-30', 'BTCUSDT', 63743.99000000, 64683.64000000, 62947.99000000, 64534.00000000, 63743.99000000, 1, 0),
(230, '2024-09-30', 'LTCUSDT', 67.93000000, 68.35000000, 66.38000000, 67.82000000, 67.93000000, 1, 0),
(231, '2024-09-30', 'PAXGUSDT', 2640.00000000, 2653.00000000, 2626.00000000, 2651.00000000, 2640.00000000, 1, 0),
(232, '2024-09-30', 'RUNEUSDC', 5.18400000, 5.29200000, 5.01500000, 5.14300000, 5.18400000, 0, 1),
(233, '2024-09-30', 'SHIBUSDC', 0.00001830, 0.00001888, 0.00001747, 0.00001875, 0.00001830, 1, 0),
(234, '2024-09-30', 'DOGEUSDC', 0.11770000, 0.12354000, 0.11342000, 0.12236000, 0.11770000, 1, 0),
(235, '2024-10-01', 'NEARUSDT', 4.93000000, 5.56200000, 4.71800000, 5.39800000, 4.93000000, 1, 0),
(236, '2024-10-01', 'BTCUSDT', 61772.01000000, 64112.00000000, 60444.51000000, 63743.99000000, 61772.01000000, 1, 0),
(237, '2024-10-01', 'BNBUSDT', 554.50000000, 582.50000000, 540.50000000, 577.00000000, 554.50000000, 1, 0),
(238, '2024-10-01', 'ETHUSDT', 2490.28000000, 2655.95000000, 2437.06000000, 2630.84000000, 2490.28000000, 1, 0),
(239, '2024-10-01', 'ATOMUSDT', 4.51200000, 4.90200000, 4.31600000, 4.84800000, 4.51200000, 1, 0),
(240, '2024-10-01', 'INJUSDT', 21.10000000, 24.75000000, 20.41000000, 24.87000000, 21.10000000, 1, 0),
(241, '2024-10-01', 'LTCUSDT', 64.31000000, 68.52000000, 62.61000000, 67.93000000, 64.31000000, 1, 0),
(242, '2024-10-01', 'PAXGUSDT', 2669.00000000, 2697.00000000, 2641.00000000, 2640.00000000, 2669.00000000, 1, 0),
(243, '2024-10-01', 'RUNEUSDC', 4.74400000, 5.34900000, 4.53000000, 5.18400000, 4.74400000, 1, 0),
(244, '2024-10-01', 'SHIBUSDC', 0.00001697, 0.00001861, 0.00001590, 0.00001830, 0.00001697, 1, 0),
(245, '2024-10-01', 'DOGEUSDC', 0.10833000, 0.11917000, 0.10360000, 0.11770000, 0.10833000, 1, 0),
(246, '2024-10-02', 'BNBUSDT', 549.90000000, 557.90000000, 536.60000000, 554.50000000, 549.90000000, 1, 0),
(247, '2024-10-02', 'ETHUSDT', 2399.44000000, 2491.35000000, 2354.13000000, 2490.28000000, 2399.44000000, 1, 0),
(248, '2024-10-02', 'ATOMUSDT', 4.48500000, 4.57600000, 4.35200000, 4.51200000, 4.48500000, 1, 0),
(249, '2024-10-02', 'NEARUSDT', 4.76500000, 4.99700000, 4.54400000, 4.93000000, 4.76500000, 1, 0),
(250, '2024-10-02', 'INJUSDT', 20.50000000, 22.38000000, 19.85000000, 21.10000000, 20.50000000, 1, 0),
(251, '2024-10-02', 'BTCUSDT', 61463.98000000, 62274.00000000, 60092.95000000, 61772.01000000, 61463.98000000, 1, 0),
(252, '2024-10-02', 'LTCUSDT', 63.97000000, 64.70000000, 62.27000000, 64.31000000, 63.97000000, 1, 0),
(253, '2024-10-02', 'PAXGUSDT', 2666.00000000, 2675.00000000, 2653.00000000, 2669.00000000, 2666.00000000, 1, 0),
(254, '2024-10-02', 'RUNEUSDC', 4.68800000, 4.90000000, 4.52600000, 4.74400000, 4.68800000, 1, 0),
(255, '2024-10-02', 'SHIBUSDC', 0.00001670, 0.00001705, 0.00001607, 0.00001697, 0.00001670, 1, 0),
(256, '2024-10-02', 'DOGEUSDC', 0.10599000, 0.10931000, 0.10269000, 0.10833000, 0.10599000, 1, 0),
(257, '2024-10-03', 'BTCUSDT', 60934.96000000, 61256.46000000, 60086.00000000, 61463.98000000, 60934.96000000, 1, 0),
(258, '2024-10-03', 'BNBUSDT', 546.40000000, 549.20000000, 535.50000000, 549.90000000, 546.40000000, 1, 0),
(259, '2024-10-03', 'ETHUSDT', 2366.30000000, 2378.57000000, 2311.06000000, 2399.44000000, 2366.30000000, 1, 0),
(260, '2024-10-03', 'ATOMUSDT', 4.42600000, 4.45000000, 4.24200000, 4.48500000, 4.42600000, 1, 0),
(261, '2024-10-03', 'NEARUSDT', 4.66400000, 4.73900000, 4.48900000, 4.76500000, 4.66400000, 1, 0),
(262, '2024-10-03', 'INJUSDT', 19.16000000, 19.53000000, 18.65000000, 20.50000000, 19.16000000, 1, 0),
(263, '2024-10-03', 'LTCUSDT', 64.03000000, 64.43000000, 61.99000000, 63.97000000, 64.03000000, 1, 0),
(264, '2024-10-03', 'PAXGUSDT', 2670.00000000, 2672.00000000, 2653.00000000, 2666.00000000, 2670.00000000, 1, 0),
(265, '2024-10-03', 'RUNEUSDC', 4.52900000, 4.62000000, 4.44600000, 4.68800000, 4.52900000, 1, 0),
(266, '2024-10-03', 'SHIBUSDC', 0.00001644, 0.00001663, 0.00001552, 0.00001670, 0.00001644, 1, 0),
(267, '2024-10-03', 'DOGEUSDC', 0.10645000, 0.10673000, 0.10147000, 0.10599000, 0.10645000, 1, 0),
(268, '2024-10-04', 'INJUSDT', 19.98000000, 20.55000000, 19.17000000, 19.16000000, 19.98000000, 0, 1),
(269, '2024-10-04', 'BNBUSDT', 553.60000000, 557.50000000, 546.50000000, 546.40000000, 553.60000000, 0, 1),
(270, '2024-10-04', 'BTCUSDT', 61856.98000000, 62463.99000000, 60936.00000000, 60934.96000000, 61856.98000000, 0, 1),
(271, '2024-10-04', 'ETHUSDT', 2399.30000000, 2438.01000000, 2356.93000000, 2366.30000000, 2399.30000000, 0, 1),
(272, '2024-10-04', 'ATOMUSDT', 4.59400000, 4.66200000, 4.43400000, 4.42600000, 4.59400000, 0, 1),
(273, '2024-10-04', 'NEARUSDT', 4.72700000, 4.86000000, 4.65200000, 4.66400000, 4.72700000, 0, 1),
(274, '2024-10-04', 'LTCUSDT', 64.88000000, 65.44000000, 63.94000000, 64.03000000, 64.88000000, 0, 1),
(275, '2024-10-04', 'PAXGUSDT', 2657.00000000, 2674.00000000, 2653.00000000, 2670.00000000, 2657.00000000, 0, 1),
(276, '2024-10-04', 'RUNEUSDC', 4.77600000, 4.82700000, 4.52900000, 4.52900000, 4.77600000, 0, 1),
(277, '2024-10-04', 'SHIBUSDC', 0.00001728, 0.00001791, 0.00001646, 0.00001644, 0.00001728, 0, 1),
(278, '2024-10-04', 'DOGEUSDC', 0.10801000, 0.11055000, 0.10654000, 0.10645000, 0.10801000, 0, 1),
(279, '2024-10-05', 'BNBUSDT', 562.00000000, 565.90000000, 553.90000000, 553.60000000, 562.00000000, 0, 1),
(280, '2024-10-05', 'BTCUSDT', 61899.80000000, 62356.68000000, 61721.90000000, 61856.98000000, 61899.80000000, 1, 0),
(281, '2024-10-05', 'ETHUSDT', 2414.04000000, 2426.43000000, 2390.63000000, 2399.30000000, 2414.04000000, 1, 0),
(282, '2024-10-05', 'ATOMUSDT', 4.57000000, 4.71100000, 4.57000000, 4.59400000, 4.57000000, 0, 1),
(283, '2024-10-05', 'NEARUSDT', 4.74800000, 4.83400000, 4.63900000, 4.72700000, 4.74800000, 1, 0),
(284, '2024-10-05', 'INJUSDT', 19.73000000, 20.50000000, 19.58000000, 19.98000000, 19.73000000, 1, 0),
(285, '2024-10-05', 'LTCUSDT', 66.33000000, 66.64000000, 64.91000000, 64.88000000, 66.33000000, 0, 1),
(286, '2024-10-05', 'PAXGUSDT', 2681.00000000, 2697.00000000, 2655.00000000, 2657.00000000, 2681.00000000, 0, 1),
(287, '2024-10-05', 'RUNEUSDC', 4.81600000, 4.87300000, 4.70000000, 4.77600000, 4.81600000, 0, 1),
(288, '2024-10-05', 'SHIBUSDC', 0.00001720, 0.00001787, 0.00001693, 0.00001728, 0.00001720, 1, 0),
(289, '2024-10-05', 'DOGEUSDC', 0.10863000, 0.11002000, 0.10774000, 0.10801000, 0.10863000, 1, 0),
(290, '2024-10-06', 'BTCUSDT', 63529.98000000, 63931.66000000, 61835.99000000, 61899.80000000, 63529.98000000, 0, 1),
(291, '2024-10-06', 'BNBUSDT', 573.30000000, 577.10000000, 561.30000000, 562.00000000, 573.30000000, 0, 1),
(292, '2024-10-06', 'ETHUSDT', 2495.21000000, 2510.47000000, 2410.89000000, 2414.04000000, 2495.21000000, 0, 1),
(293, '2024-10-06', 'ATOMUSDT', 4.73200000, 4.78900000, 4.55500000, 4.57000000, 4.73200000, 0, 1),
(294, '2024-10-06', 'NEARUSDT', 5.20300000, 5.27600000, 4.72000000, 4.74800000, 5.20300000, 0, 1),
(295, '2024-10-06', 'INJUSDT', 21.16000000, 21.49000000, 19.69000000, 19.73000000, 21.16000000, 0, 1),
(296, '2024-10-06', 'LTCUSDT', 67.68000000, 67.93000000, 66.35000000, 66.33000000, 67.68000000, 0, 1),
(297, '2024-10-06', 'PAXGUSDT', 2678.00000000, 2691.00000000, 2674.00000000, 2681.00000000, 2678.00000000, 1, 0),
(298, '2024-10-06', 'RUNEUSDC', 4.99800000, 5.06600000, 4.79100000, 4.81600000, 4.99800000, 0, 1),
(299, '2024-10-06', 'SHIBUSDC', 0.00001849, 0.00001877, 0.00001713, 0.00001720, 0.00001849, 0, 1),
(300, '2024-10-06', 'DOGEUSDC', 0.11390000, 0.11543000, 0.10849000, 0.10863000, 0.11390000, 0, 1),
(301, '2024-10-07', 'BTCUSDT', 62597.24000000, 64378.00000000, 62215.22000000, 63529.98000000, 62597.24000000, 0, 1),
(302, '2024-10-07', 'BNBUSDT', 569.70000000, 581.10000000, 564.10000000, 573.30000000, 569.70000000, 0, 1),
(303, '2024-10-07', 'ETHUSDT', 2437.59000000, 2518.00000000, 2412.06000000, 2495.21000000, 2437.59000000, 0, 1),
(304, '2024-10-07', 'ATOMUSDT', 4.44300000, 4.73400000, 4.41500000, 4.73200000, 4.44300000, 1, 0),
(305, '2024-10-07', 'NEARUSDT', 5.12700000, 5.31200000, 5.01800000, 5.20300000, 5.12700000, 0, 1),
(306, '2024-10-07', 'INJUSDT', 20.74000000, 21.74000000, 20.37000000, 21.16000000, 20.74000000, 0, 1),
(307, '2024-10-07', 'LTCUSDT', 65.23000000, 67.79000000, 64.59000000, 67.68000000, 65.23000000, 1, 0),
(308, '2024-10-07', 'PAXGUSDT', 2657.00000000, 2679.00000000, 2656.00000000, 2678.00000000, 2657.00000000, 1, 0),
(309, '2024-10-07', 'RUNEUSDC', 5.09500000, 5.34000000, 4.99800000, 4.99800000, 5.09500000, 0, 1),
(310, '2024-10-07', 'SHIBUSDC', 0.00001753, 0.00001862, 0.00001741, 0.00001849, 0.00001753, 1, 0),
(311, '2024-10-07', 'DOGEUSDC', 0.10922000, 0.11452000, 0.10830000, 0.11390000, 0.10922000, 1, 0),
(312, '2024-10-08', 'ATOMUSDT', 4.34600000, 4.47000000, 4.32200000, 4.44300000, 4.34600000, 1, 0),
(313, '2024-10-08', 'NEARUSDT', 4.89100000, 5.14900000, 4.86200000, 5.12700000, 4.89100000, 1, 0),
(314, '2024-10-08', 'BTCUSDT', 62255.99000000, 62830.01000000, 61904.01000000, 62597.24000000, 62255.99000000, 1, 0),
(315, '2024-10-08', 'BNBUSDT', 575.30000000, 586.10000000, 560.90000000, 569.70000000, 575.30000000, 0, 1),
(316, '2024-10-08', 'ETHUSDT', 2445.20000000, 2468.01000000, 2409.21000000, 2437.59000000, 2445.20000000, 1, 0),
(317, '2024-10-08', 'INJUSDT', 19.72000000, 20.85000000, 19.25000000, 20.74000000, 19.72000000, 1, 0),
(318, '2024-10-08', 'LTCUSDT', 65.57000000, 66.15000000, 64.67000000, 65.23000000, 65.57000000, 1, 0),
(319, '2024-10-08', 'PAXGUSDT', 2628.00000000, 2668.00000000, 2617.00000000, 2657.00000000, 2628.00000000, 1, 0),
(320, '2024-10-08', 'RUNEUSDC', 4.97300000, 5.11200000, 4.86200000, 5.09500000, 4.97300000, 1, 0),
(321, '2024-10-08', 'SHIBUSDC', 0.00001737, 0.00001763, 0.00001703, 0.00001753, 0.00001737, 1, 0),
(322, '2024-10-08', 'DOGEUSDC', 0.10845000, 0.10969000, 0.10539000, 0.10922000, 0.10845000, 1, 0),
(323, '2024-10-09', 'NEARUSDT', 4.64800000, 4.96900000, 4.56100000, 4.89100000, 4.64800000, 1, 0),
(324, '2024-10-09', 'BTCUSDT', 60865.29000000, 62534.00000000, 60440.03000000, 62255.99000000, 60865.29000000, 1, 0),
(325, '2024-10-09', 'BNBUSDT', 569.70000000, 585.50000000, 567.50000000, 575.30000000, 569.70000000, 1, 0),
(326, '2024-10-09', 'ETHUSDT', 2395.30000000, 2465.80000000, 2361.10000000, 2445.20000000, 2395.30000000, 1, 0),
(327, '2024-10-09', 'ATOMUSDT', 4.26500000, 4.38800000, 4.18000000, 4.34600000, 4.26500000, 1, 0),
(328, '2024-10-09', 'INJUSDT', 19.51000000, 20.04000000, 19.12000000, 19.72000000, 19.51000000, 1, 0),
(329, '2024-10-09', 'LTCUSDT', 64.87000000, 65.94000000, 64.17000000, 65.57000000, 64.87000000, 1, 0),
(330, '2024-10-09', 'PAXGUSDT', 2626.00000000, 2643.00000000, 2618.00000000, 2628.00000000, 2626.00000000, 1, 0),
(331, '2024-10-09', 'RUNEUSDC', 4.65200000, 5.05700000, 4.55100000, 4.97300000, 4.65200000, 1, 0),
(332, '2024-10-09', 'SHIBUSDC', 0.00001712, 0.00001796, 0.00001676, 0.00001737, 0.00001712, 0, 1),
(333, '2024-10-09', 'DOGEUSDC', 0.10786000, 0.11129000, 0.10642000, 0.10845000, 0.10786000, 0, 1),
(334, '2024-10-10', 'NEARUSDT', 4.60900000, 4.67400000, 4.44000000, 4.64800000, 4.60900000, 1, 0),
(335, '2024-10-10', 'BTCUSDT', 60633.32000000, 61304.31000000, 59040.00000000, 60865.29000000, 60633.32000000, 1, 0),
(336, '2024-10-10', 'BNBUSDT', 564.20000000, 572.80000000, 552.50000000, 569.70000000, 564.20000000, 1, 0),
(337, '2024-10-10', 'ETHUSDT', 2410.15000000, 2418.07000000, 2335.86000000, 2395.30000000, 2410.15000000, 1, 0),
(338, '2024-10-10', 'ATOMUSDT', 4.17300000, 4.29300000, 4.05300000, 4.26500000, 4.17300000, 1, 0),
(339, '2024-10-10', 'INJUSDT', 19.28000000, 19.77000000, 18.62000000, 19.51000000, 19.28000000, 1, 0),
(340, '2024-10-10', 'LTCUSDT', 65.02000000, 65.16000000, 63.45000000, 64.87000000, 65.02000000, 1, 0),
(341, '2024-10-10', 'PAXGUSDT', 2655.00000000, 2657.00000000, 2623.00000000, 2626.00000000, 2655.00000000, 0, 1),
(342, '2024-10-10', 'RUNEUSDC', 4.76400000, 4.77900000, 4.56000000, 4.65200000, 4.76400000, 1, 0),
(343, '2024-10-10', 'SHIBUSDC', 0.00001681, 0.00001717, 0.00001608, 0.00001712, 0.00001681, 1, 0),
(344, '2024-10-10', 'DOGEUSDC', 0.10755000, 0.10853000, 0.10336000, 0.10786000, 0.10755000, 1, 0),
(345, '2024-10-11', 'NEARUSDT', 4.70000000, 4.80500000, 4.58600000, 4.60900000, 4.70000000, 0, 1),
(346, '2024-10-11', 'BTCUSDT', 62568.00000000, 63254.60000000, 60587.69000000, 60633.32000000, 62568.00000000, 0, 1),
(347, '2024-10-11', 'BNBUSDT', 576.70000000, 577.30000000, 560.30000000, 564.20000000, 576.70000000, 0, 1),
(348, '2024-10-11', 'ETHUSDT', 2439.04000000, 2464.69000000, 2403.86000000, 2410.15000000, 2439.04000000, 0, 1),
(349, '2024-10-11', 'ATOMUSDT', 4.29600000, 4.31700000, 4.16000000, 4.17300000, 4.29600000, 0, 1),
(350, '2024-10-11', 'INJUSDT', 20.43000000, 20.62000000, 19.17000000, 19.28000000, 20.43000000, 0, 1),
(351, '2024-10-11', 'RUNEUSDC', 4.90300000, 5.08200000, 4.72800000, 4.76400000, 4.90300000, 0, 1),
(352, '2024-10-11', 'LTCUSDT', 65.20000000, 65.83000000, 64.62000000, 65.02000000, 65.20000000, 0, 1),
(353, '2024-10-11', 'PAXGUSDT', 2666.00000000, 2675.00000000, 2653.00000000, 2655.00000000, 2666.00000000, 0, 1),
(354, '2024-10-11', 'SHIBUSDC', 0.00001767, 0.00001801, 0.00001671, 0.00001681, 0.00001767, 0, 1),
(355, '2024-10-11', 'DOGEUSDC', 0.10971000, 0.11151000, 0.10720000, 0.10755000, 0.10971000, 0, 1),
(356, '2024-10-12', 'BNBUSDT', 573.60000000, 578.90000000, 572.80000000, 576.70000000, 573.60000000, 0, 1),
(357, '2024-10-12', 'BTCUSDT', 62717.99000000, 63456.96000000, 62579.00000000, 62568.00000000, 62717.99000000, 0, 1),
(358, '2024-10-12', 'NEARUSDT', 4.75400000, 4.91200000, 4.70400000, 4.70000000, 4.75400000, 0, 1),
(359, '2024-10-12', 'ETHUSDT', 2458.68000000, 2488.88000000, 2439.20000000, 2439.04000000, 2458.68000000, 0, 1),
(360, '2024-10-12', 'ATOMUSDT', 4.32200000, 4.38900000, 4.28800000, 4.29600000, 4.32200000, 0, 1),
(361, '2024-10-12', 'INJUSDT', 20.25000000, 21.03000000, 20.18000000, 20.43000000, 20.25000000, 0, 1),
(362, '2024-10-12', 'RUNEUSDC', 4.96200000, 5.12100000, 4.90300000, 4.90300000, 4.96200000, 0, 1),
(363, '2024-10-12', 'LTCUSDT', 65.57000000, 66.65000000, 65.23000000, 65.20000000, 65.57000000, 0, 1),
(364, '2024-10-12', 'PAXGUSDT', 2663.00000000, 2671.00000000, 2657.00000000, 2666.00000000, 2663.00000000, 1, 0),
(365, '2024-10-12', 'SHIBUSDC', 0.00001761, 0.00001810, 0.00001757, 0.00001767, 0.00001761, 0, 1),
(366, '2024-10-12', 'DOGEUSDC', 0.11099000, 0.11212000, 0.10971000, 0.10971000, 0.11099000, 0, 1),
(367, '2024-10-13', 'BTCUSDT', 64271.85000000, 64306.02000000, 62321.94000000, 62717.99000000, 64271.85000000, 0, 1),
(368, '2024-10-13', 'BTCUSDT', 64271.85000000, 64306.02000000, 62321.94000000, 62717.99000000, 64271.85000000, 0, 1),
(369, '2024-10-13', 'BNBUSDT', 580.70000000, 580.80000000, 566.90000000, 573.60000000, 580.70000000, 0, 1),
(370, '2024-10-13', 'ETHUSDT', 2520.19000000, 2522.12000000, 2440.21000000, 2458.68000000, 2520.19000000, 0, 1),
(371, '2024-10-13', 'ATOMUSDT', 4.42500000, 4.43100000, 4.23500000, 4.32200000, 4.42500000, 0, 1),
(372, '2024-10-13', 'NEARUSDT', 4.82700000, 4.83600000, 4.56500000, 4.75400000, 4.82700000, 1, 0),
(373, '2024-10-13', 'INJUSDT', 21.12000000, 21.18000000, 19.66000000, 20.25000000, 21.12000000, 0, 1),
(374, '2024-10-13', 'LTCUSDT', 65.45000000, 65.55000000, 64.16000000, 65.57000000, 65.45000000, 1, 0),
(375, '2024-10-13', 'PAXGUSDT', 2671.00000000, 2674.00000000, 2660.00000000, 2663.00000000, 2671.00000000, 0, 1),
(376, '2024-10-13', 'PAXGUSDT', 2671.00000000, 2674.00000000, 2660.00000000, 2663.00000000, 2671.00000000, 0, 1),
(377, '2024-10-13', 'RUNEUSDC', 5.01600000, 5.01600000, 4.69800000, 4.96200000, 5.01600000, 1, 0),
(378, '2024-10-13', 'SHIBUSDC', 0.00001802, 0.00001804, 0.00001715, 0.00001761, 0.00001802, 1, 0),
(379, '2024-10-13', 'DOGEUSDC', 0.11280000, 0.11282000, 0.10898000, 0.11099000, 0.11280000, 0, 1),
(380, '2024-10-14', 'NEARUSDT', 4.91300000, 5.07600000, 4.74600000, 4.82700000, 4.91300000, 0, 1),
(381, '2024-10-14', 'BTCUSDT', 65338.00000000, 66450.01000000, 63830.00000000, 64271.85000000, 65338.00000000, 0, 1),
(382, '2024-10-14', 'BNBUSDT', 584.40000000, 592.20000000, 577.00000000, 580.70000000, 584.40000000, 0, 1),
(383, '2024-10-14', 'ETHUSDT', 2609.98000000, 2652.65000000, 2514.20000000, 2520.19000000, 2609.98000000, 0, 1),
(384, '2024-10-14', 'ATOMUSDT', 4.48000000, 4.54400000, 4.38800000, 4.42500000, 4.48000000, 0, 1),
(385, '2024-10-14', 'INJUSDT', 21.35000000, 21.98000000, 20.68000000, 21.12000000, 21.35000000, 0, 1),
(386, '2024-10-14', 'RUNEUSDC', 5.23900000, 5.38300000, 4.95700000, 5.01600000, 5.23900000, 0, 1),
(387, '2024-10-14', 'LTCUSDT', 66.80000000, 67.81000000, 65.23000000, 65.45000000, 66.80000000, 0, 1),
(388, '2024-10-14', 'PAXGUSDT', 2656.00000000, 2676.00000000, 2655.00000000, 2671.00000000, 2656.00000000, 0, 1),
(389, '2024-10-14', 'SHIBUSDC', 0.00001839, 0.00001896, 0.00001773, 0.00001802, 0.00001839, 0, 1),
(390, '2024-10-14', 'DOGEUSDC', 0.11620000, 0.11894000, 0.11127000, 0.11280000, 0.11620000, 0, 1),
(391, '2024-10-15', 'BTCUSDT', 67112.51000000, 67785.81000000, 64997.50000000, 65338.00000000, 67112.51000000, 0, 1),
(392, '2024-10-15', 'BNBUSDT', 594.10000000, 599.50000000, 579.40000000, 584.40000000, 594.10000000, 0, 1),
(393, '2024-10-15', 'ETHUSDT', 2618.06000000, 2683.04000000, 2543.78000000, 2609.98000000, 2618.06000000, 0, 1),
(394, '2024-10-15', 'ATOMUSDT', 4.46900000, 4.58400000, 4.38500000, 4.48000000, 4.46900000, 0, 1),
(395, '2024-10-15', 'NEARUSDT', 5.00700000, 5.27100000, 4.88900000, 4.91300000, 5.00700000, 0, 1),
(396, '2024-10-15', 'INJUSDT', 21.09000000, 22.27000000, 20.77000000, 21.35000000, 21.09000000, 0, 1),
(397, '2024-10-15', 'RUNEUSDC', 5.20000000, 5.38900000, 4.98200000, 5.23900000, 5.20000000, 0, 1),
(398, '2024-10-15', 'LTCUSDT', 71.58000000, 72.96000000, 65.57000000, 66.80000000, 71.58000000, 0, 1),
(399, '2024-10-15', 'PAXGUSDT', 2675.00000000, 2680.00000000, 2651.00000000, 2656.00000000, 2675.00000000, 0, 1),
(400, '2024-10-15', 'SHIBUSDC', 0.00001822, 0.00001876, 0.00001755, 0.00001839, 0.00001822, 1, 0),
(401, '2024-10-15', 'DOGEUSDC', 0.11650000, 0.11818000, 0.11059000, 0.11620000, 0.11650000, 1, 0),
(402, '2024-10-16', 'BTCUSDT', 67609.71000000, 68347.67000000, 66776.01000000, 67112.51000000, 67609.71000000, 0, 1),
(403, '2024-10-16', 'BNBUSDT', 604.10000000, 606.30000000, 589.80000000, 594.10000000, 604.10000000, 0, 1),
(404, '2024-10-16', 'ETHUSDT', 2640.10000000, 2645.37000000, 2593.53000000, 2618.06000000, 2640.10000000, 1, 0),
(405, '2024-10-16', 'ATOMUSDT', 4.44600000, 4.50200000, 4.38900000, 4.46900000, 4.44600000, 1, 0),
(406, '2024-10-16', 'NEARUSDT', 4.99200000, 5.05800000, 4.88800000, 5.00700000, 4.99200000, 1, 0),
(407, '2024-10-16', 'INJUSDT', 21.03000000, 21.32000000, 20.58000000, 21.09000000, 21.03000000, 1, 0),
(408, '2024-10-16', 'RUNEUSDC', 5.10800000, 5.27900000, 5.05800000, 5.20000000, 5.10800000, 1, 0),
(409, '2024-10-16', 'LTCUSDT', 70.80000000, 72.05000000, 69.41000000, 71.58000000, 70.80000000, 1, 0),
(410, '2024-10-16', 'PAXGUSDT', 2684.00000000, 2690.00000000, 2674.00000000, 2675.00000000, 2684.00000000, 0, 1),
(411, '2024-10-16', 'SHIBUSDC', 0.00001844, 0.00001911, 0.00001790, 0.00001822, 0.00001844, 0, 1),
(412, '2024-10-16', 'DOGEUSDC', 0.12526000, 0.12965000, 0.11633000, 0.11650000, 0.12526000, 0, 1),
(413, '2024-10-17', 'BTCUSDT', 67602.33000000, 68167.70000000, 66683.42000000, 67609.71000000, 67602.33000000, 1, 0),
(414, '2024-10-17', 'BNBUSDT', 594.30000000, 605.30000000, 585.70000000, 604.10000000, 594.30000000, 1, 0),
(415, '2024-10-17', 'ETHUSDT', 2611.65000000, 2650.97000000, 2578.73000000, 2640.10000000, 2611.65000000, 0, 1),
(416, '2024-10-17', 'ATOMUSDT', 4.32400000, 4.44800000, 4.24100000, 4.44600000, 4.32400000, 1, 0),
(417, '2024-10-17', 'NEARUSDT', 4.78800000, 4.99500000, 4.65600000, 4.99200000, 4.78800000, 1, 0),
(418, '2024-10-17', 'INJUSDT', 21.17000000, 23.28000000, 20.36000000, 21.03000000, 21.17000000, 0, 1),
(419, '2024-10-17', 'RUNEUSDC', 4.89300000, 5.11100000, 4.70400000, 5.10800000, 4.89300000, 1, 0),
(420, '2024-10-17', 'LTCUSDT', 72.94000000, 74.73000000, 70.36000000, 70.80000000, 72.94000000, 0, 1),
(421, '2024-10-17', 'PAXGUSDT', 2715.00000000, 2717.00000000, 2684.00000000, 2684.00000000, 2715.00000000, 0, 1),
(422, '2024-10-17', 'SHIBUSDC', 0.00001869, 0.00001923, 0.00001760, 0.00001844, 0.00001869, 0, 1),
(423, '2024-10-17', 'DOGEUSDC', 0.13249000, 0.13613000, 0.12060000, 0.12526000, 0.13249000, 0, 1),
(424, '2024-10-18', 'BTCUSDT', 68458.02000000, 68836.35000000, 67569.67000000, 67602.33000000, 68458.02000000, 0, 1),
(425, '2024-10-18', 'BNBUSDT', 598.80000000, 601.60000000, 594.00000000, 594.30000000, 598.80000000, 1, 0),
(426, '2024-10-18', 'ETHUSDT', 2633.89000000, 2661.79000000, 2610.64000000, 2611.65000000, 2633.89000000, 0, 1),
(427, '2024-10-18', 'ATOMUSDT', 4.35700000, 4.38900000, 4.31500000, 4.32400000, 4.35700000, 1, 0),
(428, '2024-10-18', 'NEARUSDT', 4.84100000, 4.88300000, 4.74100000, 4.78800000, 4.84100000, 1, 0),
(429, '2024-10-18', 'INJUSDT', 21.89000000, 22.31000000, 21.19000000, 21.17000000, 21.89000000, 1, 0),
(430, '2024-10-18', 'RUNEUSDC', 4.93000000, 4.97600000, 4.83800000, 4.89300000, 4.93000000, 1, 0),
(431, '2024-10-18', 'LTCUSDT', 72.98000000, 73.34000000, 71.91000000, 72.94000000, 72.98000000, 1, 0),
(432, '2024-10-18', 'PAXGUSDT', 2728.00000000, 2729.00000000, 2707.00000000, 2715.00000000, 2728.00000000, 0, 1),
(433, '2024-10-18', 'SHIBUSDC', 0.00001878, 0.00001898, 0.00001848, 0.00001869, 0.00001878, 1, 0),
(434, '2024-10-18', 'DOGEUSDC', 0.13643000, 0.13810000, 0.13152000, 0.13249000, 0.13643000, 0, 1);

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
  `AUTOSELL` int(11) NOT NULL DEFAULT 0,
  `AUTOSTOP` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `trader`
--

INSERT INTO `trader` (`ID`, `USUARIO`, `FECHA`, `TIPO`, `MONEDA`, `ORDERID`, `ORDERVENTA`, `COMPRA`, `CANTIDAD`, `PRECIOCOMPRA`, `VENTA`, `GANANCIA`, `PRECIOVENTA`, `PORCENVENTA`, `MARGEN`, `ESCALON`, `LIQUIDAR`, `ACTIVO`, `ELIMINADO`, `XGANANCIA`, `NEGATIVO`, `AUTOSELL`, `AUTOSTOP`) VALUES
(23, 'dd77b701661c5b55', '2024-10-16 18:27:42', 'BUY', 'NEARUSDT', '3176921067', '8cd1b458b2', 10.13000000, 2.00000000, 4.91200000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 0.00000000, 0, 1, 0);

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `parametros`
--
ALTER TABLE `parametros`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `prices`
--
ALTER TABLE `prices`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=435;

--
-- AUTO_INCREMENT de la tabla `trader`
--
ALTER TABLE `trader`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
