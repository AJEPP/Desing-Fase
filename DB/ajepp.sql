-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 13, 2020 at 03:31 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ajepp`
--

-- --------------------------------------------------------

--
-- Table structure for table `bodega_tienda`
--

CREATE TABLE `bodega_tienda` (
  `id` int(11) NOT NULL,
  `fecha_salida` datetime DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `detalle` text DEFAULT NULL,
  `fechar_ingreso` datetime DEFAULT NULL,
  `detalles_pieza_tienda_id` int(11) NOT NULL,
  `detalles_pieza_bodega_id` int(11) NOT NULL,
  `personal_ajepp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cargo_ajepp`
--

CREATE TABLE `cargo_ajepp` (
  `id` int(11) NOT NULL,
  `departamento_ajepp_id` int(11) NOT NULL,
  `car_nombre` varchar(100) DEFAULT NULL,
  `pago_cargo` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cargo_ajepp`
--

INSERT INTO `cargo_ajepp` (`id`, `departamento_ajepp_id`, `car_nombre`, `pago_cargo`) VALUES
(2, 1, 'HOLA', 20000),
(4, 1, 'operador', 30000);

-- --------------------------------------------------------

--
-- Table structure for table `cargo_personal`
--

CREATE TABLE `cargo_personal` (
  `id` int(11) NOT NULL,
  `fecha_inicio` varchar(45) DEFAULT NULL,
  `per_salario` float DEFAULT NULL,
  `cargo_ajepp_id` int(11) NOT NULL,
  `personal_ajepp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `clasificacion_pieza`
--

CREATE TABLE `clasificacion_pieza` (
  `id` int(11) NOT NULL,
  `pie_img` varchar(100) DEFAULT NULL,
  `pi_nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clasificacion_pieza`
--

INSERT INTO `clasificacion_pieza` (`id`, `pie_img`, `pi_nombre`) VALUES
(1, NULL, 'Etiqueta'),
(2, NULL, 'Conjunto Gato'),
(3, NULL, 'Motor');

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `identificacion` varchar(100) NOT NULL,
  `cli_nombres` varchar(100) NOT NULL,
  `cli_apellidos` varchar(100) NOT NULL,
  `cli_edad` int(11) NOT NULL,
  `cli_genero` varchar(2) NOT NULL,
  `cli_domicilio` varchar(100) DEFAULT NULL,
  `cli_dirreccion` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `compania`
--

CREATE TABLE `compania` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `RUC` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `compra_proveedor`
--

CREATE TABLE `compra_proveedor` (
  `id` int(11) NOT NULL,
  `iva` float NOT NULL,
  `subtotal` float NOT NULL,
  `total` float NOT NULL,
  `fecha_compra` datetime NOT NULL,
  `detalle` text NOT NULL,
  `personal_ajepp_id` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `tipo_pago_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `contacto_proveedor`
--

CREATE TABLE `contacto_proveedor` (
  `id` int(11) NOT NULL,
  `pro_celular` varchar(100) DEFAULT NULL,
  `pro_correo` varchar(100) DEFAULT NULL,
  `pro_twiter` varchar(45) DEFAULT NULL,
  `pro_fax` varchar(45) DEFAULT NULL,
  `pro_telefono` varchar(100) DEFAULT NULL,
  `proveedor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `datos_contacto_cliente`
--

CREATE TABLE `datos_contacto_cliente` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `cli_correro` varchar(100) DEFAULT NULL,
  `cli_telefono` varchar(60) DEFAULT NULL,
  `cli_twiter` varchar(50) DEFAULT NULL,
  `cli_facebook` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `departamento_ajepp`
--

CREATE TABLE `departamento_ajepp` (
  `id` int(11) NOT NULL,
  `dep_nombre` varchar(60) DEFAULT NULL,
  `dep_locacion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departamento_ajepp`
--

INSERT INTO `departamento_ajepp` (`id`, `dep_nombre`, `dep_locacion`) VALUES
(1, 'cauca', 'hola');

-- --------------------------------------------------------

--
-- Table structure for table `detalles_pieza_bodega`
--

CREATE TABLE `detalles_pieza_bodega` (
  `id` int(11) NOT NULL,
  `pie_serie` varchar(100) NOT NULL,
  `pie_precio_venta` float DEFAULT NULL,
  `pie_precio_compra` float NOT NULL,
  `pie_fecha_ingreso` datetime NOT NULL,
  `pie_detalle` text NOT NULL,
  `pie_cantidad` int(11) NOT NULL,
  `bod_t_img` varchar(100) DEFAULT NULL,
  `compra_proveedor_id` int(11) NOT NULL,
  `piezas_vehiculo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `detalles_pieza_tienda`
--

CREATE TABLE `detalles_pieza_tienda` (
  `id` int(11) NOT NULL,
  `pie_serie` varchar(100) NOT NULL,
  `pie_precio` float NOT NULL,
  `pie_detalles` text NOT NULL,
  `pie_cantidad` int(11) NOT NULL,
  `pie_t_img` varchar(100) DEFAULT NULL,
  `piezas_vehiculo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `items_venta`
--

CREATE TABLE `items_venta` (
  `id` int(11) NOT NULL,
  `pie_precio` float DEFAULT NULL,
  `pie_serie` varchar(100) DEFAULT NULL,
  `pie_cantidad` int(11) DEFAULT NULL,
  `pie_numero` varchar(100) DEFAULT NULL,
  `detalles_pieza_tienda_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `usuario` varchar(45) NOT NULL,
  `contrasenia` varchar(200) NOT NULL,
  `personal_ajepp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`usuario`, `contrasenia`, `personal_ajepp_id`) VALUES
('admin', '$2y$10$nfgnhgnfghGljHYIUidvdeCaOu6OeUf2rQTNEbcGNe8ZXt3NsGuu.', 2);

-- --------------------------------------------------------

--
-- Table structure for table `marca_vehiculo`
--

CREATE TABLE `marca_vehiculo` (
  `id` int(11) NOT NULL,
  `marca_vehiculo` varchar(60) NOT NULL,
  `mar_img` varchar(45) DEFAULT NULL,
  `tipo_vehiculo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `marca_vehiculo`
--

INSERT INTO `marca_vehiculo` (`id`, `marca_vehiculo`, `mar_img`, `tipo_vehiculo_id`) VALUES
(1, 'HYUNDAI', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `contenido` text DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `estado` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `contenido`, `order`, `estado`) VALUES
(1, '{\"text\":\"Panel de control\", \"icon\": \"tachometer-alt\", \"link\":\"dashboard\", \"child\": [], \"show\": [1,2,3]}', 1, 'on'),
(2, '{\"text\":\"Departamentos\", \"icon\": \"arrows-alt\", \"link\":\"departamento\", \"child\": [], \"show\": [1,2,3]}', 2, 'on'),
(3, '{\"text\":\"Marca Vehiculo\", \"icon\": \"fas fa-bullhorn\", \"link\":\"marca\", \"child\": [], \"show\": [1,2,3]}', 3, 'on'),
(4, '{\"text\":\"Tipo Vehiculo\", \"icon\": \"fas fa-truck-monster\", \"link\":\"tipoVehiculo\", \"child\": [], \"show\": [1,2,3]}', 4, 'on'),
(5, '{\"text\":\"Cargo\", \"icon\": \"fas fa-user-plus\", \"link\":\"cargo\", \"child\": [], \"show\": [1,2,3]}', 5, 'on'),
(6, '{\"text\":\"Modelo Vehiculo\", \"icon\": \"fas fa-car\", \"link\":\"modeloVehiculo\", \"child\": [], \"show\": [1,2,3]}', 6, 'on'),
(7, '{\"text\":\"Piezas Vehiculo\", \"icon\": \"fas fa-puzzle-piece\", \"link\":\"piezasVehiculo\", \"child\": [], \"show\": [1,2,3]}', 7, 'on'),
(8, '{\"text\":\"Usuarios\", \"icon\": \"fas fa-users\", \"link\":\"usuarios\", \"child\": [], \"show\": [1,2,3]}', 8, 'on');

-- --------------------------------------------------------

--
-- Table structure for table `modelo_vehiculo`
--

CREATE TABLE `modelo_vehiculo` (
  `id` int(11) NOT NULL,
  `marca_vehiculo_id` int(11) NOT NULL,
  `mod_vehiculo` varchar(100) NOT NULL,
  `mod_anio` year(4) NOT NULL,
  `mod_img` varchar(45) DEFAULT NULL,
  `procedencia` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `modelo_vehiculo`
--

INSERT INTO `modelo_vehiculo` (`id`, `marca_vehiculo_id`, `mod_vehiculo`, `mod_anio`, `mod_img`, `procedencia`) VALUES
(1, 1, 'GL-GLS', 2001, NULL, 'Seúl - Corea del Sur');

-- --------------------------------------------------------

--
-- Table structure for table `personal_ajepp`
--

CREATE TABLE `personal_ajepp` (
  `id` int(11) NOT NULL,
  `per_identificacion` varchar(100) NOT NULL,
  `per_nombre` varchar(30) NOT NULL,
  `per_apellido` varchar(30) NOT NULL,
  `per_edad` int(11) NOT NULL,
  `per_genero` varchar(2) NOT NULL,
  `fecha_ingreso` year(4) DEFAULT NULL,
  `per_domicilio` varchar(100) DEFAULT NULL,
  `per_dirreccion` varchar(100) DEFAULT NULL,
  `personal_ajeppcol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `personal_ajepp`
--

INSERT INTO `personal_ajepp` (`id`, `per_identificacion`, `per_nombre`, `per_apellido`, `per_edad`, `per_genero`, `fecha_ingreso`, `per_domicilio`, `per_dirreccion`, `personal_ajeppcol`) VALUES
(2, '22222', 'Juan', 'Bolivar', 23, 'ma', NULL, 'hola', 'call12', 'hola');

-- --------------------------------------------------------

--
-- Table structure for table `personal_contacto`
--

CREATE TABLE `personal_contacto` (
  `id` int(11) NOT NULL,
  `per_email` varchar(100) DEFAULT NULL,
  `per_celular` varchar(45) NOT NULL,
  `per_telefono_casa` varchar(45) DEFAULT NULL,
  `per_twiter` varchar(45) DEFAULT NULL,
  `personal_ajepp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `piezas_vehiculo`
--

CREATE TABLE `piezas_vehiculo` (
  `id` int(11) NOT NULL,
  `modelo_vehiculo_id` int(11) NOT NULL,
  `clasificacion_pieza_id` int(11) NOT NULL,
  `pie_nombre` varchar(100) DEFAULT NULL,
  `pie_img` varchar(100) DEFAULT NULL,
  `pie_descripcion` text DEFAULT NULL,
  `pie_numero` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `piezas_vehiculo`
--

INSERT INTO `piezas_vehiculo` (`id`, `modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_img`, `pie_descripcion`, `pie_numero`) VALUES
(187, 1, 1, 'Etiqueta', '', 'Todas', '05203-02000'),
(188, 1, 1, 'Etiqueta Control', '', 'GEN, LHD, +2GB, +A08', '32450-02580'),
(189, 1, 1, 'Etiqueta Control', '', 'GEN, LHD, +2GB, +A08', '32450-02581'),
(190, 1, 1, 'Etiqueta Control', '', 'GEN, LHD, +2GB, +B07', '32450-02570'),
(192, 1, 2, 'Conjunto Gato', '', 'GEN, +A18', '09110-02000'),
(193, 1, 2, 'Conjunto Gato', '', 'GEN, +A18', '09110-02100'),
(194, 1, 2, 'Conjunto Gato', '', 'GEN, -A18, MES', '09110-23000'),
(195, 1, 2, 'Conjunto Gato', '', 'GEN, -A18, MES', '09110-02200'),
(198, 1, 2, 'Etiqueta', '', 'GEN, +A18', '09127-29000'),
(199, 1, 2, 'Caja de Herramientas', '', 'Todas', '09149-33540'),
(200, 1, 2, 'Caja de Herramientas', '', 'Todas', '09149-02000'),
(201, 1, 2, 'Caja de Herramientas', '', 'Todas', '09149-34000'),
(202, 1, 2, 'Llave de Ruedas', '', 'Todas', '09131-28000'),
(203, 1, 2, 'Llave de Ruedas', '', 'Todas', '09131-29000'),
(204, 1, 2, 'Llave Fija 10x12', '', 'Todas', '09135-11210'),
(205, 1, 2, 'Alicates', '', 'Todas', '09145-11200'),
(206, 1, 2, 'Destornilladores', '', 'Todas', '09146-11110'),
(207, 1, 3, 'Sub-Conjunto Motor', '', 'Todas, +2GB', '21101-02B00'),
(208, 1, 3, 'Sub-Conjunto Motor', '', 'Todas, -2GB', '21101-02C00'),
(209, 1, 3, 'Conjunto-Corto Motor', '', 'Todas, +2GB, GEN, -2GB', '21102-02B00'),
(211, 1, 3, 'Conjunto-Corto Motor', '', 'GEN, -2GB, Mes, -2GB', '21102-02D00'),
(213, 1, 3, 'Juego de Juntas Reparacion de Motor', '', 'Todas', '20910-02B00'),
(214, 1, 3, 'Juego de Juntas Reparacion de Motor GEN', '', 'Todas', '20920-02B00'),
(215, 1, 3, 'Espiga', '', 'Todas', '14303-06140'),
(216, 1, 3, 'Casquillo', '', 'Todas', '14331-10160'),
(217, 1, 3, 'Casquillo', '', 'Todas', '14331-06090'),
(219, 1, 3, 'Tapa Selladora', '', 'Todas', '15732-30001'),
(220, 1, 3, 'Bloque de Cilindros', '', 'Todas', '21100-02700'),
(221, 1, 3, 'Tapa de Perno', '', 'Todas', '21114-02511'),
(222, 1, 3, 'Filtro de Aceite de Estudio', '', 'Todas', '21141-02500'),
(223, 1, 3, 'Interruptor de Presión Aceite', '', 'Todas', '94750-21030'),
(224, 1, 3, 'Tornillo', '', 'Todas', '11400-08101'),
(226, 1, 3, 'Tornillo', '', 'Todas', '11403-06301'),
(227, 1, 3, 'Maquina de Tornillo', '', 'Todas', '12203-06141'),
(228, 1, 3, 'Anillo Retenedor', '', 'Todas', '14615-12005'),
(229, 1, 3, 'Enchufe', '', 'Todas', '15716-13111'),
(230, 1, 3, 'Conjunto de Cubierta', '', 'Todas', '21310-02500'),
(231, 1, 3, 'Tapa de Bonba de Aceite', '', 'Todas', '21313-02500'),
(232, 1, 3, 'Estuche de Junta FR', '', 'Todas', '21411-02500'),
(233, 1, 3, 'Anillo Reten de Aceite', '', 'Todas', '21421-21020'),
(234, 1, 3, 'Bomba de Aceite para Engranajes INR', '', 'Todas', '26112-02500'),
(235, 1, 3, 'Bomba de Aceite para Engranajes OTR', '', 'Todas', '26113-02500'),
(236, 1, 3, 'Embolo Descarga', '', 'Todas', '26122-02500'),
(237, 1, 3, 'Muelle Descarga', '', 'Todas', '26123-02500'),
(238, 1, 3, 'Retencion', '', 'Todas', '26124-02500'),
(239, 1, 3, 'Filtro Aceite Motor', '', 'Todas', '26300-02500'),
(240, 1, 3, 'Medidor de Nivel de Aceite', '', 'Todas', '26611-02500'),
(241, 1, 3, 'Guía de Nivel de Aceite', '', 'Todas', '26612-02501'),
(242, 1, 3, 'Anillo \"O\"', '', 'Todas', '26614-35000'),
(243, 1, 3, 'Anillo \"O\"', '', 'Todas', '26615-33000'),
(244, 1, 3, 'Tornillo', '', 'Todas', '11233-06101'),
(245, 1, 3, 'Tornillo', '', 'Todas', '11233-06121'),
(246, 1, 3, 'Tornillo', '', 'Todas', '11233-08201'),
(247, 1, 3, 'Tornillo', '', 'Todas', '11403-06181'),
(248, 1, 3, 'Tornillo', '', 'Todas', '11403-06141'),
(249, 1, 3, 'Cubierta Correa de Distribución', '', 'Todas', '21350-02710'),
(250, 1, 3, 'Correa de Distribución CVR', '', 'Todas', '21352-02700'),
(251, 1, 3, 'Bloque Placa Cilindro RR', '', 'Todas', '21431-02500'),
(252, 1, 3, 'Caja Sello de Aceite RR', '', 'Todas', '21441-02500'),
(253, 1, 3, 'Sello Aceite RR', '', 'Todas', '21443-02500'),
(254, 1, 3, 'Estuche de Junta de Aceite', '', 'Todas', '21444-02500'),
(255, 1, 3, 'Junta Liquida Motor', '', 'Todas', '21451-33A01'),
(256, 1, 3, 'Vivienda Cubierta', '', 'Todas', '21461-02500'),
(257, 1, 3, 'Aceite de Motor Conjunto', '', 'Todas', '21510-02510'),
(258, 1, 3, 'Drenaje de Aceite', '', 'Todas', '21512-21000'),
(259, 1, 3, 'Enchufe de Aceite de Junta', '', 'Todas', '21513-21000'),
(260, 1, 3, 'Pantalla Conjunto de Aceite', '', 'Todas', '26250-02500'),
(261, 1, 3, 'Pantalla de Junta de Aceite', '', 'Todas', '26259-02500'),
(262, 1, 3, 'Tornillo', '', 'GEN, -9AA', '11233-08251'),
(263, 1, 3, 'Tornillo', '', 'GEN', '11234-10251'),
(264, 1, 3, 'Tornillo', '', 'GEN', '11234-10301'),
(265, 1, 3, 'Tornillo', '', 'Todas', '11361-10851'),
(266, 1, 3, 'Tornillo', '', 'Todas', '11361-12001A'),
(267, 1, 3, 'Soporte de Motor de Soporte', '', 'Todas', '21681-02510'),
(268, 1, 3, 'Conjunto Tuerca', '', 'Todas', '21621-24000'),
(269, 1, 3, 'Conjunto Soporte - Transaxle MTG', '', 'Todas', '21830-02050'),
(270, 1, 3, 'Conjunto Soporte Rodillo Tapón FR', '', 'Todas', '21840-02000'),
(271, 1, 3, 'Conjunto Tuerca', '', 'Todas', '21845-24000'),
(272, 1, 3, 'Tornillo', '', 'Todas', '21855-02000'),
(273, 1, 3, 'Tornillo', '', 'Todas', '11403-06221'),
(274, 1, 3, 'Tornillo', '', 'Todas', '11403-08251'),
(275, 1, 3, 'Semental', '', 'RHD, MES, GEN, LHD', '11513-08351'),
(278, 1, 3, 'Semental', '', 'Todas', '11533-08255'),
(279, 1, 3, 'Semental', '', 'GEN, LHD', '11533-08325'),
(280, 1, 3, 'Abrazadera', '', 'Todas', '14720-22006'),
(282, 1, 3, 'Enchufe', '', 'Todas', '21131-32000'),
(283, 1, 3, 'Conjunto de Cilindro de Cabeza', '', 'Todas', '22100-02700'),
(284, 1, 3, 'Válvula de Asiento', '', 'Todas', '22112-02900'),
(285, 1, 3, 'Válvula de Asiento', '', 'Todas', '22112-02910'),
(286, 1, 3, 'Válvula de Escape de Asiento', '', 'Todas', '22113-02900'),
(287, 1, 3, 'Válvula de Escape de Asiento', '', 'Todas', '22113-02910'),
(288, 1, 3, 'Válvula de Entrada Guía', '', 'Todas', '22114-02900'),
(289, 1, 3, 'Válvula de Entrada Guía', '', 'Todas', '22114-02910'),
(290, 1, 3, 'Válvula de Entrada Guía', '', 'Todas', '22114-02920'),
(291, 1, 3, 'Válvula de Escape', '', 'Todas', '22115-02900'),
(292, 1, 3, 'Válvula de Escape', '', 'Todas', '22115-02910'),
(293, 1, 3, 'Válvula de Escape', '', 'Todas', '22115-02920'),
(294, 1, 3, 'Semental', '', 'Todas', '22125-21000'),
(295, 1, 3, 'Reten Aceite', '', 'Todas', '22144-21010'),
(296, 1, 3, 'Culata Junta', '', 'Todas', '22311-02700'),
(297, 1, 3, 'Culata de Perno', '', 'Todas', '22320-02500'),
(298, 1, 3, 'Entrada de Refrigerante', '', 'Todas', '25632-02501'),
(299, 1, 3, 'BYPASS Refrigerante de Manguera', '', 'Todas', '25472-02501'),
(300, 1, 3, 'Conjunto de Termostato', '', 'Todas', '25500-02500'),
(301, 1, 3, 'Salida de Refrigerante', '', 'Todas', '25611-02502'),
(302, 1, 3, 'Anillo \"O\"', '', 'Todas', '25612-02501'),
(303, 1, 3, 'Estuche de Termostato de Junta', '', 'Todas', '25614-02500'),
(304, 1, 3, 'Carcasa de Termostato', '', 'Todas', '25622-02501'),
(305, 1, 3, 'Pezón', '', 'Todas', '25623-35500'),
(306, 1, 3, 'Anillo \"O\"', '', 'Todas', '25633-02502'),
(307, 1, 3, 'Sensor Temperatura Refrigerante', '', 'Todas', '39220-02500'),
(308, 1, 3, 'Tornillo', '', 'Todas', '11403-06281'),
(309, 1, 3, 'Espiga', '', 'MTA', '14303-08180'),
(310, 1, 3, 'Pasador', '', 'Todas', '14311-05205'),
(311, 1, 3, 'Rodamiento Set CRK/SHF', '', 'Todas', '21020-02540'),
(312, 1, 3, 'Rodamiento Set CRK/SHF', '', 'Todas', '21020-02591'),
(313, 1, 3, 'Rodamiento Set CRK/SHF', '', 'Todas', '21020-02592'),
(314, 1, 3, 'Pistón de Juego de Anillos', '', 'Todas, +2GB', '23040-02700'),
(315, 1, 3, 'Pistón de Juego de Anillos', '', 'GEN, -2GB, MES', '23040-02934'),
(316, 1, 3, 'Pistón de Juego de Anillos', '', 'GEN, -2GB, MES', '23040-02710'),
(317, 1, 3, 'Pistón de Juego de Anillos', '', 'GEN, -2GB,MES', '23040-02935'),
(318, 1, 3, 'Pistón de Juego de Anillos', '', 'GEN, -2GB, MES', '23040-02936'),
(319, 1, 3, 'Pistón de Juego de Anillos', '', 'GEN, -2GB, MES', '23040-02937'),
(320, 1, 3, 'Pistón de Juego de Anillos', '', 'GEN, -2GB, MES', '23040-02938'),
(325, 1, 3, 'Pistón de Juego de Anillos', '', 'Todas, +2GB', '23040-02931'),
(327, 1, 3, 'Pistón de Juego de Anillos', '', 'Todas, +2GB', '23040-02932'),
(328, 1, 3, 'Pistón de Juego de Anillos', '', 'Todas, +2GB', '23040-02933'),
(334, 1, 3, 'Rodamiento Set C/ROD', '', 'Todas', '23060-02500'),
(335, 1, 3, 'Rodamiento Set C/ROD', '', 'Todas', '23060-02591'),
(336, 1, 3, 'Rodamiento Set C/ROD', '', 'Todas', '23060-02592'),
(337, 1, 3, 'Cigueñal', '', 'GEN', '23111-02720'),
(338, 1, 3, 'Cigueñal', '', 'GEN, MES', '23111-02721'),
(340, 1, 3, 'Cigueñal', '', 'ATA', '23112-02501'),
(341, 1, 3, 'Piñon Cigueñal', '', 'Todas', '23121-02511'),
(342, 1, 3, 'Polea Cigueñal', '', 'Todas', '23124-02510'),
(343, 1, 3, 'Arandela', '', 'Todas', '23126-02500'),
(344, 1, 3, 'Perno Cigueñal', '', 'GEN', '23127-02500'),
(345, 1, 3, 'Perno Cigueñal', '', 'GEN, MES', '23127-02501'),
(347, 1, 3, 'Polea Cigueñal A/C', '', 'Todas, +9AA', '23151-02502'),
(348, 1, 3, 'Conjunto de Volante', '', 'MTA', '23200-02521');

-- --------------------------------------------------------

--
-- Table structure for table `proveedor`
--

CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL,
  `pro_nombre` varchar(45) DEFAULT NULL,
  `pro_apellido` varchar(45) DEFAULT NULL,
  `pro_edad` int(11) DEFAULT NULL,
  `pro_genero` varchar(2) DEFAULT NULL,
  `pro_nacionalidad` varchar(45) DEFAULT NULL,
  `pro_dirreccion` varchar(150) DEFAULT NULL,
  `pro_img` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `registro_pieza_compra`
--

CREATE TABLE `registro_pieza_compra` (
  `id` int(11) NOT NULL,
  `pei_precio_compra` float DEFAULT NULL,
  `pie_precio_venta` float DEFAULT NULL,
  `pie_fecha_compra` datetime DEFAULT NULL,
  `pie_detalle` text DEFAULT NULL,
  `pie_img` text DEFAULT NULL,
  `compra_proveedor_id` int(11) NOT NULL,
  `piezas_vehiculo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reportes`
--

CREATE TABLE `reportes` (
  `id` int(11) NOT NULL,
  `repor_fecha` datetime NOT NULL,
  `detalle` text NOT NULL,
  `personal_ajepp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tienda_bodega`
--

CREATE TABLE `tienda_bodega` (
  `id` int(11) NOT NULL,
  `fecha_salida` datetime DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `detalle` text DEFAULT NULL,
  `fechar_retorno` datetime DEFAULT NULL,
  `detalles_pieza_tienda_id` int(11) NOT NULL,
  `detalles_pieza_bodega_id` int(11) NOT NULL,
  `personal_ajepp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_pago`
--

CREATE TABLE `tipo_pago` (
  `id` int(11) NOT NULL,
  `tipo_pago` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_vehiculo`
--

CREATE TABLE `tipo_vehiculo` (
  `id` int(11) NOT NULL,
  `tipo_vehiculo` varchar(60) NOT NULL,
  `clasificacion_vehiculo` varchar(60) NOT NULL,
  `vehiculo_img` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tipo_vehiculo`
--

INSERT INTO `tipo_vehiculo` (`id`, `tipo_vehiculo`, `clasificacion_vehiculo`, `vehiculo_img`) VALUES
(1, 'Terrestre', 'taxi', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehiculo_cliente`
--

CREATE TABLE `vehiculo_cliente` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `serie` varchar(150) NOT NULL,
  `veh_tipo` varchar(60) DEFAULT NULL,
  `veh_anio` year(4) DEFAULT NULL,
  `veh_modelo` varchar(60) DEFAULT NULL,
  `veh_marca` varchar(45) DEFAULT NULL,
  `veh_img` varchar(150) DEFAULT NULL,
  `detalle` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `iva` float DEFAULT NULL,
  `subtotal` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `fecha_venta` datetime DEFAULT NULL,
  `detalle` text DEFAULT NULL,
  `tipo_pago_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `personal_ajepp_id` int(11) NOT NULL,
  `descuento` float DEFAULT NULL,
  `items_venta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bodega_tienda`
--
ALTER TABLE `bodega_tienda`
  ADD PRIMARY KEY (`id`,`detalles_pieza_tienda_id`,`detalles_pieza_bodega_id`,`personal_ajepp_id`),
  ADD KEY `fk_bodega_tienda_detalles_pieza_tienda1_idx` (`detalles_pieza_tienda_id`),
  ADD KEY `fk_bodega_tienda_detalles_pieza_bodega1_idx` (`detalles_pieza_bodega_id`),
  ADD KEY `fk_bodega_tienda_personal_ajepp1_idx` (`personal_ajepp_id`);

--
-- Indexes for table `cargo_ajepp`
--
ALTER TABLE `cargo_ajepp`
  ADD PRIMARY KEY (`id`,`departamento_ajepp_id`),
  ADD KEY `fk_cargo_ajepp_departamento_ajepp1_idx` (`departamento_ajepp_id`);

--
-- Indexes for table `cargo_personal`
--
ALTER TABLE `cargo_personal`
  ADD PRIMARY KEY (`id`,`cargo_ajepp_id`,`personal_ajepp_id`),
  ADD KEY `fk_cargo_personal_cargo_ajepp1_idx` (`cargo_ajepp_id`),
  ADD KEY `fk_cargo_personal_personal_ajepp1_idx` (`personal_ajepp_id`);

--
-- Indexes for table `clasificacion_pieza`
--
ALTER TABLE `clasificacion_pieza`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identificacion_UNIQUE` (`identificacion`);

--
-- Indexes for table `compania`
--
ALTER TABLE `compania`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `compra_proveedor`
--
ALTER TABLE `compra_proveedor`
  ADD PRIMARY KEY (`id`,`personal_ajepp_id`,`proveedor_id`,`tipo_pago_id`),
  ADD KEY `fk_compra_proveedor_personal_ajepp1_idx` (`personal_ajepp_id`),
  ADD KEY `fk_compra_proveedor_proveedor1_idx` (`proveedor_id`),
  ADD KEY `fk_compra_proveedor_tipo_pago1_idx` (`tipo_pago_id`);

--
-- Indexes for table `contacto_proveedor`
--
ALTER TABLE `contacto_proveedor`
  ADD PRIMARY KEY (`id`,`proveedor_id`),
  ADD KEY `fk_contacto_proveedor_proveedor1_idx` (`proveedor_id`);

--
-- Indexes for table `datos_contacto_cliente`
--
ALTER TABLE `datos_contacto_cliente`
  ADD PRIMARY KEY (`id`,`cliente_id`),
  ADD KEY `fk_datos_contacto_cliente_cliente1_idx` (`cliente_id`);

--
-- Indexes for table `departamento_ajepp`
--
ALTER TABLE `departamento_ajepp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detalles_pieza_bodega`
--
ALTER TABLE `detalles_pieza_bodega`
  ADD PRIMARY KEY (`id`,`compra_proveedor_id`,`piezas_vehiculo_id`),
  ADD KEY `fk_detalles_pieza_bodega_compra_proveedor1_idx` (`compra_proveedor_id`),
  ADD KEY `fk_detalles_pieza_bodega_piezas_vehiculo1_idx` (`piezas_vehiculo_id`);

--
-- Indexes for table `detalles_pieza_tienda`
--
ALTER TABLE `detalles_pieza_tienda`
  ADD PRIMARY KEY (`id`,`piezas_vehiculo_id`),
  ADD UNIQUE KEY `pie_serie_UNIQUE` (`pie_serie`),
  ADD KEY `fk_detalles_pieza_tienda_piezas_vehiculo1_idx` (`piezas_vehiculo_id`);

--
-- Indexes for table `items_venta`
--
ALTER TABLE `items_venta`
  ADD PRIMARY KEY (`id`,`detalles_pieza_tienda_id`),
  ADD KEY `fk_items_venta_detalles_pieza_tienda1_idx` (`detalles_pieza_tienda_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`usuario`,`personal_ajepp_id`),
  ADD KEY `fk_Login_personal_ajepp1_idx` (`personal_ajepp_id`);

--
-- Indexes for table `marca_vehiculo`
--
ALTER TABLE `marca_vehiculo`
  ADD PRIMARY KEY (`id`,`tipo_vehiculo_id`),
  ADD KEY `fk_marca_vehiculo_tipo_vehiculo1_idx` (`tipo_vehiculo_id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modelo_vehiculo`
--
ALTER TABLE `modelo_vehiculo`
  ADD PRIMARY KEY (`id`,`marca_vehiculo_id`),
  ADD KEY `fk_modelo_vehiculo_marca_vehiculo1_idx` (`marca_vehiculo_id`);

--
-- Indexes for table `personal_ajepp`
--
ALTER TABLE `personal_ajepp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `per_identificacion_UNIQUE` (`per_identificacion`);

--
-- Indexes for table `personal_contacto`
--
ALTER TABLE `personal_contacto`
  ADD PRIMARY KEY (`id`,`personal_ajepp_id`),
  ADD UNIQUE KEY `Email_UNIQUE` (`per_email`),
  ADD KEY `fk_personal_contacto_personal_ajepp1_idx` (`personal_ajepp_id`);

--
-- Indexes for table `piezas_vehiculo`
--
ALTER TABLE `piezas_vehiculo`
  ADD PRIMARY KEY (`id`,`modelo_vehiculo_id`,`clasificacion_pieza_id`),
  ADD UNIQUE KEY `pie_numero_UNIQUE` (`pie_numero`),
  ADD KEY `fk_piezas_vehiculo_modelo_vehiculo1_idx` (`modelo_vehiculo_id`),
  ADD KEY `fk_piezas_vehiculo_clasificacion_pieza1_idx` (`clasificacion_pieza_id`);

--
-- Indexes for table `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registro_pieza_compra`
--
ALTER TABLE `registro_pieza_compra`
  ADD PRIMARY KEY (`id`,`compra_proveedor_id`,`piezas_vehiculo_id`),
  ADD KEY `fk_registro_pieza_compra_compra_proveedor1_idx` (`compra_proveedor_id`),
  ADD KEY `fk_registro_pieza_compra_piezas_vehiculo1_idx` (`piezas_vehiculo_id`);

--
-- Indexes for table `reportes`
--
ALTER TABLE `reportes`
  ADD PRIMARY KEY (`id`,`personal_ajepp_id`),
  ADD KEY `fk_reportes_personal_ajepp1_idx` (`personal_ajepp_id`);

--
-- Indexes for table `tienda_bodega`
--
ALTER TABLE `tienda_bodega`
  ADD PRIMARY KEY (`id`,`detalles_pieza_tienda_id`,`detalles_pieza_bodega_id`,`personal_ajepp_id`),
  ADD KEY `fk_tienda_bodega_detalles_pieza_tienda1_idx` (`detalles_pieza_tienda_id`),
  ADD KEY `fk_tienda_bodega_detalles_pieza_bodega1_idx` (`detalles_pieza_bodega_id`),
  ADD KEY `fk_tienda_bodega_personal_ajepp1_idx` (`personal_ajepp_id`);

--
-- Indexes for table `tipo_pago`
--
ALTER TABLE `tipo_pago`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipo_vehiculo`
--
ALTER TABLE `tipo_vehiculo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehiculo_cliente`
--
ALTER TABLE `vehiculo_cliente`
  ADD PRIMARY KEY (`id`,`cliente_id`),
  ADD UNIQUE KEY `serie_UNIQUE` (`serie`),
  ADD KEY `fk_vehiculo_cliente_cliente1_idx` (`cliente_id`);

--
-- Indexes for table `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`,`tipo_pago_id`,`cliente_id`,`personal_ajepp_id`,`items_venta_id`),
  ADD KEY `fk_ventas_tipo_pago1_idx` (`tipo_pago_id`),
  ADD KEY `fk_ventas_cliente1_idx` (`cliente_id`),
  ADD KEY `fk_ventas_personal_ajepp1_idx` (`personal_ajepp_id`),
  ADD KEY `fk_ventas_items_venta1_idx` (`items_venta_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bodega_tienda`
--
ALTER TABLE `bodega_tienda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cargo_ajepp`
--
ALTER TABLE `cargo_ajepp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cargo_personal`
--
ALTER TABLE `cargo_personal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clasificacion_pieza`
--
ALTER TABLE `clasificacion_pieza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `compra_proveedor`
--
ALTER TABLE `compra_proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacto_proveedor`
--
ALTER TABLE `contacto_proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `datos_contacto_cliente`
--
ALTER TABLE `datos_contacto_cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departamento_ajepp`
--
ALTER TABLE `departamento_ajepp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `detalles_pieza_bodega`
--
ALTER TABLE `detalles_pieza_bodega`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detalles_pieza_tienda`
--
ALTER TABLE `detalles_pieza_tienda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marca_vehiculo`
--
ALTER TABLE `marca_vehiculo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `modelo_vehiculo`
--
ALTER TABLE `modelo_vehiculo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_ajepp`
--
ALTER TABLE `personal_ajepp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_contacto`
--
ALTER TABLE `personal_contacto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `piezas_vehiculo`
--
ALTER TABLE `piezas_vehiculo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=349;

--
-- AUTO_INCREMENT for table `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `registro_pieza_compra`
--
ALTER TABLE `registro_pieza_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reportes`
--
ALTER TABLE `reportes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tienda_bodega`
--
ALTER TABLE `tienda_bodega`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipo_pago`
--
ALTER TABLE `tipo_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipo_vehiculo`
--
ALTER TABLE `tipo_vehiculo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vehiculo_cliente`
--
ALTER TABLE `vehiculo_cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bodega_tienda`
--
ALTER TABLE `bodega_tienda`
  ADD CONSTRAINT `fk_bodega_tienda_detalles_pieza_bodega1` FOREIGN KEY (`detalles_pieza_bodega_id`) REFERENCES `detalles_pieza_bodega` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bodega_tienda_detalles_pieza_tienda1` FOREIGN KEY (`detalles_pieza_tienda_id`) REFERENCES `detalles_pieza_tienda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bodega_tienda_personal_ajepp1` FOREIGN KEY (`personal_ajepp_id`) REFERENCES `personal_ajepp` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cargo_ajepp`
--
ALTER TABLE `cargo_ajepp`
  ADD CONSTRAINT `fk_cargo_ajepp_departamento_ajepp1` FOREIGN KEY (`departamento_ajepp_id`) REFERENCES `departamento_ajepp` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cargo_personal`
--
ALTER TABLE `cargo_personal`
  ADD CONSTRAINT `fk_cargo_personal_cargo_ajepp1` FOREIGN KEY (`cargo_ajepp_id`) REFERENCES `cargo_ajepp` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cargo_personal_personal_ajepp1` FOREIGN KEY (`personal_ajepp_id`) REFERENCES `personal_ajepp` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `compra_proveedor`
--
ALTER TABLE `compra_proveedor`
  ADD CONSTRAINT `fk_compra_proveedor_personal_ajepp1` FOREIGN KEY (`personal_ajepp_id`) REFERENCES `personal_ajepp` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_compra_proveedor_proveedor1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_compra_proveedor_tipo_pago1` FOREIGN KEY (`tipo_pago_id`) REFERENCES `tipo_pago` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `contacto_proveedor`
--
ALTER TABLE `contacto_proveedor`
  ADD CONSTRAINT `fk_contacto_proveedor_proveedor1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `datos_contacto_cliente`
--
ALTER TABLE `datos_contacto_cliente`
  ADD CONSTRAINT `fk_datos_contacto_cliente_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `detalles_pieza_bodega`
--
ALTER TABLE `detalles_pieza_bodega`
  ADD CONSTRAINT `fk_detalles_pieza_bodega_compra_proveedor1` FOREIGN KEY (`compra_proveedor_id`) REFERENCES `compra_proveedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalles_pieza_bodega_piezas_vehiculo1` FOREIGN KEY (`piezas_vehiculo_id`) REFERENCES `piezas_vehiculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `detalles_pieza_tienda`
--
ALTER TABLE `detalles_pieza_tienda`
  ADD CONSTRAINT `fk_detalles_pieza_tienda_piezas_vehiculo1` FOREIGN KEY (`piezas_vehiculo_id`) REFERENCES `piezas_vehiculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `items_venta`
--
ALTER TABLE `items_venta`
  ADD CONSTRAINT `fk_items_venta_detalles_pieza_tienda1` FOREIGN KEY (`detalles_pieza_tienda_id`) REFERENCES `detalles_pieza_tienda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `fk_Login_personal_ajepp1` FOREIGN KEY (`personal_ajepp_id`) REFERENCES `personal_ajepp` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `marca_vehiculo`
--
ALTER TABLE `marca_vehiculo`
  ADD CONSTRAINT `fk_marca_vehiculo_tipo_vehiculo1` FOREIGN KEY (`tipo_vehiculo_id`) REFERENCES `tipo_vehiculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `modelo_vehiculo`
--
ALTER TABLE `modelo_vehiculo`
  ADD CONSTRAINT `fk_modelo_vehiculo_marca_vehiculo1` FOREIGN KEY (`marca_vehiculo_id`) REFERENCES `marca_vehiculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `personal_contacto`
--
ALTER TABLE `personal_contacto`
  ADD CONSTRAINT `fk_personal_contacto_personal_ajepp1` FOREIGN KEY (`personal_ajepp_id`) REFERENCES `personal_ajepp` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `piezas_vehiculo`
--
ALTER TABLE `piezas_vehiculo`
  ADD CONSTRAINT `fk_piezas_vehiculo_clasificacion_pieza1` FOREIGN KEY (`clasificacion_pieza_id`) REFERENCES `clasificacion_pieza` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_piezas_vehiculo_modelo_vehiculo1` FOREIGN KEY (`modelo_vehiculo_id`) REFERENCES `modelo_vehiculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `registro_pieza_compra`
--
ALTER TABLE `registro_pieza_compra`
  ADD CONSTRAINT `fk_registro_pieza_compra_compra_proveedor1` FOREIGN KEY (`compra_proveedor_id`) REFERENCES `compra_proveedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_registro_pieza_compra_piezas_vehiculo1` FOREIGN KEY (`piezas_vehiculo_id`) REFERENCES `piezas_vehiculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reportes`
--
ALTER TABLE `reportes`
  ADD CONSTRAINT `fk_reportes_personal_ajepp1` FOREIGN KEY (`personal_ajepp_id`) REFERENCES `personal_ajepp` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tienda_bodega`
--
ALTER TABLE `tienda_bodega`
  ADD CONSTRAINT `fk_tienda_bodega_detalles_pieza_bodega1` FOREIGN KEY (`detalles_pieza_bodega_id`) REFERENCES `detalles_pieza_bodega` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tienda_bodega_detalles_pieza_tienda1` FOREIGN KEY (`detalles_pieza_tienda_id`) REFERENCES `detalles_pieza_tienda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tienda_bodega_personal_ajepp1` FOREIGN KEY (`personal_ajepp_id`) REFERENCES `personal_ajepp` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `vehiculo_cliente`
--
ALTER TABLE `vehiculo_cliente`
  ADD CONSTRAINT `fk_vehiculo_cliente_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_ventas_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ventas_items_venta1` FOREIGN KEY (`items_venta_id`) REFERENCES `items_venta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ventas_personal_ajepp1` FOREIGN KEY (`personal_ajepp_id`) REFERENCES `personal_ajepp` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ventas_tipo_pago1` FOREIGN KEY (`tipo_pago_id`) REFERENCES `tipo_pago` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
