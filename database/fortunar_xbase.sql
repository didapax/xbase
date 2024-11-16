-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-11-2024 a las 15:56:27
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

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
(1, 'BTCUSDT', 'BTC', 'USDT', 0.00000000, 60000.00000000, 18987.00000000, 0, 0.00000, '{\"par\":\"USDT\",\"asset\":\"BTC\",\"price\":\"90969.69\",\"btc\":\"90969.69\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:360deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"BTCUSDT\",\"tendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"91685.20\",\"mindia\":\"90640.01\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"techo\":\"69373.926333333333\",\"piso\":\"67012.887333333333\",\"ant\":\"91821.99000000\",\"porcenmax\":\"32%\",\"totalpromedio\":68193.40683333334,\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"1\",\"alert\":\"black\",\"labelpricebitcoin\":\"90969.69\",\"labelpricemoneda\":\"90969.69\"}', 2, 0.0000100000, 0.0000100000),
(6, 'BNBUSDT', 'BNB', 'USDT', 0.00120338, 600.00000000, 260.00000000, 0, 348.90000, '{\"par\":\"USDT\",\"asset\":\"BNB\",\"price\":\"628.49\",\"btc\":\"90969.69\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:360deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"BNBUSDT\",\"tendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"633.39\",\"mindia\":\"621.31\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"techo\":\"597.942033898305\",\"piso\":\"577.081355932203\",\"ant\":\"625.58000000\",\"porcenmax\":\"59%\",\"totalpromedio\":587.511694915254,\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"6\",\"alert\":\"olive\",\"labelpricebitcoin\":\"90969.69\",\"labelpricemoneda\":\"628.49\"}', 2, 0.0010000000, 0.0010000000),
(7, 'ETHUSDT', 'ETH', 'USDT', 0.00000000, 3000.00000000, 1484.00000000, 0, 1266.00000, '{\"par\":\"USDT\",\"asset\":\"ETH\",\"price\":\"3168.94\",\"btc\":\"90969.69\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:360deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"ETHUSDT\",\"tendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"3212.51\",\"mindia\":\"3103.63\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"techo\":\"2693.006610169492\",\"piso\":\"2580.747796610169\",\"ant\":\"3149.22000000\",\"porcenmax\":\"60%\",\"totalpromedio\":2636.8772033898304,\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"7\",\"alert\":\"olive\",\"labelpricebitcoin\":\"90969.69\",\"labelpricemoneda\":\"3168.94\"}', 2, 0.0001000000, 0.0001000000),
(9, 'ATOMUSDT', 'ATOM', 'USDT', 0.00000000, 17.00000000, 9.00000000, 0, 14.15600, '{\"par\":\"USDT\",\"asset\":\"ATOM\",\"price\":\"5.626\",\"btc\":\"90969.69\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:360deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"ATOMUSDT\",\"tendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"5.655\",\"mindia\":\"5.254\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"techo\":\"4.752116666667\",\"piso\":\"4.485050000000\",\"ant\":\"5.35400000\",\"porcenmax\":\"93%\",\"totalpromedio\":4.6185833333335005,\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"9\",\"alert\":\"green\",\"labelpricebitcoin\":\"90969.69\",\"labelpricemoneda\":\"5.626\"}', 3, 0.0100000000, 0.0100000000),
(15, 'NEARUSDT', 'NEAR', 'USDT', 0.00000000, 0.00000000, 0.00000000, 0, 2.04000, '{\"par\":\"USDT\",\"asset\":\"NEAR\",\"price\":\"5.963\",\"btc\":\"90969.69\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:360deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"NEARUSDT\",\"tendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"6.376\",\"mindia\":\"5.954\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"techo\":\"4.967491525424\",\"piso\":\"4.609067796610\",\"ant\":\"6.15500000\",\"porcenmax\":\"2%\",\"totalpromedio\":4.788279661017,\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"15\",\"alert\":\"olive\",\"labelpricebitcoin\":\"90969.69\",\"labelpricemoneda\":\"5.963\"}', 3, 0.1000000000, 0.1000000000),
(16, 'INJUSDT', 'INJ', 'USDT', 0.00000000, 0.00000000, 0.00000000, 0, 2.50400, '{\"par\":\"USDT\",\"asset\":\"INJ\",\"price\":\"25.46\",\"btc\":\"90969.69\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:360deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"INJUSDT\",\"tendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"25.95\",\"mindia\":\"24.62\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"techo\":\"22.089833333333\",\"piso\":\"20.491333333333\",\"ant\":\"25.05000000\",\"porcenmax\":\"63%\",\"totalpromedio\":21.290583333333,\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"16\",\"alert\":\"olive\",\"labelpricebitcoin\":\"90969.69\",\"labelpricemoneda\":\"25.46\"}', 2, 0.0100000000, 0.0100000000),
(17, 'LTCUSDT', 'LTC', 'USDT', 0.00000000, 0.00000000, 0.00000000, 0, 0.00000, '{\"par\":\"USDT\",\"asset\":\"LTC\",\"price\":\"92.54\",\"btc\":\"90969.69\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:360deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"LTCUSDT\",\"tendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"92.84\",\"mindia\":\"83.41\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"techo\":\"71.185254237288\",\"piso\":\"68.002033898305\",\"ant\":\"87.04000000\",\"porcenmax\":\"97%\",\"totalpromedio\":69.5936440677965,\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"17\",\"alert\":\"green\",\"labelpricebitcoin\":\"90969.69\",\"labelpricemoneda\":\"92.54\"}', 2, 0.0010000000, 0.0010000000),
(18, 'PAXGUSDT', 'PAXG', 'USDT', 0.00000000, 0.00000000, 0.00000000, 0, 1748.00000, '{\"par\":\"USDT\",\"asset\":\"PAXG\",\"price\":\"2565\",\"btc\":\"90969.69\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:360deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"PAXGUSDT\",\"tendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"color\":\"#F37A8B\",\"maxdia\":\"2579\",\"mindia\":\"2560\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"techo\":\"2681.400000000000\",\"piso\":\"2652.983333333333\",\"ant\":\"2580.00000000\",\"porcenmax\":\"26%\",\"totalpromedio\":2667.1916666666666,\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"18\",\"alert\":\"olive\",\"labelpricebitcoin\":\"90969.69\",\"labelpricemoneda\":\"2565\"}', 0, 0.0001000000, 0.0001000000),
(19, 'RUNEUSDT', 'RUNE', 'USDT', 0.00000000, 0.00000000, 0.00000000, 1, 0.00000, '{\"par\":\"USDT\",\"asset\":\"RUNE\",\"price\":\"5.646\",\"btc\":\"90969.69\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:356.4deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"RUNEUSDT\",\"tendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"5.792\",\"mindia\":\"5.578\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"techo\":\"5.287101694915\",\"piso\":\"4.904271186441\",\"ant\":\"5.67500000\",\"porcenmax\":\"32%\",\"totalpromedio\":5.095686440678,\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"19\",\"alert\":\"olive\",\"labelpricebitcoin\":\"90969.69\",\"labelpricemoneda\":\"5.646\"}', 3, 0.1000000000, 0.1000000000),
(20, 'SHIBUSDT', 'SHIB', 'USDC', 0.00000000, 0.00000000, 0.00000000, 0, 0.00000, '{\"par\":\"USDC\",\"asset\":\"SHIB\",\"price\":null,\"btc\":\"90969.69\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:0deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"SHIBUSDT\",\"tendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"color\":\"#F37A8B\",\"maxdia\":null,\"mindia\":null,\"totalTendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"techo\":\"0.000019016610\",\"piso\":\"0.000017500000\",\"ant\":\"0.00002596\",\"porcenmax\":\"0%\",\"totalpromedio\":1.8258305e-5,\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"20\",\"alert\":\"black\",\"labelpricebitcoin\":\"90969.69\",\"labelpricemoneda\":null}', 8, 1.0000000000, 1.0000000000),
(21, 'DOGEUSDT', 'DOGE', 'USDC', 0.00000000, 0.00000000, 0.00000000, 0, 0.00000, '{\"par\":\"USDC\",\"asset\":\"DOGE\",\"price\":null,\"btc\":\"90969.69\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:360deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"DOGEUSDT\",\"tendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"color\":\"#F37A8B\",\"maxdia\":null,\"mindia\":null,\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"techo\":\"0.164119491525\",\"piso\":\"0.148301186441\",\"ant\":\"0.38421000\",\"porcenmax\":\"0%\",\"totalpromedio\":0.156210338983,\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"21\",\"alert\":\"black\",\"labelpricebitcoin\":\"90969.69\",\"labelpricemoneda\":null}', 5, 1.0000000000, 1.0000000000),
(22, 'FETUSDT', 'FET', 'USDT', 0.00000000, 0.00000000, 0.00000000, 0, 0.00000, '{\"par\":\"USDT\",\"asset\":\"FET\",\"price\":\"1.302\",\"btc\":\"90969.69\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:356.4deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"FETUSDT\",\"tendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"color\":\"#F37A8B\",\"maxdia\":\"1.329\",\"mindia\":\"1.269\",\"totalTendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"techo\":\"1.394473684211\",\"piso\":\"1.277315789474\",\"ant\":\"1.32500000\",\"porcenmax\":\"55%\",\"totalpromedio\":1.3358947368425,\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"22\",\"alert\":\"olive\",\"labelpricebitcoin\":\"90969.69\",\"labelpricemoneda\":\"1.302\"}', 3, 0.1000000000, 0.1000000000),
(23, 'THETAUSDT', 'THETA', 'USDT', 0.00000000, 0.00000000, 0.00000000, 0, 0.00000, '{\"par\":\"USDT\",\"asset\":\"THETA\",\"price\":\"1.502\",\"btc\":\"90969.69\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:360deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"THETAUSDT\",\"tendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"1.520\",\"mindia\":\"1.383\",\"totalTendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"techo\":\"1.325947368421\",\"piso\":\"1.218473684211\",\"ant\":\"1.39900000\",\"porcenmax\":\"87%\",\"totalpromedio\":1.272210526316,\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"23\",\"alert\":\"black\",\"labelpricebitcoin\":\"90969.69\",\"labelpricemoneda\":\"1.502\"}', 3, 0.1000000000, 0.1000000000),
(24, 'HBARUSDT', 'HBAR', 'USDT', 0.00000000, 0.00000000, 0.00000000, 0, 0.00000, '{\"par\":\"USDT\",\"asset\":\"HBAR\",\"price\":\"0.09274\",\"btc\":\"90969.69\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:360deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"HBARUSDT\",\"tendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"0.09340\",\"mindia\":\"0.07657\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"techo\":\"0.081730000000\",\"piso\":\"0.066926666667\",\"ant\":\"0.08378000\",\"porcenmax\":\"96%\",\"totalpromedio\":0.0743283333335,\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"24\",\"alert\":\"black\",\"labelpricebitcoin\":\"90969.69\",\"labelpricemoneda\":\"0.09274\"}', 5, 1.0000000000, 1.0000000000),
(25, 'LINKUSDT', 'LINK', 'USDT', 0.00000000, 0.00000000, 0.00000000, 0, 0.00000, '{\"par\":\"USDT\",\"asset\":\"LINK\",\"price\":\"14.33\",\"btc\":\"90969.69\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:0deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"LINKUSDT\",\"tendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"color\":\"#F37A8B\",\"maxdia\":\"14.36\",\"mindia\":\"14.32\",\"totalTendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"techo\":\"14.360000000000\",\"piso\":\"14.320000000000\",\"ant\":\"14.36000000\",\"porcenmax\":\"25%\",\"totalpromedio\":14.34,\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"25\",\"alert\":\"orange\",\"labelpricebitcoin\":\"90969.69\",\"labelpricemoneda\":\"14.33\"}', 2, 0.0100000000, 0.0100000000),
(26, 'UNIUSDT', 'UNI', 'USDT', 0.00000000, 0.00000000, 0.00000000, 0, 0.00000, '{\"par\":\"USDT\",\"asset\":\"UNI\",\"price\":\"8.996\",\"btc\":\"90969.69\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:0deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"UNIUSDT\",\"tendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"8.996\",\"mindia\":\"8.966\",\"totalTendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"techo\":\"8.996000000000\",\"piso\":\"8.966000000000\",\"ant\":\"8.99600000\",\"porcenmax\":\"100%\",\"totalpromedio\":8.981,\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"26\",\"alert\":\"black\",\"labelpricebitcoin\":\"90969.69\",\"labelpricemoneda\":\"8.996\"}', 3, 0.0100000000, 0.0100000000);

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
(1, 'dd77b701661c5b55', 'BTCUSDT', 'BTC', 'USDT', 0.00000000, 60000.00000000, 18987.00000000, 1, 0.00000000, 0.00000000, NULL),
(6, 'dd77b701661c5b55', 'BNBUSDT', 'BNB', 'USDT', 0.00159852, 600.00000000, 260.00000000, 0, 650.62000000, 618.86000000, NULL),
(9, 'dd77b701661c5b55', 'ATOMUSDT', 'ATOM', 'USDT', 0.00000000, 17.00000000, 9.00000000, 0, 5.29900000, 5.03000000, NULL),
(15, 'dd77b701661c5b55', 'NEARUSDT', 'NEAR', 'USDT', 0.00000000, 0.00000000, 0.00000000, 0, 4.34300000, 4.12800000, NULL),
(22, 'cf804109f32fb39a', 'BTCUSDT', 'BTC', 'USDT', 0.00000000, 0.00000000, 0.00000000, 1, 0.00000000, 0.00000000, NULL),
(30, 'dd77b701661c5b55', 'FETUSDT', 'FET', 'USDT', 19.80000000, 0.00000000, 0.00000000, 0, 0.00000000, 0.00000000, NULL),
(31, 'dd77b701661c5b55', 'THETAUSDT', 'THETA', 'USDT', 0.00000000, 0.00000000, 0.00000000, 0, 1.44000000, 1.37000000, NULL),
(32, 'dd77b701661c5b55', 'LTCUSDT', 'LTC', 'USDT', 0.00000000, 0.00000000, 0.00000000, 0, 0.00000000, 0.00000000, NULL),
(33, 'dd77b701661c5b55', 'RUNEUSDT', 'RUNE', 'USDT', 3.50000000, 0.00000000, 0.00000000, 0, 0.00000000, 0.00000000, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

CREATE TABLE `parametros` (
  `ID` int(11) NOT NULL,
  `USUARIO` varchar(255) DEFAULT NULL,
  `ESTABLECOIN` varchar(34) NOT NULL DEFAULT 'USDT',
  `CAPITAL` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `ESCALONES` int(11) DEFAULT 1,
  `INVXCOMPRA` int(11) NOT NULL DEFAULT 0,
  `DISPONIBLE` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `GANANCIA` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `PERDIDA` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `IMPUESTO` decimal(16,8) NOT NULL DEFAULT 0.02000000,
  `LOCAL` int(11) NOT NULL DEFAULT 0,
  `BINANCE` int(11) NOT NULL DEFAULT 0,
  `APIKEY` varchar(255) DEFAULT NULL,
  `SECRET` varchar(255) DEFAULT NULL,
  `STOPLOSS` int(11) NOT NULL DEFAULT 5,
  `AUTOSHELL` int(11) NOT NULL DEFAULT 3,
  `AUTOBUY` int(11) NOT NULL DEFAULT 0,
  `GRAFICO` int(11) DEFAULT 0,
  `DATOS` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '{"valor":"null"}',
  `DATOSGRAF` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '{"valor":"null"}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `parametros`
--

INSERT INTO `parametros` (`ID`, `USUARIO`, `ESTABLECOIN`, `CAPITAL`, `ESCALONES`, `INVXCOMPRA`, `DISPONIBLE`, `GANANCIA`, `PERDIDA`, `IMPUESTO`, `LOCAL`, `BINANCE`, `APIKEY`, `SECRET`, `STOPLOSS`, `AUTOSHELL`, `AUTOBUY`, `GRAFICO`, `DATOS`, `DATOSGRAF`) VALUES
(1, 'dd77b701661c5b55', 'USDT', 41.25027112, 4, 20, 41.25027112, 5.98936000, 0.00000000, 0.02000000, 0, 0, 'Dt7T5bPCyEfhX8XabI9F4k9KYzdycVJPYXZSak5CQTBXWkhydGwrQ1lDaXF5TGFSMlpRM0JFL1k0SUtsc2c2dDJZZDJFQVJuejNMY2xLQ1FjNldWOGFRUURGSHJhMlBaWHgyYWdUMlU4dFBUbzBBZ0duZ255aHN3ZGlnPQ==', 'AdaCX7LKVBpr6gDgOWVR9TVQbjMrVWF3RjNVSi9tTDM5RnJBREJucVFzbVNGSVpVOC95dS8zUWhuNFU0bk16Rk0vNGF0MW4xWnc0L1RsTUdyUVZndWVFMWwwMTFGVHA1Z0lnM1BiKzRYdTl6djZLcEZxa241cFZrS044PQ==', 5, 5, 1, 1, '{\"pante\":\"86421.21\",\"animotrader\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"balance_asset\":\"0.00000000\",\"par\":\"USDT\",\"tipografico\":\"1\",\"asset\":\"BTC\",\"ultimaventa\":\"0.00\",\"ultimacompra\":\"0.00\",\"price\":\"90969.69\",\"btc\":\"90969.69\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:360deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"BTCUSDT\",\"tendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"91685.20\",\"mindia\":\"90640.01\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"utc\":\"2:56 PM\",\"techo\":\"69373.926333333333\",\"piso\":\"67012.887333333333\",\"totalmoneda\":\"<div style=width:100%;padding:3px;background:#372127;border-radius:3px;color:#F37A8B;>0.0000 BTC <span style=color:#F37A8B;>&#9660;</span></div>\",\"m_balance\":0,\"ant\":\"91821.99000000\",\"porcenmax\":\"32%\",\"ganancia\":\"5.99\",\"perdida\":\"0.0000\",\"capital\":\"41.25\",\"disponible\":\"41.25\",\"escalones\":\"4\",\"invxcompra\":20,\"totalpromedio\":\"68193.41\",\"xdisponible\":\"41.25\",\"auto\":\"1\",\"bina\":\"0\",\"impuesto\":\"0.0200\",\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"1\",\"recordCount\":\"2\",\"colordisp\":\"#4BC883\",\"checkMesGrafico\":false,\"recupera\":\"91060.66\",\"alert\":\"black\",\"checkAnoGrafico\":true,\"verescalones\":\"<table style=width:100%;><th></th><th>Dias</th><th>Tipo</th><th>Precio</th><th>Moneda</th><th style=text-align:right;>Ganancia</th><th>Opciones</th><tr style=background:transparent;><td><div class=odometro style=--data:0deg;></div></td><td>4</td><td style=color:white;>BUY</td><td style=color:white;>1.411$</td><td style=text-align:right;><div style=width:100%;padding:3px;background:#372127;border-radius:3px;color:#F37A8B;>19.8 FET <span style=color:#F37A8B;>&#9660;</span></div></td><td style=text-align:right;><span style=font-weight:bold;color:#F37A8B>-2.16$</span></td><td style=text-align:right;><button type=button id=btnstop37 onclick=autostop(37) class=btn-label1 >Stop</button><button type=button id=btnauto37 onclick=autosell(37) class=btn-label2 style=background-color:#4caf50;color:white;>Auto</button><button  class=btn-label1 style=background:#EA465C; onclick=perdida(37)>Sell</button><button  class=btn-label1 title=eliminar style=background:#EAB92B; onclick=borrar(37)>x</button></td></tr><tr style=background:transparent;><td><div class=odometro style=--data:360deg;></div></td><td>2</td><td style=color:white;>BUY</td><td style=color:white;>5.617$</td><td style=text-align:right;><div style=width:100%;padding:3px;background:#15342D;border-radius:3px;color:#4BC883;>3.5 RUNE <span style=color:#4BC883;>&#9650;</span></div></td><td style=text-align:right;><span style=font-weight:bold;color:#4BC883>0.10$</span></td><td style=text-align:right;><button type=button id=btnstop41 onclick=autostop(41) class=btn-label1 >Stop</button><button type=button id=btnauto41 onclick=autosell(41) class=btn-label2 style=background-color:#4caf50;color:white;>Auto</button><button  class=btn-label1 style=background:#EA465C; onclick=perdida(41)>Sell</button><button  class=btn-label1 title=eliminar style=background:#EAB92B; onclick=borrar(41)>x</button></td></tr></table>\",\"labelpricebitcoin\":\"90969.69\",\"labelpricemoneda\":\"90969.69\",\"precio_venta\":\"5\",\"listasset\":\"<table style=text-align:right;width:100%;><th></th><th></th><tr><td><span onclick=moneyChangue(1) style=cursor:pointer;color:#4BC883;>BTC</span></td><td><span style=color:#4BC883;font-weight:bold;>90969.69</span></td><td><span class=bolita style=color:black;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(6) style=cursor:pointer;color:#4BC883;>BNB</span></td><td><span style=color:#4BC883;font-weight:bold;>628.49</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(9) style=cursor:pointer;color:#4BC883;>ATOM</span></td><td><span style=color:#4BC883;font-weight:bold;>5.626</span></td><td><span class=bolita style=color:green;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(15) style=cursor:pointer;color:#4BC883;>NEAR</span></td><td><span style=color:#4BC883;font-weight:bold;>5.963</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(30) style=cursor:pointer;color:#F37A8B;>FET</span></td><td><span style=color:#F37A8B;font-weight:bold;>1.302</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(31) style=cursor:pointer;color:#4BC883;>THETA</span></td><td><span style=color:#4BC883;font-weight:bold;>1.502</span></td><td><span class=bolita style=color:black;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(32) style=cursor:pointer;color:#4BC883;>LTC</span></td><td><span style=color:#4BC883;font-weight:bold;>92.54</span></td><td><span class=bolita style=color:green;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(33) style=cursor:pointer;color:#4BC883;>RUNE</span></td><td><span style=color:#4BC883;font-weight:bold;>5.646</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr></table>\",\"stop\":\"5\",\"balance\":\"0.00000000\"}', '{\"grafico\":[{\"date\":\"2024-11-16\",\"open\":\"91266.09\",\"high\":\"91685.20\",\"low\":\"90640.01\",\"close\":\"90969.69\",\"prm\":\"89032.75\"},{\"date\":\"2024-11-15\",\"open\":\"88242.44\",\"high\":\"91821.99\",\"low\":\"87095.81\",\"close\":\"91266.09\",\"prm\":\"89180.95\"},{\"date\":\"2024-11-14\",\"open\":\"89928.00\",\"high\":\"91706.06\",\"low\":\"86922.75\",\"close\":\"88242.44\",\"prm\":\"87669.13\"},{\"date\":\"2024-11-13\",\"open\":\"87204.19\",\"high\":\"93152.01\",\"low\":\"86171.91\",\"close\":\"89928.00\",\"prm\":\"88511.91\"},{\"date\":\"2024-11-12\",\"open\":\"88088.08\",\"high\":\"89854.01\",\"low\":\"85164.00\",\"close\":\"87204.19\",\"prm\":\"87150.00\"},{\"date\":\"2024-11-11\",\"open\":\"81668.00\",\"high\":\"89500.00\",\"low\":\"80500.01\",\"close\":\"88088.08\",\"prm\":\"87591.95\"},{\"date\":\"2024-11-10\",\"open\":\"77240.24\",\"high\":\"81729.46\",\"low\":\"77156.00\",\"close\":\"81668.00\",\"prm\":\"84381.91\"},{\"date\":\"2024-11-09\",\"open\":\"76344.65\",\"high\":\"77468.29\",\"low\":\"75789.58\",\"close\":\"77240.24\",\"prm\":\"82168.03\"},{\"date\":\"2024-11-08\",\"open\":\"75885.99\",\"high\":\"77171.51\",\"low\":\"75669.99\",\"close\":\"76344.65\",\"prm\":\"81720.23\"},{\"date\":\"2024-11-07\",\"open\":\"75050.01\",\"high\":\"76833.13\",\"low\":\"74471.31\",\"close\":\"75885.99\",\"prm\":\"81490.90\"},{\"date\":\"2024-11-06\",\"open\":\"74281.80\",\"high\":\"76331.02\",\"low\":\"72711.99\",\"close\":\"75050.01\",\"prm\":\"81072.91\"},{\"date\":\"2024-11-05\",\"open\":\"0.00\",\"high\":\"74990.01\",\"low\":\"68930.00\",\"close\":\"74281.80\",\"prm\":\"80688.81\"},{\"date\":\"2024-10-31\",\"open\":\"72337.99\",\"high\":\"72610.00\",\"low\":\"70171.99\",\"close\":\"70364.21\",\"prm\":\"78730.01\"},{\"date\":\"2024-10-30\",\"open\":\"72244.43\",\"high\":\"72937.29\",\"low\":\"71653.06\",\"close\":\"72337.99\",\"prm\":\"79716.90\"},{\"date\":\"2024-10-29\",\"open\":\"70966.98\",\"high\":\"73560.00\",\"low\":\"70882.95\",\"close\":\"72244.43\",\"prm\":\"79670.12\"},{\"date\":\"2024-10-28\",\"open\":\"67733.61\",\"high\":\"71544.00\",\"low\":\"67621.19\",\"close\":\"70966.98\",\"prm\":\"79031.40\"},{\"date\":\"2024-10-27\",\"open\":\"67290.01\",\"high\":\"68299.99\",\"low\":\"67038.00\",\"close\":\"67733.61\",\"prm\":\"77414.71\"},{\"date\":\"2024-10-26\",\"open\":\"66928.48\",\"high\":\"67414.94\",\"low\":\"66761.80\",\"close\":\"67290.01\",\"prm\":\"77192.91\"},{\"date\":\"2024-10-25\",\"open\":\"68054.05\",\"high\":\"68759.99\",\"low\":\"65810.01\",\"close\":\"66928.48\",\"prm\":\"77012.15\"},{\"date\":\"2024-10-24\",\"open\":\"67224.00\",\"high\":\"68839.47\",\"low\":\"66762.01\",\"close\":\"68054.05\",\"prm\":\"77574.93\"},{\"date\":\"2024-10-23\",\"open\":\"67082.10\",\"high\":\"67585.61\",\"low\":\"65274.71\",\"close\":\"67224.00\",\"prm\":\"77159.91\"},{\"date\":\"2024-10-22\",\"open\":\"67390.02\",\"high\":\"67823.00\",\"low\":\"66650.15\",\"close\":\"67082.10\",\"prm\":\"77088.96\"},{\"date\":\"2024-10-21\",\"open\":\"68935.47\",\"high\":\"69155.27\",\"low\":\"66614.00\",\"close\":\"67390.02\",\"prm\":\"77242.92\"},{\"date\":\"2024-10-20\",\"open\":\"68192.37\",\"high\":\"69451.74\",\"low\":\"68176.26\",\"close\":\"68935.47\",\"prm\":\"78015.64\"},{\"date\":\"2024-10-19\",\"open\":\"68466.03\",\"high\":\"68559.99\",\"low\":\"68040.01\",\"close\":\"68192.37\",\"prm\":\"77644.09\"},{\"date\":\"2024-10-18\",\"open\":\"67602.33\",\"high\":\"68964.00\",\"low\":\"67569.67\",\"close\":\"68466.03\",\"prm\":\"77780.92\"},{\"date\":\"2024-10-17\",\"open\":\"67609.71\",\"high\":\"68167.70\",\"low\":\"66683.42\",\"close\":\"67602.33\",\"prm\":\"77349.07\"},{\"date\":\"2024-10-16\",\"open\":\"67112.51\",\"high\":\"68347.67\",\"low\":\"66776.01\",\"close\":\"67609.71\",\"prm\":\"77352.76\"},{\"date\":\"2024-10-15\",\"open\":\"65338.00\",\"high\":\"67785.81\",\"low\":\"64997.50\",\"close\":\"67112.51\",\"prm\":\"77104.16\"},{\"date\":\"2024-10-14\",\"open\":\"64271.85\",\"high\":\"66450.01\",\"low\":\"63830.00\",\"close\":\"65338.00\",\"prm\":\"76216.91\"}]}'),
(2, 'cf804109f32fb39a', 'USDT', 0.00000000, 4, 0, 0.00000000, 0.00000000, 0.00000000, 0.02000000, 1, 0, 'n//BUwujCe5poUyBnMy/MWZENlFwbE9GYktUZkRKbG9jNFFnbkx2UE13WVFGdlZXVHprem1YblJpUGg5VXJTVWxVelhZRnY3MGx3ZDB6MFg=', 'yMq+4VXzhr5b3ytCQpRQAWRNZTNoWDJsakV6alJkWjFHQmt1dHBSUk00L3ZROTJoM0VualIreXpkdi9Id3FOZFNKRnRhRlhSUWNGWVk1NUM=', 1, 2, 0, 0, NULL, NULL);

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
(42, '2024-09-12', 'RUNEUSDT', 3.87300000, 4.08300000, 3.80500000, 4.02500000, 3.87300000, 1, 0),
(43, '2024-09-12', 'SHIBUSDT', 0.00001342, 0.00001354, 0.00001320, 0.00001342, 0.00001342, 0, 1),
(44, '2024-09-12', 'DOGEUSDT', 0.10185000, 0.10293000, 0.10065000, 0.10238000, 0.10185000, 0, 1),
(45, '2024-09-13', 'PAXGUSDT', 2575.00000000, 2584.00000000, 2560.00000000, 2560.00000000, 2575.00000000, 0, 1),
(46, '2024-09-13', 'BTCUSDT', 60319.87000000, 60624.54000000, 57632.63000000, 57845.97000000, 60319.87000000, 0, 1),
(47, '2024-09-13', 'BNBUSDT', 556.20000000, 559.40000000, 538.80000000, 542.80000000, 556.20000000, 0, 1),
(48, '2024-09-13', 'ETHUSDT', 2432.60000000, 2460.55000000, 2337.36000000, 2356.04000000, 2432.60000000, 0, 1),
(49, '2024-09-13', 'ATOMUSDT', 4.21800000, 4.25500000, 4.13600000, 4.13300000, 4.21800000, 0, 1),
(50, '2024-09-13', 'NEARUSDT', 4.24100000, 4.34400000, 4.11800000, 4.21600000, 4.24100000, 0, 1),
(51, '2024-09-13', 'RUNEUSDT', 4.13500000, 4.18100000, 3.82900000, 3.87300000, 4.13500000, 0, 1),
(52, '2024-09-13', 'SHIBUSDT', 0.00001400, 0.00001410, 0.00001339, 0.00001342, 0.00001400, 0, 1),
(53, '2024-09-13', 'DOGEUSDT', 0.10721000, 0.10836000, 0.10185000, 0.10185000, 0.10721000, 0, 1),
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
(86, '2024-09-17', 'RUNEUSDT', 4.05800000, 4.15000000, 3.83700000, 3.83700000, 4.05800000, 0, 1),
(87, '2024-09-17', 'SHIBUSDT', 0.00001337, 0.00001357, 0.00001317, 0.00001320, 0.00001337, 0, 1),
(88, '2024-09-17', 'DOGEUSDT', 0.10119000, 0.10257000, 0.09960000, 0.09983000, 0.10119000, 0, 1),
(89, '2024-09-18', 'LTCUSDT', 64.93000000, 65.41000000, 62.43000000, 64.19000000, 64.93000000, 0, 1),
(90, '2024-09-18', 'BTCUSDT', 62117.99000000, 62503.99000000, 59218.06000000, 60509.99000000, 62117.99000000, 0, 1),
(91, '2024-09-18', 'BNBUSDT', 560.10000000, 562.60000000, 536.90000000, 547.40000000, 560.10000000, 0, 1),
(92, '2024-09-18', 'ETHUSDT', 2403.68000000, 2410.86000000, 2279.45000000, 2334.79000000, 2403.68000000, 0, 1),
(93, '2024-09-18', 'ATOMUSDT', 4.44500000, 4.47200000, 4.10200000, 4.19700000, 4.44500000, 0, 1),
(94, '2024-09-18', 'NEARUSDT', 4.53400000, 4.56300000, 3.93700000, 4.09200000, 4.53400000, 0, 1),
(95, '2024-09-18', 'INJUSDT', 20.38000000, 20.72000000, 18.20000000, 19.35000000, 20.38000000, 0, 1),
(96, '2024-09-18', 'PAXGUSDT', 2571.00000000, 2608.00000000, 2556.00000000, 2582.00000000, 2571.00000000, 1, 0),
(97, '2024-09-18', 'RUNEUSDT', 4.37100000, 4.41800000, 3.81400000, 4.05800000, 4.37100000, 0, 1),
(98, '2024-09-18', 'SHIBUSDT', 0.00001385, 0.00001399, 0.00001297, 0.00001337, 0.00001385, 0, 1),
(99, '2024-09-18', 'DOGEUSDT', 0.10407000, 0.10552000, 0.09950000, 0.10119000, 0.10407000, 0, 1),
(100, '2024-09-19', 'RUNEUSDT', 4.52500000, 4.58700000, 4.33600000, 4.37100000, 4.52500000, 0, 1),
(101, '2024-09-19', 'NEARUSDT', 4.40700000, 4.58100000, 4.25800000, 4.53400000, 4.40700000, 0, 1),
(102, '2024-09-19', 'BTCUSDT', 63715.80000000, 63848.89000000, 61816.00000000, 62117.99000000, 63715.80000000, 0, 1),
(103, '2024-09-19', 'BNBUSDT', 571.00000000, 571.90000000, 553.20000000, 560.10000000, 571.00000000, 0, 1),
(104, '2024-09-19', 'ETHUSDT', 2519.72000000, 2519.72000000, 2399.71000000, 2403.68000000, 2519.72000000, 0, 1),
(105, '2024-09-19', 'ATOMUSDT', 4.54600000, 4.61400000, 4.42100000, 4.44500000, 4.54600000, 0, 1),
(106, '2024-09-19', 'ATOMUSDT', 4.54600000, 4.61400000, 4.42100000, 4.44500000, 4.54600000, 0, 1),
(107, '2024-09-19', 'INJUSDT', 20.94000000, 21.04000000, 20.09000000, 20.38000000, 20.94000000, 0, 1),
(108, '2024-09-19', 'INJUSDT', 20.94000000, 21.04000000, 20.09000000, 20.38000000, 20.94000000, 0, 1),
(109, '2024-09-19', 'SHIBUSDT', 0.00001433, 0.00001456, 0.00001382, 0.00001385, 0.00001433, 0, 1),
(110, '2024-09-19', 'LTCUSDT', 65.93000000, 66.05000000, 64.71000000, 64.93000000, 65.93000000, 0, 1),
(111, '2024-09-19', 'DOGEUSDT', 0.10602000, 0.10712000, 0.10364000, 0.10407000, 0.10602000, 0, 1),
(112, '2024-09-19', 'PAXGUSDT', 2598.00000000, 2598.00000000, 2566.00000000, 2571.00000000, 2598.00000000, 1, 0),
(113, '2024-09-20', 'RUNEUSDT', 4.44500000, 4.58500000, 4.34700000, 4.52500000, 4.44500000, 1, 0),
(114, '2024-09-20', 'BTCUSDT', 62889.58000000, 64099.19000000, 62582.83000000, 63715.80000000, 62889.58000000, 0, 1),
(115, '2024-09-20', 'BNBUSDT', 567.80000000, 577.10000000, 564.70000000, 571.00000000, 567.80000000, 0, 1),
(116, '2024-09-20', 'ETHUSDT', 2544.67000000, 2586.49000000, 2516.24000000, 2519.72000000, 2544.67000000, 0, 1),
(117, '2024-09-20', 'ATOMUSDT', 4.49600000, 4.59000000, 4.47000000, 4.54600000, 4.49600000, 1, 0),
(118, '2024-09-20', 'NEARUSDT', 4.32600000, 4.50400000, 4.30200000, 4.40700000, 4.32600000, 1, 0),
(119, '2024-09-20', 'INJUSDT', 20.69000000, 21.39000000, 20.45000000, 20.94000000, 20.69000000, 0, 1),
(120, '2024-09-20', 'SHIBUSDT', 0.00001425, 0.00001450, 0.00001405, 0.00001433, 0.00001425, 1, 0),
(121, '2024-09-20', 'DOGEUSDT', 0.10480000, 0.10744000, 0.10397000, 0.10602000, 0.10480000, 0, 1),
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
(132, '2024-09-21', 'RUNEUSDT', 4.62900000, 4.70300000, 4.39900000, 4.44500000, 4.62900000, 0, 1),
(133, '2024-09-21', 'SHIBUSDT', 0.00001475, 0.00001507, 0.00001412, 0.00001425, 0.00001475, 0, 1),
(134, '2024-09-21', 'DOGEUSDT', 0.10808000, 0.11040000, 0.10431000, 0.10480000, 0.10808000, 0, 1),
(135, '2024-09-22', 'BTCUSDT', 64367.80000000, 64681.99000000, 62390.01000000, 63106.00000000, 64367.80000000, 0, 1),
(136, '2024-09-22', 'BNBUSDT', 596.90000000, 599.40000000, 576.70000000, 584.00000000, 596.90000000, 0, 1),
(137, '2024-09-22', 'ETHUSDT', 2677.02000000, 2685.28000000, 2526.69000000, 2594.72000000, 2677.02000000, 0, 1),
(138, '2024-09-22', 'ATOMUSDT', 4.67000000, 4.71900000, 4.48500000, 4.65000000, 4.67000000, 1, 0),
(139, '2024-09-22', 'NEARUSDT', 4.72300000, 4.74500000, 4.38500000, 4.60800000, 4.72300000, 0, 1),
(140, '2024-09-22', 'INJUSDT', 21.74000000, 22.13000000, 20.64000000, 21.15000000, 21.74000000, 0, 1),
(141, '2024-09-22', 'LTCUSDT', 68.70000000, 69.30000000, 66.51000000, 67.35000000, 68.70000000, 0, 1),
(142, '2024-09-22', 'PAXGUSDT', 2630.00000000, 2634.00000000, 2611.00000000, 2618.00000000, 2630.00000000, 0, 1),
(143, '2024-09-22', 'RUNEUSDT', 4.71000000, 4.73500000, 4.38400000, 4.62900000, 4.71000000, 0, 1),
(144, '2024-09-22', 'SHIBUSDT', 0.00001476, 0.00001485, 0.00001416, 0.00001475, 0.00001476, 1, 0),
(145, '2024-09-22', 'DOGEUSDT', 0.10817000, 0.10911000, 0.10381000, 0.10808000, 0.10817000, 1, 0),
(146, '2024-09-23', 'BNBUSDT', 606.50000000, 615.80000000, 588.50000000, 596.90000000, 606.50000000, 0, 1),
(147, '2024-09-23', 'ETHUSDT', 2627.40000000, 2698.99000000, 2609.43000000, 2677.02000000, 2627.40000000, 0, 1),
(148, '2024-09-23', 'BTCUSDT', 63127.99000000, 64455.13000000, 62748.00000000, 64367.80000000, 63127.99000000, 1, 0),
(149, '2024-09-23', 'ATOMUSDT', 4.55700000, 4.68700000, 4.49700000, 4.67000000, 4.55700000, 1, 0),
(150, '2024-09-23', 'NEARUSDT', 5.24900000, 5.26900000, 4.64100000, 4.72300000, 5.24900000, 0, 1),
(151, '2024-09-23', 'INJUSDT', 22.28000000, 22.59000000, 21.50000000, 21.74000000, 22.28000000, 0, 1),
(153, '2024-09-23', 'PAXGUSDT', 2631.00000000, 2632.00000000, 2615.00000000, 2630.00000000, 2631.00000000, 1, 0),
(154, '2024-09-23', 'RUNEUSDT', 4.60100000, 4.80000000, 4.52300000, 4.71000000, 4.60100000, 0, 1),
(155, '2024-09-23', 'SHIBUSDT', 0.00001446, 0.00001480, 0.00001427, 0.00001476, 0.00001446, 1, 0),
(156, '2024-09-23', 'DOGEUSDT', 0.10818000, 0.10883000, 0.10609000, 0.10817000, 0.10818000, 1, 0),
(157, '2024-09-23', 'LTCUSDT', 66.61000000, 67.99000000, 66.25000000, 68.70000000, 66.61000000, 1, 0),
(158, '2024-09-24', 'INJUSDT', 21.83000000, 22.76000000, 21.47000000, 22.28000000, 21.83000000, 0, 1),
(159, '2024-09-24', 'BTCUSDT', 64461.94000000, 64763.99000000, 62739.91000000, 63127.99000000, 64461.94000000, 0, 1),
(160, '2024-09-24', 'PAXGUSDT', 2658.00000000, 2665.00000000, 2626.00000000, 2631.00000000, 2658.00000000, 0, 1),
(161, '2024-09-24', 'RUNEUSDT', 5.08100000, 5.09100000, 4.54600000, 4.60100000, 5.08100000, 0, 1),
(162, '2024-09-24', 'BNBUSDT', 607.10000000, 613.00000000, 599.70000000, 606.50000000, 607.10000000, 1, 0),
(163, '2024-09-24', 'ETHUSDT', 2646.89000000, 2670.41000000, 2591.87000000, 2627.40000000, 2646.89000000, 1, 0),
(164, '2024-09-24', 'ATOMUSDT', 4.96800000, 4.96800000, 4.51300000, 4.55700000, 4.96800000, 0, 1),
(165, '2024-09-24', 'NEARUSDT', 5.35300000, 5.45500000, 5.08900000, 5.24900000, 5.35300000, 0, 1),
(166, '2024-09-24', 'SHIBUSDT', 0.00001501, 0.00001505, 0.00001434, 0.00001446, 0.00001501, 0, 1),
(167, '2024-09-24', 'DOGEUSDT', 0.11057000, 0.11091000, 0.10694000, 0.10818000, 0.11057000, 0, 1),
(168, '2024-09-24', 'LTCUSDT', 66.99000000, 67.15000000, 65.75000000, 66.61000000, 66.99000000, 1, 0),
(169, '2024-09-25', 'INJUSDT', 22.76000000, 23.18000000, 21.23000000, 21.83000000, 22.76000000, 0, 1),
(170, '2024-09-25', 'BTCUSDT', 63491.99000000, 64458.00000000, 62689.99000000, 64461.94000000, 63491.99000000, 1, 0),
(171, '2024-09-25', 'BNBUSDT', 587.80000000, 607.10000000, 580.90000000, 607.10000000, 587.80000000, 1, 0),
(172, '2024-09-25', 'ETHUSDT', 2601.63000000, 2646.86000000, 2557.51000000, 2646.89000000, 2601.63000000, 1, 0),
(173, '2024-09-25', 'ATOMUSDT', 4.82900000, 4.96400000, 4.70200000, 4.96800000, 4.82900000, 1, 0),
(174, '2024-09-25', 'NEARUSDT', 5.27800000, 5.37000000, 5.11200000, 5.35300000, 5.27800000, 1, 0),
(175, '2024-09-25', 'LTCUSDT', 66.43000000, 67.84000000, 65.64000000, 66.99000000, 66.43000000, 0, 1),
(176, '2024-09-25', 'PAXGUSDT', 2659.00000000, 2666.00000000, 2648.00000000, 2658.00000000, 2659.00000000, 0, 1),
(177, '2024-09-25', 'RUNEUSDT', 5.10500000, 5.14100000, 4.90600000, 5.08100000, 5.10500000, 0, 1),
(178, '2024-09-25', 'SHIBUSDT', 0.00001559, 0.00001574, 0.00001474, 0.00001501, 0.00001559, 0, 1),
(179, '2024-09-25', 'DOGEUSDT', 0.10894000, 0.11072000, 0.10700000, 0.11057000, 0.10894000, 1, 0),
(180, '2024-09-26', 'NEARUSDT', 5.83000000, 5.84900000, 5.24500000, 5.27800000, 5.83000000, 0, 1),
(181, '2024-09-26', 'BTCUSDT', 65244.88000000, 65461.75000000, 63353.77000000, 63491.99000000, 65244.88000000, 0, 1),
(182, '2024-09-26', 'BNBUSDT', 605.10000000, 605.10000000, 587.40000000, 587.80000000, 605.10000000, 1, 0),
(183, '2024-09-26', 'ETHUSDT', 2643.73000000, 2658.00000000, 2593.40000000, 2601.63000000, 2643.73000000, 0, 1),
(184, '2024-09-26', 'ATOMUSDT', 5.07800000, 5.07800000, 4.80300000, 4.82900000, 5.07800000, 0, 1),
(185, '2024-09-26', 'INJUSDT', 23.39000000, 23.75000000, 22.73000000, 22.76000000, 23.39000000, 0, 1),
(186, '2024-09-26', 'LTCUSDT', 68.40000000, 68.40000000, 66.47000000, 66.43000000, 68.40000000, 0, 1),
(187, '2024-09-26', 'PAXGUSDT', 2658.00000000, 2677.00000000, 2653.00000000, 2659.00000000, 2658.00000000, 0, 1),
(188, '2024-09-26', 'RUNEUSDT', 5.61500000, 5.69800000, 5.08700000, 5.10500000, 5.61500000, 0, 1),
(189, '2024-09-26', 'SHIBUSDT', 0.00001795, 0.00001819, 0.00001544, 0.00001559, 0.00001795, 0, 1),
(190, '2024-09-26', 'DOGEUSDT', 0.11786000, 0.11850000, 0.10856000, 0.10894000, 0.11786000, 0, 1),
(191, '2024-09-27', 'BTCUSDT', 66052.62000000, 66225.44000000, 65683.02000000, 65244.88000000, 66052.62000000, 0, 1),
(192, '2024-09-27', 'BNBUSDT', 612.10000000, 616.10000000, 605.50000000, 605.10000000, 612.10000000, 0, 1),
(193, '2024-09-27', 'ETHUSDT', 2690.26000000, 2703.07000000, 2690.01000000, 2643.73000000, 2690.26000000, 0, 1),
(194, '2024-09-27', 'ATOMUSDT', 5.13700000, 5.16200000, 5.10500000, 5.07800000, 5.13700000, 0, 1),
(195, '2024-09-27', 'NEARUSDT', 5.50300000, 5.52900000, 5.43600000, 5.83000000, 5.50300000, 1, 0),
(196, '2024-09-27', 'INJUSDT', 23.90000000, 23.96000000, 23.53000000, 23.39000000, 23.90000000, 0, 1),
(197, '2024-09-27', 'LTCUSDT', 71.32000000, 71.44000000, 70.90000000, 68.40000000, 71.32000000, 0, 1),
(198, '2024-09-27', 'PAXGUSDT', 2652.00000000, 2657.00000000, 2650.00000000, 2658.00000000, 2652.00000000, 1, 0),
(199, '2024-09-27', 'RUNEUSDT', 5.40300000, 5.45500000, 5.36300000, 5.61500000, 5.40300000, 1, 0),
(200, '2024-09-27', 'SHIBUSDT', 0.00002103, 0.00002141, 0.00002019, 0.00001795, 0.00002103, 0, 1),
(201, '2024-09-27', 'DOGEUSDT', 0.12610000, 0.12665000, 0.12357000, 0.11786000, 0.12610000, 0, 1),
(202, '2024-09-28', 'ATOMUSDT', 5.04900000, 5.13300000, 4.93800000, 5.13700000, 5.04900000, 1, 0),
(203, '2024-09-28', 'NEARUSDT', 5.49200000, 5.57600000, 5.34700000, 5.50300000, 5.49200000, 0, 1),
(204, '2024-09-28', 'INJUSDT', 22.86000000, 23.95000000, 22.58000000, 23.90000000, 22.86000000, 1, 0),
(205, '2024-09-28', 'BTCUSDT', 65816.39000000, 66082.00000000, 65444.00000000, 66052.62000000, 65816.39000000, 1, 0),
(206, '2024-09-28', 'BNBUSDT', 600.40000000, 612.60000000, 594.80000000, 612.10000000, 600.40000000, 1, 0),
(207, '2024-09-28', 'ETHUSDT', 2675.01000000, 2699.06000000, 2652.76000000, 2690.26000000, 2675.01000000, 1, 0),
(208, '2024-09-28', 'LTCUSDT', 69.58000000, 71.47000000, 69.03000000, 71.32000000, 69.58000000, 0, 1),
(209, '2024-09-28', 'PAXGUSDT', 2667.00000000, 2668.00000000, 2650.00000000, 2652.00000000, 2667.00000000, 0, 1),
(210, '2024-09-28', 'RUNEUSDT', 5.36900000, 5.48600000, 5.29300000, 5.40300000, 5.36900000, 0, 1),
(211, '2024-09-28', 'SHIBUSDT', 0.00002017, 0.00002106, 0.00001907, 0.00002103, 0.00002017, 1, 0),
(212, '2024-09-28', 'DOGEUSDT', 0.12959000, 0.13142000, 0.12041000, 0.12610000, 0.12959000, 0, 1),
(213, '2024-09-29', 'ETHUSDT', 2628.35000000, 2673.95000000, 2607.50000000, 2675.01000000, 2628.35000000, 1, 0),
(214, '2024-09-29', 'ATOMUSDT', 4.91900000, 5.11900000, 4.89600000, 5.04900000, 4.91900000, 1, 0),
(215, '2024-09-29', 'NEARUSDT', 5.34500000, 5.62300000, 5.29200000, 5.49200000, 5.34500000, 0, 1),
(216, '2024-09-29', 'INJUSDT', 22.85000000, 23.74000000, 22.25000000, 22.86000000, 22.85000000, 1, 0),
(217, '2024-09-29', 'BNBUSDT', 577.90000000, 600.90000000, 573.10000000, 600.40000000, 577.90000000, 1, 0),
(218, '2024-09-29', 'BTCUSDT', 64534.00000000, 65973.15000000, 64274.01000000, 65816.39000000, 64534.00000000, 1, 0),
(219, '2024-09-29', 'LTCUSDT', 67.82000000, 70.24000000, 67.69000000, 69.58000000, 67.82000000, 1, 0),
(220, '2024-09-29', 'PAXGUSDT', 2651.00000000, 2668.00000000, 2651.00000000, 2667.00000000, 2651.00000000, 1, 0),
(221, '2024-09-29', 'RUNEUSDT', 5.14300000, 5.14500000, 5.03700000, 5.36900000, 5.14300000, 1, 0),
(222, '2024-09-29', 'SHIBUSDT', 0.00001875, 0.00002009, 0.00001837, 0.00002017, 0.00001875, 1, 0),
(223, '2024-09-29', 'DOGEUSDT', 0.12236000, 0.12923000, 0.12096000, 0.12959000, 0.12236000, 1, 0),
(224, '2024-09-30', 'BNBUSDT', 577.00000000, 582.90000000, 564.50000000, 577.90000000, 577.00000000, 1, 0),
(225, '2024-09-30', 'ETHUSDT', 2630.84000000, 2642.87000000, 2580.99000000, 2628.35000000, 2630.84000000, 1, 0),
(226, '2024-09-30', 'ATOMUSDT', 4.84800000, 5.00300000, 4.69100000, 4.91900000, 4.84800000, 1, 0),
(227, '2024-09-30', 'NEARUSDT', 5.39800000, 5.46700000, 5.23600000, 5.34500000, 5.39800000, 1, 0),
(228, '2024-09-30', 'INJUSDT', 24.87000000, 24.88000000, 22.58000000, 22.85000000, 24.87000000, 0, 1),
(229, '2024-09-30', 'BTCUSDT', 63743.99000000, 64683.64000000, 62947.99000000, 64534.00000000, 63743.99000000, 1, 0),
(230, '2024-09-30', 'LTCUSDT', 67.93000000, 68.35000000, 66.38000000, 67.82000000, 67.93000000, 1, 0),
(231, '2024-09-30', 'PAXGUSDT', 2640.00000000, 2653.00000000, 2626.00000000, 2651.00000000, 2640.00000000, 1, 0),
(232, '2024-09-30', 'RUNEUSDT', 5.18400000, 5.29200000, 5.01500000, 5.14300000, 5.18400000, 0, 1),
(233, '2024-09-30', 'SHIBUSDT', 0.00001830, 0.00001888, 0.00001747, 0.00001875, 0.00001830, 1, 0),
(234, '2024-09-30', 'DOGEUSDT', 0.11770000, 0.12354000, 0.11342000, 0.12236000, 0.11770000, 1, 0),
(235, '2024-10-01', 'NEARUSDT', 4.93000000, 5.56200000, 4.71800000, 5.39800000, 4.93000000, 1, 0),
(236, '2024-10-01', 'BTCUSDT', 61772.01000000, 64112.00000000, 60444.51000000, 63743.99000000, 61772.01000000, 1, 0),
(237, '2024-10-01', 'BNBUSDT', 554.50000000, 582.50000000, 540.50000000, 577.00000000, 554.50000000, 1, 0),
(238, '2024-10-01', 'ETHUSDT', 2490.28000000, 2655.95000000, 2437.06000000, 2630.84000000, 2490.28000000, 1, 0),
(239, '2024-10-01', 'ATOMUSDT', 4.51200000, 4.90200000, 4.31600000, 4.84800000, 4.51200000, 1, 0),
(240, '2024-10-01', 'INJUSDT', 21.10000000, 24.75000000, 20.41000000, 24.87000000, 21.10000000, 1, 0),
(241, '2024-10-01', 'LTCUSDT', 64.31000000, 68.52000000, 62.61000000, 67.93000000, 64.31000000, 1, 0),
(242, '2024-10-01', 'PAXGUSDT', 2669.00000000, 2697.00000000, 2641.00000000, 2640.00000000, 2669.00000000, 1, 0),
(243, '2024-10-01', 'RUNEUSDT', 4.74400000, 5.34900000, 4.53000000, 5.18400000, 4.74400000, 1, 0),
(244, '2024-10-01', 'SHIBUSDT', 0.00001697, 0.00001861, 0.00001590, 0.00001830, 0.00001697, 1, 0),
(245, '2024-10-01', 'DOGEUSDT', 0.10833000, 0.11917000, 0.10360000, 0.11770000, 0.10833000, 1, 0),
(246, '2024-10-02', 'BNBUSDT', 549.90000000, 557.90000000, 536.60000000, 554.50000000, 549.90000000, 1, 0),
(247, '2024-10-02', 'ETHUSDT', 2399.44000000, 2491.35000000, 2354.13000000, 2490.28000000, 2399.44000000, 1, 0),
(248, '2024-10-02', 'ATOMUSDT', 4.48500000, 4.57600000, 4.35200000, 4.51200000, 4.48500000, 1, 0),
(249, '2024-10-02', 'NEARUSDT', 4.76500000, 4.99700000, 4.54400000, 4.93000000, 4.76500000, 1, 0),
(250, '2024-10-02', 'INJUSDT', 20.50000000, 22.38000000, 19.85000000, 21.10000000, 20.50000000, 1, 0),
(251, '2024-10-02', 'BTCUSDT', 61463.98000000, 62274.00000000, 60092.95000000, 61772.01000000, 61463.98000000, 1, 0),
(252, '2024-10-02', 'LTCUSDT', 63.97000000, 64.70000000, 62.27000000, 64.31000000, 63.97000000, 1, 0),
(253, '2024-10-02', 'PAXGUSDT', 2666.00000000, 2675.00000000, 2653.00000000, 2669.00000000, 2666.00000000, 1, 0),
(254, '2024-10-02', 'RUNEUSDT', 4.68800000, 4.90000000, 4.52600000, 4.74400000, 4.68800000, 1, 0),
(255, '2024-10-02', 'SHIBUSDT', 0.00001670, 0.00001705, 0.00001607, 0.00001697, 0.00001670, 1, 0),
(256, '2024-10-02', 'DOGEUSDT', 0.10599000, 0.10931000, 0.10269000, 0.10833000, 0.10599000, 1, 0),
(257, '2024-10-03', 'BTCUSDT', 60934.96000000, 61256.46000000, 60086.00000000, 61463.98000000, 60934.96000000, 1, 0),
(258, '2024-10-03', 'BNBUSDT', 546.40000000, 549.20000000, 535.50000000, 549.90000000, 546.40000000, 1, 0),
(259, '2024-10-03', 'ETHUSDT', 2366.30000000, 2378.57000000, 2311.06000000, 2399.44000000, 2366.30000000, 1, 0),
(260, '2024-10-03', 'ATOMUSDT', 4.42600000, 4.45000000, 4.24200000, 4.48500000, 4.42600000, 1, 0),
(261, '2024-10-03', 'NEARUSDT', 4.66400000, 4.73900000, 4.48900000, 4.76500000, 4.66400000, 1, 0),
(262, '2024-10-03', 'INJUSDT', 19.16000000, 19.53000000, 18.65000000, 20.50000000, 19.16000000, 1, 0),
(263, '2024-10-03', 'LTCUSDT', 64.03000000, 64.43000000, 61.99000000, 63.97000000, 64.03000000, 1, 0),
(264, '2024-10-03', 'PAXGUSDT', 2670.00000000, 2672.00000000, 2653.00000000, 2666.00000000, 2670.00000000, 1, 0),
(265, '2024-10-03', 'RUNEUSDT', 4.52900000, 4.62000000, 4.44600000, 4.68800000, 4.52900000, 1, 0),
(266, '2024-10-03', 'SHIBUSDT', 0.00001644, 0.00001663, 0.00001552, 0.00001670, 0.00001644, 1, 0),
(267, '2024-10-03', 'DOGEUSDT', 0.10645000, 0.10673000, 0.10147000, 0.10599000, 0.10645000, 1, 0),
(268, '2024-10-04', 'INJUSDT', 19.98000000, 20.55000000, 19.17000000, 19.16000000, 19.98000000, 0, 1),
(269, '2024-10-04', 'BNBUSDT', 553.60000000, 557.50000000, 546.50000000, 546.40000000, 553.60000000, 0, 1),
(270, '2024-10-04', 'BTCUSDT', 61856.98000000, 62463.99000000, 60936.00000000, 60934.96000000, 61856.98000000, 0, 1),
(271, '2024-10-04', 'ETHUSDT', 2399.30000000, 2438.01000000, 2356.93000000, 2366.30000000, 2399.30000000, 0, 1),
(272, '2024-10-04', 'ATOMUSDT', 4.59400000, 4.66200000, 4.43400000, 4.42600000, 4.59400000, 0, 1),
(273, '2024-10-04', 'NEARUSDT', 4.72700000, 4.86000000, 4.65200000, 4.66400000, 4.72700000, 0, 1),
(274, '2024-10-04', 'LTCUSDT', 64.88000000, 65.44000000, 63.94000000, 64.03000000, 64.88000000, 0, 1),
(275, '2024-10-04', 'PAXGUSDT', 2657.00000000, 2674.00000000, 2653.00000000, 2670.00000000, 2657.00000000, 0, 1),
(276, '2024-10-04', 'RUNEUSDT', 4.77600000, 4.82700000, 4.52900000, 4.52900000, 4.77600000, 0, 1),
(277, '2024-10-04', 'SHIBUSDT', 0.00001728, 0.00001791, 0.00001646, 0.00001644, 0.00001728, 0, 1),
(278, '2024-10-04', 'DOGEUSDT', 0.10801000, 0.11055000, 0.10654000, 0.10645000, 0.10801000, 0, 1),
(279, '2024-10-05', 'BNBUSDT', 562.00000000, 565.90000000, 553.90000000, 553.60000000, 562.00000000, 0, 1),
(280, '2024-10-05', 'BTCUSDT', 61899.80000000, 62356.68000000, 61721.90000000, 61856.98000000, 61899.80000000, 1, 0),
(281, '2024-10-05', 'ETHUSDT', 2414.04000000, 2426.43000000, 2390.63000000, 2399.30000000, 2414.04000000, 1, 0),
(282, '2024-10-05', 'ATOMUSDT', 4.57000000, 4.71100000, 4.57000000, 4.59400000, 4.57000000, 0, 1),
(283, '2024-10-05', 'NEARUSDT', 4.74800000, 4.83400000, 4.63900000, 4.72700000, 4.74800000, 1, 0),
(284, '2024-10-05', 'INJUSDT', 19.73000000, 20.50000000, 19.58000000, 19.98000000, 19.73000000, 1, 0),
(285, '2024-10-05', 'LTCUSDT', 66.33000000, 66.64000000, 64.91000000, 64.88000000, 66.33000000, 0, 1),
(286, '2024-10-05', 'PAXGUSDT', 2681.00000000, 2697.00000000, 2655.00000000, 2657.00000000, 2681.00000000, 0, 1),
(287, '2024-10-05', 'RUNEUSDT', 4.81600000, 4.87300000, 4.70000000, 4.77600000, 4.81600000, 0, 1),
(288, '2024-10-05', 'SHIBUSDT', 0.00001720, 0.00001787, 0.00001693, 0.00001728, 0.00001720, 1, 0),
(289, '2024-10-05', 'DOGEUSDT', 0.10863000, 0.11002000, 0.10774000, 0.10801000, 0.10863000, 1, 0),
(290, '2024-10-06', 'BTCUSDT', 63529.98000000, 63931.66000000, 61835.99000000, 61899.80000000, 63529.98000000, 0, 1),
(291, '2024-10-06', 'BNBUSDT', 573.30000000, 577.10000000, 561.30000000, 562.00000000, 573.30000000, 0, 1),
(292, '2024-10-06', 'ETHUSDT', 2495.21000000, 2510.47000000, 2410.89000000, 2414.04000000, 2495.21000000, 0, 1),
(293, '2024-10-06', 'ATOMUSDT', 4.73200000, 4.78900000, 4.55500000, 4.57000000, 4.73200000, 0, 1),
(294, '2024-10-06', 'NEARUSDT', 5.20300000, 5.27600000, 4.72000000, 4.74800000, 5.20300000, 0, 1),
(295, '2024-10-06', 'INJUSDT', 21.16000000, 21.49000000, 19.69000000, 19.73000000, 21.16000000, 0, 1),
(296, '2024-10-06', 'LTCUSDT', 67.68000000, 67.93000000, 66.35000000, 66.33000000, 67.68000000, 0, 1),
(297, '2024-10-06', 'PAXGUSDT', 2678.00000000, 2691.00000000, 2674.00000000, 2681.00000000, 2678.00000000, 1, 0),
(298, '2024-10-06', 'RUNEUSDT', 4.99800000, 5.06600000, 4.79100000, 4.81600000, 4.99800000, 0, 1),
(299, '2024-10-06', 'SHIBUSDT', 0.00001849, 0.00001877, 0.00001713, 0.00001720, 0.00001849, 0, 1),
(300, '2024-10-06', 'DOGEUSDT', 0.11390000, 0.11543000, 0.10849000, 0.10863000, 0.11390000, 0, 1),
(301, '2024-10-07', 'BTCUSDT', 62597.24000000, 64378.00000000, 62215.22000000, 63529.98000000, 62597.24000000, 0, 1),
(302, '2024-10-07', 'BNBUSDT', 569.70000000, 581.10000000, 564.10000000, 573.30000000, 569.70000000, 0, 1),
(303, '2024-10-07', 'ETHUSDT', 2437.59000000, 2518.00000000, 2412.06000000, 2495.21000000, 2437.59000000, 0, 1),
(304, '2024-10-07', 'ATOMUSDT', 4.44300000, 4.73400000, 4.41500000, 4.73200000, 4.44300000, 1, 0),
(305, '2024-10-07', 'NEARUSDT', 5.12700000, 5.31200000, 5.01800000, 5.20300000, 5.12700000, 0, 1),
(306, '2024-10-07', 'INJUSDT', 20.74000000, 21.74000000, 20.37000000, 21.16000000, 20.74000000, 0, 1),
(307, '2024-10-07', 'LTCUSDT', 65.23000000, 67.79000000, 64.59000000, 67.68000000, 65.23000000, 1, 0),
(308, '2024-10-07', 'PAXGUSDT', 2657.00000000, 2679.00000000, 2656.00000000, 2678.00000000, 2657.00000000, 1, 0),
(309, '2024-10-07', 'RUNEUSDT', 5.09500000, 5.34000000, 4.99800000, 4.99800000, 5.09500000, 0, 1),
(310, '2024-10-07', 'SHIBUSDT', 0.00001753, 0.00001862, 0.00001741, 0.00001849, 0.00001753, 1, 0),
(311, '2024-10-07', 'DOGEUSDT', 0.10922000, 0.11452000, 0.10830000, 0.11390000, 0.10922000, 1, 0),
(312, '2024-10-08', 'ATOMUSDT', 4.34600000, 4.47000000, 4.32200000, 4.44300000, 4.34600000, 1, 0),
(313, '2024-10-08', 'NEARUSDT', 4.89100000, 5.14900000, 4.86200000, 5.12700000, 4.89100000, 1, 0),
(314, '2024-10-08', 'BTCUSDT', 62255.99000000, 62830.01000000, 61904.01000000, 62597.24000000, 62255.99000000, 1, 0),
(315, '2024-10-08', 'BNBUSDT', 575.30000000, 586.10000000, 560.90000000, 569.70000000, 575.30000000, 0, 1),
(316, '2024-10-08', 'ETHUSDT', 2445.20000000, 2468.01000000, 2409.21000000, 2437.59000000, 2445.20000000, 1, 0),
(317, '2024-10-08', 'INJUSDT', 19.72000000, 20.85000000, 19.25000000, 20.74000000, 19.72000000, 1, 0),
(318, '2024-10-08', 'LTCUSDT', 65.57000000, 66.15000000, 64.67000000, 65.23000000, 65.57000000, 1, 0),
(319, '2024-10-08', 'PAXGUSDT', 2628.00000000, 2668.00000000, 2617.00000000, 2657.00000000, 2628.00000000, 1, 0),
(320, '2024-10-08', 'RUNEUSDT', 4.97300000, 5.11200000, 4.86200000, 5.09500000, 4.97300000, 1, 0),
(321, '2024-10-08', 'SHIBUSDT', 0.00001737, 0.00001763, 0.00001703, 0.00001753, 0.00001737, 1, 0),
(322, '2024-10-08', 'DOGEUSDT', 0.10845000, 0.10969000, 0.10539000, 0.10922000, 0.10845000, 1, 0),
(323, '2024-10-09', 'NEARUSDT', 4.64800000, 4.96900000, 4.56100000, 4.89100000, 4.64800000, 1, 0),
(324, '2024-10-09', 'BTCUSDT', 60865.29000000, 62534.00000000, 60440.03000000, 62255.99000000, 60865.29000000, 1, 0),
(325, '2024-10-09', 'BNBUSDT', 569.70000000, 585.50000000, 567.50000000, 575.30000000, 569.70000000, 1, 0),
(326, '2024-10-09', 'ETHUSDT', 2395.30000000, 2465.80000000, 2361.10000000, 2445.20000000, 2395.30000000, 1, 0),
(327, '2024-10-09', 'ATOMUSDT', 4.26500000, 4.38800000, 4.18000000, 4.34600000, 4.26500000, 1, 0),
(328, '2024-10-09', 'INJUSDT', 19.51000000, 20.04000000, 19.12000000, 19.72000000, 19.51000000, 1, 0),
(329, '2024-10-09', 'LTCUSDT', 64.87000000, 65.94000000, 64.17000000, 65.57000000, 64.87000000, 1, 0),
(330, '2024-10-09', 'PAXGUSDT', 2626.00000000, 2643.00000000, 2618.00000000, 2628.00000000, 2626.00000000, 1, 0),
(331, '2024-10-09', 'RUNEUSDT', 4.65200000, 5.05700000, 4.55100000, 4.97300000, 4.65200000, 1, 0),
(332, '2024-10-09', 'SHIBUSDT', 0.00001712, 0.00001796, 0.00001676, 0.00001737, 0.00001712, 0, 1),
(333, '2024-10-09', 'DOGEUSDT', 0.10786000, 0.11129000, 0.10642000, 0.10845000, 0.10786000, 0, 1),
(334, '2024-10-10', 'NEARUSDT', 4.60900000, 4.67400000, 4.44000000, 4.64800000, 4.60900000, 1, 0),
(335, '2024-10-10', 'BTCUSDT', 60633.32000000, 61304.31000000, 59040.00000000, 60865.29000000, 60633.32000000, 1, 0),
(336, '2024-10-10', 'BNBUSDT', 564.20000000, 572.80000000, 552.50000000, 569.70000000, 564.20000000, 1, 0),
(337, '2024-10-10', 'ETHUSDT', 2410.15000000, 2418.07000000, 2335.86000000, 2395.30000000, 2410.15000000, 1, 0),
(338, '2024-10-10', 'ATOMUSDT', 4.17300000, 4.29300000, 4.05300000, 4.26500000, 4.17300000, 1, 0),
(339, '2024-10-10', 'INJUSDT', 19.28000000, 19.77000000, 18.62000000, 19.51000000, 19.28000000, 1, 0),
(340, '2024-10-10', 'LTCUSDT', 65.02000000, 65.16000000, 63.45000000, 64.87000000, 65.02000000, 1, 0),
(341, '2024-10-10', 'PAXGUSDT', 2655.00000000, 2657.00000000, 2623.00000000, 2626.00000000, 2655.00000000, 0, 1),
(342, '2024-10-10', 'RUNEUSDT', 4.76400000, 4.77900000, 4.56000000, 4.65200000, 4.76400000, 1, 0),
(343, '2024-10-10', 'SHIBUSDT', 0.00001681, 0.00001717, 0.00001608, 0.00001712, 0.00001681, 1, 0),
(344, '2024-10-10', 'DOGEUSDT', 0.10755000, 0.10853000, 0.10336000, 0.10786000, 0.10755000, 1, 0),
(345, '2024-10-11', 'NEARUSDT', 4.70000000, 4.80500000, 4.58600000, 4.60900000, 4.70000000, 0, 1),
(346, '2024-10-11', 'BTCUSDT', 62568.00000000, 63254.60000000, 60587.69000000, 60633.32000000, 62568.00000000, 0, 1),
(347, '2024-10-11', 'BNBUSDT', 576.70000000, 577.30000000, 560.30000000, 564.20000000, 576.70000000, 0, 1),
(348, '2024-10-11', 'ETHUSDT', 2439.04000000, 2464.69000000, 2403.86000000, 2410.15000000, 2439.04000000, 0, 1),
(349, '2024-10-11', 'ATOMUSDT', 4.29600000, 4.31700000, 4.16000000, 4.17300000, 4.29600000, 0, 1),
(350, '2024-10-11', 'INJUSDT', 20.43000000, 20.62000000, 19.17000000, 19.28000000, 20.43000000, 0, 1),
(351, '2024-10-11', 'RUNEUSDT', 4.90300000, 5.08200000, 4.72800000, 4.76400000, 4.90300000, 0, 1),
(352, '2024-10-11', 'LTCUSDT', 65.20000000, 65.83000000, 64.62000000, 65.02000000, 65.20000000, 0, 1),
(353, '2024-10-11', 'PAXGUSDT', 2666.00000000, 2675.00000000, 2653.00000000, 2655.00000000, 2666.00000000, 0, 1),
(354, '2024-10-11', 'SHIBUSDT', 0.00001767, 0.00001801, 0.00001671, 0.00001681, 0.00001767, 0, 1),
(355, '2024-10-11', 'DOGEUSDT', 0.10971000, 0.11151000, 0.10720000, 0.10755000, 0.10971000, 0, 1),
(356, '2024-10-12', 'BNBUSDT', 573.60000000, 578.90000000, 572.80000000, 576.70000000, 573.60000000, 0, 1),
(357, '2024-10-12', 'BTCUSDT', 62717.99000000, 63456.96000000, 62579.00000000, 62568.00000000, 62717.99000000, 0, 1),
(358, '2024-10-12', 'NEARUSDT', 4.75400000, 4.91200000, 4.70400000, 4.70000000, 4.75400000, 0, 1),
(359, '2024-10-12', 'ETHUSDT', 2458.68000000, 2488.88000000, 2439.20000000, 2439.04000000, 2458.68000000, 0, 1),
(360, '2024-10-12', 'ATOMUSDT', 4.32200000, 4.38900000, 4.28800000, 4.29600000, 4.32200000, 0, 1),
(361, '2024-10-12', 'INJUSDT', 20.25000000, 21.03000000, 20.18000000, 20.43000000, 20.25000000, 0, 1),
(362, '2024-10-12', 'RUNEUSDT', 4.96200000, 5.12100000, 4.90300000, 4.90300000, 4.96200000, 0, 1),
(363, '2024-10-12', 'LTCUSDT', 65.57000000, 66.65000000, 65.23000000, 65.20000000, 65.57000000, 0, 1),
(364, '2024-10-12', 'PAXGUSDT', 2663.00000000, 2671.00000000, 2657.00000000, 2666.00000000, 2663.00000000, 1, 0),
(365, '2024-10-12', 'SHIBUSDT', 0.00001761, 0.00001810, 0.00001757, 0.00001767, 0.00001761, 0, 1),
(366, '2024-10-12', 'DOGEUSDT', 0.11099000, 0.11212000, 0.10971000, 0.10971000, 0.11099000, 0, 1),
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
(377, '2024-10-13', 'RUNEUSDT', 5.01600000, 5.01600000, 4.69800000, 4.96200000, 5.01600000, 1, 0),
(378, '2024-10-13', 'SHIBUSDT', 0.00001802, 0.00001804, 0.00001715, 0.00001761, 0.00001802, 1, 0),
(379, '2024-10-13', 'DOGEUSDT', 0.11280000, 0.11282000, 0.10898000, 0.11099000, 0.11280000, 0, 1),
(380, '2024-10-14', 'NEARUSDT', 4.91300000, 5.07600000, 4.74600000, 4.82700000, 4.91300000, 0, 1),
(381, '2024-10-14', 'BTCUSDT', 65338.00000000, 66450.01000000, 63830.00000000, 64271.85000000, 65338.00000000, 0, 1),
(382, '2024-10-14', 'BNBUSDT', 584.40000000, 592.20000000, 577.00000000, 580.70000000, 584.40000000, 0, 1),
(383, '2024-10-14', 'ETHUSDT', 2609.98000000, 2652.65000000, 2514.20000000, 2520.19000000, 2609.98000000, 0, 1),
(384, '2024-10-14', 'ATOMUSDT', 4.48000000, 4.54400000, 4.38800000, 4.42500000, 4.48000000, 0, 1),
(385, '2024-10-14', 'INJUSDT', 21.35000000, 21.98000000, 20.68000000, 21.12000000, 21.35000000, 0, 1),
(386, '2024-10-14', 'RUNEUSDT', 5.23900000, 5.38300000, 4.95700000, 5.01600000, 5.23900000, 0, 1),
(387, '2024-10-14', 'LTCUSDT', 66.80000000, 67.81000000, 65.23000000, 65.45000000, 66.80000000, 0, 1),
(388, '2024-10-14', 'PAXGUSDT', 2656.00000000, 2676.00000000, 2655.00000000, 2671.00000000, 2656.00000000, 0, 1),
(389, '2024-10-14', 'SHIBUSDT', 0.00001839, 0.00001896, 0.00001773, 0.00001802, 0.00001839, 0, 1),
(390, '2024-10-14', 'DOGEUSDT', 0.11620000, 0.11894000, 0.11127000, 0.11280000, 0.11620000, 0, 1),
(391, '2024-10-15', 'BTCUSDT', 67112.51000000, 67785.81000000, 64997.50000000, 65338.00000000, 67112.51000000, 0, 1),
(392, '2024-10-15', 'BNBUSDT', 594.10000000, 599.50000000, 579.40000000, 584.40000000, 594.10000000, 0, 1),
(393, '2024-10-15', 'ETHUSDT', 2618.06000000, 2683.04000000, 2543.78000000, 2609.98000000, 2618.06000000, 0, 1),
(394, '2024-10-15', 'ATOMUSDT', 4.46900000, 4.58400000, 4.38500000, 4.48000000, 4.46900000, 0, 1),
(395, '2024-10-15', 'NEARUSDT', 5.00700000, 5.27100000, 4.88900000, 4.91300000, 5.00700000, 0, 1),
(396, '2024-10-15', 'INJUSDT', 21.09000000, 22.27000000, 20.77000000, 21.35000000, 21.09000000, 0, 1),
(397, '2024-10-15', 'RUNEUSDT', 5.20000000, 5.38900000, 4.98200000, 5.23900000, 5.20000000, 0, 1),
(398, '2024-10-15', 'LTCUSDT', 71.58000000, 72.96000000, 65.57000000, 66.80000000, 71.58000000, 0, 1),
(399, '2024-10-15', 'PAXGUSDT', 2675.00000000, 2680.00000000, 2651.00000000, 2656.00000000, 2675.00000000, 0, 1),
(400, '2024-10-15', 'SHIBUSDT', 0.00001822, 0.00001876, 0.00001755, 0.00001839, 0.00001822, 1, 0),
(401, '2024-10-15', 'DOGEUSDT', 0.11650000, 0.11818000, 0.11059000, 0.11620000, 0.11650000, 1, 0),
(402, '2024-10-16', 'BTCUSDT', 67609.71000000, 68347.67000000, 66776.01000000, 67112.51000000, 67609.71000000, 0, 1),
(403, '2024-10-16', 'BNBUSDT', 604.10000000, 606.30000000, 589.80000000, 594.10000000, 604.10000000, 0, 1),
(404, '2024-10-16', 'ETHUSDT', 2640.10000000, 2645.37000000, 2593.53000000, 2618.06000000, 2640.10000000, 1, 0),
(405, '2024-10-16', 'ATOMUSDT', 4.44600000, 4.50200000, 4.38900000, 4.46900000, 4.44600000, 1, 0),
(406, '2024-10-16', 'NEARUSDT', 4.99200000, 5.05800000, 4.88800000, 5.00700000, 4.99200000, 1, 0),
(407, '2024-10-16', 'INJUSDT', 21.03000000, 21.32000000, 20.58000000, 21.09000000, 21.03000000, 1, 0),
(408, '2024-10-16', 'RUNEUSDT', 5.10800000, 5.27900000, 5.05800000, 5.20000000, 5.10800000, 1, 0),
(409, '2024-10-16', 'LTCUSDT', 70.80000000, 72.05000000, 69.41000000, 71.58000000, 70.80000000, 1, 0),
(410, '2024-10-16', 'PAXGUSDT', 2684.00000000, 2690.00000000, 2674.00000000, 2675.00000000, 2684.00000000, 0, 1),
(411, '2024-10-16', 'SHIBUSDT', 0.00001844, 0.00001911, 0.00001790, 0.00001822, 0.00001844, 0, 1),
(412, '2024-10-16', 'DOGEUSDT', 0.12526000, 0.12965000, 0.11633000, 0.11650000, 0.12526000, 0, 1),
(413, '2024-10-17', 'BTCUSDT', 67602.33000000, 68167.70000000, 66683.42000000, 67609.71000000, 67602.33000000, 1, 0),
(414, '2024-10-17', 'BNBUSDT', 594.30000000, 605.30000000, 585.70000000, 604.10000000, 594.30000000, 1, 0),
(415, '2024-10-17', 'ETHUSDT', 2611.65000000, 2650.97000000, 2578.73000000, 2640.10000000, 2611.65000000, 0, 1),
(416, '2024-10-17', 'ATOMUSDT', 4.32400000, 4.44800000, 4.24100000, 4.44600000, 4.32400000, 1, 0),
(417, '2024-10-17', 'NEARUSDT', 4.78800000, 4.99500000, 4.65600000, 4.99200000, 4.78800000, 1, 0),
(418, '2024-10-17', 'INJUSDT', 21.17000000, 23.28000000, 20.36000000, 21.03000000, 21.17000000, 0, 1),
(419, '2024-10-17', 'RUNEUSDT', 4.89300000, 5.11100000, 4.70400000, 5.10800000, 4.89300000, 1, 0),
(420, '2024-10-17', 'LTCUSDT', 72.94000000, 74.73000000, 70.36000000, 70.80000000, 72.94000000, 0, 1),
(421, '2024-10-17', 'PAXGUSDT', 2715.00000000, 2717.00000000, 2684.00000000, 2684.00000000, 2715.00000000, 0, 1),
(422, '2024-10-17', 'SHIBUSDT', 0.00001869, 0.00001923, 0.00001760, 0.00001844, 0.00001869, 0, 1),
(423, '2024-10-17', 'DOGEUSDT', 0.13249000, 0.13613000, 0.12060000, 0.12526000, 0.13249000, 0, 1),
(424, '2024-10-18', 'BTCUSDT', 68466.03000000, 68964.00000000, 67569.67000000, 67602.33000000, 68466.03000000, 0, 1),
(425, '2024-10-18', 'BNBUSDT', 599.00000000, 602.20000000, 594.00000000, 594.30000000, 599.00000000, 1, 0),
(426, '2024-10-18', 'ETHUSDT', 2646.78000000, 2671.70000000, 2610.64000000, 2611.65000000, 2646.78000000, 0, 1),
(427, '2024-10-18', 'ATOMUSDT', 4.42600000, 4.45300000, 4.30200000, 4.32400000, 4.42600000, 0, 1),
(428, '2024-10-18', 'NEARUSDT', 4.90400000, 4.94400000, 4.74100000, 4.78800000, 4.90400000, 1, 0),
(429, '2024-10-18', 'INJUSDT', 22.04000000, 22.31000000, 21.19000000, 21.17000000, 22.04000000, 1, 0),
(430, '2024-10-18', 'RUNEUSDT', 5.11600000, 5.15100000, 4.83800000, 4.89300000, 5.11600000, 0, 1),
(431, '2024-10-18', 'LTCUSDT', 73.79000000, 74.04000000, 71.91000000, 72.94000000, 73.79000000, 1, 0),
(432, '2024-10-18', 'PAXGUSDT', 2726.00000000, 2732.00000000, 2707.00000000, 2715.00000000, 2726.00000000, 0, 1),
(433, '2024-10-18', 'SHIBUSDT', 0.00001924, 0.00001948, 0.00001848, 0.00001869, 0.00001924, 0, 1),
(434, '2024-10-18', 'DOGEUSDT', 0.14435000, 0.14648000, 0.13152000, 0.13249000, 0.14435000, 0, 1),
(435, '2024-10-19', 'ATOMUSDT', 4.41700000, 4.48400000, 4.36400000, 4.42600000, 4.41700000, 0, 1),
(436, '2024-10-19', 'NEARUSDT', 4.73800000, 4.92700000, 4.72300000, 4.90400000, 4.73800000, 1, 0),
(437, '2024-10-19', 'INJUSDT', 21.87000000, 22.41000000, 21.67000000, 22.04000000, 21.87000000, 0, 1),
(438, '2024-10-19', 'RUNEUSDT', 4.88700000, 5.13000000, 4.87400000, 5.11600000, 4.88700000, 1, 0),
(439, '2024-10-19', 'BTCUSDT', 68192.37000000, 68559.99000000, 68040.01000000, 68466.03000000, 68192.37000000, 1, 0),
(440, '2024-10-19', 'BNBUSDT', 594.60000000, 599.50000000, 593.50000000, 599.00000000, 594.60000000, 1, 0),
(441, '2024-10-19', 'ETHUSDT', 2641.60000000, 2653.56000000, 2632.53000000, 2646.78000000, 2641.60000000, 1, 0),
(442, '2024-10-19', 'LTCUSDT', 75.05000000, 75.99000000, 73.76000000, 73.79000000, 75.05000000, 0, 1),
(443, '2024-10-19', 'PAXGUSDT', 2740.00000000, 2745.00000000, 2725.00000000, 2726.00000000, 2740.00000000, 0, 1),
(444, '2024-10-19', 'SHIBUSDT', 0.00001867, 0.00001940, 0.00001859, 0.00001924, 0.00001867, 1, 0),
(445, '2024-10-19', 'DOGEUSDT', 0.14142000, 0.14650000, 0.13947000, 0.14435000, 0.14142000, 0, 1),
(446, '2024-10-20', 'BTCUSDT', 68935.47000000, 69451.74000000, 68176.26000000, 68192.37000000, 68935.47000000, 0, 1),
(447, '2024-10-20', 'NEARUSDT', 4.96100000, 5.05300000, 4.71100000, 4.73800000, 4.96100000, 0, 1),
(448, '2024-10-20', 'BNBUSDT', 604.30000000, 608.40000000, 594.40000000, 594.60000000, 604.30000000, 0, 1),
(449, '2024-10-20', 'ETHUSDT', 2733.76000000, 2764.00000000, 2638.89000000, 2641.60000000, 2733.76000000, 0, 1),
(450, '2024-10-20', 'ATOMUSDT', 4.83300000, 4.83300000, 4.40900000, 4.41700000, 4.83300000, 0, 1),
(451, '2024-10-20', 'INJUSDT', 21.97000000, 22.43000000, 21.67000000, 21.87000000, 21.97000000, 0, 1),
(452, '2024-10-20', 'RUNEUSDT', 5.14300000, 5.28700000, 4.87300000, 4.88700000, 5.14300000, 0, 1),
(453, '2024-10-20', 'LTCUSDT', 73.71000000, 75.64000000, 73.60000000, 75.05000000, 73.71000000, 1, 0),
(454, '2024-10-20', 'PAXGUSDT', 2745.00000000, 2749.00000000, 2738.00000000, 2740.00000000, 2745.00000000, 0, 1),
(455, '2024-10-20', 'SHIBUSDT', 0.00001901, 0.00001929, 0.00001843, 0.00001867, 0.00001901, 1, 0),
(456, '2024-10-20', 'DOGEUSDT', 0.14557000, 0.14660000, 0.13732000, 0.14142000, 0.14557000, 0, 1),
(457, '2024-10-21', 'BTCUSDT', 67390.02000000, 69155.27000000, 66614.00000000, 68935.47000000, 67390.02000000, 1, 0),
(458, '2024-10-21', 'BNBUSDT', 598.40000000, 611.40000000, 591.70000000, 604.30000000, 598.40000000, 0, 1),
(459, '2024-10-21', 'ETHUSDT', 2644.59000000, 2743.23000000, 2618.69000000, 2733.76000000, 2644.59000000, 1, 0),
(460, '2024-10-21', 'ATOMUSDT', 4.90000000, 5.09900000, 4.79900000, 4.83300000, 4.90000000, 0, 1),
(461, '2024-10-21', 'NEARUSDT', 4.79000000, 5.04800000, 4.71800000, 4.96100000, 4.79000000, 1, 0),
(462, '2024-10-21', 'INJUSDT', 21.42000000, 22.17000000, 20.99000000, 21.97000000, 21.42000000, 1, 0),
(463, '2024-10-21', 'RUNEUSDT', 5.03400000, 5.22000000, 4.87700000, 5.14300000, 5.03400000, 1, 0),
(464, '2024-10-21', 'LTCUSDT', 71.04000000, 74.13000000, 70.13000000, 73.71000000, 71.04000000, 1, 0),
(465, '2024-10-21', 'PAXGUSDT', 2749.00000000, 2754.00000000, 2732.00000000, 2745.00000000, 2749.00000000, 0, 1),
(466, '2024-10-21', 'SHIBUSDT', 0.00001840, 0.00001932, 0.00001802, 0.00001901, 0.00001840, 0, 1),
(467, '2024-10-21', 'DOGEUSDT', 0.14464000, 0.14954000, 0.13841000, 0.14557000, 0.14464000, 0, 1),
(468, '2024-10-22', 'BNBUSDT', 590.50000000, 599.80000000, 587.10000000, 598.40000000, 590.50000000, 1, 0),
(469, '2024-10-22', 'ETHUSDT', 2616.39000000, 2659.27000000, 2602.77000000, 2644.59000000, 2616.39000000, 1, 0),
(470, '2024-10-22', 'ATOMUSDT', 4.82600000, 4.96100000, 4.70500000, 4.90000000, 4.82600000, 1, 0),
(471, '2024-10-22', 'NEARUSDT', 4.63000000, 4.83200000, 4.59500000, 4.79000000, 4.63000000, 1, 0),
(472, '2024-10-22', 'INJUSDT', 20.66000000, 21.60000000, 20.59000000, 21.42000000, 20.66000000, 1, 0),
(473, '2024-10-22', 'RUNEUSDT', 5.16800000, 5.31600000, 5.00500000, 5.03400000, 5.16800000, 0, 1),
(474, '2024-10-22', 'BTCUSDT', 67082.10000000, 67823.00000000, 66650.15000000, 67390.02000000, 67082.10000000, 1, 0),
(475, '2024-10-22', 'LTCUSDT', 69.08000000, 71.55000000, 68.76000000, 71.04000000, 69.08000000, 1, 0),
(476, '2024-10-22', 'PAXGUSDT', 2756.00000000, 2762.00000000, 2746.00000000, 2749.00000000, 2756.00000000, 0, 1),
(477, '2024-10-22', 'SHIBUSDT', 0.00001796, 0.00001860, 0.00001784, 0.00001840, 0.00001796, 1, 0),
(478, '2024-10-22', 'DOGEUSDT', 0.13805000, 0.14643000, 0.13668000, 0.14464000, 0.13805000, 1, 0),
(479, '2024-10-23', 'BTCUSDT', 67224.00000000, 67585.61000000, 65274.71000000, 67082.10000000, 67224.00000000, 1, 0),
(480, '2024-10-23', 'BNBUSDT', 590.60000000, 591.90000000, 573.30000000, 590.50000000, 590.60000000, 1, 0),
(481, '2024-10-23', 'ETHUSDT', 2545.87000000, 2623.00000000, 2466.00000000, 2616.39000000, 2545.87000000, 1, 0),
(482, '2024-10-23', 'ATOMUSDT', 4.68500000, 4.85500000, 4.56500000, 4.82600000, 4.68500000, 1, 0),
(483, '2024-10-23', 'NEARUSDT', 4.67500000, 4.73400000, 4.45100000, 4.63000000, 4.67500000, 1, 0),
(484, '2024-10-23', 'INJUSDT', 20.38000000, 20.78000000, 19.59000000, 20.66000000, 20.38000000, 1, 0),
(485, '2024-10-23', 'RUNEUSDT', 5.26600000, 5.36600000, 4.92700000, 5.16800000, 5.26600000, 0, 1),
(486, '2024-10-23', 'LTCUSDT', 69.97000000, 70.50000000, 67.98000000, 69.08000000, 69.97000000, 1, 0),
(487, '2024-10-23', 'PAXGUSDT', 2745.00000000, 2776.00000000, 2728.00000000, 2756.00000000, 2745.00000000, 0, 1),
(488, '2024-10-23', 'SHIBUSDT', 0.00001780, 0.00001807, 0.00001706, 0.00001796, 0.00001780, 1, 0),
(489, '2024-10-23', 'DOGEUSDT', 0.13931000, 0.14292000, 0.13315000, 0.13805000, 0.13931000, 1, 0),
(490, '2024-10-24', 'BTCUSDT', 68054.05000000, 68839.47000000, 66762.01000000, 67224.00000000, 68054.05000000, 0, 1),
(491, '2024-10-24', 'BNBUSDT', 596.60000000, 598.00000000, 586.70000000, 590.60000000, 596.60000000, 0, 1),
(492, '2024-10-24', 'ETHUSDT', 2522.01000000, 2561.44000000, 2509.41000000, 2545.87000000, 2522.01000000, 1, 0),
(493, '2024-10-24', 'ATOMUSDT', 4.77100000, 4.85800000, 4.56900000, 4.68500000, 4.77100000, 0, 1),
(494, '2024-10-24', 'NEARUSDT', 4.64700000, 4.77600000, 4.55500000, 4.67500000, 4.64700000, 0, 1),
(495, '2024-10-24', 'INJUSDT', 20.34000000, 20.57000000, 19.84000000, 20.38000000, 20.34000000, 1, 0),
(496, '2024-10-24', 'RUNEUSDT', 5.33500000, 5.51400000, 5.11700000, 5.26600000, 5.33500000, 0, 1),
(497, '2024-10-24', 'LTCUSDT', 71.13000000, 71.40000000, 69.30000000, 69.97000000, 71.13000000, 0, 1),
(498, '2024-10-24', 'PAXGUSDT', 2749.00000000, 2763.00000000, 2739.00000000, 2745.00000000, 2749.00000000, 1, 0),
(499, '2024-10-24', 'SHIBUSDT', 0.00001783, 0.00001815, 0.00001741, 0.00001780, 0.00001783, 0, 1),
(500, '2024-10-24', 'DOGEUSDT', 0.13975000, 0.14335000, 0.13617000, 0.13931000, 0.13975000, 0, 1),
(501, '2024-10-25', 'BTCUSDT', 66928.48000000, 68759.99000000, 65810.01000000, 68054.05000000, 66928.48000000, 1, 0),
(502, '2024-10-25', 'BNBUSDT', 578.90000000, 595.60000000, 567.80000000, 596.60000000, 578.90000000, 1, 0),
(503, '2024-10-25', 'ETHUSDT', 2453.04000000, 2564.40000000, 2393.11000000, 2522.01000000, 2453.04000000, 0, 1),
(504, '2024-10-25', 'ATOMUSDT', 4.46500000, 4.77700000, 4.32400000, 4.77100000, 4.46500000, 1, 0),
(505, '2024-10-25', 'NEARUSDT', 4.21900000, 4.61500000, 4.06000000, 4.64700000, 4.21900000, 1, 0),
(506, '2024-10-25', 'INJUSDT', 18.63000000, 20.38000000, 17.71000000, 20.34000000, 18.63000000, 1, 0),
(507, '2024-10-25', 'RUNEUSDT', 4.88100000, 5.31800000, 4.76000000, 5.33500000, 4.88100000, 1, 0),
(508, '2024-10-25', 'LTCUSDT', 69.39000000, 72.26000000, 67.08000000, 71.13000000, 69.39000000, 0, 1),
(509, '2024-10-25', 'PAXGUSDT', 2758.00000000, 2769.00000000, 2744.00000000, 2749.00000000, 2758.00000000, 0, 1),
(510, '2024-10-25', 'SHIBUSDT', 0.00001676, 0.00001785, 0.00001605, 0.00001783, 0.00001676, 1, 0),
(512, '2024-10-25', 'DOGEUSDT', 0.13353000, 0.13970000, 0.12871000, 0.13975000, 0.13353000, 1, 0),
(513, '2024-10-25', 'FETUSDT', 1.21300000, 1.21900000, 1.19500000, 0.00000000, 1.21300000, 1, 0),
(514, '2024-10-25', 'THETAUSDT', 1.14700000, 1.15500000, 1.13200000, 0.00000000, 1.14700000, 1, 0),
(515, '2024-10-26', 'BTCUSDT', 67290.01000000, 67414.94000000, 66761.80000000, 66928.48000000, 67290.01000000, 1, 0),
(516, '2024-10-26', 'BNBUSDT', 585.80000000, 587.00000000, 578.20000000, 578.90000000, 585.80000000, 1, 0),
(517, '2024-10-26', 'ETHUSDT', 2483.41000000, 2507.00000000, 2443.33000000, 2453.04000000, 2483.41000000, 1, 0),
(518, '2024-10-26', 'ATOMUSDT', 4.38100000, 4.50700000, 4.30900000, 4.46500000, 4.38100000, 1, 0),
(519, '2024-10-26', 'NEARUSDT', 4.25800000, 4.27300000, 4.14100000, 4.21900000, 4.25800000, 1, 0),
(520, '2024-10-26', 'INJUSDT', 18.49000000, 18.81000000, 18.01000000, 18.63000000, 18.49000000, 1, 0),
(521, '2024-10-26', 'RUNEUSDT', 5.09700000, 5.10100000, 4.86600000, 4.88100000, 5.09700000, 1, 0),
(522, '2024-10-26', 'LTCUSDT', 69.10000000, 69.63000000, 68.04000000, 69.39000000, 69.10000000, 1, 0),
(523, '2024-10-26', 'PAXGUSDT', 2763.00000000, 2766.00000000, 2748.00000000, 2758.00000000, 2763.00000000, 1, 0),
(524, '2024-10-26', 'SHIBUSDT', 0.00001703, 0.00001713, 0.00001657, 0.00001676, 0.00001703, 1, 0),
(525, '2024-10-26', 'DOGEUSDT', 0.13799000, 0.13845000, 0.13208000, 0.13353000, 0.13799000, 1, 0),
(526, '2024-10-26', 'FETUSDT', 1.24800000, 1.24900000, 1.19600000, 1.21300000, 1.24800000, 0, 1),
(527, '2024-10-26', 'THETAUSDT', 1.15000000, 1.15500000, 1.11400000, 1.14700000, 1.15000000, 1, 0),
(528, '2024-10-27', 'NEARUSDT', 4.18600000, 4.37900000, 4.18600000, 4.25800000, 4.18600000, 0, 1),
(529, '2024-10-27', 'BTCUSDT', 67733.61000000, 68299.99000000, 67038.00000000, 67290.01000000, 67733.61000000, 0, 1),
(530, '2024-10-27', 'ATOMUSDT', 4.34500000, 4.47200000, 4.32200000, 4.38100000, 4.34500000, 1, 0),
(531, '2024-10-27', 'BNBUSDT', 587.00000000, 590.90000000, 581.80000000, 585.80000000, 587.00000000, 0, 1),
(532, '2024-10-27', 'ETHUSDT', 2477.10000000, 2525.21000000, 2465.71000000, 2483.41000000, 2477.10000000, 0, 1),
(533, '2024-10-27', 'INJUSDT', 18.66000000, 19.12000000, 18.28000000, 18.49000000, 18.66000000, 0, 1),
(534, '2024-10-27', 'RUNEUSDT', 5.26700000, 5.38900000, 5.12000000, 5.09700000, 5.26700000, 0, 1),
(535, '2024-10-27', 'LTCUSDT', 70.64000000, 71.55000000, 68.79000000, 69.10000000, 70.64000000, 0, 1),
(536, '2024-10-27', 'PAXGUSDT', 2752.00000000, 2770.00000000, 2747.00000000, 2763.00000000, 2752.00000000, 0, 1),
(537, '2024-10-27', 'SHIBUSDT', 0.00001693, 0.00001735, 0.00001682, 0.00001703, 0.00001693, 0, 1),
(538, '2024-10-27', 'DOGEUSDT', 0.14313000, 0.14592000, 0.13655000, 0.13799000, 0.14313000, 0, 1),
(539, '2024-10-27', 'FETUSDT', 1.24000000, 1.28700000, 1.22400000, 1.24800000, 1.24000000, 0, 1),
(540, '2024-10-27', 'THETAUSDT', 1.14200000, 1.17900000, 1.13700000, 1.15000000, 1.14200000, 0, 1),
(541, '2024-10-28', 'BTCUSDT', 70966.98000000, 71544.00000000, 67621.19000000, 67733.61000000, 70966.98000000, 0, 1),
(542, '2024-10-28', 'BNBUSDT', 605.70000000, 609.70000000, 585.60000000, 587.00000000, 605.70000000, 0, 1);
INSERT INTO `prices` (`ID`, `FECHA`, `MONEDA`, `ACTUAL`, `ARRIBA`, `ABAJO`, `OPEN`, `CLOSE`, `BAJISTA`, `ALCISTA`) VALUES
(543, '2024-10-28', 'ETHUSDT', 2608.25000000, 2629.00000000, 2475.21000000, 2477.10000000, 2608.25000000, 0, 1),
(544, '2024-10-28', 'ATOMUSDT', 4.55700000, 4.55700000, 4.28000000, 4.34500000, 4.55700000, 0, 1),
(545, '2024-10-28', 'NEARUSDT', 4.41100000, 4.47300000, 4.09000000, 4.18600000, 4.41100000, 0, 1),
(546, '2024-10-28', 'INJUSDT', 20.17000000, 20.17000000, 18.29000000, 18.66000000, 20.17000000, 0, 1),
(547, '2024-10-28', 'LTCUSDT', 72.24000000, 72.42000000, 69.65000000, 70.64000000, 72.24000000, 0, 1),
(548, '2024-10-28', 'PAXGUSDT', 2760.00000000, 2768.00000000, 2748.00000000, 2752.00000000, 2760.00000000, 0, 1),
(549, '2024-10-28', 'RUNEUSDT', 6.13400000, 6.19200000, 5.25500000, 5.26700000, 6.13400000, 0, 1),
(550, '2024-10-28', 'SHIBUSDT', 0.00001829, 0.00001874, 0.00001681, 0.00001693, 0.00001829, 0, 1),
(551, '2024-10-28', 'DOGEUSDT', 0.16721000, 0.16879000, 0.14200000, 0.14313000, 0.16721000, 0, 1),
(552, '2024-10-28', 'FETUSDT', 1.32700000, 1.34100000, 1.18800000, 1.24000000, 1.32700000, 0, 1),
(553, '2024-10-28', 'THETAUSDT', 1.21200000, 1.22500000, 1.13200000, 1.14200000, 1.21200000, 0, 1),
(554, '2024-10-29', 'BTCUSDT', 72244.43000000, 73560.00000000, 70882.95000000, 70966.98000000, 72244.43000000, 0, 1),
(555, '2024-10-29', 'BNBUSDT', 602.70000000, 612.10000000, 598.50000000, 605.70000000, 602.70000000, 1, 0),
(556, '2024-10-29', 'ETHUSDT', 2641.70000000, 2678.23000000, 2601.21000000, 2608.25000000, 2641.70000000, 0, 1),
(557, '2024-10-29', 'ATOMUSDT', 4.50400000, 4.60600000, 4.44800000, 4.55700000, 4.50400000, 1, 0),
(558, '2024-10-29', 'NEARUSDT', 4.40600000, 4.51300000, 4.33100000, 4.41100000, 4.40600000, 1, 0),
(559, '2024-10-29', 'INJUSDT', 20.08000000, 20.50000000, 19.75000000, 20.17000000, 20.08000000, 1, 0),
(560, '2024-10-29', 'LTCUSDT', 73.38000000, 74.30000000, 71.79000000, 72.24000000, 73.38000000, 0, 1),
(561, '2024-10-29', 'PAXGUSDT', 2769.00000000, 2777.00000000, 2745.00000000, 2760.00000000, 2769.00000000, 0, 1),
(562, '2024-10-29', 'RUNEUSDT', 6.04700000, 6.30400000, 5.96700000, 6.13400000, 6.04700000, 1, 0),
(563, '2024-10-29', 'SHIBUSDT', 0.00001897, 0.00001963, 0.00001815, 0.00001829, 0.00001897, 0, 1),
(564, '2024-10-29', 'DOGEUSDT', 0.17498000, 0.17891000, 0.16335000, 0.16721000, 0.17498000, 0, 1),
(565, '2024-10-29', 'FETUSDT', 1.32000000, 1.35600000, 1.30900000, 1.32700000, 1.32000000, 1, 0),
(566, '2024-10-29', 'THETAUSDT', 1.20500000, 1.24100000, 1.19200000, 1.21200000, 1.20500000, 1, 0),
(567, '2024-10-30', 'BTCUSDT', 72337.99000000, 72937.29000000, 71653.06000000, 72244.43000000, 72337.99000000, 0, 1),
(568, '2024-10-30', 'BNBUSDT', 592.60000000, 606.50000000, 592.20000000, 602.70000000, 592.60000000, 1, 0),
(569, '2024-10-30', 'ETHUSDT', 2656.30000000, 2719.79000000, 2636.89000000, 2641.70000000, 2656.30000000, 0, 1),
(570, '2024-10-30', 'ATOMUSDT', 4.41900000, 4.52000000, 4.38200000, 4.50400000, 4.41900000, 1, 0),
(571, '2024-10-30', 'NEARUSDT', 4.26000000, 4.43200000, 4.26000000, 4.40600000, 4.26000000, 1, 0),
(572, '2024-10-30', 'INJUSDT', 19.69000000, 20.21000000, 19.43000000, 20.08000000, 19.69000000, 1, 0),
(573, '2024-10-30', 'LTCUSDT', 71.70000000, 73.37000000, 71.45000000, 73.38000000, 71.70000000, 1, 0),
(574, '2024-10-30', 'PAXGUSDT', 2783.00000000, 2786.00000000, 2768.00000000, 2769.00000000, 2783.00000000, 0, 1),
(575, '2024-10-30', 'RUNEUSDT', 5.86500000, 6.16600000, 5.81100000, 6.04700000, 5.86500000, 1, 0),
(576, '2024-10-30', 'SHIBUSDT', 0.00001854, 0.00001922, 0.00001820, 0.00001897, 0.00001854, 1, 0),
(577, '2024-10-30', 'DOGEUSDT', 0.17025000, 0.17777000, 0.16483000, 0.17498000, 0.17025000, 1, 0),
(578, '2024-10-30', 'FETUSDT', 1.28000000, 1.33300000, 1.27600000, 1.32000000, 1.28000000, 1, 0),
(579, '2024-10-30', 'THETAUSDT', 1.17500000, 1.21000000, 1.17200000, 1.20500000, 1.17500000, 1, 0),
(580, '2024-10-31', 'BTCUSDT', 70364.21000000, 72610.00000000, 70171.99000000, 72337.99000000, 70364.21000000, 1, 0),
(581, '2024-10-31', 'BNBUSDT', 575.10000000, 592.70000000, 573.90000000, 592.60000000, 575.10000000, 1, 0),
(582, '2024-10-31', 'ETHUSDT', 2522.24000000, 2656.61000000, 2511.10000000, 2656.30000000, 2522.24000000, 1, 0),
(583, '2024-10-31', 'ATOMUSDT', 4.21200000, 4.42700000, 4.19100000, 4.41900000, 4.21200000, 1, 0),
(584, '2024-10-31', 'NEARUSDT', 4.03800000, 4.28900000, 4.02700000, 4.26000000, 4.03800000, 1, 0),
(585, '2024-10-31', 'INJUSDT', 18.89000000, 19.76000000, 18.85000000, 19.69000000, 18.89000000, 1, 0),
(586, '2024-10-31', 'LTCUSDT', 69.03000000, 71.66000000, 68.76000000, 71.70000000, 69.03000000, 1, 0),
(587, '2024-10-31', 'PAXGUSDT', 2759.00000000, 2785.00000000, 2754.00000000, 2783.00000000, 2759.00000000, 1, 0),
(588, '2024-10-31', 'RUNEUSDT', 5.57500000, 5.90000000, 5.56800000, 5.86500000, 5.57500000, 1, 0),
(589, '2024-10-31', 'SHIBUSDT', 0.00001792, 0.00001902, 0.00001780, 0.00001854, 0.00001792, 1, 0),
(590, '2024-10-31', 'DOGEUSDT', 0.16226000, 0.17330000, 0.16183000, 0.17025000, 0.16226000, 1, 0),
(591, '2024-10-31', 'FETUSDT', 1.26900000, 1.32900000, 1.24700000, 1.28000000, 1.26900000, 1, 0),
(592, '2024-10-31', 'THETAUSDT', 1.12400000, 1.18200000, 1.11400000, 1.17500000, 1.12400000, 1, 0),
(593, '2024-11-05', 'BTCUSDT', 74281.80000000, 74990.01000000, 68930.00000000, 0.00000000, 74281.80000000, 1, 0),
(594, '2024-11-05', 'BNBUSDT', 581.82000000, 588.70000000, 560.09000000, 0.00000000, 581.82000000, 1, 0),
(595, '2024-11-05', 'ATOMUSDT', 4.39300000, 4.41100000, 4.14800000, 0.00000000, 4.39300000, 1, 0),
(596, '2024-11-05', 'NEARUSDT', 4.17100000, 4.20000000, 3.78000000, 0.00000000, 4.17100000, 1, 0),
(597, '2024-11-05', 'THETAUSDT', 1.17100000, 1.17600000, 1.08100000, 0.00000000, 1.17100000, 1, 0),
(598, '2024-11-05', 'RUNEUSDT', 5.19800000, 5.27700000, 4.60700000, 0.00000000, 5.19800000, 1, 0),
(599, '2024-11-05', 'ETHUSDT', 2576.39000000, 2633.04000000, 2409.54000000, 0.00000000, 2576.39000000, 1, 0),
(600, '2024-11-05', 'FETUSDT', 1.33100000, 1.34300000, 1.23300000, 0.00000000, 1.33100000, 1, 0),
(601, '2024-11-05', 'INJUSDT', 18.99000000, 19.15000000, 17.14000000, 0.00000000, 18.99000000, 1, 0),
(602, '2024-11-05', 'LTCUSDT', 68.88000000, 69.75000000, 65.36000000, 0.00000000, 68.88000000, 1, 0),
(603, '2024-11-05', 'PAXGUSDT', 2725.00000000, 2740.00000000, 2725.00000000, 0.00000000, 2725.00000000, 1, 0),
(604, '2024-11-05', 'SHIBUSDT', 0.00001942, 0.00001982, 0.00001753, 0.00000000, 0.00001942, 1, 0),
(605, '2024-11-05', 'DOGEUSDT', 0.21135000, 0.21946000, 0.16588000, 0.00000000, 0.21135000, 1, 0),
(606, '2024-11-06', 'BTCUSDT', 75050.01000000, 76331.02000000, 72711.99000000, 74281.80000000, 75050.01000000, 0, 1),
(607, '2024-11-06', 'BNBUSDT', 604.47000000, 611.10000000, 575.60000000, 581.82000000, 604.47000000, 0, 1),
(608, '2024-11-06', 'ETHUSDT', 2850.00000000, 2875.66000000, 2566.10000000, 2576.39000000, 2850.00000000, 0, 1),
(609, '2024-11-06', 'ATOMUSDT', 4.60800000, 4.65200000, 4.38000000, 4.39300000, 4.60800000, 0, 1),
(610, '2024-11-06', 'NEARUSDT', 4.27000000, 4.34300000, 4.03500000, 4.17100000, 4.27000000, 0, 1),
(611, '2024-11-06', 'INJUSDT', 21.34000000, 21.69000000, 19.04000000, 18.99000000, 21.34000000, 0, 1),
(612, '2024-11-06', 'LTCUSDT', 71.19000000, 72.25000000, 68.44000000, 68.88000000, 71.19000000, 0, 1),
(613, '2024-11-06', 'PAXGUSDT', 2663.00000000, 2734.00000000, 2642.00000000, 2725.00000000, 2663.00000000, 1, 0),
(614, '2024-11-06', 'RUNEUSDT', 5.49100000, 5.65200000, 5.15000000, 5.19800000, 5.49100000, 0, 1),
(615, '2024-11-06', 'SHIBUSDT', 0.00001899, 0.00001950, 0.00001824, 0.00001942, 0.00001899, 1, 0),
(616, '2024-11-06', 'DOGEUSDT', 0.19569000, 0.21185000, 0.18784000, 0.21135000, 0.19569000, 1, 0),
(617, '2024-11-06', 'FETUSDT', 1.41500000, 1.44900000, 1.32300000, 1.33100000, 1.41500000, 0, 1),
(618, '2024-11-06', 'THETAUSDT', 1.23800000, 1.24800000, 1.17200000, 1.17100000, 1.23800000, 0, 1),
(619, '2024-11-07', 'BTCUSDT', 75885.99000000, 76833.13000000, 74471.31000000, 75050.01000000, 75885.99000000, 0, 1),
(620, '2024-11-07', 'BNBUSDT', 597.10000000, 605.88000000, 588.08000000, 604.47000000, 597.10000000, 1, 0),
(621, '2024-11-07', 'ETHUSDT', 2900.19000000, 2949.02000000, 2782.51000000, 2850.00000000, 2900.19000000, 0, 1),
(622, '2024-11-07', 'ATOMUSDT', 4.48300000, 4.62100000, 4.46500000, 4.60800000, 4.48300000, 1, 0),
(623, '2024-11-07', 'NEARUSDT', 4.21200000, 4.33700000, 4.09900000, 4.27000000, 4.21200000, 1, 0),
(624, '2024-11-07', 'INJUSDT', 22.00000000, 22.51000000, 20.58000000, 21.34000000, 22.00000000, 0, 1),
(625, '2024-11-07', 'LTCUSDT', 71.11000000, 72.62000000, 69.95000000, 71.19000000, 71.11000000, 1, 0),
(626, '2024-11-07', 'PAXGUSDT', 2689.00000000, 2715.00000000, 2655.00000000, 2663.00000000, 2689.00000000, 0, 1),
(627, '2024-11-07', 'RUNEUSDT', 5.46800000, 5.69900000, 5.36600000, 5.49100000, 5.46800000, 1, 0),
(628, '2024-11-07', 'SHIBUSDT', 0.00001898, 0.00001948, 0.00001833, 0.00001899, 0.00001898, 1, 0),
(629, '2024-11-07', 'DOGEUSDT', 0.19498000, 0.19870000, 0.18605000, 0.19569000, 0.19498000, 1, 0),
(630, '2024-11-07', 'FETUSDT', 1.39200000, 1.43900000, 1.37100000, 1.41500000, 1.39200000, 1, 0),
(631, '2024-11-07', 'THETAUSDT', 1.19200000, 1.24100000, 1.17900000, 1.23800000, 1.19200000, 1, 0),
(632, '2024-11-08', 'BTCUSDT', 76344.65000000, 77171.51000000, 75669.99000000, 75885.99000000, 76344.65000000, 0, 1),
(633, '2024-11-08', 'BNBUSDT', 635.46000000, 637.67000000, 588.22000000, 597.10000000, 635.46000000, 0, 1),
(634, '2024-11-08', 'ETHUSDT', 2964.99000000, 2994.86000000, 2891.78000000, 2900.19000000, 2964.99000000, 0, 1),
(635, '2024-11-08', 'ATOMUSDT', 4.66000000, 4.79900000, 4.46900000, 4.48300000, 4.66000000, 0, 1),
(636, '2024-11-08', 'NEARUSDT', 4.24900000, 4.38600000, 4.15500000, 4.21200000, 4.24900000, 0, 1),
(637, '2024-11-08', 'INJUSDT', 22.00000000, 22.94000000, 21.77000000, 22.00000000, 22.00000000, 1, 0),
(638, '2024-11-08', 'LTCUSDT', 72.72000000, 73.32000000, 70.70000000, 71.11000000, 72.72000000, 0, 1),
(639, '2024-11-08', 'PAXGUSDT', 2671.00000000, 2693.00000000, 2670.00000000, 2689.00000000, 2671.00000000, 1, 0),
(640, '2024-11-08', 'RUNEUSDT', 5.49100000, 5.60300000, 5.37600000, 5.46800000, 5.49100000, 0, 1),
(641, '2024-11-08', 'SHIBUSDT', 0.00001865, 0.00001933, 0.00001844, 0.00001898, 0.00001865, 1, 0),
(642, '2024-11-08', 'DOGEUSDT', 0.19943000, 0.20719000, 0.19093000, 0.19498000, 0.19943000, 0, 1),
(643, '2024-11-08', 'FETUSDT', 1.38000000, 1.42800000, 1.34100000, 1.39200000, 1.38000000, 1, 0),
(644, '2024-11-08', 'THETAUSDT', 1.21100000, 1.25600000, 1.17400000, 1.19200000, 1.21100000, 0, 1),
(645, '2024-11-09', 'BTCUSDT', 77240.24000000, 77468.29000000, 75789.58000000, 76344.65000000, 77240.24000000, 0, 1),
(646, '2024-11-09', 'BNBUSDT', 627.90000000, 636.09000000, 610.62000000, 635.46000000, 627.90000000, 1, 0),
(647, '2024-11-09', 'ETHUSDT', 3136.78000000, 3150.80000000, 2959.31000000, 2964.99000000, 3136.78000000, 0, 1),
(648, '2024-11-09', 'ATOMUSDT', 4.84100000, 4.89800000, 4.63200000, 4.66000000, 4.84100000, 0, 1),
(649, '2024-11-09', 'NEARUSDT', 4.64700000, 4.68100000, 4.25200000, 4.24900000, 4.64700000, 0, 1),
(650, '2024-11-09', 'INJUSDT', 24.20000000, 24.66000000, 21.92000000, 22.00000000, 24.20000000, 0, 1),
(651, '2024-11-09', 'LTCUSDT', 75.36000000, 75.73000000, 71.64000000, 72.72000000, 75.36000000, 0, 1),
(652, '2024-11-09', 'PAXGUSDT', 2664.00000000, 2683.00000000, 2663.00000000, 2671.00000000, 2664.00000000, 1, 0),
(653, '2024-11-09', 'RUNEUSDT', 5.72700000, 5.78900000, 5.36700000, 5.49100000, 5.72700000, 0, 1),
(654, '2024-11-09', 'SHIBUSDT', 0.00002244, 0.00002269, 0.00001864, 0.00001865, 0.00002244, 0, 1),
(655, '2024-11-09', 'DOGEUSDT', 0.22897000, 0.22930000, 0.19903000, 0.19943000, 0.22897000, 0, 1),
(656, '2024-11-09', 'FETUSDT', 1.48500000, 1.48800000, 1.36600000, 1.38000000, 1.48500000, 0, 1),
(657, '2024-11-09', 'THETAUSDT', 1.34200000, 1.35200000, 1.21200000, 1.21100000, 1.34200000, 0, 1),
(658, '2024-11-10', 'BTCUSDT', 81668.00000000, 81729.46000000, 77156.00000000, 77240.24000000, 81668.00000000, 0, 1),
(659, '2024-11-10', 'BNBUSDT', 637.50000000, 643.79000000, 613.24000000, 627.90000000, 637.50000000, 0, 1),
(660, '2024-11-10', 'ETHUSDT', 3196.60000000, 3243.40000000, 3084.51000000, 3136.78000000, 3196.60000000, 0, 1),
(661, '2024-11-10', 'ATOMUSDT', 5.38500000, 5.53300000, 4.80900000, 4.84100000, 5.38500000, 0, 1),
(662, '2024-11-10', 'NEARUSDT', 5.11800000, 5.20100000, 4.45900000, 4.64700000, 5.11800000, 0, 1),
(663, '2024-11-10', 'INJUSDT', 25.86000000, 26.41000000, 23.33000000, 24.20000000, 25.86000000, 0, 1),
(664, '2024-11-10', 'LTCUSDT', 77.18000000, 78.20000000, 73.69000000, 75.36000000, 77.18000000, 0, 1),
(665, '2024-11-10', 'PAXGUSDT', 2653.00000000, 2669.00000000, 2646.00000000, 2664.00000000, 2653.00000000, 1, 0),
(666, '2024-11-10', 'RUNEUSDT', 6.11700000, 6.14700000, 5.52000000, 5.72700000, 6.11700000, 0, 1),
(667, '2024-11-10', 'SHIBUSDT', 0.00002663, 0.00002793, 0.00002213, 0.00002244, 0.00002663, 0, 1),
(668, '2024-11-10', 'DOGEUSDT', 0.29406000, 0.30244000, 0.22497000, 0.22897000, 0.29406000, 0, 1),
(669, '2024-11-10', 'FETUSDT', 1.51500000, 1.56400000, 1.40100000, 1.48500000, 1.51500000, 0, 1),
(670, '2024-11-10', 'THETAUSDT', 1.54400000, 1.56000000, 1.31400000, 1.34200000, 1.54400000, 0, 1),
(671, '2024-11-11', 'BTCUSDT', 88088.08000000, 89500.00000000, 80500.01000000, 81668.00000000, 88088.08000000, 0, 1),
(672, '2024-11-11', 'BNBUSDT', 653.68000000, 666.43000000, 613.33000000, 637.50000000, 653.68000000, 0, 1),
(673, '2024-11-11', 'ETHUSDT', 3334.55000000, 3385.91000000, 3110.60000000, 3196.60000000, 3334.55000000, 0, 1),
(674, '2024-11-11', 'ATOMUSDT', 5.62100000, 5.67000000, 5.16500000, 5.38500000, 5.62100000, 0, 1),
(675, '2024-11-11', 'NEARUSDT', 5.70100000, 5.74200000, 5.05300000, 5.11800000, 5.70100000, 0, 1),
(676, '2024-11-11', 'INJUSDT', 26.14000000, 27.02000000, 24.88000000, 25.86000000, 26.14000000, 0, 1),
(677, '2024-11-11', 'LTCUSDT', 79.09000000, 80.26000000, 74.69000000, 77.18000000, 79.09000000, 0, 1),
(678, '2024-11-11', 'PAXGUSDT', 2603.00000000, 2653.00000000, 2590.00000000, 2653.00000000, 2603.00000000, 1, 0),
(679, '2024-11-11', 'RUNEUSDT', 6.52700000, 6.67100000, 5.80100000, 6.11700000, 6.52700000, 0, 1),
(680, '2024-11-11', 'SHIBUSDT', 0.00002732, 0.00002872, 0.00002454, 0.00002663, 0.00002732, 0, 1),
(681, '2024-11-11', 'DOGEUSDT', 0.36462000, 0.36462000, 0.27451000, 0.29406000, 0.36462000, 0, 1),
(682, '2024-11-11', 'FETUSDT', 1.63000000, 1.63400000, 1.44100000, 1.51500000, 1.63000000, 0, 1),
(683, '2024-11-11', 'THETAUSDT', 1.54300000, 1.63200000, 1.44200000, 1.54400000, 1.54300000, 1, 0),
(684, '2024-11-12', 'BTCUSDT', 87204.19000000, 89854.01000000, 85164.00000000, 88088.08000000, 87204.19000000, 1, 0),
(685, '2024-11-12', 'BNBUSDT', 606.84000000, 656.59000000, 606.84000000, 653.68000000, 606.84000000, 1, 0),
(686, '2024-11-12', 'ETHUSDT', 3213.20000000, 3436.58000000, 3209.49000000, 3334.55000000, 3213.20000000, 1, 0),
(687, '2024-11-12', 'ATOMUSDT', 5.01700000, 5.81700000, 5.01700000, 5.62100000, 5.01700000, 1, 0),
(688, '2024-11-12', 'NEARUSDT', 5.15600000, 5.73800000, 4.96500000, 5.70100000, 5.15600000, 1, 0),
(689, '2024-11-12', 'INJUSDT', 23.33000000, 26.83000000, 23.33000000, 26.14000000, 23.33000000, 1, 0),
(690, '2024-11-12', 'LTCUSDT', 73.69000000, 82.62000000, 73.69000000, 79.09000000, 73.69000000, 1, 0),
(691, '2024-11-12', 'PAXGUSDT', 2573.00000000, 2604.00000000, 2552.00000000, 2603.00000000, 2573.00000000, 1, 0),
(692, '2024-11-12', 'RUNEUSDT', 5.65400000, 6.53600000, 5.64800000, 6.52700000, 5.65400000, 1, 0),
(693, '2024-11-12', 'SHIBUSDT', 0.00002450, 0.00003028, 0.00002447, 0.00002732, 0.00002450, 1, 0),
(694, '2024-11-12', 'DOGEUSDT', 0.37300000, 0.43880000, 0.34282000, 0.36462000, 0.37300000, 0, 1),
(695, '2024-11-12', 'FETUSDT', 1.27200000, 1.64000000, 1.27200000, 1.63000000, 1.27200000, 1, 0),
(696, '2024-11-12', 'THETAUSDT', 1.35100000, 1.60000000, 1.35100000, 1.54300000, 1.35100000, 1, 0),
(697, '2024-11-13', 'BTCUSDT', 89928.00000000, 93152.01000000, 86171.91000000, 87204.19000000, 89928.00000000, 0, 1),
(698, '2024-11-13', 'BNBUSDT', 626.31000000, 637.96000000, 598.63000000, 606.84000000, 626.31000000, 0, 1),
(699, '2024-11-13', 'ETHUSDT', 3211.48000000, 3325.88000000, 3119.06000000, 3213.20000000, 3211.48000000, 1, 0),
(700, '2024-11-13', 'ATOMUSDT', 5.14300000, 5.32700000, 4.85900000, 5.01700000, 5.14300000, 0, 1),
(701, '2024-11-13', 'NEARUSDT', 5.11500000, 5.50500000, 4.97300000, 5.15600000, 5.11500000, 1, 0),
(702, '2024-11-13', 'INJUSDT', 23.80000000, 26.89000000, 22.36000000, 23.33000000, 23.80000000, 0, 1),
(703, '2024-11-13', 'LTCUSDT', 83.53000000, 83.53000000, 71.93000000, 73.69000000, 83.53000000, 0, 1),
(704, '2024-11-13', 'PAXGUSDT', 2572.00000000, 2599.00000000, 2562.00000000, 2573.00000000, 2572.00000000, 1, 0),
(705, '2024-11-13', 'RUNEUSDT', 5.61500000, 6.06700000, 5.42900000, 5.65400000, 5.61500000, 1, 0),
(706, '2024-11-13', 'SHIBUSDT', 0.00002548, 0.00002770, 0.00002340, 0.00002450, 0.00002548, 0, 1),
(707, '2024-11-13', 'DOGEUSDT', 0.38768000, 0.43190000, 0.35660000, 0.37300000, 0.38768000, 0, 1),
(708, '2024-11-13', 'FETUSDT', 1.28900000, 1.38300000, 1.21300000, 1.27200000, 1.28900000, 0, 1),
(709, '2024-11-13', 'THETAUSDT', 1.38900000, 1.44200000, 1.31300000, 1.35100000, 1.38900000, 0, 1),
(710, '2024-11-14', 'BTCUSDT', 88242.44000000, 91706.06000000, 86922.75000000, 89928.00000000, 88242.44000000, 1, 0),
(711, '2024-11-14', 'BNBUSDT', 623.49000000, 658.90000000, 616.33000000, 626.31000000, 623.49000000, 1, 0),
(712, '2024-11-14', 'ETHUSDT', 3084.60000000, 3239.32000000, 3039.99000000, 3211.48000000, 3084.60000000, 1, 0),
(713, '2024-11-14', 'ATOMUSDT', 4.99200000, 5.28100000, 4.87400000, 5.14300000, 4.99200000, 1, 0),
(714, '2024-11-14', 'NEARUSDT', 5.43900000, 5.64600000, 5.09200000, 5.11500000, 5.43900000, 0, 1),
(715, '2024-11-14', 'INJUSDT', 23.28000000, 25.46000000, 22.87000000, 23.80000000, 23.28000000, 1, 0),
(716, '2024-11-14', 'LTCUSDT', 81.83000000, 84.51000000, 77.79000000, 83.53000000, 81.83000000, 1, 0),
(717, '2024-11-14', 'PAXGUSDT', 2564.00000000, 2575.00000000, 2547.00000000, 2572.00000000, 2564.00000000, 1, 0),
(718, '2024-11-14', 'RUNEUSDT', 5.46800000, 5.82300000, 5.33300000, 5.61500000, 5.46800000, 1, 0),
(719, '2024-11-14', 'SHIBUSDT', 0.00002376, 0.00002675, 0.00002287, 0.00002548, 0.00002376, 1, 0),
(720, '2024-11-14', 'DOGEUSDT', 0.37116000, 0.41476000, 0.35503000, 0.38768000, 0.37116000, 1, 0),
(721, '2024-11-14', 'FETUSDT', 1.22800000, 1.35900000, 1.21200000, 1.28900000, 1.22800000, 1, 0),
(722, '2024-11-14', 'THETAUSDT', 1.29900000, 1.42000000, 1.27700000, 1.38900000, 1.29900000, 1, 0),
(723, '2024-11-14', 'HBARUSDT', 0.06605000, 0.06801000, 0.05955000, 0.00000000, 0.06605000, 1, 0),
(724, '2024-11-15', 'BTCUSDT', 91266.09000000, 91821.99000000, 87095.81000000, 88242.44000000, 91266.09000000, 0, 1),
(725, '2024-11-15', 'BNBUSDT', 624.30000000, 625.58000000, 603.91000000, 623.49000000, 624.30000000, 0, 1),
(726, '2024-11-15', 'ETHUSDT', 3149.22000000, 3149.22000000, 3016.18000000, 3084.60000000, 3149.22000000, 0, 1),
(727, '2024-11-15', 'ATOMUSDT', 5.34900000, 5.35400000, 4.83600000, 4.99200000, 5.34900000, 0, 1),
(728, '2024-11-15', 'NEARUSDT', 6.11100000, 6.15500000, 5.18000000, 5.43900000, 6.11100000, 0, 1),
(729, '2024-11-15', 'INJUSDT', 25.01000000, 25.05000000, 22.51000000, 23.28000000, 25.01000000, 0, 1),
(730, '2024-11-15', 'LTCUSDT', 84.00000000, 87.04000000, 79.04000000, 81.83000000, 84.00000000, 0, 1),
(731, '2024-11-15', 'PAXGUSDT', 2567.00000000, 2580.00000000, 2549.00000000, 2564.00000000, 2567.00000000, 0, 1),
(732, '2024-11-15', 'RUNEUSDT', 5.67500000, 5.67500000, 5.27500000, 5.46800000, 5.67500000, 0, 1),
(733, '2024-11-15', 'SHIBUSDT', 0.00002546, 0.00002596, 0.00002267, 0.00002376, 0.00002546, 0, 1),
(734, '2024-11-15', 'DOGEUSDT', 0.37948000, 0.38421000, 0.35376000, 0.37116000, 0.37948000, 0, 1),
(735, '2024-11-15', 'FETUSDT', 1.31800000, 1.32500000, 1.19200000, 1.22800000, 1.31800000, 0, 1),
(736, '2024-11-15', 'THETAUSDT', 1.39700000, 1.39900000, 1.26000000, 1.29900000, 1.39700000, 0, 1),
(737, '2024-11-15', 'HBARUSDT', 0.07782000, 0.08378000, 0.06466000, 0.06605000, 0.07782000, 0, 1),
(738, '2024-11-16', 'BTCUSDT', 90969.69000000, 91685.20000000, 90640.01000000, 91266.09000000, 90969.69000000, 1, 0),
(739, '2024-11-16', 'BNBUSDT', 628.49000000, 633.39000000, 621.31000000, 624.30000000, 628.49000000, 0, 1),
(740, '2024-11-16', 'ETHUSDT', 3168.94000000, 3212.51000000, 3103.63000000, 3149.22000000, 3168.94000000, 0, 1),
(741, '2024-11-16', 'ATOMUSDT', 5.62600000, 5.65500000, 5.25400000, 5.34900000, 5.62600000, 0, 1),
(742, '2024-11-16', 'NEARUSDT', 5.96300000, 6.37600000, 5.95400000, 6.11100000, 5.96300000, 1, 0),
(743, '2024-11-16', 'INJUSDT', 25.46000000, 25.95000000, 24.62000000, 25.01000000, 25.46000000, 0, 1),
(744, '2024-11-16', 'LTCUSDT', 92.54000000, 92.84000000, 83.41000000, 84.00000000, 92.54000000, 0, 1),
(745, '2024-11-16', 'PAXGUSDT', 2565.00000000, 2579.00000000, 2560.00000000, 2567.00000000, 2565.00000000, 1, 0),
(746, '2024-11-16', 'RUNEUSDT', 5.64600000, 5.79200000, 5.57800000, 5.67500000, 5.64600000, 1, 0),
(747, '2024-11-16', 'SHIBUSDT', 0.00002474, 0.00002474, 0.00002474, 0.00002546, 0.00002474, 1, 0),
(748, '2024-11-16', 'DOGEUSDT', 0.36732000, 0.36732000, 0.36732000, 0.37948000, 0.36732000, 1, 0),
(749, '2024-11-16', 'FETUSDT', 1.30200000, 1.32900000, 1.26900000, 1.31800000, 1.30200000, 1, 0),
(750, '2024-11-16', 'THETAUSDT', 1.50200000, 1.52000000, 1.38300000, 1.39700000, 1.50200000, 0, 1),
(751, '2024-11-16', 'HBARUSDT', 0.09274000, 0.09340000, 0.07657000, 0.07782000, 0.09274000, 0, 1),
(752, '2024-11-16', 'LINKUSDT', 14.33000000, 14.36000000, 14.32000000, 0.00000000, 14.33000000, 1, 0),
(753, '2024-11-16', 'UNIUSDT', 8.99600000, 8.99600000, 8.96600000, 0.00000000, 8.99600000, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trader`
--

CREATE TABLE `trader` (
  `ID` int(11) NOT NULL,
  `USUARIO` varchar(255) DEFAULT NULL,
  `FECHA` date NOT NULL DEFAULT current_timestamp(),
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
  `AUTOSELL` int(11) NOT NULL DEFAULT 1,
  `AUTOSTOP` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `trader`
--

INSERT INTO `trader` (`ID`, `USUARIO`, `FECHA`, `TIPO`, `MONEDA`, `ORDERID`, `ORDERVENTA`, `COMPRA`, `CANTIDAD`, `PRECIOCOMPRA`, `VENTA`, `GANANCIA`, `PRECIOVENTA`, `PORCENVENTA`, `MARGEN`, `ESCALON`, `LIQUIDAR`, `ACTIVO`, `ELIMINADO`, `XGANANCIA`, `NEGATIVO`, `AUTOSELL`, `AUTOSTOP`) VALUES
(37, 'dd77b701661c5b55', '2024-11-12', 'BUY', 'FETUSDT', '2235608230', '3ed7cb2163', 28.00000000, 19.80000000, 1.41100000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 0.00000000, 0, 1, 0),
(41, 'dd77b701661c5b55', '2024-11-14', 'BUY', 'RUNEUSDT', '2079023610', '40c618720b', 20.00000000, 3.50000000, 5.61700000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 0.00000000, 0, 1, 0);

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `datosusuarios`
--
ALTER TABLE `datosusuarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `parametros`
--
ALTER TABLE `parametros`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `prices`
--
ALTER TABLE `prices`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=755;

--
-- AUTO_INCREMENT de la tabla `trader`
--
ALTER TABLE `trader`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
