-- Insertar tipo de Vehiculo
INSERT INTO `ventas_partes`.`tipo_vehiculo` (`tipo_vehiculo`, `clasificacion_vehiculo`) VALUES ('Terrestre', 'Taxi');
INSERT INTO `ventas_partes`.`tipo_vehiculo` (`tipo_vehiculo`, `clasificacion_vehiculo`) VALUES ('Terrestre', 'Camión');

-- Insertar Marca de Vehiculo
INSERT INTO `ventas_partes`.`marca_vehiculo` (`marca_vehiculo`, `tipo_vehiculo_id`) VALUES ('HYUNDAI','1');
INSERT INTO `ventas_partes`.`marca_vehiculo` (`marca_vehiculo`, `tipo_vehiculo_id`) VALUES ('KIA','2');

-- Insertar Modelo Vehiculo
INSERT INTO `ventas_partes`.`modelo_vehiculo` (`marca_vehiculo_id`, `mod_vehiculo`, `mod_anio`, `procedencia`) VALUES ('1', 'GL-GLS', '2001', 'Seúl - Corea del Sur');
INSERT INTO `ventas_partes`.`modelo_vehiculo` (`marca_vehiculo_id`, `mod_vehiculo`, `mod_anio`, `procedencia`) VALUES ('2', 'K3000S', '2000', 'Seúl - Corea del Sur');

-- Insertar Clasificacion Piezas
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Etiqueta');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Conjunto Gato');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Motor');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Sistema de Refrigeración');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Admición y Escape');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Gasolina');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Motor Electrico');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Embrague');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Eje de transmición');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Eje y Rueda');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Suspención');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('De Dirección');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Freno');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Cuerpo');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Puerta');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Interial');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Execrical');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Seta');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Chasis Electrico');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Calentador y A/C');

-- Insertar Piezas Vehiculo K3000S Clasificación de piezas Motor
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '3', 'Motor Completo', 'Capacidad del Motor 3000 CC', '0K43A02000');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '3', 'Cojunto Motor - Corto , 97MY', 'Capacidad del Motor 3000 CC', '0K75A02200');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '3', 'Kit de Juntas - Revisión del Motor, 97MY', 'Capacidad del Motor 3000 CC', '0K75A10270A');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '3', 'Kit de Juntas - Revisión del Motor', 'Capacidad del Motor 3000 CC', '0K75A10270B');

-- Insertar piezas Vehiculo K3000S Calsificación del Piezas Admición y Escape
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '5', 'Conjunto Aislador - Escape', '', '0K65A13390D');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '5', 'Arandela - Liso', '', '0071011513');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '5', 'Conjunto del Colector - Escape', 'Código de Opción(2835), Emisión CE 1996', '0K65A13450D');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '5', 'Conjunto del Colector - Escape', 'Código de Opción(283B), Emisión (DOM 2000)', '0K78C13450');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '5', 'Junta - Colector de Escape', '', '0K65A13461B');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '5', 'Tuerca - Escape', '', '0K71013461');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '5', 'Tornillo - Maquina, W / PM, W / PDL', '', 'K997860612B');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '5', 'Stud - Colector de Escape', '', '0K65A13456');

-- Insertar piezas Vehiculo K3000S Calsificación del Sistema de Refrigeración
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '4', 'Caucho - Montaje, GSL', '', '0K42113363');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '4', 'Conjunto de Bomba - Refrijerante, Uso selectivo', '', '0K65B15100A');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '4', 'Junta - Bomba de Agua', '', '0K65A15116A');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '4', 'Polea - Bomba de Agua', '', '0K65A15131');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '4', 'Conjunto de Ventilador - Refrigeracón', '', '0K43A15140');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '4', 'Conjunto de Termostado, KONG HWA', '', '0K75615171C');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '4', 'Cubierta - Termostado', '', '0K65A15172C');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '4', 'Junta - Termostado', '', '0K65A15173A');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '4', 'Manguera - Agua, Inferior', '', '0K43A15185B');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '4', 'Manguera - Agua, Superior', '', '0K43A15186A');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '4', 'Conjunto Radiador', '', '0K43A15200B');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '4', 'Polla - Drenaje de Agua, 5M2W', '', '0K20615203');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '4', 'Anillo O, 5M2W', '', '0K20615204');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '4', 'Cap Conjunto - Radiador, GSL', '', '0K20215205');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '4', 'Cubierta - Radiador', '', '0K43A15210');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '4', 'Conjunto de Placa - Caucho, RH', '', '0K43A15281');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '4', 'Sello - Placa, LH', '', '0K43A15282');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '4', 'Soporte SUB ASSY-RAD, LH', '', '0K43A15330');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '4', 'Soporte - Montaje del Radiador, Inferior', '', '0K43A15440A');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '4', 'TANK ASSY-RESERVOIR', '', '0K60A15250C');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '4', 'Manguera - Tanque de Reserva de Agua', '', '0K43A15270A');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('2', '4', 'Ventilador - Enfriamiento', '', '252614Z100');

