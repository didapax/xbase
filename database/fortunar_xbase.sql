-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 25-11-2022 a las 13:15:36
-- Versión del servidor: 5.7.39-cll-lve
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
-- Estructura de tabla para la tabla `USER`
--

CREATE TABLE `USER` (
  `ID` int(11) NOT NULL,
  `USUARIO` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `SALDO` decimal(16,4) NOT NULL DEFAULT '0.0000',
  `RATE` int(11) DEFAULT '1',
  `BLOQUEADO` int(11) DEFAULT '0',
  `IP` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `USER`
--

INSERT INTO `USER` (`ID`, `USUARIO`, `PASSWORD`, `SALDO`, `RATE`, `BLOQUEADO`, `IP`) VALUES
(1, 'dd77b701661c5b55', '12358132134', '0.0000', 1, 0, '190.207.11.113'),
(2, 'b54d66a5fd158d3f', '12358132134', '0.0000', 1, 0, '186.94.247.219');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `USER`
--
ALTER TABLE `USER`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `USER`
--
ALTER TABLE `USER`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
