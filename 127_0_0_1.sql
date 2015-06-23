-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-06-2015 a las 23:59:13
-- Versión del servidor: 5.6.21
-- Versión de PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `negociomama`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
`id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `apellido` text NOT NULL,
  `block` varchar(6) NOT NULL,
  `departamento` int(2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `apellido`, `block`, `departamento`) VALUES
(1, 'Nibaldo', 'Aros', '451', 28),
(2, 'Marina', 'Guzman', '451', 43),
(3, 'Tatiana', 'Aros', '451', 28),
(4, 'Ana', 'Coloma', '451', 22),
(5, 'Jessica', 'Matus', '451', 26),
(6, 'Veronica', 'Caamaño', '451', 28);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deuda`
--

CREATE TABLE IF NOT EXISTS `deuda` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `monto_deuda` int(11) NOT NULL,
  `estado_deuda` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `deuda`
--

INSERT INTO `deuda` (`id_cliente`, `nombre`, `monto_deuda`, `estado_deuda`) VALUES
(1, 'Nibaldo Aros', 1500, 'Debe'),
(2, 'Marina Guzman', 5800, 'Debe'),
(4, 'Ana Coloma', 3800, 'Debe'),
(5, 'Jessica Matus', 1800, 'Debe'),
(6, 'Veronica Caamaño', 2520, 'No debe');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
`id_producto` int(11) NOT NULL,
  `nombre_producto` text NOT NULL,
  `tipo_producto` text NOT NULL,
  `precio_producto` int(12) NOT NULL,
  `stock_producto` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre_producto`, `tipo_producto`, `precio_producto`, `stock_producto`) VALUES
(7, 'Aceite Protal', 'Abarrotes', 500, 9),
(8, 'Cigarrillos Belmont', 'Tabaco', 180, 8),
(10, 'Leche Milo Sachets', 'Abarrotes', 300, 28),
(11, 'Shampoo Ballerina', 'Aseo', 150, 29),
(12, 'Cigarrillos Pall Mall', 'Tabaco', 150, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoproductos`
--

CREATE TABLE IF NOT EXISTS `tipoproductos` (
`id_tipo` int(11) NOT NULL,
  `nombre_tipo` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipoproductos`
--

INSERT INTO `tipoproductos` (`id_tipo`, `nombre_tipo`) VALUES
(1, 'Aseo'),
(2, 'Abarrotes'),
(3, 'Congelados'),
(4, 'Tabaco'),
(5, 'Liquidos'),
(6, 'Alimentos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
`id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `usuario` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `usuario`, `password`) VALUES
(1, 'Pruebas', 'prueba', 'probando'),
(2, 'Roberto', 'rabertcaamano', 'lalleva'),
(4, 'Juanito', 'juanperez', 'katyteamo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE IF NOT EXISTS `ventas` (
  `id_venta` int(11) DEFAULT NULL,
  `nombre_cliente` varchar(200) NOT NULL,
  `nombre_producto` varchar(200) NOT NULL,
  `cant_vendida` int(11) NOT NULL,
  `precio_obtenido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `nombre_cliente`, `nombre_producto`, `cant_vendida`, `precio_obtenido`) VALUES
(NULL, 'Ana Coloma', 'Leche Milo Sachets', 3, 900);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `deuda`
--
ALTER TABLE `deuda`
 ADD PRIMARY KEY (`id_cliente`), ADD KEY `id_cliente` (`id_cliente`), ADD KEY `id_cliente_2` (`id_cliente`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
 ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `tipoproductos`
--
ALTER TABLE `tipoproductos`
 ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `tipoproductos`
--
ALTER TABLE `tipoproductos`
MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `deuda`
--
ALTER TABLE `deuda`
ADD CONSTRAINT `deuda_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
