-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-03-2025 a las 02:06:32
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
-- Base de datos: `discoteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cierres_caja`
--

CREATE TABLE `cierres_caja` (
  `ID_Cierre` int(11) NOT NULL,
  `ID_Usuario` int(11) DEFAULT NULL,
  `Fecha_Hora` timestamp NOT NULL DEFAULT current_timestamp(),
  `Monto_Declarado` decimal(10,2) DEFAULT NULL,
  `Monto_Real` decimal(10,2) DEFAULT NULL,
  `Diferencia` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cierres_caja`
--

INSERT INTO `cierres_caja` (`ID_Cierre`, `ID_Usuario`, `Fecha_Hora`, `Monto_Declarado`, `Monto_Real`, `Diferencia`) VALUES
(1, 2, '2025-03-19 01:06:16', 500000.00, 495000.00, 5000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ID_Cliente` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Apellido` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Fecha_Registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `Tipo_Cliente` enum('Regular','VIP') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`ID_Cliente`, `Nombre`, `Apellido`, `Email`, `Telefono`, `Fecha_Registro`, `Tipo_Cliente`) VALUES
(1, 'Juan', 'López', 'juan@example.com', '3112345678', '2025-03-19 01:06:16', 'Regular'),
(2, 'María', 'García', 'maria@example.com', '3223456789', '2025-03-19 01:06:16', 'VIP');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `ID_Detalle` int(11) NOT NULL,
  `ID_Venta` int(11) DEFAULT NULL,
  `ID_Producto` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Precio_Unitario` decimal(10,2) DEFAULT NULL,
  `Subtotal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`ID_Detalle`, `ID_Venta`, `ID_Producto`, `Cantidad`, `Precio_Unitario`, `Subtotal`) VALUES
(3, 2, 2, 1, 120000.00, 50000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados_turnos`
--

CREATE TABLE `empleados_turnos` (
  `ID_Turno` int(11) NOT NULL,
  `ID_Usuario` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Hora_Entrada` time DEFAULT NULL,
  `Hora_Salida` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidencias_fraude`
--

CREATE TABLE `incidencias_fraude` (
  `ID_Incidencia` int(11) NOT NULL,
  `ID_Usuario` int(11) DEFAULT NULL,
  `ID_Venta` int(11) DEFAULT NULL,
  `Tipo_Incidencia` enum('Robo','Manipulación de Caja','Alteración de Facturas') DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `Fecha_Hora` timestamp NOT NULL DEFAULT current_timestamp(),
  `Estado` enum('Pendiente','Resuelto') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `ID_Inventario` int(11) NOT NULL,
  `ID_Producto` int(11) DEFAULT NULL,
  `Cantidad_Inicial` int(11) DEFAULT NULL,
  `Cantidad_Actual` int(11) DEFAULT NULL,
  `Fecha_Registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`ID_Inventario`, `ID_Producto`, `Cantidad_Inicial`, `Cantidad_Actual`, `Fecha_Registro`) VALUES
(1, 1, 100, 90, '2025-03-19 01:06:16'),
(2, 2, 20, 15, '2025-03-19 01:06:16'),
(3, 3, 50, 45, '2025-03-19 01:06:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `ID_Mesa` int(11) NOT NULL,
  `Numero_Mesa` int(11) DEFAULT NULL,
  `Capacidad` int(11) DEFAULT NULL,
  `Estado` enum('Disponible','Ocupada') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mesas`
--

INSERT INTO `mesas` (`ID_Mesa`, `Numero_Mesa`, `Capacidad`, `Estado`) VALUES
(1, 1, 4, 'Disponible'),
(2, 2, 6, 'Ocupada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ID_Producto` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Categoria` enum('Bebida','Comida') DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL,
  `Stock` int(11) DEFAULT NULL,
  `ID_Proveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ID_Producto`, `Nombre`, `Categoria`, `Precio`, `Stock`, `ID_Proveedor`) VALUES
(1, 'Cerveza', 'Bebida', 5000.00, 100, 1),
(2, 'Whisky', 'Bebida', 120000.00, 20, 2),
(3, 'Hamburguesa', 'Comida', 25000.00, 50, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `ID_Proveedor` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Contacto` varchar(100) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`ID_Proveedor`, `Nombre`, `Contacto`, `Telefono`, `Email`) VALUES
(1, 'Distribuidora XYZ', 'Ricardo Pérez', '3123456789', 'ricardo@xyz.com'),
(2, 'Bebidas Nacionales', 'Ana Torres', '3234567890', 'ana@bebidas.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservaciones`
--

CREATE TABLE `reservaciones` (
  `ID_Reservacion` int(11) NOT NULL,
  `ID_Cliente` int(11) DEFAULT NULL,
  `ID_Mesa` int(11) DEFAULT NULL,
  `Fecha_Hora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Estado` enum('Confirmada','Cancelada') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservaciones`
--

INSERT INTO `reservaciones` (`ID_Reservacion`, `ID_Cliente`, `ID_Mesa`, `Fecha_Hora`, `Estado`) VALUES
(1, 1, 1, '2025-03-19 01:06:16', 'Confirmada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_Usuario` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Apellido` varchar(100) DEFAULT NULL,
  `Rol` enum('Cajero','Mesero','Gerente','Seguridad') DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Fecha_Registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID_Usuario`, `Nombre`, `Apellido`, `Rol`, `Email`, `Telefono`, `Fecha_Registro`) VALUES
(1, 'Carlos', 'Gómez', 'Gerente', 'carlos@example.com', '3012345678', '2025-03-19 01:06:16'),
(2, 'Andrea', 'Pérez', 'Cajero', 'andrea@example.com', '3023456789', '2025-03-19 01:06:16'),
(3, 'Luis', 'Martínez', 'Mesero', 'luis@example.com', '3034567890', '2025-03-19 01:06:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `ID_Venta` int(11) NOT NULL,
  `ID_Usuario` int(11) DEFAULT NULL,
  `ID_Cliente` int(11) DEFAULT NULL,
  `ID_Mesa` int(11) DEFAULT NULL,
  `Fecha_Hora` timestamp NOT NULL DEFAULT current_timestamp(),
  `Total` decimal(10,2) DEFAULT NULL,
  `Metodo_Pago` enum('Efectivo','Tarjeta','Transferencia') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`ID_Venta`, `ID_Usuario`, `ID_Cliente`, `ID_Mesa`, `Fecha_Hora`, `Total`, `Metodo_Pago`) VALUES
(2, 3, 2, 2, '2025-03-19 01:06:16', 75000.00, 'Tarjeta');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cierres_caja`
--
ALTER TABLE `cierres_caja`
  ADD PRIMARY KEY (`ID_Cierre`),
  ADD KEY `ID_Usuario` (`ID_Usuario`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID_Cliente`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`ID_Detalle`),
  ADD KEY `ID_Venta` (`ID_Venta`),
  ADD KEY `ID_Producto` (`ID_Producto`);

--
-- Indices de la tabla `empleados_turnos`
--
ALTER TABLE `empleados_turnos`
  ADD PRIMARY KEY (`ID_Turno`),
  ADD KEY `ID_Usuario` (`ID_Usuario`);

--
-- Indices de la tabla `incidencias_fraude`
--
ALTER TABLE `incidencias_fraude`
  ADD PRIMARY KEY (`ID_Incidencia`),
  ADD KEY `ID_Usuario` (`ID_Usuario`),
  ADD KEY `ID_Venta` (`ID_Venta`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`ID_Inventario`),
  ADD KEY `ID_Producto` (`ID_Producto`);

--
-- Indices de la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`ID_Mesa`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ID_Producto`),
  ADD KEY `ID_Proveedor` (`ID_Proveedor`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`ID_Proveedor`);

--
-- Indices de la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  ADD PRIMARY KEY (`ID_Reservacion`),
  ADD KEY `ID_Cliente` (`ID_Cliente`),
  ADD KEY `ID_Mesa` (`ID_Mesa`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_Usuario`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`ID_Venta`),
  ADD KEY `ID_Usuario` (`ID_Usuario`),
  ADD KEY `ID_Cliente` (`ID_Cliente`),
  ADD KEY `ID_Mesa` (`ID_Mesa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cierres_caja`
--
ALTER TABLE `cierres_caja`
  MODIFY `ID_Cierre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `ID_Detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `empleados_turnos`
--
ALTER TABLE `empleados_turnos`
  MODIFY `ID_Turno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `incidencias_fraude`
--
ALTER TABLE `incidencias_fraude`
  MODIFY `ID_Incidencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `ID_Inventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `ID_Mesa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `ID_Producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `ID_Proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  MODIFY `ID_Reservacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `ID_Venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cierres_caja`
--
ALTER TABLE `cierres_caja`
  ADD CONSTRAINT `cierres_caja_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuarios` (`ID_Usuario`);

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`ID_Venta`) REFERENCES `ventas` (`ID_Venta`),
  ADD CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`);

--
-- Filtros para la tabla `empleados_turnos`
--
ALTER TABLE `empleados_turnos`
  ADD CONSTRAINT `empleados_turnos_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuarios` (`ID_Usuario`);

--
-- Filtros para la tabla `incidencias_fraude`
--
ALTER TABLE `incidencias_fraude`
  ADD CONSTRAINT `incidencias_fraude_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuarios` (`ID_Usuario`),
  ADD CONSTRAINT `incidencias_fraude_ibfk_2` FOREIGN KEY (`ID_Venta`) REFERENCES `ventas` (`ID_Venta`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`ID_Proveedor`) REFERENCES `proveedores` (`ID_Proveedor`) ON DELETE CASCADE;

--
-- Filtros para la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  ADD CONSTRAINT `reservaciones_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `clientes` (`ID_Cliente`),
  ADD CONSTRAINT `reservaciones_ibfk_2` FOREIGN KEY (`ID_Mesa`) REFERENCES `mesas` (`ID_Mesa`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuarios` (`ID_Usuario`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`ID_Cliente`) REFERENCES `clientes` (`ID_Cliente`),
  ADD CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`ID_Mesa`) REFERENCES `mesas` (`ID_Mesa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
