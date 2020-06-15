-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 15-06-2020 a las 02:19:11
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ajepp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodega_tienda`
--

CREATE TABLE `bodega_tienda` (
  `id` int(11) NOT NULL,
  `fecha_salida` datetime DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `detalle` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `fechar_ingreso` datetime DEFAULT NULL,
  `detalles_pieza_tienda_id` int(11) NOT NULL,
  `detalles_pieza_bodega_id` int(11) NOT NULL,
  `personal_ajepp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo_ajepp`
--

CREATE TABLE `cargo_ajepp` (
  `id` int(11) NOT NULL,
  `departamento_ajepp_id` int(11) NOT NULL,
  `car_nombre` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pago_cargo` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cargo_ajepp`
--

INSERT INTO `cargo_ajepp` (`id`, `departamento_ajepp_id`, `car_nombre`, `pago_cargo`) VALUES
(1, 1, 'Super Admin', 10000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo_personal`
--

CREATE TABLE `cargo_personal` (
  `id` int(11) NOT NULL,
  `fecha_inicio` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `per_salario` float DEFAULT NULL,
  `cargo_ajepp_id` int(11) NOT NULL,
  `personal_ajepp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cargo_personal`
--

INSERT INTO `cargo_personal` (`id`, `fecha_inicio`, `per_salario`, `cargo_ajepp_id`, `personal_ajepp_id`) VALUES
(1, NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasificacion_pieza`
--

CREATE TABLE `clasificacion_pieza` (
  `id` int(11) NOT NULL,
  `pie_img` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pi_nombre` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `clasificacion_pieza`
--

INSERT INTO `clasificacion_pieza` (`id`, `pie_img`, `pi_nombre`) VALUES
(1, NULL, 'Etiqueta'),
(2, NULL, 'Conjunto Gato'),
(3, NULL, 'Motor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `identificacion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cli_nombres` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cli_apellidos` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cli_edad` int(11) NOT NULL,
  `cli_genero` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `cli_domicilio` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cli_dirreccion` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `identificacion`, `cli_nombres`, `cli_apellidos`, `cli_edad`, `cli_genero`, `cli_domicilio`, `cli_dirreccion`) VALUES
(5, '601-262662-6131H', 'Juan', 'Pérez', 39, 'ms', 'Bluefields', 'Barrio San Mateo sector 4 frente a la familia Rojas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compania`
--

CREATE TABLE `compania` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RUC` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_proveedor`
--

CREATE TABLE `compra_proveedor` (
  `id` int(11) NOT NULL,
  `iva` float NOT NULL,
  `subtotal` float NOT NULL,
  `total` float NOT NULL,
  `fecha_compra` datetime NOT NULL,
  `detalle` text COLLATE utf8_unicode_ci NOT NULL,
  `personal_ajepp_id` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `tipo_pago_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto_proveedor`
--

CREATE TABLE `contacto_proveedor` (
  `id` int(11) NOT NULL,
  `pro_celular` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pro_correo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pro_twiter` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pro_fax` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pro_telefono` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `proveedor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_contacto_cliente`
--

CREATE TABLE `datos_contacto_cliente` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `cli_correro` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cli_telefono` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cli_twiter` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cli_facebook` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento_ajepp`
--

CREATE TABLE `departamento_ajepp` (
  `id` int(11) NOT NULL,
  `dep_nombre` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dep_locacion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `departamento_ajepp`
--

INSERT INTO `departamento_ajepp` (`id`, `dep_nombre`, `dep_locacion`) VALUES
(1, 'Administración', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_pieza_bodega`
--

CREATE TABLE `detalles_pieza_bodega` (
  `id` int(11) NOT NULL,
  `pie_serie` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `pie_precio_venta` float DEFAULT NULL,
  `pie_precio_compra` float NOT NULL,
  `pie_fecha_ingreso` datetime NOT NULL,
  `pie_detalle` text COLLATE utf8_unicode_ci NOT NULL,
  `pie_cantidad` int(11) NOT NULL,
  `bod_t_img` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `piezas_vehiculo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_pieza_tienda`
--

CREATE TABLE `detalles_pieza_tienda` (
  `id` int(11) NOT NULL,
  `pie_serie` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `pie_precio` float NOT NULL,
  `pie_detalles` text COLLATE utf8_unicode_ci NOT NULL,
  `pie_cantidad` int(11) NOT NULL,
  `pie_t_img` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `piezas_vehiculo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `items_venta`
--

CREATE TABLE `items_venta` (
  `id` int(11) NOT NULL,
  `pie_precio` float DEFAULT NULL,
  `pie_serie` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pie_cantidad` int(11) DEFAULT NULL,
  `pie_numero` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `detalles_pieza_tienda_id` int(11) NOT NULL,
  `ventas_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `usuario` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `contrasenia` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `personal_ajepp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`usuario`, `contrasenia`, `personal_ajepp_id`) VALUES
('admin', '$2y$10$nfgnhgnfghGljHYIUidvdeCaOu6OeUf2rQTNEbcGNe8ZXt3NsGuu.', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca_vehiculo`
--

CREATE TABLE `marca_vehiculo` (
  `id` int(11) NOT NULL,
  `marca_vehiculo` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `mar_img` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_vehiculo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `marca_vehiculo`
--

INSERT INTO `marca_vehiculo` (`id`, `marca_vehiculo`, `mar_img`, `tipo_vehiculo_id`) VALUES
(1, 'HYUNDAI', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `contenido` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `estado` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id`, `contenido`, `order`, `estado`) VALUES
(1, '{\"text\":\"Panel de control\", \"icon\": \"tachometer-alt\", \"link\":\"dashboard\", \"child\": [], \"show\": [1,2,3]}', 1, 'on'),
(2, '{\"text\":\"Personal\", \"icon\": \"users\", \"link\":\"#\", \"show\": [1,2], \"child\": [\r\n    {\"text\":\"Departamentos\", \"icon\": \"user-friends\", \"link\":\"departamento\", \"show\": [1,2], \"child\": []},\r\n    {\"text\":\"Cargo\", \"icon\": \"user-tie\", \"link\":\"cargo\", \"show\": [1,2], \"child\": []},\r\n    {\"text\":\"Usuarios\", \"icon\": \"users\", \"link\":\"usuarios\", \"show\": [1,2], \"child\": []}\r\n]}', 2, 'on'),
(3, '{\"text\":\"Tienda\", \"icon\": \"store\", \"link\":\"#\", \"show\": [1,2,3], \"child\": [\r\n    {\"text\":\"Marca Vehiculo\", \"icon\": \"bullhorn\", \"link\":\"marca\", \"show\": [1,2,3], \"child\": []},\r\n    {\"text\":\"Tipo Vehiculo\", \"icon\": \"truck\", \"link\":\"tipoVehiculo\", \"show\": [1,2,3], \"child\": []},\r\n    {\"text\":\"Modelo Vehiculo\", \"icon\": \"car\", \"link\":\"modeloVehiculo\", \"show\": [1,2,3], \"child\": []},\r\n    {\"text\":\"Piezas Vehiculo\", \"icon\": \"puzzle-piece\", \"link\":\"piezasVehiculo\", \"show\": [1,2,3], \"child\": []}\r\n]}', 3, 'on'),
(4, '{\"text\":\"Ventas\", \"icon\": \"fas fa-shopping-cart\", \"link\":\"pos\", \"child\": [], \"show\": [1,2,3]}', 4, 'on'),
(5, '{\"text\":\"Inventario\", \"icon\": \"archive\", \"link\":\"#\", \"show\": [1,2,3], \"child\": [\r\n    {\"text\":\"Compras\", \"icon\": \"bullhorn\", \"link\":\"compras\", \"show\": [1,2,3], \"child\": []},\r\n    {\"text\":\"Entradas\", \"icon\": \"parachute-box\", \"link\":\"entradas\", \"show\": [1,2,3], \"child\": []},\r\n    {\"text\":\"Salidas\", \"icon\": \"people-carry\", \"link\":\"salidas\", \"show\": [1,2,3], \"child\": []},\r\n    {\"text\":\"Proveedores\", \"icon\": \"user-tie\", \"link\":\"proveedores\", \"show\": [1,2,3], \"child\": []}\r\n]}', 5, 'on');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo_vehiculo`
--

CREATE TABLE `modelo_vehiculo` (
  `id` int(11) NOT NULL,
  `marca_vehiculo_id` int(11) NOT NULL,
  `mod_vehiculo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `mod_anio` year(4) NOT NULL,
  `mod_img` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `procedencia` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `modelo_vehiculo`
--

INSERT INTO `modelo_vehiculo` (`id`, `marca_vehiculo_id`, `mod_vehiculo`, `mod_anio`, `mod_img`, `procedencia`) VALUES
(1, 1, 'GL-GLS', 2001, NULL, 'Seúl - Corea del Sur');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_ajepp`
--

CREATE TABLE `personal_ajepp` (
  `id` int(11) NOT NULL,
  `per_identificacion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `per_nombre` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `per_apellido` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `per_edad` int(11) NOT NULL,
  `per_genero` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_ingreso` year(4) DEFAULT NULL,
  `per_domicilio` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `per_dirreccion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `personal_ajeppcol` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `personal_ajepp`
--

INSERT INTO `personal_ajepp` (`id`, `per_identificacion`, `per_nombre`, `per_apellido`, `per_edad`, `per_genero`, `fecha_ingreso`, `per_domicilio`, `per_dirreccion`, `personal_ajeppcol`) VALUES
(1, '601-030593-0004Q', 'José Daniel', 'Quijano', 27, 'ma', NULL, 'Bluefields', 'San Mateo', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_contacto`
--

CREATE TABLE `personal_contacto` (
  `id` int(11) NOT NULL,
  `per_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `per_celular` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `per_telefono_casa` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `per_twiter` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `personal_ajepp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `piezas_vehiculo`
--

CREATE TABLE `piezas_vehiculo` (
  `id` int(11) NOT NULL,
  `modelo_vehiculo_id` int(11) NOT NULL,
  `clasificacion_pieza_id` int(11) NOT NULL,
  `pie_nombre` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pie_img` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pie_descripcion` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `pie_numero` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `piezas_vehiculo`
--

INSERT INTO `piezas_vehiculo` (`id`, `modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_img`, `pie_descripcion`, `pie_numero`) VALUES
(187, 1, 1, 'Etiqueta', NULL, 'Todas Num: 05203-02000', '05203-02000'),
(188, 1, 1, 'Etiqueta Control', NULL, 'GEN, LHD, +2GB, +A08 Num: 32450-02580', '32450-02580'),
(189, 1, 1, 'Etiqueta Control', NULL, 'GEN, LHD, +2GB, +A08 Num: 32450-02581', '32450-02581'),
(190, 1, 1, 'Etiqueta Control', NULL, 'GEN, LHD, +2GB, +B07 Num: 32450-02570', '32450-02570'),
(191, 1, 2, 'Conjunto Gato', NULL, 'GEN Num: 09110-23000', '09110-23000'),
(192, 1, 2, 'Conjunto Gato', NULL, 'GEN, +A18 Num: 09110-02000', '09110-02000'),
(193, 1, 2, 'Conjunto Gato', NULL, 'GEN, +A18 Num: 09110-02100', '09110-02100'),
(194, 1, 2, 'Conjunto Gato', NULL, 'GEN, -A18 Num: 09110-23000', '09110-23000'),
(195, 1, 2, 'Conjunto Gato', NULL, 'GEN, -A18 Num: 09110-02200', '09110-02200'),
(196, 1, 2, 'Conjunto Gato', NULL, 'MES Num: 09110-23000', '09110-23000'),
(197, 1, 2, 'Conjunto Gato', NULL, 'MES Num: 09110-02200', '09110-02200'),
(198, 1, 2, 'Etiqueta', NULL, 'GEN, +A18 Num: 09127-29000', '09127-29000'),
(199, 1, 2, 'Caja de Herramientas', NULL, 'Todas Num: 09149-33540', '09149-33540'),
(200, 1, 2, 'Caja de Herramientas', NULL, 'Todas Num: 09149-02000', '09149-02000'),
(201, 1, 2, 'Caja de Herramientas', NULL, 'Todas Num: 09149-34000', '09149-34000'),
(202, 1, 2, 'Llave de Ruedas', NULL, 'Todas Num: 09131-28000', '09131-28000'),
(203, 1, 2, 'Llave de Ruedas', NULL, 'Todas Num: 09131-29000', '09131-29000'),
(204, 1, 2, 'Llave Fija 10x12', NULL, 'Todas Num: 09135-11210', '09135-11210'),
(205, 1, 2, 'Alicates', NULL, 'Todas Num: 09145-11200', '09145-11200'),
(206, 1, 2, 'Destornilladores', NULL, 'Todas Num: 09146-11110', '09146-11110'),
(207, 1, 3, 'Sub-Conjunto Motor', NULL, 'Todas, +2GB Num: 21101-02B00', '21101-02B00'),
(208, 1, 3, 'Sub-Conjunto Motor', NULL, 'Todas, -2GB Num: 21101-02C00', '21101-02C00'),
(209, 1, 3, 'Conjunto-Corto Motor', NULL, 'Todas, +2GB Num: 21102-02B00', '21102-02B00'),
(210, 1, 3, 'Conjunto-Corto Motor', NULL, 'GEN, -2GB Num: 21102-02B00', '21102-02B00'),
(211, 1, 3, 'Conjunto-Corto Motor', NULL, 'GEN, -2GB Num: 21102-02D00', '21102-02D00'),
(212, 1, 3, 'Conjunto-Corto Motor', NULL, 'Mes, -2GB Num: 21102-02D00', '21102-02D00'),
(213, 1, 3, 'Juego de Juntas Reparacion de Motor', NULL, 'Todas Num: 20910-02B00', '20910-02B00'),
(214, 1, 3, 'Juego de Juntas Reparacion de Motor GEN', NULL, 'Todas Num: 20920-02B00', '20920-02B00'),
(215, 1, 3, 'Espiga', NULL, 'Todas Num: 14303-06140', '14303-06140'),
(216, 1, 3, 'Casquillo', NULL, 'Todas Num: 14331-10160', '14331-10160'),
(217, 1, 3, 'Casquillo', NULL, 'Todas Num: 14331-06090', '14331-06090'),
(218, 1, 3, 'Tornillo', NULL, 'Todas Num: 15716-13111', '15716-13111'),
(219, 1, 3, 'Tapa Selladora', NULL, 'Todas Num: 15732-30001', '15732-30001'),
(220, 1, 3, 'Bloque de Cilindros', NULL, 'Todas Num: 21100-02700', '21100-02700'),
(221, 1, 3, 'Tapa de Perno', NULL, 'Todas Num: 21114-02511', '21114-02511'),
(222, 1, 3, 'Filtro de Aceite de Estudio', NULL, 'Todas Num: 21141-02500', '21141-02500'),
(223, 1, 3, 'Interruptor de Presión Aceite', NULL, 'Todas Num: 94750-21030', '94750-21030'),
(224, 1, 3, 'Tornillo', NULL, 'Todas Num: 11400-08101', '11400-08101'),
(225, 1, 3, 'Tornillo', NULL, 'Todas Num: 11403-06181', '11403-06181'),
(226, 1, 3, 'Tornillo', NULL, 'Todas Num: 11403-06301', '11403-06301'),
(227, 1, 3, 'Maquina de Tornillo', NULL, 'Todas Num: 12203-06141', '12203-06141'),
(228, 1, 3, 'Anillo Retenedor', NULL, 'Todas Num: 14615-12005', '14615-12005'),
(229, 1, 3, 'Enchufe', NULL, 'Todas Num: 15716-13111', '15716-13111'),
(230, 1, 3, 'Conjunto de Cubierta', NULL, 'Todas Num: 21310-02500', '21310-02500'),
(231, 1, 3, 'Tapa de Bonba de Aceite', NULL, 'Todas Num: 21313-02500', '21313-02500'),
(232, 1, 3, 'Estuche de Junta FR', NULL, 'Todas Num: 21411-02500', '21411-02500'),
(233, 1, 3, 'Anillo Reten de Aceite', NULL, 'Todas Num: 21421-21020', '21421-21020'),
(234, 1, 3, 'Bomba de Aceite para Engranajes INR', NULL, 'Todas Num: 26112-02500', '26112-02500'),
(235, 1, 3, 'Bomba de Aceite para Engranajes OTR', NULL, 'Todas Num: 26113-02500', '26113-02500'),
(236, 1, 3, 'Embolo Descarga', NULL, 'Todas Num: 26122-02500', '26122-02500'),
(237, 1, 3, 'Muelle Descarga', NULL, 'Todas Num: 26123-02500', '26123-02500'),
(238, 1, 3, 'Retencion', NULL, 'Todas Num: 26124-02500', '26124-02500'),
(239, 1, 3, 'Filtro Aceite Motor', NULL, 'Todas Num: 26300-02500', '26300-02500'),
(240, 1, 3, 'Medidor de Nivel de Aceite', NULL, 'Todas Num: 26611-02500', '26611-02500'),
(241, 1, 3, 'Guía de Nivel de Aceite', NULL, 'Todas Num: 26612-02501', '26612-02501'),
(242, 1, 3, 'Anillo \"O\"', NULL, 'Todas Num: 26614-35000', '26614-35000'),
(243, 1, 3, 'Anillo \"O\"', NULL, 'Todas Num: 26615-33000', '26615-33000'),
(244, 1, 3, 'Tornillo', NULL, 'Todas Num: 11233-06101', '11233-06101'),
(245, 1, 3, 'Tornillo', NULL, 'Todas Num: 11233-06121', '11233-06121'),
(246, 1, 3, 'Tornillo', NULL, 'Todas Num: 11233-08201', '11233-08201'),
(247, 1, 3, 'Tornillo', NULL, 'Todas Num: 11403-06181', '11403-06181'),
(248, 1, 3, 'Tornillo', NULL, 'Todas Num: 11403-06141', '11403-06141'),
(249, 1, 3, 'Cubierta Correa de Distribución', NULL, 'Todas Num: 21350-02710', '21350-02710'),
(250, 1, 3, 'Correa de Distribución CVR', NULL, 'Todas Num: 21352-02700', '21352-02700'),
(251, 1, 3, 'Bloque Placa Cilindro RR', NULL, 'Todas Num: 21431-02500', '21431-02500'),
(252, 1, 3, 'Caja Sello de Aceite RR', NULL, 'Todas Num: 21441-02500', '21441-02500'),
(253, 1, 3, 'Sello Aceite RR', NULL, 'Todas Num: 21443-02500', '21443-02500'),
(254, 1, 3, 'Estuche de Junta de Aceite', NULL, 'Todas Num: 21444-02500', '21444-02500'),
(255, 1, 3, 'Junta Liquida Motor', NULL, 'Todas Num: 21451-33A01', '21451-33A01'),
(256, 1, 3, 'Vivienda Cubierta', NULL, 'Todas Num: 21461-02500', '21461-02500'),
(257, 1, 3, 'Aceite de Motor Conjunto', NULL, 'Todas Num: 21510-02510', '21510-02510'),
(258, 1, 3, 'Drenaje de Aceite', NULL, 'Todas Num: 21512-21000', '21512-21000'),
(259, 1, 3, 'Enchufe de Aceite de Junta', NULL, 'Todas Num: 21513-21000', '21513-21000'),
(260, 1, 3, 'Pantalla Conjunto de Aceite', NULL, 'Todas Num: 26250-02500', '26250-02500'),
(261, 1, 3, 'Pantalla de Junta de Aceite', NULL, 'Todas Num: 26259-02500', '26259-02500'),
(262, 1, 3, 'Tornillo', NULL, 'GEN, -9AA Num: 11233-08251', '11233-08251'),
(263, 1, 3, 'Tornillo', NULL, 'GEN Num: 11234-10251', '11234-10251'),
(264, 1, 3, 'Tornillo', NULL, 'GEN Num: 11234-10301', '11234-10301'),
(265, 1, 3, 'Tornillo', NULL, 'Todas Num: 11361-10851', '11361-10851'),
(266, 1, 3, 'Tornillo', NULL, 'Todas Num: 11361-12001A', '1361-12001A'),
(267, 1, 3, 'Soporte de Motor de Soporte', NULL, 'Todas Num: 21681-02510', '21681-02510'),
(268, 1, 3, 'Conjunto Tuerca', NULL, 'Todas Num: 21621-24000', '21621-24000'),
(269, 1, 3, 'Conjunto Soporte - Transaxle MTG', NULL, 'Todas Num: 21830-02050', '21830-02050'),
(270, 1, 3, 'Conjunto Soporte Rodillo Tapón FR', NULL, 'Todas Num: 21840-02000', '21840-02000'),
(271, 1, 3, 'Conjunto Tuerca', NULL, 'Todas Num: 21845-24000', '21845-24000'),
(272, 1, 3, 'Tornillo', NULL, 'Todas Num: 21855-02000', '21855-02000'),
(273, 1, 3, 'Tornillo', NULL, 'Todas Num: 11403-06221', '11403-06221'),
(274, 1, 3, 'Tornillo', NULL, 'Todas Num: 11403-08251', '11403-08251'),
(275, 1, 3, 'Semental', NULL, 'RHD Num: 11513-08351', '11513-08351'),
(276, 1, 3, 'Semental', NULL, 'GEN, LHD Num: 11513-08351', '11513-08351'),
(277, 1, 3, 'Semental', NULL, 'MES Num: 11513-08351', '11513-08351'),
(278, 1, 3, 'Semental', NULL, 'Todas Num: 11533-08255', '11533-08255'),
(279, 1, 3, 'Semental', NULL, 'GEN, LHD Num: 11533-08325', '11533-08325'),
(280, 1, 3, 'Abrazadera', NULL, 'Todas Num: 14720-22006', '14720-22006'),
(281, 1, 3, 'Sellado de Tapones', NULL, 'Todas Num: 15732-30001', '15732-30001'),
(282, 1, 3, 'Enchufe', NULL, 'Todas Num: 21131-32000', '21131-32000'),
(283, 1, 3, 'Conjunto de Cilindro de Cabeza', NULL, 'Todas Num: 22100-02700', '22100-02700'),
(284, 1, 3, 'Válvula de Asiento', NULL, 'Todas Num: 22112-02900', '22112-02900'),
(285, 1, 3, 'Válvula de Asiento', NULL, 'Todas Num: 22112-02910', '22112-02910'),
(286, 1, 3, 'Válvula de Escape de Asiento', NULL, 'Todas Num: 22113-02900', '22113-02900'),
(287, 1, 3, 'Válvula de Escape de Asiento', NULL, 'Todas Num: 22113-02910', '22113-02910'),
(288, 1, 3, 'Válvula de Entrada Guía', NULL, 'Todas Num: 22114-02900', '22114-02900'),
(289, 1, 3, 'Válvula de Entrada Guía', NULL, 'Todas Num: 22114-02910', '22114-02910'),
(290, 1, 3, 'Válvula de Entrada Guía', NULL, 'Todas Num: 22114-02920', '22114-02920'),
(291, 1, 3, 'Válvula de Escape', NULL, 'Todas Num: 22115-02900', '22115-02900'),
(292, 1, 3, 'Válvula de Escape', NULL, 'Todas Num: 22115-02910', '22115-02910'),
(293, 1, 3, 'Válvula de Escape', NULL, 'Todas Num: 22115-02920', '22115-02920'),
(294, 1, 3, 'Semental', NULL, 'Todas Num: 22125-21000', '22125-21000'),
(295, 1, 3, 'Reten Aceite', NULL, 'Todas Num: 22144-21010', '22144-21010'),
(296, 1, 3, 'Culata Junta', NULL, 'Todas Num: 22311-02700', '22311-02700'),
(297, 1, 3, 'Culata de Perno', NULL, 'Todas Num: 22320-02500', '22320-02500'),
(298, 1, 3, 'Entrada de Refrigerante', NULL, 'Todas Num: 25632-02501', '25632-02501'),
(299, 1, 3, 'BYPASS Refrigerante de Manguera', NULL, 'Todas Num: 25472-02501', '25472-02501'),
(300, 1, 3, 'Conjunto de Termostato', NULL, 'Todas Num: 25500-02500', '25500-02500'),
(301, 1, 3, 'Salida de Refrigerante', NULL, 'Todas Num: 25611-02502', '25611-02502'),
(302, 1, 3, 'Anillo \"O\"', NULL, 'Todas Num: 25612-02501', '25612-02501'),
(303, 1, 3, 'Estuche de Termostato de Junta', NULL, 'Todas Num: 25614-02500', '25614-02500'),
(304, 1, 3, 'Carcasa de Termostato', NULL, 'Todas Num: 25622-02501', '25622-02501'),
(305, 1, 3, 'Pezón', NULL, 'Todas Num: 25623-35500', '25623-35500'),
(306, 1, 3, 'Anillo \"O\"', NULL, 'Todas Num: 25633-02502', '25633-02502'),
(307, 1, 3, 'Sensor Temperatura Refrigerante', NULL, 'Todas Num: 39220-02500', '39220-02500'),
(308, 1, 3, 'Tornillo', NULL, 'Todas Num: 11403-06281', '11403-06281'),
(309, 1, 3, 'Espiga', NULL, 'MTA Num: 14303-08180', '14303-08180'),
(310, 1, 3, 'Pasador', NULL, 'Todas Num: 14311-05205', '14311-05205'),
(311, 1, 3, 'Rodamiento Set CRK/SHF', NULL, 'Todas Num: 21020-02540', '21020-02540'),
(312, 1, 3, 'Rodamiento Set CRK/SHF', NULL, 'Todas Num: 21020-02591', '21020-02591'),
(313, 1, 3, 'Rodamiento Set CRK/SHF', NULL, 'Todas Num: 21020-02592', '21020-02592'),
(314, 1, 3, 'Pistón de Juego de Anillos', NULL, 'Todas, +2GB Num: 23040-02700', '23040-02700'),
(315, 1, 3, 'Pistón de Juego de Anillos', NULL, 'GEN, -2GB Num: 23040-02934', '23040-02934'),
(316, 1, 3, 'Pistón de Juego de Anillos', NULL, 'GEN, -2GB Num: 23040-02710', '23040-02710'),
(317, 1, 3, 'Pistón de Juego de Anillos', NULL, 'GEN, -2GB Num: 23040-02935', '23040-02935'),
(318, 1, 3, 'Pistón de Juego de Anillos', NULL, 'GEN, -2GB Num: 23040-02936', '23040-02936'),
(319, 1, 3, 'Pistón de Juego de Anillos', NULL, 'GEN, -2GB Num: 23040-02937', '23040-02937'),
(320, 1, 3, 'Pistón de Juego de Anillos', NULL, 'GEN, -2GB Num: 23040-02938', '23040-02938'),
(321, 1, 3, 'Pistón de Juego de Anillos', NULL, 'MES, -2GB Num: 23040-02710', '23040-02710'),
(322, 1, 3, 'Pistón de Juego de Anillos', NULL, 'MES, -2GB Num: 23040-02935', '23040-02935'),
(323, 1, 3, 'Pistón de Juego de Anillos', NULL, 'MES, -2GB Num: 23040-02936', '23040-02936'),
(324, 1, 3, 'Pistón de Juego de Anillos', NULL, 'MES, -2GB Num: 23040-02937', '23040-02937'),
(325, 1, 3, 'Pistón de Juego de Anillos', NULL, 'Todas, +2GB Num: 23040-02931', '23040-02931'),
(326, 1, 3, 'Pistón de Juego de Anillos', NULL, 'MES, -2GB Num: 23040-02938', '23040-02938'),
(327, 1, 3, 'Pistón de Juego de Anillos', NULL, 'Todas, +2GB Num: 23040-02932', '23040-02932'),
(328, 1, 3, 'Pistón de Juego de Anillos', NULL, 'Todas, +2GB Num: 23040-02933', '23040-02933'),
(329, 1, 3, 'Pistón de Juego de Anillos', NULL, 'Todas, +2GB Num: 23040-02934', '23040-02934'),
(330, 1, 3, 'Pistón de Juego de Anillos', NULL, 'GEN, -2GB Num: 23040-02700', '23040-02700'),
(331, 1, 3, 'Pistón de Juego de Anillos', NULL, 'GEN, -2GB Num: 23040-02931', '23040-02931'),
(332, 1, 3, 'Pistón de Juego de Anillos', NULL, 'GEN, -2GB Num: 23040-02932', '23040-02932'),
(333, 1, 3, 'Pistón de Juego de Anillos', NULL, 'GEN, -2GB Num: 23040-02933', '23040-02933'),
(334, 1, 3, 'Rodamiento Set C/ROD', NULL, 'Todas Num: 23060-02500', '23060-02500'),
(335, 1, 3, 'Rodamiento Set C/ROD', NULL, 'Todas Num: 23060-02591', '23060-02591'),
(336, 1, 3, 'Rodamiento Set C/ROD', NULL, 'Todas Num: 23060-02592', '23060-02592'),
(337, 1, 3, 'Cigueñal', NULL, 'GEN Num: 23111-02720', '23111-02720'),
(338, 1, 3, 'Cigueñal', NULL, 'GEN Num: 23111-02721', '23111-02721'),
(339, 1, 3, 'Cigueñal', NULL, 'MES Num: 23111-02721', '23111-02721'),
(340, 1, 3, 'Cigueñal', NULL, 'ATA Num: 23112-02501', '23112-02501'),
(341, 1, 3, 'Piñon Cigueñal', NULL, 'Todas Num: 23121-02511', '23121-02511'),
(342, 1, 3, 'Polea Cigueñal', NULL, 'Todas Num: 23124-02510', '23124-02510'),
(343, 1, 3, 'Arandela', NULL, 'Todas Num: 23126-02500', '23126-02500'),
(344, 1, 3, 'Perno Cigueñal', NULL, 'GEN Num: 23127-02500', '23127-02500'),
(345, 1, 3, 'Perno Cigueñal', NULL, 'GEN Num: 23127-02501', '23127-02501'),
(346, 1, 3, 'Perno Cigueñal', NULL, 'MES Num: 23127-02501', '23127-02501'),
(347, 1, 3, 'Polea Cigueñal A/C', NULL, 'Todas, +9AA Num: 23151-02502', '23151-02502'),
(348, 1, 3, 'Conjunto de Volante', NULL, 'MTA Num: 23200-02521', '23200-02521');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL,
  `pro_nombre` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pro_apellido` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pro_edad` int(11) DEFAULT NULL,
  `pro_genero` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pro_nacionalidad` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pro_dirreccion` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pro_img` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_pieza_compra`
--

CREATE TABLE `registro_pieza_compra` (
  `id` int(11) NOT NULL,
  `pei_precio_compra` float DEFAULT NULL,
  `pie_precio_venta` float DEFAULT NULL,
  `pie_fecha_compra` datetime DEFAULT NULL,
  `pie_detalle` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `pie_img` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `compra_proveedor_id` int(11) NOT NULL,
  `piezas_vehiculo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

CREATE TABLE `reportes` (
  `id` int(11) NOT NULL,
  `repor_fecha` datetime NOT NULL,
  `detalle` text COLLATE utf8_unicode_ci NOT NULL,
  `personal_ajepp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda_bodega`
--

CREATE TABLE `tienda_bodega` (
  `id` int(11) NOT NULL,
  `fecha_salida` datetime DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `detalle` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `fechar_retorno` datetime DEFAULT NULL,
  `detalles_pieza_tienda_id` int(11) NOT NULL,
  `detalles_pieza_bodega_id` int(11) NOT NULL,
  `personal_ajepp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pago`
--

CREATE TABLE `tipo_pago` (
  `id` int(11) NOT NULL,
  `tipo_pago` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_vehiculo`
--

CREATE TABLE `tipo_vehiculo` (
  `id` int(11) NOT NULL,
  `tipo_vehiculo` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `clasificacion_vehiculo` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `vehiculo_img` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_vehiculo`
--

INSERT INTO `tipo_vehiculo` (`id`, `tipo_vehiculo`, `clasificacion_vehiculo`, `vehiculo_img`) VALUES
(1, 'Terrestre', 'taxi', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo_cliente`
--

CREATE TABLE `vehiculo_cliente` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `serie` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `veh_tipo` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `veh_anio` year(4) DEFAULT NULL,
  `veh_modelo` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `veh_marca` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `veh_img` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `detalle` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `iva` float DEFAULT NULL,
  `subtotal` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `fecha_venta` datetime DEFAULT NULL,
  `detalle` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_pago_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `personal_ajepp_id` int(11) NOT NULL,
  `descuento` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bodega_tienda`
--
ALTER TABLE `bodega_tienda`
  ADD PRIMARY KEY (`id`,`detalles_pieza_tienda_id`,`detalles_pieza_bodega_id`,`personal_ajepp_id`),
  ADD KEY `fk_bodega_tienda_detalles_pieza_tienda1` (`detalles_pieza_tienda_id`),
  ADD KEY `fk_bodega_tienda_detalles_pieza_bodega1` (`detalles_pieza_bodega_id`),
  ADD KEY `fk_bodega_tienda_personal_ajepp1` (`personal_ajepp_id`);

--
-- Indices de la tabla `cargo_ajepp`
--
ALTER TABLE `cargo_ajepp`
  ADD PRIMARY KEY (`id`,`departamento_ajepp_id`),
  ADD KEY `fk_cargo_ajepp_departamento_ajepp1` (`departamento_ajepp_id`);

--
-- Indices de la tabla `cargo_personal`
--
ALTER TABLE `cargo_personal`
  ADD PRIMARY KEY (`id`,`cargo_ajepp_id`,`personal_ajepp_id`),
  ADD KEY `fk_cargo_personal_cargo_ajepp1` (`cargo_ajepp_id`),
  ADD KEY `fk_cargo_personal_personal_ajepp1` (`personal_ajepp_id`);

--
-- Indices de la tabla `clasificacion_pieza`
--
ALTER TABLE `clasificacion_pieza`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identificacion` (`identificacion`);

--
-- Indices de la tabla `compania`
--
ALTER TABLE `compania`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compra_proveedor`
--
ALTER TABLE `compra_proveedor`
  ADD PRIMARY KEY (`id`,`personal_ajepp_id`,`proveedor_id`,`tipo_pago_id`),
  ADD KEY `fk_compra_proveedor_personal_ajepp1` (`personal_ajepp_id`),
  ADD KEY `fk_compra_proveedor_proveedor1` (`proveedor_id`),
  ADD KEY `fk_compra_proveedor_tipo_pago1` (`tipo_pago_id`);

--
-- Indices de la tabla `contacto_proveedor`
--
ALTER TABLE `contacto_proveedor`
  ADD PRIMARY KEY (`id`,`proveedor_id`),
  ADD KEY `fk_contacto_proveedor_proveedor1` (`proveedor_id`);

--
-- Indices de la tabla `datos_contacto_cliente`
--
ALTER TABLE `datos_contacto_cliente`
  ADD PRIMARY KEY (`id`,`cliente_id`),
  ADD KEY `fk_datos_contacto_cliente_cliente1` (`cliente_id`);

--
-- Indices de la tabla `departamento_ajepp`
--
ALTER TABLE `departamento_ajepp`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalles_pieza_bodega`
--
ALTER TABLE `detalles_pieza_bodega`
  ADD PRIMARY KEY (`id`,`piezas_vehiculo_id`) USING BTREE,
  ADD KEY `fk_detalles_pieza_bodega_piezas_vehiculo1` (`piezas_vehiculo_id`);

--
-- Indices de la tabla `detalles_pieza_tienda`
--
ALTER TABLE `detalles_pieza_tienda`
  ADD PRIMARY KEY (`id`,`piezas_vehiculo_id`),
  ADD UNIQUE KEY `pie_serie` (`pie_serie`),
  ADD KEY `fk_detalles_pieza_tienda_piezas_vehiculo1` (`piezas_vehiculo_id`);

--
-- Indices de la tabla `items_venta`
--
ALTER TABLE `items_venta`
  ADD PRIMARY KEY (`id`,`detalles_pieza_tienda_id`,`ventas_id`),
  ADD KEY `fk_items_venta_detalles_pieza_tienda1` (`detalles_pieza_tienda_id`),
  ADD KEY `fk_items_venta_ventas1` (`ventas_id`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`usuario`,`personal_ajepp_id`),
  ADD KEY `fk_Login_personal_ajepp1` (`personal_ajepp_id`);

--
-- Indices de la tabla `marca_vehiculo`
--
ALTER TABLE `marca_vehiculo`
  ADD PRIMARY KEY (`id`,`tipo_vehiculo_id`),
  ADD KEY `fk_marca_vehiculo_tipo_vehiculo1` (`tipo_vehiculo_id`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modelo_vehiculo`
--
ALTER TABLE `modelo_vehiculo`
  ADD PRIMARY KEY (`id`,`marca_vehiculo_id`),
  ADD KEY `fk_modelo_vehiculo_marca_vehiculo1` (`marca_vehiculo_id`);

--
-- Indices de la tabla `personal_ajepp`
--
ALTER TABLE `personal_ajepp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `per_identificacion` (`per_identificacion`);

--
-- Indices de la tabla `personal_contacto`
--
ALTER TABLE `personal_contacto`
  ADD PRIMARY KEY (`id`,`personal_ajepp_id`),
  ADD KEY `fk_personal_contacto_personal_ajepp1` (`personal_ajepp_id`);

--
-- Indices de la tabla `piezas_vehiculo`
--
ALTER TABLE `piezas_vehiculo`
  ADD PRIMARY KEY (`id`,`modelo_vehiculo_id`,`clasificacion_pieza_id`),
  ADD KEY `fk_piezas_vehiculo_modelo_vehiculo1` (`modelo_vehiculo_id`),
  ADD KEY `fk_piezas_vehiculo_clasificacion_pieza1` (`clasificacion_pieza_id`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `registro_pieza_compra`
--
ALTER TABLE `registro_pieza_compra`
  ADD PRIMARY KEY (`id`,`compra_proveedor_id`,`piezas_vehiculo_id`),
  ADD KEY `fk_registro_pieza_compra_compra_proveedor1` (`compra_proveedor_id`),
  ADD KEY `fk_registro_pieza_compra_piezas_vehiculo1` (`piezas_vehiculo_id`);

--
-- Indices de la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD PRIMARY KEY (`id`,`personal_ajepp_id`),
  ADD KEY `fk_reportes_personal_ajepp1` (`personal_ajepp_id`);

--
-- Indices de la tabla `tienda_bodega`
--
ALTER TABLE `tienda_bodega`
  ADD PRIMARY KEY (`id`,`detalles_pieza_tienda_id`,`detalles_pieza_bodega_id`,`personal_ajepp_id`),
  ADD KEY `fk_tienda_bodega_detalles_pieza_tienda1` (`detalles_pieza_tienda_id`),
  ADD KEY `fk_tienda_bodega_detalles_pieza_bodega1` (`detalles_pieza_bodega_id`),
  ADD KEY `fk_tienda_bodega_personal_ajepp1` (`personal_ajepp_id`);

--
-- Indices de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_vehiculo`
--
ALTER TABLE `tipo_vehiculo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `vehiculo_cliente`
--
ALTER TABLE `vehiculo_cliente`
  ADD PRIMARY KEY (`id`,`cliente_id`),
  ADD UNIQUE KEY `serie` (`serie`),
  ADD KEY `fk_vehiculo_cliente_cliente1` (`cliente_id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`,`tipo_pago_id`,`cliente_id`,`personal_ajepp_id`),
  ADD KEY `fk_ventas_tipo_pago1` (`tipo_pago_id`),
  ADD KEY `fk_ventas_cliente1` (`cliente_id`),
  ADD KEY `fk_ventas_personal_ajepp1` (`personal_ajepp_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bodega_tienda`
--
ALTER TABLE `bodega_tienda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cargo_ajepp`
--
ALTER TABLE `cargo_ajepp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cargo_personal`
--
ALTER TABLE `cargo_personal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `clasificacion_pieza`
--
ALTER TABLE `clasificacion_pieza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `compra_proveedor`
--
ALTER TABLE `compra_proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contacto_proveedor`
--
ALTER TABLE `contacto_proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `datos_contacto_cliente`
--
ALTER TABLE `datos_contacto_cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `departamento_ajepp`
--
ALTER TABLE `departamento_ajepp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalles_pieza_bodega`
--
ALTER TABLE `detalles_pieza_bodega`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalles_pieza_tienda`
--
ALTER TABLE `detalles_pieza_tienda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marca_vehiculo`
--
ALTER TABLE `marca_vehiculo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `modelo_vehiculo`
--
ALTER TABLE `modelo_vehiculo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `personal_ajepp`
--
ALTER TABLE `personal_ajepp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `personal_contacto`
--
ALTER TABLE `personal_contacto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `piezas_vehiculo`
--
ALTER TABLE `piezas_vehiculo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=349;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registro_pieza_compra`
--
ALTER TABLE `registro_pieza_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reportes`
--
ALTER TABLE `reportes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tienda_bodega`
--
ALTER TABLE `tienda_bodega`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_vehiculo`
--
ALTER TABLE `tipo_vehiculo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `vehiculo_cliente`
--
ALTER TABLE `vehiculo_cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bodega_tienda`
--
ALTER TABLE `bodega_tienda`
  ADD CONSTRAINT `fk_bodega_tienda_detalles_pieza_bodega1` FOREIGN KEY (`detalles_pieza_bodega_id`) REFERENCES `detalles_pieza_bodega` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bodega_tienda_detalles_pieza_tienda1` FOREIGN KEY (`detalles_pieza_tienda_id`) REFERENCES `detalles_pieza_tienda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bodega_tienda_personal_ajepp1` FOREIGN KEY (`personal_ajepp_id`) REFERENCES `personal_ajepp` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cargo_ajepp`
--
ALTER TABLE `cargo_ajepp`
  ADD CONSTRAINT `fk_cargo_ajepp_departamento_ajepp1` FOREIGN KEY (`departamento_ajepp_id`) REFERENCES `departamento_ajepp` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cargo_personal`
--
ALTER TABLE `cargo_personal`
  ADD CONSTRAINT `fk_cargo_personal_cargo_ajepp1` FOREIGN KEY (`cargo_ajepp_id`) REFERENCES `cargo_ajepp` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cargo_personal_personal_ajepp1` FOREIGN KEY (`personal_ajepp_id`) REFERENCES `personal_ajepp` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `compra_proveedor`
--
ALTER TABLE `compra_proveedor`
  ADD CONSTRAINT `fk_compra_proveedor_personal_ajepp1` FOREIGN KEY (`personal_ajepp_id`) REFERENCES `personal_ajepp` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_compra_proveedor_proveedor1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_compra_proveedor_tipo_pago1` FOREIGN KEY (`tipo_pago_id`) REFERENCES `tipo_pago` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `contacto_proveedor`
--
ALTER TABLE `contacto_proveedor`
  ADD CONSTRAINT `fk_contacto_proveedor_proveedor1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `datos_contacto_cliente`
--
ALTER TABLE `datos_contacto_cliente`
  ADD CONSTRAINT `fk_datos_contacto_cliente_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalles_pieza_tienda`
--
ALTER TABLE `detalles_pieza_tienda`
  ADD CONSTRAINT `fk_detalles_pieza_tienda_piezas_vehiculo1` FOREIGN KEY (`piezas_vehiculo_id`) REFERENCES `piezas_vehiculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `items_venta`
--
ALTER TABLE `items_venta`
  ADD CONSTRAINT `fk_items_venta_detalles_pieza_tienda1` FOREIGN KEY (`detalles_pieza_tienda_id`) REFERENCES `detalles_pieza_tienda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_items_venta_ventas1` FOREIGN KEY (`ventas_id`) REFERENCES `ventas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `fk_Login_personal_ajepp1` FOREIGN KEY (`personal_ajepp_id`) REFERENCES `personal_ajepp` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `marca_vehiculo`
--
ALTER TABLE `marca_vehiculo`
  ADD CONSTRAINT `fk_marca_vehiculo_tipo_vehiculo1` FOREIGN KEY (`tipo_vehiculo_id`) REFERENCES `tipo_vehiculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `modelo_vehiculo`
--
ALTER TABLE `modelo_vehiculo`
  ADD CONSTRAINT `fk_modelo_vehiculo_marca_vehiculo1` FOREIGN KEY (`marca_vehiculo_id`) REFERENCES `marca_vehiculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `personal_contacto`
--
ALTER TABLE `personal_contacto`
  ADD CONSTRAINT `fk_personal_contacto_personal_ajepp1` FOREIGN KEY (`personal_ajepp_id`) REFERENCES `personal_ajepp` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `piezas_vehiculo`
--
ALTER TABLE `piezas_vehiculo`
  ADD CONSTRAINT `fk_piezas_vehiculo_clasificacion_pieza1` FOREIGN KEY (`clasificacion_pieza_id`) REFERENCES `clasificacion_pieza` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_piezas_vehiculo_modelo_vehiculo1` FOREIGN KEY (`modelo_vehiculo_id`) REFERENCES `modelo_vehiculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `registro_pieza_compra`
--
ALTER TABLE `registro_pieza_compra`
  ADD CONSTRAINT `fk_registro_pieza_compra_compra_proveedor1` FOREIGN KEY (`compra_proveedor_id`) REFERENCES `compra_proveedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_registro_pieza_compra_piezas_vehiculo1` FOREIGN KEY (`piezas_vehiculo_id`) REFERENCES `piezas_vehiculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD CONSTRAINT `fk_reportes_personal_ajepp1` FOREIGN KEY (`personal_ajepp_id`) REFERENCES `personal_ajepp` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tienda_bodega`
--
ALTER TABLE `tienda_bodega`
  ADD CONSTRAINT `fk_tienda_bodega_detalles_pieza_bodega1` FOREIGN KEY (`detalles_pieza_bodega_id`) REFERENCES `detalles_pieza_bodega` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tienda_bodega_detalles_pieza_tienda1` FOREIGN KEY (`detalles_pieza_tienda_id`) REFERENCES `detalles_pieza_tienda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tienda_bodega_personal_ajepp1` FOREIGN KEY (`personal_ajepp_id`) REFERENCES `personal_ajepp` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vehiculo_cliente`
--
ALTER TABLE `vehiculo_cliente`
  ADD CONSTRAINT `fk_vehiculo_cliente_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_ventas_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ventas_personal_ajepp1` FOREIGN KEY (`personal_ajepp_id`) REFERENCES `personal_ajepp` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ventas_tipo_pago1` FOREIGN KEY (`tipo_pago_id`) REFERENCES `tipo_pago` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
