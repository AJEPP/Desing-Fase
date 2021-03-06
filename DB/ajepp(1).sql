-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 01, 2020 at 03:47 AM
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
  `fecha_ingreso` datetime DEFAULT NULL,
  `detalles_pieza_tienda_id` int(11) NOT NULL,
  `detalles_pieza_bodega_id` int(11) NOT NULL,
  `personal_ajepp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bodega_tienda`
--

INSERT INTO `bodega_tienda` (`id`, `fecha_salida`, `cantidad`, `detalle`, `fecha_ingreso`, `detalles_pieza_tienda_id`, `detalles_pieza_bodega_id`, `personal_ajepp_id`) VALUES
(5, '2020-06-30 03:33:49', 10, 'test', '2020-06-30 03:33:49', 24, 24, 2);

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
(1, 1, 'Super Admin', 10000),
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

--
-- Dumping data for table `cargo_personal`
--

INSERT INTO `cargo_personal` (`id`, `fecha_inicio`, `per_salario`, `cargo_ajepp_id`, `personal_ajepp_id`) VALUES
(1, NULL, NULL, 1, 2);

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
(3, NULL, 'Motor'),
(4, NULL, 'Sistema de Refrigeración'),
(5, NULL, 'Admición y Escape'),
(6, NULL, 'Gasolina'),
(7, NULL, 'Motor Electrico'),
(8, NULL, 'Embrague'),
(9, NULL, 'Eje de transmición'),
(10, NULL, 'Eje y Rueda'),
(11, NULL, 'Suspención'),
(12, NULL, 'De Dirección'),
(13, NULL, 'Freno'),
(14, NULL, 'Cuerpo'),
(15, NULL, 'Puerta'),
(16, NULL, 'Interial'),
(17, NULL, 'Execrical'),
(18, NULL, 'Seta'),
(19, NULL, 'Chasis Electrico'),
(20, NULL, 'Calentador y A/C'),
(21, NULL, 'Calentador y A/C'),
(22, NULL, 'Cuerpo - Panel de Techo'),
(23, NULL, 'Cuerpo - Panel de Piso'),
(24, NULL, 'Cuerpo - Panel Puerta Trasera');

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

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`id`, `identificacion`, `cli_nombres`, `cli_apellidos`, `cli_edad`, `cli_genero`, `cli_domicilio`, `cli_dirreccion`) VALUES
(5, '601-262662-6131H', 'Juan', 'Pérez', 39, 'ms', 'Bluefields', 'Barrio San Mateo sector 4 frente a la familia Rojas'),
(6, '602-150494-000s', 'aurel', 'cuthbert', 25, 'fm', 'fatima', 'fatima'),
(7, '602-150494-000B', 'Mario', 'Moreno', 30, 'ms', 'Bluefields', 'Fatima');

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
-- Table structure for table `datos_vehiculos`
--

CREATE TABLE `datos_vehiculos` (
  `id` int(11) DEFAULT NULL,
  `num_motor` varchar(50) NOT NULL,
  `chasis` varchar(50) NOT NULL,
  `anio` year(4) NOT NULL,
  `marca` varchar(100) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `cuerpo` varchar(100) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `modelo_vehiculo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `datos_vehiculos`
--

INSERT INTO `datos_vehiculos` (`id`, `num_motor`, `chasis`, `anio`, `marca`, `modelo`, `cuerpo`, `tipo`, `modelo_vehiculo_id`) VALUES
(NULL, 'G4HC', 'MALAB51GP8M072810', 2005, 'Hyundai', 'Atoz Prime', 'Sedan', 'Automovil', 14);

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
(1, 'cauca', 'hola'),
(2, 'Administración', ''),
(4, 'Caja', 'Admin');

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
  `num_modelo_pieza` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detalles_pieza_bodega`
--

INSERT INTO `detalles_pieza_bodega` (`id`, `pie_serie`, `pie_precio_venta`, `pie_precio_compra`, `pie_fecha_ingreso`, `pie_detalle`, `pie_cantidad`, `bod_t_img`, `num_modelo_pieza`) VALUES
(24, '11111', 10, 40, '2020-06-30 02:43:27', 'test', 10, NULL, '05203-02000');

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
  `num_modelo_pieza` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detalles_pieza_tienda`
--

INSERT INTO `detalles_pieza_tienda` (`id`, `pie_serie`, `pie_precio`, `pie_detalles`, `pie_cantidad`, `pie_t_img`, `num_modelo_pieza`) VALUES
(24, '11111', 10, 'test', 10, NULL, '05203-02000');

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
(1, 'HYUNDAI', NULL, 1),
(2, 'TOYOTA', '', 1),
(3, 'KIA', NULL, 2);

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
(2, '{\"text\":\"Personal\", \"icon\": \"users\", \"link\":\"#\", \"show\": [1,2], \"child\": [\r\n    {\"text\":\"Departamentos\", \"icon\": \"user-friends\", \"link\":\"departamento\", \"show\": [1,2], \"child\": []},\r\n    {\"text\":\"Cargo\", \"icon\": \"user-tie\", \"link\":\"cargo\", \"show\": [1,2], \"child\": []},\r\n    {\"text\":\"Usuarios\", \"icon\": \"users\", \"link\":\"usuarios\", \"show\": [1,2], \"child\": []}\r\n]}', 2, 'on'),
(3, '{\"text\":\"Tienda\", \"icon\": \"store\", \"link\":\"#\", \"show\": [1,2,3], \"child\": [\r\n    {\"text\":\"Marca Vehiculo\", \"icon\": \"bullhorn\", \"link\":\"marca\", \"show\": [1,2,3], \"child\": []},\r\n    {\"text\":\"Tipo Vehiculo\", \"icon\": \"truck\", \"link\":\"tipoVehiculo\", \"show\": [1,2,3], \"child\": []},\r\n    {\"text\":\"Modelo Vehiculo\", \"icon\": \"car\", \"link\":\"modeloVehiculo\", \"show\": [1,2,3], \"child\": []},\r\n    {\"text\":\"Piezas Vehiculo\", \"icon\": \"puzzle-piece\", \"link\":\"piezasVehiculo\", \"show\": [1,2,3], \"child\": []}\r\n]}', 3, 'on'),
(4, '{\"text\":\"Ventas\", \"icon\": \"fas fa-shopping-cart\", \"link\":\"pos\", \"child\": [], \"show\": [1,2,3]}', 4, 'on'),
(5, '{\"text\":\"Inventario\", \"icon\": \"archive\", \"link\":\"#\", \"show\": [1,2,3], \"child\": [\r\n    {\"text\":\"Compras\", \"icon\": \"bullhorn\", \"link\":\"compras\", \"show\": [1,2,3], \"child\": []},\r\n    {\"text\":\"Entradas\", \"icon\": \"parachute-box\", \"link\":\"entradas\", \"show\": [1,2,3], \"child\": []},\r\n    {\"text\":\"Salidas\", \"icon\": \"people-carry\", \"link\":\"salidas\", \"show\": [1,2,3], \"child\": []},\r\n    {\"text\":\"Proveedores\", \"icon\": \"user-tie\", \"link\":\"proveedores\", \"show\": [1,2,3], \"child\": []}\r\n]}', 5, 'on');

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
  `procedencia` varchar(100) DEFAULT NULL,
  `mob_chasis_tipo` varchar(200) NOT NULL,
  `mob_motor_cod` varchar(50) DEFAULT NULL,
  `mob_motor_tam` varchar(50) DEFAULT NULL,
  `mod_anio_termina` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `modelo_vehiculo`
--

INSERT INTO `modelo_vehiculo` (`id`, `marca_vehiculo_id`, `mod_vehiculo`, `mod_anio`, `mod_img`, `procedencia`, `mob_chasis_tipo`, `mob_motor_cod`, `mob_motor_tam`, `mod_anio_termina`) VALUES
(1, 1, 'Elentra III', 2001, NULL, 'Corea del Sur', 'Sedan', '', '1.8 (132 Hp) ', 2007),
(2, 2, 'K3000S', 2000, NULL, 'Corea del Sur', '', '', NULL, NULL),
(3, 1, 'Atos 01', 2001, NULL, 'Corea del Sur', 'Hatchback ', 'G4HCE', '1000 CC AT', 2003),
(4, 1, 'Atos ', 2003, NULL, 'Corea del Sur', 'Hatchback ', 'G4HD', 'Prime 1.1  AT (59 Hp)', 2011),
(5, 1, 'Atos 01', 2001, NULL, 'Corea del Sur', 'Hatchback  ', 'G4HCE', '1000 CC MT ', 2003),
(6, 1, 'Atos 98', 1997, NULL, 'Corea del Sur', 'Hatchback  ', 'G4HC', '1000 CC AT', 2002),
(7, 1, 'Atos 98', 1997, NULL, ' \r\nCorea del Sur', 'Hatchback ', 'G4HC', '1000 CC MT', 2002),
(8, 1, 'Atos', 2001, NULL, 'Corea del Sur', 'Hatchback', NULL, 'Prime 1.0  AT (58 Hp)', 2011),
(9, 1, 'Atos', 2003, NULL, 'Corea del Sur', 'Hatchback', 'G4HD', 'Prime 1.1  MT (59 Hp) ', 2011),
(10, 1, 'Atos', 2001, NULL, 'Corea del Sur', 'Hatchback', NULL, 'Prime 1.0  MT (58 Hp)', 2011),
(11, 1, 'Atoz Prime 99', 1999, NULL, 'Corea del Sur', 'Hatchback', NULL, '1000 CC', 2000),
(12, 1, 'Atoz Prime 01', 2001, NULL, 'Corea del Sur', 'Sedan 5PTS', NULL, '1000 CC', 2003),
(13, 1, 'Atoz Prime 06', 2005, NULL, 'Corea del Sur', 'Sedan 5PTS', NULL, '1000 CC ', 2007),
(14, 1, 'Atoz Prime 06', 2005, NULL, 'Corea del Sur', 'Sedan 5PTS', NULL, '1100 CC', 2007),
(15, 1, 'Atoz Prime 07', 2007, NULL, 'Corea del Sur', 'Sedan 5PTS', NULL, '1000 CC', 2011),
(16, 1, 'Atoz Prime 07', 2007, NULL, 'Corea del Sur', 'Sedan 5PTS', NULL, '1100 CC', 2011),
(17, 1, 'Accent 06', 2005, NULL, 'Corea del Sur', 'Sedan 4PTS', NULL, '1400 CC', 2006),
(18, 1, 'Accent 06', 2005, NULL, 'Corea del Sur', 'Sedan 4PTS', NULL, '1600 CC', 2006),
(19, 1, 'Accent 06', 2006, NULL, 'Corea del sur', 'Sedan 4PTS', NULL, '1400 CC', 2010),
(20, 1, 'Accent 06', 2006, NULL, 'Corea del Sur', 'Sedan 4PTS', NULL, '1500 CC', 2010),
(21, 1, 'Accent 06', 2006, NULL, 'Coreal del Sur', 'Sedan 4PTS', NULL, '1600 CC', 2010),
(22, 1, 'Accent 15', 2014, NULL, 'Corea del Sur', 'Sedan 4-5PTS', NULL, '1600 CC', 2018),
(23, 1, 'Accent 15', 2014, NULL, 'Corea del Sur', 'Sedan 4-5PTS', NULL, '1400 CC', 2018),
(24, 1, 'Accent/Solaris 14', 2015, NULL, 'Corea del Sur', 'Sedan 4-5PTS', NULL, '1400 CC', 2016),
(25, 1, 'Eletran 96', 1995, NULL, 'Corea del Sur', 'Sedan 4-5PTS Wagon', NULL, '1500 CC', 2000),
(26, 1, 'Elentra 96', 1995, NULL, 'Corea del Sur', 'Sedan 4-5PTS Wagon', NULL, '1600 CC', 2000),
(27, 1, 'Coreal de Sur', 1995, NULL, 'Corea del Sur', 'Sedan 4-5PTS Wagon', NULL, '1900 CC', 2000),
(28, 1, 'Elentra 96', 1995, NULL, 'Corea del Sur', 'Sedan 4-5PTS Wagon', NULL, '2000 CC', 2000),
(29, 1, 'Elentra 96', 1995, NULL, 'Corea del Sur', 'Sedan 4-5PTS Wagon', NULL, '1800 CC', 2000),
(30, 1, 'Elentra 00', 2000, NULL, 'Corea del Sur', 'Sedan 4-5PTS', NULL, '1600 CC', 2006),
(31, 1, 'Elentra 00', 2000, NULL, 'Corea del Sur', 'Sedan 4-5PTS Wagon', NULL, '1800 CC', 2006),
(32, 1, 'Elentra 00', 2000, NULL, 'Corea del Sur', 'Sedan 4-5PTS Wagon', NULL, '2000 CC', 2006),
(33, 1, 'Elentra 06', 2006, NULL, 'Corea del Sur', '\r\nSedan 4PTS', NULL, '1600 CC', 2011),
(34, 1, 'Elentra 06', 2006, NULL, 'Corea del Sur', 'Sedan 4PTS', NULL, '1600 CC - Gamma', 2011),
(35, 1, 'Elentra 06', 2006, NULL, 'Corea del Sur', 'Sedan 4PTS', NULL, '2000 CC', 2011),
(36, 1, 'Elentra 11', 2011, NULL, 'Corea del Sur', 'Sedan 4PTS', NULL, '1800 CC', 2013),
(37, 1, 'Elentra 11', 2011, NULL, 'Corea del Sur', 'Sedan 4PTS', NULL, '2000 CC', 2013),
(38, 1, 'Elentra 14', 2013, NULL, 'Corea del Sur', 'Sedan 4PTS', NULL, '1800 CC', 2015),
(39, 1, 'Elentra 14', 2013, NULL, 'Corea del Sur', 'Sedan 4PTS', NULL, '2000 CC', 2015),
(40, 1, 'Elentra 16', 2015, NULL, 'Corea del Sur', 'Sedan 4PTS', NULL, '2000 CC', 2018),
(41, 1, 'Elentra 16', 2015, NULL, 'Corea del Sur', 'Sedan 4PTS', NULL, '1600 CC', 2018),
(42, 3, 'Picanto 04', 2004, NULL, 'Corea del Sur', 'Sedan 5PTS', NULL, '1100 CC', 2006),
(43, 3, 'Picanto 04', 2006, NULL, 'Corea del Sur', 'Sedan 5PTS', NULL, '1000 CC', 2007),
(44, 3, 'Picanto 04', 2006, NULL, 'Corea del Sur', 'Sedan 5PTS', NULL, '1100 CC', 2007),
(45, 3, 'Picanto 08', 2007, NULL, 'Corea del Sur', 'Sedan 5PTS', NULL, '1000 CC', 2011),
(46, 3, 'Picanto 08', 2007, NULL, 'Corea del Sur', 'Sedan 5PTS', NULL, '1100 CC', 2011),
(47, 3, 'Morning/Picanto', 2011, NULL, 'Corea del Sur', 'Sedan 5PTS', NULL, '1000 CC', 2015),
(48, 3, 'Morning/Picanto', 2011, NULL, 'Corea del Sur', 'Sedan 5PTS', NULL, '1200 CC', 2015),
(49, 3, 'Morning/Picanto', 2015, NULL, 'Corea del Sur', 'Sedan 5PTS', NULL, '1000 CC', 2017),
(50, 1, 'Morning/Picanto', 2015, NULL, 'Corea del Sur', 'Sedan 5PTS', NULL, '1200 CC', 2017),
(51, 3, 'Picanto 17', 2017, NULL, 'Corea del Sur', 'Sedan 5PTS', NULL, '1000 CC', 2018),
(52, 3, 'Picanto 17', 2017, NULL, 'Corea del Sur', 'Sedan 5PTS', NULL, '1200 CC', 2018),
(56, 3, 'Rio 00', 2000, NULL, 'Corea del Sur', 'Sedan 4PTS', NULL, '1300 CC', 2005),
(57, 3, 'Rio 00', 2000, NULL, 'Corea del Sur', 'Sedan 4PTS', NULL, '1500 CC', 2005),
(58, 3, 'Rio 05', 2005, NULL, 'Corea del Sur', 'Sedan 4PTS', NULL, '1400 CC', 2006),
(59, 3, 'Rio 05', 2005, NULL, 'Corea del Sur', 'Sedan 4PTS', NULL, '1600 CC', 2006);

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
(348, 1, 3, 'Conjunto de Volante', '', 'MTA', '23200-02521'),
(350, 2, 3, 'Motor Completo', NULL, 'Capacidad del Motor 3000 CC', '0K43A02000'),
(351, 2, 3, 'Cojunto Motor - Corto , 97MY', NULL, 'Capacidad del Motor 3000 CC', '0K75A02200'),
(352, 2, 3, 'Kit de Juntas - Revisión del Motor, 97MY', NULL, 'Capacidad del Motor 3000 CC', '0K75A10270A'),
(353, 2, 3, 'Kit de Juntas - Revisión del Motor', NULL, 'Capacidad del Motor 3000 CC', '0K75A10270B'),
(354, 2, 5, 'Conjunto Aislador - Escape', NULL, '', '0K65A13390D'),
(355, 2, 5, 'Arandela - Liso', NULL, '', '0071011513'),
(356, 2, 5, 'Conjunto del Colector - Escape', NULL, 'Código de Opción(2835), Emisión CE 1996', '0K65A13450D'),
(357, 2, 5, 'Conjunto del Colector - Escape', NULL, 'Código de Opción(283B), Emisión (DOM 2000)', '0K78C13450'),
(358, 2, 5, 'Junta - Colector de Escape', NULL, '', '0K65A13461B'),
(359, 2, 5, 'Tuerca - Escape', NULL, '', '0K71013461'),
(360, 2, 5, 'Tornillo - Maquina, W / PM, W / PDL', NULL, '', 'K997860612B'),
(361, 2, 5, 'Stud - Colector de Escape', NULL, '', '0K65A13456'),
(362, 2, 4, 'Caucho - Montaje, GSL', NULL, '', '0K42113363'),
(363, 2, 4, 'Conjunto de Bomba - Refrijerante, Uso selectivo', NULL, '', '0K65B15100A'),
(364, 2, 4, 'Junta - Bomba de Agua', NULL, '', '0K65A15116A'),
(365, 2, 4, 'Polea - Bomba de Agua', NULL, '', '0K65A15131'),
(366, 2, 4, 'Conjunto de Ventilador - Refrigeracón', NULL, '', '0K43A15140'),
(367, 2, 4, 'Conjunto de Termostado, KONG HWA', NULL, '', '0K75615171C'),
(368, 2, 4, 'Cubierta - Termostado', NULL, '', '0K65A15172C'),
(369, 2, 4, 'Junta - Termostado', NULL, '', '0K65A15173A'),
(370, 2, 4, 'Manguera - Agua, Inferior', NULL, '', '0K43A15185B'),
(371, 2, 4, 'Manguera - Agua, Superior', NULL, '', '0K43A15186A'),
(372, 2, 4, 'Conjunto Radiador', NULL, '', '0K43A15200B'),
(373, 2, 4, 'Polla - Drenaje de Agua, 5M2W', NULL, '', '0K20615203'),
(374, 2, 4, 'Anillo O, 5M2W', NULL, '', '0K20615204'),
(375, 2, 4, 'Cap Conjunto - Radiador, GSL', NULL, '', '0K20215205'),
(376, 2, 4, 'Cubierta - Radiador', NULL, '', '0K43A15210'),
(377, 2, 4, 'Conjunto de Placa - Caucho, RH', NULL, '', '0K43A15281'),
(378, 2, 4, 'Sello - Placa, LH', NULL, '', '0K43A15282'),
(379, 2, 4, 'Soporte SUB ASSY-RAD, LH', NULL, '', '0K43A15330'),
(380, 2, 4, 'Soporte - Montaje del Radiador, Inferior', NULL, '', '0K43A15440A'),
(381, 2, 4, 'TANK ASSY-RESERVOIR', NULL, '', '0K60A15250C'),
(382, 2, 4, 'Manguera - Tanque de Reserva de Agua', NULL, '', '0K43A15270A'),
(383, 2, 4, 'Ventilador - Enfriamiento', NULL, '', '252614Z100'),
(403, 7, 6, 'Conjunto de tapa - Llenado de combustible, Cuello de llenado de combustible', NULL, 'Coche especial: [G] GENERAL [+] Códigos opcionales: [+A08] + (TAIWÁN)', '3101024000'),
(404, 7, 6, 'Soporte - Soporte de montaje de cuello de llenado', NULL, 'Códigos opcionales: [+2WD] PAQUETE DE COMBUSTIBLE (SIN PLOMO)', '3103402000'),
(405, 7, 6, 'Etiqueta - Puerta de llenado de combustible', NULL, 'Códigos opcionales: [+2WD] PAQUETE DE COMBUSTIBLE (SIN PLOMO)', '3103834500'),
(406, 7, 6, 'Conjunto de Cuello - Tubo conjunto de llenado de combustible', NULL, 'Códigos opcionales: [+2WD] PAQUETE DE COMBUSTIBLE (SIN PLOMO)', '3104002000'),
(407, 7, 6, 'Embalaje - Empaque de combustible cuello tanque de combustible junta', NULL, 'Códigos opcionales: [+2GB] PAQUETE DE COMBUSTIBLE (SIN PLOMO)', '3104824000'),
(408, 7, 6, 'Conjunto de cubierta - Bomba de combustible cubierta A / S', NULL, 'Coche especial: [G] GENERAL', '3110602000'),
(409, 7, 6, 'Completo - Bomba de combustible conjunto', NULL, 'Coche especial: [G] GENERAL Códigos opcionales: [+ A08] + (TAIWÁN)', '3111002500'),
(410, 7, 6, 'Conjunto de taza - Tanque de taza de reserva', NULL, 'Coche especial: [G] GENERAL Códigos opcionales: [+ A08] + (TAIWÁN)', '3111402000'),
(411, 7, 6, 'Placa - Bomba de combustible, Superior', NULL, 'Coche especial: [G] GENERAL', '3111602000'),
(412, 7, 6, 'Aislador - Bomba de combustible, Aislador', NULL, 'Coche especial: [G] GENERAL', '3111702000'),
(413, 7, 6, 'Conjunto de bomba de combustible y Soporte', NULL, 'Coche especial: [G] GENERAL', '3111902000'),
(414, 7, 6, 'Conjunto de tanque - Tanque de combustible', NULL, 'Coche especial: [G] GENERAL, Códigos opcionales: [+ A08] + (TAIWÁN) ', '3115002000'),
(423, 7, 3, 'Conjunto del motor', NULL, 'Códigos opcionales: [+ 2GB] PAQUETE DE COMBUSTIBLE (SIN PLOMO)', '2110102B00'),
(424, 7, 3, 'Juego de pares de rodamientos - Cigueñal, STD', NULL, '', '2102002540'),
(425, 7, 3, 'Cigueñal', NULL, 'Combustible: [D] TRANSMISOR MANUAL Coche especial: [M] ORIENTE MEDIO', '2311102721'),
(426, 7, 3, 'Piñon - Correa de distrubución de la polea del arbol de levas', NULL, 'Combustible: [D] TRANSMISOR MANUAL', '2312102511'),
(427, 7, 3, 'Polea - Amortiguador del cigueñal', NULL, 'Combustible: [D] TRANSMISOR MANUAL', '2312402511'),
(428, 7, 3, 'Conjunto de polea - Palanca del cigueñal', NULL, 'Combustible: [D] TRANSMISOR MANUAL [+]Codigós opcionales: [+9aa] Aire acondicionado', '2313002550'),
(429, 7, 3, 'Conjunto piston Y PIN, STD  - Conjunto de piston del motor, STD', NULL, 'Códigos opcionales: [+ 2GB] PAQUETE DE COMBUSTIBLE (SIN PLOMO)', '2341002710'),
(430, 7, 3, 'Conjunto de Bloques - Cilindro conjunto de bloques', NULL, '', '2110002700'),
(433, 6, 22, 'Panel -  Piso delantero', NULL, 'Combustible: [A] TRANSMISIÓN AUTOMÁTICA', '6511102350'),
(434, 6, 22, 'Conjunto de refuerzo - Piso delantero trasero ', NULL, '', '6514102300'),
(435, 10, 3, 'Conjunto de bandeja - Batería Paleta', NULL, 'Códigos opcionales: [371E] Batería - 40AH (MF)', '3715002300'),
(436, 10, 3, 'Batería Humedad Original 35 AH, Local: [GB] Reino Unido; [IE] Irlanda', NULL, 'Códigos opcionales: [371E] Batería - 40AH (MF)', '3711002100'),
(437, 10, 3, 'Soporte - Montaje de la batería', NULL, 'Códigos opcionales: [371E] Batería - 40AH (MF)', '3716022000'),
(438, 10, 3, 'Conjunto de cables - Cable de batería', NULL, 'Transmisión: [B] 5 SPEED MT 2WD', '3721002003'),
(439, 10, 3, 'Soporte - Montaje de cable de batería', NULL, 'Transmisión: [B] 4 VELOCIDAD EN 2WD', '3716022000'),
(440, 10, 3, 'PAD - Pedal del acelerador (GAS)', NULL, 'Tipo de control: [R] - CONDUCCIÓN A LA DERECHA', '3272102910'),
(441, 10, 3, 'Conjunto del brazo - Palanca del Acelerador', NULL, 'Tipo de control: [R] - CONDUCCIÓN A LA DERECHA', '3272002910'),
(442, 10, 3, 'Resorte - Retorno resorte', NULL, 'Tipo de control: [R] - CONDUCCIÓN A LA DERECHA', '3272502900'),
(443, 10, 3, 'Conjunto de pedales - Pedal de embrage', NULL, 'Tipo de control: [R] - CONDUCCIÓN A LA DERECHA, Transmisión: [5] 5 SPEED MT 2WD', '3283502900'),
(444, 10, 3, 'Pedal - Pedal de Freno', NULL, 'Tipo de control: [L] - MANILLAR A LA IZQUIERDA, Transmisión: [B] 4 VELOCIDAD EN 2WD', '3281002710'),
(445, 10, 3, 'Pedal - Pedal de Freno', NULL, 'Tipo de control: [L] - MANILLAR A LA IZQUIERDA, Transmisión: [5] 5 SPEED MT 2WD', '3281002110'),
(446, 10, 3, 'Conjunto de Miembros - Embrague ', NULL, 'Tipo de control: [R] - CONDUCCIÓN A LA DERECHA, Transmisión: [5] 5 SPEED MT 2WD', '3283602900'),
(447, 10, 14, 'Panel - Guardabarros, Panel Izquierdo', NULL, 'Códigos opcionales: [9231] LATERAL DE REPETIDOR [6501] GRADO ALTO', '6631102260'),
(448, 10, 14, 'Panel - Guardabarros, Panel Derecho', NULL, 'Códigos opcionales: [9231] LATERAL DE REPETIDOR [6501] GRADO ALTO', '6632102260'),
(449, 10, 14, 'Conjunto de paneles - Panel con capucha', NULL, 'Códigos opcionales: [6501] GRADO ALTO', '6640006010'),
(450, 10, 14, 'Conjunto de bisagra - Capucha, Gancho LH LOOP', NULL, '', '7911002000'),
(451, 10, 14, 'Conjunto de bisagra - Capucha, Gancho RH, OL', NULL, '', '7912002000'),
(452, 10, 14, 'Conjunto de moldeo - Moldedura de extremo de la capa', NULL, 'Cuerpo: [A] 5 DR SEDAN Clase: [G] GRADO ALTO [+] Códigos opcionales: [863C] CR COAT', '8621106000'),
(453, 10, 15, 'Conjunto de paneles - Puerta delantera, LH', NULL, 'Códigos opcionales: [6501] GRADO ALTO', '7600306010'),
(454, 10, 15, 'Conjunto de paneles - Puerta delantera, Derecha', NULL, 'Códigos opcionales: [6501] GRADO ALTO', '7600406010'),
(455, 10, 15, 'Panel - Puerta delantera exterior, LH', NULL, 'Códigos opcionales: [6501] GRADO ALTO', '7611102010'),
(456, 10, 15, 'Panel - Puerta delantera exterior, Derecha', NULL, 'Códigos opcionales: [6501] GRADO ALTO', '7612102010'),
(457, 10, 15, 'Conjunto de bisagra - Puerta delantera, LH', NULL, '', '7931002000'),
(458, 10, 15, 'Conjunto de bisagra - Puerta delantera, Derecha', NULL, '', '7932002000'),
(459, 10, 15, 'Perno M6', NULL, '', '7935921000'),
(460, 10, 21, 'Conjunto Ferroviario - Trasero cruzado trasero', NULL, '', '6713006000'),
(461, 10, 21, 'Panel - Azotea del panel', NULL, '', '6711106000'),
(462, 10, 21, 'Ferrocarril - Centro de techo, Centro de viga transversal del techo', NULL, '', '6712106000'),
(463, 10, 21, 'Centro Ferroviarrio - Techo delantero Crossbar', NULL, '', '6731006000'),
(464, 10, 22, 'Panel - Piso delantero', NULL, 'Transmisión: [5] 5 SPEED MT 2WD [+] Códigos opcionales: [6501] GRADO ALTO', '6511102300'),
(465, 10, 22, 'Conjunto de refuerzo - Piso delantero o trasero', NULL, 'Códigos opcionales: [6501] Grado Alto', '6514102301'),
(466, 10, 22, 'Refuerzo - Montaje de ESPS', NULL, '', '6514502000'),
(467, 10, 22, 'Conjunto cruzado - Cruz cruzada del asiento delantero antes de LED', NULL, 'Transmisión: [5] 5 SPEED MT 2WD [+] Códigos opcionales: [6501] GRADO ALTO', '6516102300'),
(468, 10, 22, 'Conjunto de paneles - Almohadilla lateral interior, LH', NULL, '', '6517002001'),
(469, 10, 22, 'Conjunto de paneles - Almohadilla lateral interior, Derecha', NULL, '', '6518002001'),
(470, 10, 22, 'Conjunto de miembros - Piso delantero lado, LH ', NULL, 'Códigos opcionales: [6501] GRADO ALTO', '6521002301'),
(471, 10, 22, 'Conjunto de miembros - Piso delantero lado, Derecha ', NULL, 'Códigos opcionales: [6501] GRADO ALTO', '6522002301'),
(472, 10, 22, 'Panel - Suelo Trasero', NULL, '', '6551102060'),
(473, 10, 22, 'Soporte - Soporte de Montaje en Jack', NULL, '', '6552602000'),
(474, 10, 23, 'Conjunto de Paneles - Puerta trasera, LH', NULL, 'Códigos opcionales: [6501] GRADO ALTO', '7700306010'),
(475, 10, 23, 'Conjunto de Paneles - Puerta trasera, Derecha', NULL, 'Códigos opcionales: [6501] GRADO ALTO', '7700406010'),
(476, 10, 23, 'Panel - Puerta trasera exterior, LH', NULL, 'Códigos opcionales: [6501] GRADO ALTO', '7711102011'),
(477, 10, 23, 'Panel - Puerta trasera exterior, Derecha', NULL, 'Códigos opcionales: [6501] GRADO ALTO', '7712102011'),
(478, 10, 23, 'Conjunto de bisagra - Puerta Trasera superior, Conjunto de bisagra IZQUIERDA', NULL, '', '7933002000'),
(479, 10, 23, 'Conjunto de bisagra - Puerta Trasera superior, Conjunto de bisagra DERECHA', NULL, '', '7934002000'),
(480, 10, 23, 'Conjunto de bisagra - Puerta Trasera inferior, Conjunto de bisagra IZQUIERDA', NULL, '', '7935002000'),
(481, 10, 23, 'Conjunto de bisagra - Puerta Trasera inferior, Conjunto de bisagra DERECHA', NULL, '', '7936002000');

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
(1, 'Taxi', 'Terrestre', NULL),
(2, 'Camión', 'Terrestre', NULL),
(3, 'Personal', 'Terrestre', NULL);

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
-- Indexes for table `datos_vehiculos`
--
ALTER TABLE `datos_vehiculos`
  ADD KEY `modelo_vehiculo_id` (`modelo_vehiculo_id`);

--
-- Indexes for table `departamento_ajepp`
--
ALTER TABLE `departamento_ajepp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detalles_pieza_bodega`
--
ALTER TABLE `detalles_pieza_bodega`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `detalles_pieza_tienda`
--
ALTER TABLE `detalles_pieza_tienda`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `pie_serie_UNIQUE` (`pie_serie`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cargo_ajepp`
--
ALTER TABLE `cargo_ajepp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cargo_personal`
--
ALTER TABLE `cargo_personal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `clasificacion_pieza`
--
ALTER TABLE `clasificacion_pieza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `detalles_pieza_bodega`
--
ALTER TABLE `detalles_pieza_bodega`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `detalles_pieza_tienda`
--
ALTER TABLE `detalles_pieza_tienda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `marca_vehiculo`
--
ALTER TABLE `marca_vehiculo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `modelo_vehiculo`
--
ALTER TABLE `modelo_vehiculo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=482;

--
-- AUTO_INCREMENT for table `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- Constraints for table `datos_vehiculos`
--
ALTER TABLE `datos_vehiculos`
  ADD CONSTRAINT `datos_vehiculos_ibfk_1` FOREIGN KEY (`modelo_vehiculo_id`) REFERENCES `modelo_vehiculo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
