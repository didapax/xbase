-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-09-2024 a las 03:39:28
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
  `DATOS` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`DATOS`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `datos`
--

INSERT INTO `datos` (`ID`, `MONEDA`, `ASSET`, `PAR`, `BALANCE_ASSET`, `PRECIO_VENTA`, `PANTE`, `ACTIVO`, `ULTIMAVENTA`, `DATOS`) VALUES
(1, 'BTCUSDT', 'BTC', 'USDT', 0.00000000, 60000.00000000, 18987.00000000, 0, 0.00000, '{\"balance_asset\":\"0.00000000\",\"par\":\"USDT\",\"asset\":\"BTC\",\"ultimaventa\":\"0.00000\",\"price\":\"60160.35\",\"btc\":\"60160.35\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:360deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"BTCUSDT\",\"tendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"61288.00\",\"mindia\":\"58046.12\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"utc\":\"1:39 AM\",\"techo\":\"59016.152500000000\",\"piso\":\"57464.425000000000\",\"totalmoneda\":\"<div style=width:100%;padding:3px;background:#372127;border-radius:3px;color:#F37A8B;>0.0000 BTC <span style=color:#F37A8B;>&#9660;</span></div>\",\"ant\":\"58359.63000000\",\"nivel\":\"<div class=odometros style=--data:219.6deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:219.6deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"65%\",\"ganancia\":\"0.0000\",\"perdida\":\"0.0000\",\"capital\":\"10.00\",\"disponible\":\"10.00\",\"escalones\":\"1\",\"invxcompra\":\"10.00000000\",\"totalpromedio\":58240.28875,\"xdisponible\":\"10.00\",\"grafico\":[{\"date\":\"2024-09-17\",\"high\":\"61288.00\",\"low\":\"58046.12\",\"prm\":\"58890.53\"},{\"date\":\"2024-09-16\",\"high\":\"58359.63\",\"low\":\"57620.71\",\"prm\":\"57840.36\"},{\"date\":\"2024-09-14\",\"high\":\"60340.75\",\"low\":\"59616.02\",\"prm\":\"58748.68\"},{\"date\":\"2024-09-13\",\"high\":\"60624.54\",\"low\":\"57632.63\",\"prm\":\"58970.29\"},{\"date\":\"2024-09-12\",\"high\":\"58503.99\",\"low\":\"57371.62\",\"prm\":\"57733.34\"},{\"date\":\"2024-09-11\",\"high\":\"58308.31\",\"low\":\"56106.00\",\"prm\":\"57927.59\"},{\"date\":\"2024-09-10\",\"high\":\"58038.00\",\"low\":\"56713.79\",\"prm\":\"57218.45\"},{\"date\":\"2024-09-09\",\"high\":\"56666.00\",\"low\":\"56608.51\",\"prm\":\"57124.36\"}],\"auto\":\"1\",\"bina\":\"0\",\"impuesto\":\"0.0200\",\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"1\",\"recordCount\":\"0\",\"colordisp\":\"#4BC883\",\"checkMesGrafico\":true,\"recupera\":\"60220.51\",\"alert\":\"olive\",\"checkAnoGrafico\":false,\"verescalones\":\"<table style=width:100%;><th>Stop</th><th>Compra</th><th>Price</th><th>Wallet</th><th style=text-align:right;>Ganancia</th><th>Opciones</th></table>\",\"verbinance\":\"<table style=width:100%;><th>Estatus</th><th>Moneda</th><th>Cant.</th><th>Orden Id</th><th>Tipo</th><th>Opciones</th></table>\",\"labelpricebitcoin\":\"60160.35\",\"labelpricemoneda\":\"60160.35\",\"precio_venta\":\"2\",\"listasset\":\"<table style=text-align:right;width:100%;><th></th><th></th><tr><td><span onclick=moneyChangue(1) style=cursor:pointer;color:#4BC883;>BTC</span></td><td><span style=color:#4BC883;font-weight:bold;>60160.35</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(6) style=cursor:pointer;color:#4BC883;>BNB</span></td><td><span style=color:#4BC883;font-weight:bold;>547.8</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(7) style=cursor:pointer;color:#F37A8B;>ETH</span></td><td><span style=color:#F37A8B;font-weight:bold;>2325.19</span></td><td><span class=bolita style=color:orange;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(9) style=cursor:pointer;color:#4BC883;>ATOM</span></td><td><span style=color:#4BC883;font-weight:bold;>4.164</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(15) style=cursor:pointer;color:#F37A8B;>NEAR</span></td><td><span style=color:#F37A8B;font-weight:bold;>4.068</span></td><td><span class=bolita style=color:orange;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(28) style=cursor:pointer;color:#4BC883;>INJ</span></td><td><span style=color:#4BC883;font-weight:bold;>19.430</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr></table>\",\"stop\":\"1\",\"balance\":\"0.00000\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:-80deg;--color2:#F6465D;--data2:-220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}'),
(6, 'BNBUSDT', 'BNB', 'USDT', 0.00120338, 600.00000000, 260.00000000, 0, 348.90000, '{\"balance_asset\":\"0.00120338\",\"par\":\"USDT\",\"asset\":\"BNB\",\"ultimaventa\":\"348.900\",\"price\":\"547.8\",\"btc\":\"60160.35\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:360deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"BNBUSDT\",\"tendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"552.6\",\"mindia\":\"534.9\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"utc\":\"1:39 AM\",\"techo\":\"542.050000000000\",\"piso\":\"527.637500000000\",\"totalmoneda\":\"<div style=width:100%;padding:3px;background:#372127;border-radius:3px;color:#F37A8B;>0.0000 BNB <span style=color:#F37A8B;>&#9660;</span></div>\",\"ant\":\"535.80000000\",\"nivel\":\"<div class=odometros style=--data:255.6deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:219.6deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"73%\",\"ganancia\":\"0.0000\",\"perdida\":\"0.0000\",\"capital\":\"10.00\",\"disponible\":\"10.00\",\"escalones\":\"1\",\"invxcompra\":\"10.00000000\",\"totalpromedio\":534.84375,\"xdisponible\":\"10.00\",\"grafico\":[{\"date\":\"2024-09-17\",\"high\":\"552.6\",\"low\":\"534.9\",\"prm\":\"538.5\"},{\"date\":\"2024-09-16\",\"high\":\"535.8\",\"low\":\"529.1\",\"prm\":\"532.0\"},{\"date\":\"2024-09-14\",\"high\":\"556.3\",\"low\":\"549.8\",\"prm\":\"540.3\"},{\"date\":\"2024-09-13\",\"high\":\"559.4\",\"low\":\"538.8\",\"prm\":\"542.7\"},{\"date\":\"2024-09-12\",\"high\":\"548.5\",\"low\":\"534.4\",\"prm\":\"536.0\"},{\"date\":\"2024-09-11\",\"high\":\"545.9\",\"low\":\"507.0\",\"prm\":\"536.1\"},{\"date\":\"2024-09-10\",\"high\":\"522.2\",\"low\":\"511.8\",\"prm\":\"521.9\"},{\"date\":\"2024-09-09\",\"high\":\"515.7\",\"low\":\"515.3\",\"prm\":\"522.3\"}],\"auto\":\"1\",\"bina\":\"0\",\"impuesto\":\"0.0200\",\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"6\",\"recordCount\":\"0\",\"colordisp\":\"#4BC883\",\"checkMesGrafico\":true,\"recupera\":\"548.35\",\"alert\":\"olive\",\"checkAnoGrafico\":false,\"verescalones\":\"<table style=width:100%;><th>Stop</th><th>Compra</th><th>Price</th><th>Wallet</th><th style=text-align:right;>Ganancia</th><th>Opciones</th></table>\",\"verbinance\":\"<table style=width:100%;><th>Estatus</th><th>Moneda</th><th>Cant.</th><th>Orden Id</th><th>Tipo</th><th>Opciones</th></table>\",\"labelpricebitcoin\":\"60160.35\",\"labelpricemoneda\":\"547.8\",\"precio_venta\":\"2\",\"listasset\":\"<table style=text-align:right;width:100%;><th></th><th></th><tr><td><span onclick=moneyChangue(1) style=cursor:pointer;color:#4BC883;>BTC</span></td><td><span style=color:#4BC883;font-weight:bold;>60160.35</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(6) style=cursor:pointer;color:#4BC883;>BNB</span></td><td><span style=color:#4BC883;font-weight:bold;>547.8</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(7) style=cursor:pointer;color:#F37A8B;>ETH</span></td><td><span style=color:#F37A8B;font-weight:bold;>2325.19</span></td><td><span class=bolita style=color:orange;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(9) style=cursor:pointer;color:#4BC883;>ATOM</span></td><td><span style=color:#4BC883;font-weight:bold;>4.164</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(15) style=cursor:pointer;color:#F37A8B;>NEAR</span></td><td><span style=color:#F37A8B;font-weight:bold;>4.068</span></td><td><span class=bolita style=color:orange;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(28) style=cursor:pointer;color:#4BC883;>INJ</span></td><td><span style=color:#4BC883;font-weight:bold;>19.430</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr></table>\",\"stop\":\"1\",\"balance\":\"0.001\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:-80deg;--color2:#F6465D;--data2:-220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}'),
(7, 'ETHUSDT', 'ETH', 'USDT', 0.00000000, 3000.00000000, 1484.00000000, 0, 1266.00000, '{\"balance_asset\":\"0.00000000\",\"par\":\"USDT\",\"asset\":\"ETH\",\"ultimaventa\":\"1266.0000\",\"price\":\"2324.95\",\"btc\":\"60160.35\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:360deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"ETHUSDT\",\"tendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"color\":\"#F37A8B\",\"maxdia\":\"2391.65\",\"mindia\":\"2282.70\",\"totalTendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"utc\":\"1:39 AM\",\"techo\":\"2386.210000000000\",\"piso\":\"2325.617500000000\",\"totalmoneda\":\"<div style=width:100%;padding:3px;background:#372127;border-radius:3px;color:#F37A8B;>0.0000 ETH <span style=color:#F37A8B;>&#9660;</span></div>\",\"ant\":\"2300.46000000\",\"nivel\":\"<div class=odometros style=--data:97.2deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:219.6deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"39%\",\"ganancia\":\"0.0000\",\"perdida\":\"0.0000\",\"capital\":\"10.00\",\"disponible\":\"10.00\",\"escalones\":\"1\",\"invxcompra\":\"10.00000000\",\"totalpromedio\":2355.9137499999997,\"xdisponible\":\"10.00\",\"grafico\":[{\"date\":\"2024-09-17\",\"high\":\"2391.65\",\"low\":\"2282.70\",\"prm\":\"2294.48\"},{\"date\":\"2024-09-16\",\"high\":\"2300.46\",\"low\":\"2264.00\",\"prm\":\"2274.09\"},{\"date\":\"2024-09-14\",\"high\":\"2433.59\",\"low\":\"2408.55\",\"prm\":\"2339.14\"},{\"date\":\"2024-09-13\",\"high\":\"2460.55\",\"low\":\"2337.36\",\"prm\":\"2348.30\"},{\"date\":\"2024-09-12\",\"high\":\"2377.40\",\"low\":\"2318.27\",\"prm\":\"2310.02\"},{\"date\":\"2024-09-11\",\"high\":\"2383.40\",\"low\":\"2308.80\",\"prm\":\"2316.75\"},{\"date\":\"2024-09-10\",\"high\":\"2398.18\",\"low\":\"2344.30\",\"prm\":\"2305.90\"},{\"date\":\"2024-09-09\",\"high\":\"2344.45\",\"low\":\"2340.96\",\"prm\":\"2302.75\"}],\"auto\":\"1\",\"bina\":\"0\",\"impuesto\":\"0.0200\",\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"7\",\"recordCount\":\"0\",\"colordisp\":\"#4BC883\",\"checkMesGrafico\":true,\"recupera\":\"2327.27\",\"alert\":\"orange\",\"checkAnoGrafico\":false,\"verescalones\":\"<table style=width:100%;><th>Stop</th><th>Compra</th><th>Price</th><th>Wallet</th><th style=text-align:right;>Ganancia</th><th>Opciones</th></table>\",\"verbinance\":\"<table style=width:100%;><th>Estatus</th><th>Moneda</th><th>Cant.</th><th>Orden Id</th><th>Tipo</th><th>Opciones</th></table>\",\"labelpricebitcoin\":\"60160.35\",\"labelpricemoneda\":\"2324.95\",\"precio_venta\":\"2\",\"listasset\":\"<table style=text-align:right;width:100%;><th></th><th></th><tr><td><span onclick=moneyChangue(1) style=cursor:pointer;color:#4BC883;>BTC</span></td><td><span style=color:#4BC883;font-weight:bold;>60160.35</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(6) style=cursor:pointer;color:#4BC883;>BNB</span></td><td><span style=color:#4BC883;font-weight:bold;>547.8</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(7) style=cursor:pointer;color:#F37A8B;>ETH</span></td><td><span style=color:#F37A8B;font-weight:bold;>2324.95</span></td><td><span class=bolita style=color:orange;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(9) style=cursor:pointer;color:#4BC883;>ATOM</span></td><td><span style=color:#4BC883;font-weight:bold;>4.164</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(15) style=cursor:pointer;color:#F37A8B;>NEAR</span></td><td><span style=color:#F37A8B;font-weight:bold;>4.068</span></td><td><span class=bolita style=color:orange;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(28) style=cursor:pointer;color:#4BC883;>INJ</span></td><td><span style=color:#4BC883;font-weight:bold;>19.430</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr></table>\",\"stop\":\"1\",\"balance\":\"0.0000\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:80deg;--color2:#F6465D;--data2:-220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}'),
(9, 'ATOMUSDT', 'ATOM', 'USDT', 0.00000000, 17.00000000, 9.00000000, 0, 14.15600, '{\"balance_asset\":\"0.00000000\",\"par\":\"USDT\",\"asset\":\"ATOM\",\"ultimaventa\":\"14.16\",\"price\":\"4.164\",\"btc\":\"60160.35\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:352.8deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"ATOMUSDT\",\"tendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"4.238\",\"mindia\":\"3.999\",\"totalTendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"utc\":\"1:39 AM\",\"techo\":\"4.158625000000\",\"piso\":\"4.056250000000\",\"totalmoneda\":\"<div style=width:100%;padding:3px;background:#372127;border-radius:3px;color:#F37A8B;>0.0000 ATOM <span style=color:#F37A8B;>&#9660;</span></div>\",\"ant\":\"4.00600000\",\"nivel\":\"<div class=odometros style=--data:244.8deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:219.6deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"69%\",\"ganancia\":\"0.0000\",\"perdida\":\"0.0000\",\"capital\":\"10.00\",\"disponible\":\"10.00\",\"escalones\":\"1\",\"invxcompra\":\"10.00000000\",\"totalpromedio\":4.1074375,\"xdisponible\":\"10.00\",\"grafico\":[{\"date\":\"2024-09-17\",\"high\":\"4.238\",\"low\":\"3.999\",\"prm\":\"4.053\"},{\"date\":\"2024-09-16\",\"high\":\"4.006\",\"low\":\"3.941\",\"prm\":\"3.971\"},{\"date\":\"2024-09-14\",\"high\":\"4.225\",\"low\":\"4.147\",\"prm\":\"4.083\"},{\"date\":\"2024-09-13\",\"high\":\"4.255\",\"low\":\"4.136\",\"prm\":\"4.080\"},{\"date\":\"2024-09-12\",\"high\":\"4.168\",\"low\":\"4.059\",\"prm\":\"4.037\"},{\"date\":\"2024-09-11\",\"high\":\"4.174\",\"low\":\"4.043\",\"prm\":\"4.042\"},{\"date\":\"2024-09-10\",\"high\":\"4.156\",\"low\":\"4.083\",\"prm\":\"4.025\"},{\"date\":\"2024-09-09\",\"high\":\"4.047\",\"low\":\"4.042\",\"prm\":\"3.992\"}],\"auto\":\"1\",\"bina\":\"0\",\"impuesto\":\"0.0200\",\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"9\",\"recordCount\":\"0\",\"colordisp\":\"#4BC883\",\"checkMesGrafico\":true,\"recupera\":\"4.17\",\"alert\":\"olive\",\"checkAnoGrafico\":false,\"verescalones\":\"<table style=width:100%;><th>Stop</th><th>Compra</th><th>Price</th><th>Wallet</th><th style=text-align:right;>Ganancia</th><th>Opciones</th></table>\",\"verbinance\":\"<table style=width:100%;><th>Estatus</th><th>Moneda</th><th>Cant.</th><th>Orden Id</th><th>Tipo</th><th>Opciones</th></table>\",\"labelpricebitcoin\":\"60160.35\",\"labelpricemoneda\":\"4.164\",\"precio_venta\":\"2\",\"listasset\":\"<table style=text-align:right;width:100%;><th></th><th></th><tr><td><span onclick=moneyChangue(1) style=cursor:pointer;color:#4BC883;>BTC</span></td><td><span style=color:#4BC883;font-weight:bold;>60160.35</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(6) style=cursor:pointer;color:#4BC883;>BNB</span></td><td><span style=color:#4BC883;font-weight:bold;>547.8</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(7) style=cursor:pointer;color:#F37A8B;>ETH</span></td><td><span style=color:#F37A8B;font-weight:bold;>2324.95</span></td><td><span class=bolita style=color:orange;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(9) style=cursor:pointer;color:#4BC883;>ATOM</span></td><td><span style=color:#4BC883;font-weight:bold;>4.164</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(15) style=cursor:pointer;color:#F37A8B;>NEAR</span></td><td><span style=color:#F37A8B;font-weight:bold;>4.068</span></td><td><span class=bolita style=color:orange;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(28) style=cursor:pointer;color:#4BC883;>INJ</span></td><td><span style=color:#4BC883;font-weight:bold;>19.430</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr></table>\",\"stop\":\"1\",\"balance\":\"0.00\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:-80deg;--color2:#F6465D;--data2:-220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}'),
(15, 'NEARUSDT', 'NEAR', 'USDT', 0.00000000, 0.00000000, 0.00000000, 0, 2.04000, '{\"balance_asset\":\"0.00000000\",\"par\":\"USDT\",\"asset\":\"NEAR\",\"ultimaventa\":\"2.0\",\"price\":\"4.069\",\"btc\":\"60160.35\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:360deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"NEARUSDT\",\"tendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"color\":\"#F37A8B\",\"maxdia\":\"4.300\",\"mindia\":\"3.893\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"utc\":\"1:39 AM\",\"techo\":\"4.159750000000\",\"piso\":\"3.989250000000\",\"totalmoneda\":\"<div style=width:100%;padding:3px;background:#372127;border-radius:3px;color:#F37A8B;>0.0000 NEAR <span style=color:#F37A8B;>&#9660;</span></div>\",\"ant\":\"3.90600000\",\"nivel\":\"<div class=odometros style=--data:147.6deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:219.6deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"43%\",\"ganancia\":\"0.0000\",\"perdida\":\"0.0000\",\"capital\":\"10.00\",\"disponible\":\"10.00\",\"escalones\":\"1\",\"invxcompra\":\"10.00000000\",\"totalpromedio\":4.0745000000000005,\"xdisponible\":\"10.00\",\"grafico\":[{\"date\":\"2024-09-17\",\"high\":\"4.300\",\"low\":\"3.893\",\"prm\":\"3.951\"},{\"date\":\"2024-09-16\",\"high\":\"3.906\",\"low\":\"3.833\",\"prm\":\"3.864\"},{\"date\":\"2024-09-14\",\"high\":\"4.243\",\"low\":\"4.155\",\"prm\":\"4.021\"},{\"date\":\"2024-09-13\",\"high\":\"4.344\",\"low\":\"4.118\",\"prm\":\"4.037\"},{\"date\":\"2024-09-12\",\"high\":\"4.299\",\"low\":\"4.094\",\"prm\":\"4.025\"},{\"date\":\"2024-09-11\",\"high\":\"4.149\",\"low\":\"3.888\",\"prm\":\"3.968\"},{\"date\":\"2024-09-10\",\"high\":\"4.071\",\"low\":\"3.974\",\"prm\":\"3.908\"},{\"date\":\"2024-09-09\",\"high\":\"3.966\",\"low\":\"3.959\",\"prm\":\"3.896\"}],\"auto\":\"1\",\"bina\":\"0\",\"impuesto\":\"0.0200\",\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"15\",\"recordCount\":\"0\",\"colordisp\":\"#4BC883\",\"checkMesGrafico\":true,\"recupera\":\"4.07\",\"alert\":\"orange\",\"checkAnoGrafico\":false,\"verescalones\":\"<table style=width:100%;><th>Stop</th><th>Compra</th><th>Price</th><th>Wallet</th><th style=text-align:right;>Ganancia</th><th>Opciones</th></table>\",\"verbinance\":\"<table style=width:100%;><th>Estatus</th><th>Moneda</th><th>Cant.</th><th>Orden Id</th><th>Tipo</th><th>Opciones</th></table>\",\"labelpricebitcoin\":\"60160.35\",\"labelpricemoneda\":\"4.069\",\"precio_venta\":\"2\",\"listasset\":\"<table style=text-align:right;width:100%;><th></th><th></th><tr><td><span onclick=moneyChangue(1) style=cursor:pointer;color:#4BC883;>BTC</span></td><td><span style=color:#4BC883;font-weight:bold;>60160.35</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(6) style=cursor:pointer;color:#4BC883;>BNB</span></td><td><span style=color:#4BC883;font-weight:bold;>547.8</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(7) style=cursor:pointer;color:#F37A8B;>ETH</span></td><td><span style=color:#F37A8B;font-weight:bold;>2324.95</span></td><td><span class=bolita style=color:orange;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(9) style=cursor:pointer;color:#4BC883;>ATOM</span></td><td><span style=color:#4BC883;font-weight:bold;>4.164</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(15) style=cursor:pointer;color:#F37A8B;>NEAR</span></td><td><span style=color:#F37A8B;font-weight:bold;>4.069</span></td><td><span class=bolita style=color:orange;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(28) style=cursor:pointer;color:#4BC883;>INJ</span></td><td><span style=color:#4BC883;font-weight:bold;>19.430</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr></table>\",\"stop\":\"1\",\"balance\":\"0.0\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:80deg;--color2:#F6465D;--data2:-220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}'),
(16, 'INJUSDT', 'INJ', 'USDT', 0.00000000, 0.00000000, 0.00000000, 0, 2.50400, '{\"balance_asset\":\"0.00000000\",\"par\":\"USDT\",\"asset\":\"INJ\",\"ultimaventa\":\"2.5\",\"price\":\"19.450\",\"btc\":\"60160.35\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:360deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"INJUSDT\",\"tendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"19.960\",\"mindia\":\"18.030\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"utc\":\"1:39 AM\",\"techo\":\"19.002500000000\",\"piso\":\"18.133750000000\",\"totalmoneda\":\"<div style=width:100%;padding:3px;background:#372127;border-radius:3px;color:#F37A8B;>0.0000 INJ <span style=color:#F37A8B;>&#9660;</span></div>\",\"ant\":\"18.17000000\",\"nivel\":\"<div class=odometros style=--data:259.2deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:219.6deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"74%\",\"ganancia\":\"0.0000\",\"perdida\":\"0.0000\",\"capital\":\"10.00\",\"disponible\":\"10.00\",\"escalones\":\"1\",\"invxcompra\":\"10.00000000\",\"totalpromedio\":18.568125000000002,\"xdisponible\":\"10.00\",\"grafico\":[{\"date\":\"2024-09-17\",\"high\":\"19.960\",\"low\":\"18.030\",\"prm\":\"18.590\"},{\"date\":\"2024-09-16\",\"high\":\"18.170\",\"low\":\"17.730\",\"prm\":\"17.885\"},{\"date\":\"2024-09-14\",\"high\":\"19.700\",\"low\":\"19.210\",\"prm\":\"18.620\"},{\"date\":\"2024-09-13\",\"high\":\"20.110\",\"low\":\"18.490\",\"prm\":\"18.675\"},{\"date\":\"2024-09-12\",\"high\":\"19.480\",\"low\":\"18.820\",\"prm\":\"18.415\"},{\"date\":\"2024-09-11\",\"high\":\"19.060\",\"low\":\"17.740\",\"prm\":\"18.395\"},{\"date\":\"2024-09-10\",\"high\":\"18.500\",\"low\":\"18.040\",\"prm\":\"18.065\"},{\"date\":\"2024-09-09\",\"high\":\"17.040\",\"low\":\"17.010\",\"prm\":\"17.375\"}],\"auto\":\"1\",\"bina\":\"0\",\"impuesto\":\"0.0200\",\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"16\",\"recordCount\":\"0\",\"colordisp\":\"#4BC883\",\"checkMesGrafico\":true,\"recupera\":\"19.47\",\"alert\":\"olive\",\"checkAnoGrafico\":false,\"verescalones\":\"<table style=width:100%;><th>Stop</th><th>Compra</th><th>Price</th><th>Wallet</th><th style=text-align:right;>Ganancia</th><th>Opciones</th></table>\",\"verbinance\":\"<table style=width:100%;><th>Estatus</th><th>Moneda</th><th>Cant.</th><th>Orden Id</th><th>Tipo</th><th>Opciones</th></table>\",\"labelpricebitcoin\":\"60160.35\",\"labelpricemoneda\":\"19.450\",\"precio_venta\":\"2\",\"listasset\":\"<table style=text-align:right;width:100%;><th></th><th></th><tr><td><span onclick=moneyChangue(1) style=cursor:pointer;color:#4BC883;>BTC</span></td><td><span style=color:#4BC883;font-weight:bold;>60160.35</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(6) style=cursor:pointer;color:#4BC883;>BNB</span></td><td><span style=color:#4BC883;font-weight:bold;>547.8</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(7) style=cursor:pointer;color:#F37A8B;>ETH</span></td><td><span style=color:#F37A8B;font-weight:bold;>2324.95</span></td><td><span class=bolita style=color:orange;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(9) style=cursor:pointer;color:#4BC883;>ATOM</span></td><td><span style=color:#4BC883;font-weight:bold;>4.164</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(15) style=cursor:pointer;color:#F37A8B;>NEAR</span></td><td><span style=color:#F37A8B;font-weight:bold;>4.069</span></td><td><span class=bolita style=color:orange;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(28) style=cursor:pointer;color:#4BC883;>INJ</span></td><td><span style=color:#4BC883;font-weight:bold;>19.450</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr></table>\",\"stop\":\"1\",\"balance\":\"0.0\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:-80deg;--color2:#F6465D;--data2:-220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}'),
(17, 'LTCUSDT', 'LTC', 'USDT', 0.00000000, 0.00000000, 0.00000000, 0, 0.00000, '{\"balance_asset\":\"0.00000000\",\"par\":\"USDT\",\"asset\":\"LTC\",\"ultimaventa\":\"0.000\",\"price\":\"63.54\",\"btc\":\"60160.35\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:360deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"LTCUSDT\",\"tendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"64.03\",\"mindia\":\"62.24\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"utc\":\"1:39 AM\",\"techo\":\"63.447500000000\",\"piso\":\"61.883750000000\",\"totalmoneda\":\"<div style=width:100%;padding:3px;background:#372127;border-radius:3px;color:#F37A8B;>0.0000 LTC <span style=color:#F37A8B;>&#9660;</span></div>\",\"ant\":\"63.22000000\",\"nivel\":\"<div class=odometros style=--data:144deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:219.6deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"73%\",\"ganancia\":\"0.0000\",\"perdida\":\"0.0000\",\"capital\":\"10.00\",\"disponible\":\"10.00\",\"escalones\":\"1\",\"invxcompra\":\"10.00000000\",\"totalpromedio\":62.665625,\"xdisponible\":\"10.00\",\"grafico\":[{\"date\":\"2024-09-17\",\"high\":\"64.03\",\"low\":\"62.24\",\"prm\":\"62.74\"},{\"date\":\"2024-09-16\",\"high\":\"63.22\",\"low\":\"61.94\",\"prm\":\"62.58\"},{\"date\":\"2024-09-14\",\"high\":\"66.74\",\"low\":\"64.91\",\"prm\":\"64.08\"},{\"date\":\"2024-09-13\",\"high\":\"65.62\",\"low\":\"62.46\",\"prm\":\"63.63\"},{\"date\":\"2024-09-12\",\"high\":\"63.12\",\"low\":\"61.56\",\"prm\":\"62.22\"},{\"date\":\"2024-09-11\",\"high\":\"62.50\",\"low\":\"60.65\",\"prm\":\"62.16\"},{\"date\":\"2024-09-10\",\"high\":\"61.77\",\"low\":\"60.80\",\"prm\":\"61.66\"},{\"date\":\"2024-09-09\",\"high\":\"60.58\",\"low\":\"60.51\",\"prm\":\"61.26\"}],\"auto\":\"1\",\"bina\":\"0\",\"impuesto\":\"0.0200\",\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"17\",\"recordCount\":\"0\",\"colordisp\":\"#4BC883\",\"checkMesGrafico\":true,\"recupera\":\"63.60\",\"alert\":\"olive\",\"checkAnoGrafico\":false,\"verescalones\":\"<table style=width:100%;><th>Stop</th><th>Compra</th><th>Price</th><th>Wallet</th><th style=text-align:right;>Ganancia</th><th>Opciones</th></table>\",\"verbinance\":\"<table style=width:100%;><th>Estatus</th><th>Moneda</th><th>Cant.</th><th>Orden Id</th><th>Tipo</th><th>Opciones</th></table>\",\"labelpricebitcoin\":\"60160.35\",\"labelpricemoneda\":\"63.54\",\"precio_venta\":\"2\",\"listasset\":\"<table style=text-align:right;width:100%;><th></th><th></th><tr><td><span onclick=moneyChangue(1) style=cursor:pointer;color:#4BC883;>BTC</span></td><td><span style=color:#4BC883;font-weight:bold;>60160.35</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(6) style=cursor:pointer;color:#4BC883;>BNB</span></td><td><span style=color:#4BC883;font-weight:bold;>547.8</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(7) style=cursor:pointer;color:#F37A8B;>ETH</span></td><td><span style=color:#F37A8B;font-weight:bold;>2324.95</span></td><td><span class=bolita style=color:orange;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(9) style=cursor:pointer;color:#4BC883;>ATOM</span></td><td><span style=color:#4BC883;font-weight:bold;>4.164</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(15) style=cursor:pointer;color:#F37A8B;>NEAR</span></td><td><span style=color:#F37A8B;font-weight:bold;>4.069</span></td><td><span class=bolita style=color:orange;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(28) style=cursor:pointer;color:#4BC883;>INJ</span></td><td><span style=color:#4BC883;font-weight:bold;>19.450</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr></table>\",\"stop\":\"1\",\"balance\":\"0.000\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:-80deg;--color2:#F6465D;--data2:-220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}'),
(18, 'PAXGUSDT', 'PAXG', 'USDT', 0.00000000, 0.00000000, 0.00000000, 0, 1748.00000, '{\"balance_asset\":\"0.00000000\",\"par\":\"USDT\",\"asset\":\"PAXG\",\"ultimaventa\":\"1748.0000\",\"price\":\"2582\",\"btc\":\"60160.35\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:0deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"PAXGUSDT\",\"tendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"2614\",\"mindia\":\"2572\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"utc\":\"1:39 AM\",\"techo\":\"2561.875000000000\",\"piso\":\"2541.250000000000\",\"totalmoneda\":\"<div style=width:100%;padding:3px;background:#372127;border-radius:3px;color:#F37A8B;>0.0000 PAXG <span style=color:#F37A8B;>&#9660;</span></div>\",\"ant\":\"2598.00000000\",\"nivel\":\"<div class=odometros style=--data:0deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:219.6deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"24%\",\"ganancia\":\"0.0000\",\"perdida\":\"0.0000\",\"capital\":\"10.00\",\"disponible\":\"10.00\",\"escalones\":\"1\",\"invxcompra\":\"10.00000000\",\"totalpromedio\":2551.5625,\"xdisponible\":\"10.00\",\"grafico\":[{\"date\":\"2024-09-17\",\"high\":\"2614\",\"low\":\"2572\",\"prm\":\"2585\"},{\"date\":\"2024-09-16\",\"high\":\"2598\",\"low\":\"2587\",\"prm\":\"2588\"},{\"date\":\"2024-09-14\",\"high\":\"2580\",\"low\":\"2569\",\"prm\":\"2583\"},{\"date\":\"2024-09-13\",\"high\":\"2584\",\"low\":\"2560\",\"prm\":\"2581\"},{\"date\":\"2024-09-12\",\"high\":\"2563\",\"low\":\"2520\",\"prm\":\"2574\"},{\"date\":\"2024-09-11\",\"high\":\"2527\",\"low\":\"2502\",\"prm\":\"2554\"},{\"date\":\"2024-09-10\",\"high\":\"2521\",\"low\":\"2513\",\"prm\":\"2554\"},{\"date\":\"2024-09-09\",\"high\":\"2508\",\"low\":\"2507\",\"prm\":\"2548\"}],\"auto\":\"1\",\"bina\":\"0\",\"impuesto\":\"0.0200\",\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"18\",\"recordCount\":\"0\",\"colordisp\":\"#4BC883\",\"checkMesGrafico\":true,\"recupera\":\"2584.58\",\"alert\":\"orange\",\"checkAnoGrafico\":false,\"verescalones\":\"<table style=width:100%;><th>Stop</th><th>Compra</th><th>Price</th><th>Wallet</th><th style=text-align:right;>Ganancia</th><th>Opciones</th></table>\",\"verbinance\":\"<table style=width:100%;><th>Estatus</th><th>Moneda</th><th>Cant.</th><th>Orden Id</th><th>Tipo</th><th>Opciones</th></table>\",\"labelpricebitcoin\":\"60160.35\",\"labelpricemoneda\":\"2582\",\"precio_venta\":\"2\",\"listasset\":\"<table style=text-align:right;width:100%;><th></th><th></th><tr><td><span onclick=moneyChangue(1) style=cursor:pointer;color:#4BC883;>BTC</span></td><td><span style=color:#4BC883;font-weight:bold;>60160.35</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(6) style=cursor:pointer;color:#4BC883;>BNB</span></td><td><span style=color:#4BC883;font-weight:bold;>547.8</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(7) style=cursor:pointer;color:#F37A8B;>ETH</span></td><td><span style=color:#F37A8B;font-weight:bold;>2324.95</span></td><td><span class=bolita style=color:orange;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(9) style=cursor:pointer;color:#4BC883;>ATOM</span></td><td><span style=color:#4BC883;font-weight:bold;>4.164</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(15) style=cursor:pointer;color:#F37A8B;>NEAR</span></td><td><span style=color:#F37A8B;font-weight:bold;>4.069</span></td><td><span class=bolita style=color:orange;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(28) style=cursor:pointer;color:#4BC883;>INJ</span></td><td><span style=color:#4BC883;font-weight:bold;>19.450</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr></table>\",\"stop\":\"1\",\"balance\":\"0.0000\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:80deg;--color2:#F6465D;--data2:-220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}'),
(19, 'RUNEUSDC', 'RUNE', 'USDT', 0.00000000, 0.00000000, 0.00000000, 1, 0.00000, '{\"balance_asset\":\"0.00000000\",\"par\":\"USDT\",\"asset\":\"RUNE\",\"ultimaventa\":\"0.0\",\"price\":\"4.009\",\"btc\":\"60160.35\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:334.8deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"RUNEUSDC\",\"tendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"color\":\"#F37A8B\",\"maxdia\":\"4.150\",\"mindia\":\"3.837\",\"totalTendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"utc\":\"1:39 AM\",\"techo\":\"4.058250000000\",\"piso\":\"3.874250000000\",\"totalmoneda\":\"<div style=width:100%;padding:3px;background:#372127;border-radius:3px;color:#F37A8B;>0.0000 RUNE <span style=color:#F37A8B;>&#9660;</span></div>\",\"ant\":\"3.88400000\",\"nivel\":\"<div class=odometros style=--data:169.2deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:219.6deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"55%\",\"ganancia\":\"0.0000\",\"perdida\":\"0.0000\",\"capital\":\"10.00\",\"disponible\":\"10.00\",\"escalones\":\"1\",\"invxcompra\":\"10.00000000\",\"totalpromedio\":3.96625,\"xdisponible\":\"10.00\",\"grafico\":[{\"date\":\"2024-09-17\",\"high\":\"4.150\",\"low\":\"3.837\",\"prm\":\"3.907\"},{\"date\":\"2024-09-16\",\"high\":\"3.884\",\"low\":\"3.804\",\"prm\":\"3.821\"},{\"date\":\"2024-09-14\",\"high\":\"4.135\",\"low\":\"3.989\",\"prm\":\"3.905\"},{\"date\":\"2024-09-13\",\"high\":\"4.181\",\"low\":\"3.829\",\"prm\":\"3.970\"},{\"date\":\"2024-09-12\",\"high\":\"4.083\",\"low\":\"3.805\",\"prm\":\"3.839\"},{\"date\":\"2024-09-11\",\"high\":\"4.127\",\"low\":\"3.943\",\"prm\":\"3.915\"},{\"date\":\"2024-09-10\",\"high\":\"4.105\",\"low\":\"3.990\",\"prm\":\"3.909\"},{\"date\":\"2024-09-09\",\"high\":\"3.801\",\"low\":\"3.797\",\"prm\":\"3.801\"}],\"auto\":\"1\",\"bina\":\"0\",\"impuesto\":\"0.0200\",\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"19\",\"recordCount\":\"0\",\"colordisp\":\"#4BC883\",\"checkMesGrafico\":true,\"recupera\":\"4.01\",\"alert\":\"black\",\"checkAnoGrafico\":false,\"verescalones\":\"<table style=width:100%;><th>Stop</th><th>Compra</th><th>Price</th><th>Wallet</th><th style=text-align:right;>Ganancia</th><th>Opciones</th></table>\",\"verbinance\":\"<table style=width:100%;><th>Estatus</th><th>Moneda</th><th>Cant.</th><th>Orden Id</th><th>Tipo</th><th>Opciones</th></table>\",\"labelpricebitcoin\":\"60160.35\",\"labelpricemoneda\":\"4.009\",\"precio_venta\":\"2\",\"listasset\":\"<table style=text-align:right;width:100%;><th></th><th></th><tr><td><span onclick=moneyChangue(1) style=cursor:pointer;color:#4BC883;>BTC</span></td><td><span style=color:#4BC883;font-weight:bold;>60160.35</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(6) style=cursor:pointer;color:#4BC883;>BNB</span></td><td><span style=color:#4BC883;font-weight:bold;>547.8</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(7) style=cursor:pointer;color:#F37A8B;>ETH</span></td><td><span style=color:#F37A8B;font-weight:bold;>2324.95</span></td><td><span class=bolita style=color:orange;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(9) style=cursor:pointer;color:#4BC883;>ATOM</span></td><td><span style=color:#4BC883;font-weight:bold;>4.164</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(15) style=cursor:pointer;color:#F37A8B;>NEAR</span></td><td><span style=color:#F37A8B;font-weight:bold;>4.069</span></td><td><span class=bolita style=color:orange;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(28) style=cursor:pointer;color:#4BC883;>INJ</span></td><td><span style=color:#4BC883;font-weight:bold;>19.450</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr></table>\",\"stop\":\"1\",\"balance\":\"0.0\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:-80deg;--color2:#F6465D;--data2:-220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}'),
(20, 'SHIBUSDC', 'SHIB', 'USDC', 0.00000000, 0.00000000, 0.00000000, 0, 0.00000, '{\"balance_asset\":\"0.00000000\",\"par\":\"USDC\",\"asset\":\"SHIB\",\"ultimaventa\":\"0\",\"price\":\"0.00001324\",\"btc\":\"60170.01\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:0deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"SHIBUSDC\",\"tendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"color\":\"#F37A8B\",\"maxdia\":\"0.00001357\",\"mindia\":\"0.00001317\",\"totalTendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"utc\":\"1:39 AM\",\"techo\":\"0.000013608750\",\"piso\":\"0.000013276250\",\"totalmoneda\":\"<div style=width:100%;padding:3px;background:#372127;border-radius:3px;color:#F37A8B;>0.0000 SHIB <span style=color:#F37A8B;>&#9660;</span></div>\",\"ant\":\"0.00001321\",\"nivel\":\"<div class=odometros style=--data:28.8deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:223.2deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"18%\",\"ganancia\":\"0.0000\",\"perdida\":\"0.0000\",\"capital\":\"10.00\",\"disponible\":\"10.00\",\"escalones\":\"1\",\"invxcompra\":\"10.00000000\",\"totalpromedio\":1.34425e-5,\"xdisponible\":\"10.00\",\"grafico\":[{\"date\":\"2024-09-17\",\"high\":\"0.00001357\",\"low\":\"0.00001317\",\"prm\":1.314e-5},{\"date\":\"2024-09-16\",\"high\":\"0.00001321\",\"low\":\"0.00001304\",\"prm\":1.312e-5},{\"date\":\"2024-09-14\",\"high\":\"0.00001400\",\"low\":\"0.00001362\",\"prm\":1.339e-5},{\"date\":\"2024-09-13\",\"high\":\"0.00001410\",\"low\":\"0.00001339\",\"prm\":1.352e-5},{\"date\":\"2024-09-12\",\"high\":\"0.00001354\",\"low\":\"0.00001320\",\"prm\":1.323e-5},{\"date\":\"2024-09-11\",\"high\":\"0.00001344\",\"low\":\"0.00001313\",\"prm\":1.323e-5},{\"date\":\"2024-09-10\",\"high\":\"0.00001364\",\"low\":\"0.00001330\",\"prm\":1.318e-5},{\"date\":\"2024-09-09\",\"high\":\"0.00001337\",\"low\":\"0.00001336\",\"prm\":1.3205e-5}],\"auto\":\"1\",\"bina\":\"0\",\"impuesto\":\"0.0200\",\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"20\",\"recordCount\":\"0\",\"colordisp\":\"#4BC883\",\"checkMesGrafico\":true,\"recupera\":\"0.00\",\"alert\":\"yellow\",\"checkAnoGrafico\":false,\"verescalones\":\"<table style=width:100%;><th>Stop</th><th>Compra</th><th>Price</th><th>Wallet</th><th style=text-align:right;>Ganancia</th><th>Opciones</th></table>\",\"verbinance\":\"<table style=width:100%;><th>Estatus</th><th>Moneda</th><th>Cant.</th><th>Orden Id</th><th>Tipo</th><th>Opciones</th></table>\",\"labelpricebitcoin\":\"60170.01\",\"labelpricemoneda\":\"0.00001324\",\"precio_venta\":\"2\",\"listasset\":\"<table style=text-align:right;width:100%;><th></th><th></th><tr><td><span onclick=moneyChangue(1) style=cursor:pointer;color:#4BC883;>BTC</span></td><td><span style=color:#4BC883;font-weight:bold;>60170.01</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(6) style=cursor:pointer;color:#4BC883;>BNB</span></td><td><span style=color:#4BC883;font-weight:bold;>547.8</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(7) style=cursor:pointer;color:#F37A8B;>ETH</span></td><td><span style=color:#F37A8B;font-weight:bold;>2325.19</span></td><td><span class=bolita style=color:orange;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(9) style=cursor:pointer;color:#4BC883;>ATOM</span></td><td><span style=color:#4BC883;font-weight:bold;>4.164</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(15) style=cursor:pointer;color:#F37A8B;>NEAR</span></td><td><span style=color:#F37A8B;font-weight:bold;>4.068</span></td><td><span class=bolita style=color:orange;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(28) style=cursor:pointer;color:#4BC883;>INJ</span></td><td><span style=color:#4BC883;font-weight:bold;>19.430</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr></table>\",\"stop\":\"1\",\"balance\":\"0\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:80deg;--color2:#F6465D;--data2:220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}'),
(21, 'DOGEUSDC', 'DOGE', 'USDC', 0.00000000, 0.00000000, 0.00000000, 0, 0.00000, '{\"balance_asset\":\"0.00000000\",\"par\":\"USDC\",\"asset\":\"DOGE\",\"ultimaventa\":\"0\",\"price\":\"0.10036\",\"btc\":\"60170.01\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:360deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"DOGEUSDC\",\"tendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"color\":\"#F37A8B\",\"maxdia\":\"0.10257\",\"mindia\":\"0.09960\",\"totalTendencia\":\"<span style=color:#EA465C;font-weight:bold;>&#9660;</span>\",\"utc\":\"1:39 AM\",\"techo\":\"0.103728750000\",\"piso\":\"0.101053750000\",\"totalmoneda\":\"<div style=width:100%;padding:3px;background:#372127;border-radius:3px;color:#F37A8B;>0.0000 DOGE <span style=color:#F37A8B;>&#9660;</span></div>\",\"ant\":\"0.09998000\",\"nivel\":\"<div class=odometros style=--data:54deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:223.2deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"26%\",\"ganancia\":\"0.0000\",\"perdida\":\"0.0000\",\"capital\":\"10.00\",\"disponible\":\"10.00\",\"escalones\":\"1\",\"invxcompra\":\"10.00000000\",\"totalpromedio\":0.10239124999999999,\"xdisponible\":\"10.00\",\"grafico\":[{\"date\":\"2024-09-17\",\"high\":\"0.10257\",\"low\":\"0.09960\",\"prm\":\"0.09955\"},{\"date\":\"2024-09-16\",\"high\":\"0.09998\",\"low\":\"0.09873\",\"prm\":\"0.09928\"},{\"date\":\"2024-09-14\",\"high\":\"0.10739\",\"low\":\"0.10491\",\"prm\":\"0.10193\"},{\"date\":\"2024-09-13\",\"high\":\"0.10836\",\"low\":\"0.10185\",\"prm\":\"0.10297\"},{\"date\":\"2024-09-12\",\"high\":\"0.10293\",\"low\":\"0.10065\",\"prm\":\"0.10029\"},{\"date\":\"2024-09-11\",\"high\":\"0.10259\",\"low\":\"0.09922\",\"prm\":\"0.10056\"},{\"date\":\"2024-09-10\",\"high\":\"0.10323\",\"low\":\"0.10084\",\"prm\":\"0.09984\"},{\"date\":\"2024-09-09\",\"high\":\"0.10278\",\"low\":\"0.10263\",\"prm\":\"0.10068\"}],\"auto\":\"1\",\"bina\":\"0\",\"impuesto\":\"0.0200\",\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"21\",\"recordCount\":\"0\",\"colordisp\":\"#4BC883\",\"checkMesGrafico\":true,\"recupera\":\"0.10\",\"alert\":\"orange\",\"checkAnoGrafico\":false,\"verescalones\":\"<table style=width:100%;><th>Stop</th><th>Compra</th><th>Price</th><th>Wallet</th><th style=text-align:right;>Ganancia</th><th>Opciones</th></table>\",\"verbinance\":\"<table style=width:100%;><th>Estatus</th><th>Moneda</th><th>Cant.</th><th>Orden Id</th><th>Tipo</th><th>Opciones</th></table>\",\"labelpricebitcoin\":\"60170.01\",\"labelpricemoneda\":\"0.10036\",\"precio_venta\":\"2\",\"listasset\":\"<table style=text-align:right;width:100%;><th></th><th></th><tr><td><span onclick=moneyChangue(1) style=cursor:pointer;color:#4BC883;>BTC</span></td><td><span style=color:#4BC883;font-weight:bold;>60170.01</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(6) style=cursor:pointer;color:#4BC883;>BNB</span></td><td><span style=color:#4BC883;font-weight:bold;>547.8</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(7) style=cursor:pointer;color:#F37A8B;>ETH</span></td><td><span style=color:#F37A8B;font-weight:bold;>2325.19</span></td><td><span class=bolita style=color:orange;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(9) style=cursor:pointer;color:#4BC883;>ATOM</span></td><td><span style=color:#4BC883;font-weight:bold;>4.164</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(15) style=cursor:pointer;color:#F37A8B;>NEAR</span></td><td><span style=color:#F37A8B;font-weight:bold;>4.068</span></td><td><span class=bolita style=color:orange;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(28) style=cursor:pointer;color:#4BC883;>INJ</span></td><td><span style=color:#4BC883;font-weight:bold;>19.430</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr></table>\",\"stop\":\"1\",\"balance\":\"0\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:80deg;--color2:#F6465D;--data2:-220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}');

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
(6, 'dd77b701661c5b55', 'BNBUSDT', 'BNB', 'USDT', 0.00120338, 600.00000000, 260.00000000, 0, 348.90000, NULL),
(7, 'dd77b701661c5b55', 'ETHUSDT', 'ETH', 'USDT', 0.00000000, 3000.00000000, 1484.00000000, 0, 1266.00000, NULL),
(9, 'dd77b701661c5b55', 'ATOMUSDT', 'ATOM', 'USDT', 0.00000000, 17.00000000, 9.00000000, 0, 14.15600, NULL),
(15, 'dd77b701661c5b55', 'NEARUSDT', 'NEAR', 'USDT', 0.00000000, 0.00000000, 0.00000000, 0, 2.04000, NULL),
(22, 'cf804109f32fb39a', 'BTCUSDT', 'BTC', 'USDT', 0.00000000, 0.00000000, 0.00000000, 1, 0.00000, NULL),
(28, 'dd77b701661c5b55', 'INJUSDT', 'INJ', 'USDT', 0.00000000, 0.00000000, 0.00000000, 1, 0.00000, NULL);

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
(1, 'dd77b701661c5b55', 'USDT', 10.00000000, 1, 10.00000000, 10.00000000, 0.00000000, 0.00000000, 0.02000000, 1, 0, 'Dt7T5bPCyEfhX8XabI9F4k9KYzdycVJPYXZSak5CQTBXWkhydGwrQ1lDaXF5TGFSMlpRM0JFL1k0SUtsc2c2dDJZZDJFQVJuejNMY2xLQ1FjNldWOGFRUURGSHJhMlBaWHgyYWdUMlU4dFBUbzBBZ0duZ255aHN3ZGlnPQ==', 'AdaCX7LKVBpr6gDgOWVR9TVQbjMrVWF3RjNVSi9tTDM5RnJBREJucVFzbVNGSVpVOC95dS8zUWhuNFU0bk16Rk0vNGF0MW4xWnc0L1RsTUdyUVZndWVFMWwwMTFGVHA1Z0lnM1BiKzRYdTl6djZLcEZxa241cFZrS044PQ==', 1, 2, '{\"balance_asset\":\"0.00000000\",\"par\":\"USDT\",\"asset\":\"INJ\",\"ultimaventa\":\"0.0\",\"price\":\"19.450\",\"btc\":\"60160.35\",\"colorbtc\":\"#4BC883\",\"symbol\":\"<div class=odometros style=--data:360deg;><div id=grad2>BUY</div></div>\",\"moneda\":\"INJUSDT\",\"tendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"color\":\"#4BC883\",\"maxdia\":\"19.960\",\"mindia\":\"18.030\",\"totalTendencia\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"utc\":\"1:39 AM\",\"techo\":\"19.002500000000\",\"piso\":\"18.133750000000\",\"totalmoneda\":\"<div style=width:100%;padding:3px;background:#372127;border-radius:3px;color:#F37A8B;>0.0000 INJ <span style=color:#F37A8B;>&#9660;</span></div>\",\"ant\":\"18.17000000\",\"nivel\":\"<div class=odometros style=--data:259.2deg;><div id=grad2>SELL</div></div>\",\"nivelbtc\":\"<div class=odometrosBtc style=--data:219.6deg;><div id=grad2>BTC</div></div>\",\"porcenmax\":\"74%\",\"ganancia\":\"0.0000\",\"perdida\":\"0.0000\",\"capital\":\"10.00\",\"disponible\":\"10.00\",\"escalones\":\"1\",\"invxcompra\":\"10.00000000\",\"totalpromedio\":18.568125000000002,\"xdisponible\":\"10.00\",\"grafico\":[{\"date\":\"2024-09-17\",\"high\":\"19.960\",\"low\":\"18.030\",\"prm\":\"18.590\"},{\"date\":\"2024-09-16\",\"high\":\"18.170\",\"low\":\"17.730\",\"prm\":\"17.885\"},{\"date\":\"2024-09-14\",\"high\":\"19.700\",\"low\":\"19.210\",\"prm\":\"18.620\"},{\"date\":\"2024-09-13\",\"high\":\"20.110\",\"low\":\"18.490\",\"prm\":\"18.675\"},{\"date\":\"2024-09-12\",\"high\":\"19.480\",\"low\":\"18.820\",\"prm\":\"18.415\"},{\"date\":\"2024-09-11\",\"high\":\"19.060\",\"low\":\"17.740\",\"prm\":\"18.395\"},{\"date\":\"2024-09-10\",\"high\":\"18.500\",\"low\":\"18.040\",\"prm\":\"18.065\"},{\"date\":\"2024-09-09\",\"high\":\"17.040\",\"low\":\"17.010\",\"prm\":\"17.375\"}],\"auto\":\"1\",\"bina\":\"0\",\"impuesto\":\"0.0200\",\"mercado\":\"<span style=color:#4DCB85;font-weight:bold;>&#9650;</span>\",\"id\":\"28\",\"recordCount\":\"0\",\"colordisp\":\"#4BC883\",\"checkMesGrafico\":true,\"recupera\":\"19.47\",\"alert\":\"olive\",\"checkAnoGrafico\":false,\"verescalones\":\"<table style=width:100%;><th>Stop</th><th>Compra</th><th>Price</th><th>Wallet</th><th style=text-align:right;>Ganancia</th><th>Opciones</th></table>\",\"verbinance\":\"<table style=width:100%;><th>Estatus</th><th>Moneda</th><th>Cant.</th><th>Orden Id</th><th>Tipo</th><th>Opciones</th></table>\",\"labelpricebitcoin\":\"60160.35\",\"labelpricemoneda\":\"19.450\",\"precio_venta\":\"2\",\"listasset\":\"<table style=text-align:right;width:100%;><th></th><th></th><tr><td><span onclick=moneyChangue(1) style=cursor:pointer;color:#4BC883;>BTC</span></td><td><span style=color:#4BC883;font-weight:bold;>60160.35</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(6) style=cursor:pointer;color:#4BC883;>BNB</span></td><td><span style=color:#4BC883;font-weight:bold;>547.8</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(7) style=cursor:pointer;color:#F37A8B;>ETH</span></td><td><span style=color:#F37A8B;font-weight:bold;>2324.95</span></td><td><span class=bolita style=color:orange;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(9) style=cursor:pointer;color:#4BC883;>ATOM</span></td><td><span style=color:#4BC883;font-weight:bold;>4.164</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(15) style=cursor:pointer;color:#F37A8B;>NEAR</span></td><td><span style=color:#F37A8B;font-weight:bold;>4.069</span></td><td><span class=bolita style=color:orange;>&#9679;</span></td></tr><tr><td><span onclick=moneyChangue(28) style=cursor:pointer;color:#4BC883;>INJ</span></td><td><span style=color:#4BC883;font-weight:bold;>19.450</span></td><td><span class=bolita style=color:olive;>&#9679;</span></td></tr></table>\",\"stop\":\"1\",\"balance\":\"0.0\",\"nivelcompra\":\"<div class=odometroalert style=--color1:#F6465D;--data1:-80deg;--color2:#F6465D;--data2:-220deg;--color3:#F6465D;--data3:-360deg;--color4:#85929e;--data4:-360deg;><div id=grad2>BUY</div></div>\"}', 0),
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
(1, '2024-09-09', 'BTCUSDT', 56628.00000000, 56666.00000000, 56608.51000000, 0.00000000, 0.00000000, 1, 0, 0, 0, 0),
(2, '2024-09-09', 'BNBUSDT', 515.40000000, 515.70000000, 515.30000000, 0.00000000, 0.00000000, 1, 0, 0, 0, 0),
(3, '2024-09-09', 'ETHUSDT', 2341.50000000, 2344.45000000, 2340.96000000, 0.00000000, 0.00000000, 1, 0, 0, 0, 0),
(4, '2024-09-09', 'ATOMUSDT', 4.04300000, 4.04700000, 4.04200000, 0.00000000, 0.00000000, 1, 0, 0, 0, 0),
(5, '2024-09-09', 'NEARUSDT', 3.95900000, 3.96600000, 3.95900000, 0.00000000, 0.00000000, 1, 0, 0, 0, 0),
(6, '2024-09-09', 'INJUSDT', 17.02000000, 17.04000000, 17.01000000, 0.00000000, 0.00000000, 1, 0, 0, 0, 0),
(7, '2024-09-09', 'LTCUSDT', 60.58000000, 60.58000000, 60.51000000, 0.00000000, 0.00000000, 1, 0, 0, 0, 0),
(8, '2024-09-09', 'PAXGUSDT', 2508.00000000, 2508.00000000, 2507.00000000, 0.00000000, 0.00000000, 1, 0, 0, 0, 0),
(9, '2024-09-09', 'RUNEUSDC', 3.79700000, 3.80100000, 3.79700000, 0.00000000, 0.00000000, 1, 0, 0, 0, 0),
(10, '2024-09-09', 'SHIBUSDC', 0.00001337, 0.00001337, 0.00001336, 0.00000000, 0.00000000, 1, 0, 0, 0, 0),
(11, '2024-09-09', 'DOGEUSDC', 0.10263000, 0.10278000, 0.10263000, 0.00000000, 0.00000000, 1, 0, 0, 0, 0),
(12, '2024-09-10', 'BTCUSDT', 56816.18000000, 58038.00000000, 56713.79000000, 0.00000000, 0.00000000, 0, 1, 0, 0, 0),
(13, '2024-09-10', 'BNBUSDT', 514.60000000, 522.20000000, 511.80000000, 0.00000000, 0.00000000, 0, 1, 0, 0, 0),
(14, '2024-09-10', 'ETHUSDT', 2347.79000000, 2398.18000000, 2344.30000000, 0.00000000, 0.00000000, 0, 1, 0, 0, 0),
(15, '2024-09-10', 'ATOMUSDT', 4.10800000, 4.15600000, 4.08300000, 0.00000000, 0.00000000, 0, 1, 0, 0, 0),
(16, '2024-09-10', 'NEARUSDT', 3.98300000, 4.07100000, 3.97400000, 0.00000000, 0.00000000, 0, 1, 0, 0, 0),
(17, '2024-09-10', 'INJUSDT', 18.40000000, 18.50000000, 18.04000000, 0.00000000, 0.00000000, 0, 1, 0, 0, 0),
(18, '2024-09-10', 'LTCUSDT', 61.38000000, 61.77000000, 60.80000000, 0.00000000, 0.00000000, 0, 1, 0, 0, 0),
(19, '2024-09-10', 'PAXGUSDT', 2521.00000000, 2521.00000000, 2513.00000000, 0.00000000, 0.00000000, 0, 1, 0, 0, 0),
(20, '2024-09-10', 'RUNEUSDC', 4.01400000, 4.10500000, 3.99000000, 0.00000000, 0.00000000, 0, 1, 0, 0, 0),
(21, '2024-09-10', 'SHIBUSDC', 0.00001332, 0.00001364, 0.00001330, 0.00000000, 0.00000000, 0, 1, 0, 0, 0),
(22, '2024-09-10', 'DOGEUSDC', 0.10095000, 0.10323000, 0.10084000, 0.00000000, 0.00000000, 0, 1, 0, 0, 0),
(23, '2024-09-11', 'INJUSDT', 19.06000000, 19.06000000, 17.74000000, 0.00000000, 19.06000000, 0, 1, 0, 0, 0),
(24, '2024-09-11', 'LTCUSDT', 62.37000000, 62.50000000, 60.65000000, 0.00000000, 62.37000000, 0, 1, 0, 0, 0),
(25, '2024-09-11', 'PAXGUSDT', 2521.00000000, 2527.00000000, 2502.00000000, 0.00000000, 2521.00000000, 0, 1, 0, 0, 0),
(26, '2024-09-11', 'RUNEUSDC', 4.02500000, 4.12700000, 3.94300000, 0.00000000, 4.02500000, 0, 1, 0, 0, 0),
(27, '2024-09-11', 'SHIBUSDC', 0.00001342, 0.00001344, 0.00001313, 0.00000000, 0.00001342, 1, 0, 0, 0, 0),
(28, '2024-09-11', 'DOGEUSDC', 0.10238000, 0.10259000, 0.09922000, 0.00000000, 0.10238000, 1, 0, 0, 0, 0),
(29, '2024-09-11', 'BTCUSDT', 58234.46000000, 58308.31000000, 56106.00000000, 0.00000000, 58234.46000000, 0, 1, 0, 0, 0),
(30, '2024-09-11', 'BNBUSDT', 543.00000000, 545.90000000, 507.00000000, 0.00000000, 543.00000000, 0, 1, 0, 0, 0),
(31, '2024-09-11', 'ETHUSDT', 2369.49000000, 2383.40000000, 2308.80000000, 0.00000000, 2369.49000000, 1, 0, 0, 0, 0),
(32, '2024-09-11', 'ATOMUSDT', 4.14200000, 4.17400000, 4.04300000, 0.00000000, 4.14200000, 0, 1, 0, 0, 0),
(33, '2024-09-11', 'NEARUSDT', 4.10300000, 4.14900000, 3.88800000, 0.00000000, 4.10300000, 0, 1, 0, 0, 0),
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
(56, '2024-09-14', 'RUNEUSDC', 4.00600000, 4.13500000, 3.98900000, 4.13500000, 0.00000000, 1, 0, 0, 0, 0),
(57, '2024-09-14', 'BTCUSDT', 59876.64000000, 60340.75000000, 59616.02000000, 60319.87000000, 0.00000000, 1, 0, 0, 0, 0),
(58, '2024-09-14', 'BNBUSDT', 551.50000000, 556.30000000, 549.80000000, 556.20000000, 0.00000000, 1, 0, 0, 0, 0),
(59, '2024-09-14', 'ETHUSDT', 2414.27000000, 2433.59000000, 2408.55000000, 2432.60000000, 0.00000000, 1, 0, 0, 0, 0),
(60, '2024-09-14', 'ATOMUSDT', 4.22500000, 4.22500000, 4.14700000, 4.21800000, 0.00000000, 1, 0, 0, 0, 0),
(61, '2024-09-14', 'NEARUSDT', 4.20900000, 4.24300000, 4.15500000, 4.24100000, 0.00000000, 1, 0, 0, 0, 0),
(62, '2024-09-14', 'SHIBUSDC', 0.00001374, 0.00001400, 0.00001362, 0.00001400, 0.00000000, 1, 0, 0, 0, 0),
(63, '2024-09-14', 'DOGEUSDC', 0.10513000, 0.10739000, 0.10491000, 0.10721000, 0.00000000, 1, 0, 0, 0, 0),
(64, '2024-09-14', 'INJUSDT', 19.51000000, 19.70000000, 19.21000000, 19.62000000, 0.00000000, 1, 0, 0, 0, 0),
(65, '2024-09-14', 'LTCUSDT', 66.22000000, 66.74000000, 64.91000000, 65.32000000, 0.00000000, 0, 1, 0, 0, 0),
(66, '2024-09-14', 'PAXGUSDT', 2578.00000000, 2580.00000000, 2569.00000000, 2575.00000000, 0.00000000, 1, 0, 0, 0, 0),
(67, '2024-09-16', 'BTCUSDT', 58060.00000000, 58359.63000000, 57620.71000000, 0.00000000, 58060.00000000, 1, 0, 0, 0, 0),
(68, '2024-09-16', 'BNBUSDT', 534.90000000, 535.80000000, 529.10000000, 0.00000000, 534.90000000, 1, 0, 0, 0, 0),
(69, '2024-09-16', 'ETHUSDT', 2284.18000000, 2300.46000000, 2264.00000000, 0.00000000, 2284.18000000, 1, 0, 0, 0, 0),
(70, '2024-09-16', 'ATOMUSDT', 4.00000000, 4.00600000, 3.94100000, 0.00000000, 4.00000000, 1, 0, 0, 0, 0),
(71, '2024-09-16', 'NEARUSDT', 3.89400000, 3.90600000, 3.83300000, 0.00000000, 3.89400000, 1, 0, 0, 0, 0),
(72, '2024-09-16', 'INJUSDT', 18.04000000, 18.17000000, 17.73000000, 0.00000000, 18.04000000, 1, 0, 0, 0, 0),
(73, '2024-09-16', 'LTCUSDT', 63.22000000, 63.22000000, 61.94000000, 0.00000000, 63.22000000, 1, 0, 0, 0, 0),
(74, '2024-09-16', 'PAXGUSDT', 2588.00000000, 2598.00000000, 2587.00000000, 0.00000000, 2588.00000000, 1, 0, 0, 0, 0),
(75, '2024-09-16', 'RUNEUSDC', 3.83700000, 3.88400000, 3.80400000, 0.00000000, 3.83700000, 1, 0, 0, 0, 0),
(76, '2024-09-16', 'SHIBUSDC', 0.00001320, 0.00001321, 0.00001304, 0.00000000, 0.00001320, 1, 0, 0, 0, 0),
(77, '2024-09-16', 'DOGEUSDC', 0.09983000, 0.09998000, 0.09873000, 0.00000000, 0.09983000, 1, 0, 0, 0, 0),
(78, '2024-09-17', 'ATOMUSDT', 4.16400000, 4.23800000, 3.99900000, 4.00000000, 0.00000000, 0, 1, 0, 0, 0),
(79, '2024-09-17', 'NEARUSDT', 4.06900000, 4.30000000, 3.89300000, 3.89400000, 0.00000000, 0, 1, 0, 0, 0),
(80, '2024-09-17', 'BNBUSDT', 547.80000000, 552.60000000, 534.90000000, 534.90000000, 0.00000000, 0, 1, 0, 0, 0),
(81, '2024-09-17', 'ETHUSDT', 2324.95000000, 2391.65000000, 2282.70000000, 2284.18000000, 0.00000000, 0, 1, 0, 0, 0),
(82, '2024-09-17', 'BTCUSDT', 60160.35000000, 61288.00000000, 58046.12000000, 58060.00000000, 0.00000000, 0, 1, 0, 0, 0),
(83, '2024-09-17', 'INJUSDT', 19.45000000, 19.96000000, 18.03000000, 18.04000000, 0.00000000, 0, 1, 0, 0, 0),
(84, '2024-09-17', 'LTCUSDT', 63.54000000, 64.03000000, 62.24000000, 63.22000000, 0.00000000, 0, 1, 0, 0, 0),
(85, '2024-09-17', 'PAXGUSDT', 2582.00000000, 2614.00000000, 2572.00000000, 2588.00000000, 0.00000000, 0, 1, 0, 0, 0),
(86, '2024-09-17', 'RUNEUSDC', 4.00900000, 4.15000000, 3.83700000, 3.83700000, 0.00000000, 0, 1, 0, 0, 0),
(87, '2024-09-17', 'SHIBUSDC', 0.00001324, 0.00001357, 0.00001317, 0.00001320, 0.00000000, 0, 1, 0, 0, 0),
(88, '2024-09-17', 'DOGEUSDC', 0.10036000, 0.10257000, 0.09960000, 0.09983000, 0.00000000, 0, 1, 0, 0, 0);

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT de la tabla `trader`
--
ALTER TABLE `trader`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
