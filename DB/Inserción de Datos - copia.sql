-- Insertar tipo de Vehiculo
INSERT INTO `ventas_partes`.`tipo_vehiculo` (`tipo_vehiculo`, `clasificacion_vehiculo`) VALUES ('Terrestre', 'Taxi');
INSERT INTO `ventas_partes`.`tipo_vehiculo` (`tipo_vehiculo`, `clasificacion_vehiculo`) VALUES ('Terrestre', 'Camión');

-- Insertar Marca de Vehiculo
INSERT INTO `ventas_partes`.`marca_vehiculo` (`marca_vehiculo`, `tipo_vehiculo_id`) VALUES ('HYUNDAI','1');
INSERT INTO `ventas_partes`.`marca_vehiculo` (`marca_vehiculo`, `tipo_vehiculo_id`) VALUES ('KIA','2');

-- Insertar Modelo Vehiculo
INSERT INTO `ventas_partes`.`modelo_vehiculo` (`marca_vehiculo_id`, `mod_vehiculo`, `mod_anio`, `procedencia`) VALUES ('1', 'GL-GLS', '2001', 'Seúl - Corea del Sur');
INSERT INTO `ventas_partes`.`modelo_vehiculo` (`marca_vehiculo_id`, `mod_vehiculo`, `mod_anio`, `procedencia`) VALUES ('2', 'K3000S', '2000', 'Seúl - Corea del Sur');
INSERT INTO `ventas_partes`.`modelo_vehiculo` (`marca_vehiculo_id`, `mod_vehiculo`, `mod_anio`, `procedencia`) VALUES ('1', 'ATOZ PRIME 01', '2002', 'Corea del Sur');
INSERT INTO `ventas_partes`.`modelo_vehiculo` (`marca_vehiculo_id`, `mod_vehiculo`, `mod_anio`, `procedencia`) VALUES ('1', 'ATOZ 98', '2000', 'Corea del Sur');

-- Insertar Clasificacion Piezas
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Etiqueta');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Conjunto Gato');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Motor');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Sistema de Refrigeración');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Admición y Escape');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Combustible');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Motor Electrico');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Embrague');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Transmición');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Eje y Rueda');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Suspención');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('De Dirección');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Freno');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Cuerpo - Panel de Capó y Alas');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Cuerpo -  Puerta');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Interial');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Execrical');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Seta');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Chasis - Electrico');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Calentador y A/C');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Cuerpo - Panel de Techo');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Cuerpo - Panel de Piso');
INSERT INTO `ventas_partes`.`clasificacion_pieza` (`pi_nombre`) VALUES ('Cuerpo - Panel Puerta Trasera');

-- Insertar Piezas Vehiculo HYUNDAI ATOZ 98 1997 - 2000 | 5 Velocidad AT | Clasificación de piezas Motor Verificar modelo de Vehiculo
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('4', '6', 'Conjunto de tapa - Llenado de combustible, Cuello de llenado de combustible', 'Coche especial: [G] GENERAL [+] Códigos opcionales: [+A08] + (TAIWÁN)', '3101024000');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('4', '6', 'Soporte - Soporte de montaje de cuello de llenado', 'Códigos opcionales: [+2WD] PAQUETE DE COMBUSTIBLE (SIN PLOMO)', '3103402000');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('4', '6', 'Etiqueta - Puerta de llenado de combustible', 'Códigos opcionales: [+2WD] PAQUETE DE COMBUSTIBLE (SIN PLOMO)', '3103834500');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('4', '6', 'Conjunto de Cuello - Tubo conjunto de llenado de combustible', 'Códigos opcionales: [+2WD] PAQUETE DE COMBUSTIBLE (SIN PLOMO)', '3104002000');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('4', '6', 'Embalaje - Empaque de combustible cuello tanque de combustible junta', 'Códigos opcionales: [+2GB] PAQUETE DE COMBUSTIBLE (SIN PLOMO)', '3104824000');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('4', '6', 'Conjunto de cubierta - Bomba de combustible cubierta A / S', 'Coche especial: [G] GENERAL', '3110602000');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('4', '6', 'Completo - Bomba de combustible conjunto', 'Coche especial: [G] GENERAL Códigos opcionales: [+ A08] + (TAIWÁN)', '3111002500');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('4', '6', 'Conjunto de taza - Tanque de taza de reserva', 'Coche especial: [G] GENERAL Códigos opcionales: [+ A08] + (TAIWÁN)', '3111402000');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('4', '6', 'Placa - Bomba de combustible, Superior', 'Coche especial: [G] GENERAL', '3111602000');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('4', '6', 'Aislador - Bomba de combustible, Aislador', 'Coche especial: [G] GENERAL', '3111702000');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('4', '6', 'Conjunto de bomba de combustible y Soporte', 'Coche especial: [G] GENERAL', '3111902000');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('4', '6', 'Conjunto de tanque - Tanque de combustible', 'Coche especial: [G] GENERAL, Códigos opcionales: [+ A08] + (TAIWÁN) ', '3115002000');

-- Insertar Piezas Vehiculo HYUNDAI ATOZ 98 1997 - 2000 | 5 Velocidad AT | Clasificación de piezas Motor Verificar modelo de Vehiculo
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('4', '3', 'Conjunto del motor', 'Códigos opcionales: [+ 2GB] PAQUETE DE COMBUSTIBLE (SIN PLOMO)', '2110102B00');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('4', '3', 'Juego de pares de rodamientos - Cigueñal, STD', '', '2102002540');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('4', '3', 'Cigueñal', 'Combustible: [D] TRANSMISOR MANUAL Coche especial: [M] ORIENTE MEDIO', '2311102721');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('4', '3', 'Piñon - Correa de distrubución de la polea del arbol de levas', 'Combustible: [D] TRANSMISOR MANUAL', '2312102511');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('4', '3', 'Polea - Amortiguador del cigueñal', 'Combustible: [D] TRANSMISOR MANUAL', '2312402511');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('4', '3', 'Conjunto de polea - Palanca del cigueñal', 'Combustible: [D] TRANSMISOR MANUAL [+]Codigós opcionales: [+9aa] Aire acondicionado', '2313002550');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('4', '3', 'Conjunto piston Y PIN, STD  - Conjunto de piston del motor, STD', 'Códigos opcionales: [+ 2GB] PAQUETE DE COMBUSTIBLE (SIN PLOMO)', '2341002710');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('4', '3', 'Conjunto de Bloques - Cilindro conjunto de bloques', '', '2110002700');

-- Insertar Piezas Vehiculo HYUNDAI ATOZ 98 1997 - 2000 | 5 Velocidad AT | Clasificación de piezas Tubo de Escape Verificar modelo de Vehiculo
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('4', '5', 'Tubo - Escape delatero', 'Códigos opcionales: [-2GB] PAQUETE DE COMBUSTIBLE (SIN PLOMO)', '2861002100');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('4', '5', 'Tubo - Escape centro', 'Códigos opcionales: [-2GB] PAQUETE DE COMBUSTIBLE (SIN PLOMO)', '2865002120');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('4', '5', 'Hanger - Tubo de escape suspensión', 'Combustible: [D] TRANSMISOR MANUAL Coche especial: [G] GENERAL [+] Códigos opcionales: [+ 2GB] PAQUETE DE COMBUSTIBLE (SIN PLOMO)', '2865822000');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('4', '5', 'Tubo - Cola con tubo de silenciador', 'Combustible: [D] TRANSMISOR MANUAL Coche especial: [G] GENERAL [+] Códigos opcionales: [+ 3LC] EMISIÓN (EC 96 SIN PLOMO) [+ 2GB] PAQUETE DE COMBUSTIBLE (SIN PLOMO)', '2870002220');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('4', '5', 'Junta - Tubo de escape junta tubo', 'Códigos opcionales: [-2GB] PAQUETE DE COMBUSTIBLE (SIN PLOMO)', '2875002000');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('4', '5', 'Conjunto del colector - Entrada colector', 'Tipo de control: [L] - MANILLAR A LA IZQUIERDA', '2831002520');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('4', '5', 'Junta - Controlador de velocidad inactiva actuador prox sala reguladora', '', '3512702700');

-- Insertar Piezas Vehiculo HYUNDAI ATOZ 98 1997 - 2000 | 5 Velocidad AT | Clasificación de piezas Transmicion Verificar modelo de Vehiculo
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('4', '22', 'Panel -  Piso delantero', 'Combustible: [A] TRANSMISIÓN AUTOMÁTICA', '6511102350');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('4', '22', 'Conjunto de refuerzo - Piso delantero trasero ', '', '6514102300');

-- HYUNDAI ATOZ PRIME 01 | 5 Velocidad MT ||| Compatible con HYUNDAI ATOZ 01 2001 - 2003 | 5 Velocidad MT ||| Compatible con HYUNDAI ATOZ 98 1997 - 2000 | 5 Velocidad MT
-- Insertar Piezas Vehiculo  ATOZ PRIME 01 | 5 Velocidad MT | Clasificación de piezas Transmicion Verificar modelo de Vehiculo
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '9', 'Conjunto de discos - Conjunto de embrage de disco', 'Transmición: [5] 5 SPEED MT 2WD', '4110002010');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '9', 'Conjunto de cubierta - Cubierta de embrage', 'Transmición: [5] 5 SPEED MT 2WD', '4130002030');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '9', 'Rodamiento - Rodamiento de suspención de embrage', 'Transmición: [5] 5 SPEED MT 2WD', '4142102000');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '9', 'Eje completo - Horquilla de reembolso de embrague', 'Transmición: [5] 5 SPEED MT 2WD', '4143002010');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '9', 'Soporte - Cable de embragie, soporte de embrage', 'Transmición: [5] 5 SPEED MT 2WD', '4311802041');

-- Insertar Piezas Vehiculo  ATOZ PRIME 01 | 5 Velocidad MT | Clasificación de piezas Motor Verificar modelo de Vehiculo
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '3', 'Conjunto de bandeja - Batería Paleta', 'Códigos opcionales: [371E] Batería - 40AH (MF)', '3715002300');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '3', 'Batería Humedad Original 35 AH, Local: [GB] Reino Unido; [IE] Irlanda', 'Códigos opcionales: [371E] Batería - 40AH (MF)', '3711002100');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '3', 'Soporte - Montaje de la batería', 'Códigos opcionales: [371E] Batería - 40AH (MF)', '3716022000');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '3', 'Conjunto de cables - Cable de batería', 'Transmisión: [B] 5 SPEED MT 2WD', '3721002003');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '3', 'Soporte - Montaje de cable de batería', 'Transmisión: [B] 4 VELOCIDAD EN 2WD', '3716022000');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '3', 'PAD - Pedal del acelerador (GAS)', 'Tipo de control: [R] - CONDUCCIÓN A LA DERECHA', '3272102910');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '3', 'Conjunto del brazo - Palanca del Acelerador', 'Tipo de control: [R] - CONDUCCIÓN A LA DERECHA', '3272002910');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '3', 'Resorte - Retorno resorte', 'Tipo de control: [R] - CONDUCCIÓN A LA DERECHA', '3272502900');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '3', 'Conjunto de pedales - Pedal de embrage', 'Tipo de control: [R] - CONDUCCIÓN A LA DERECHA, Transmisión: [5] 5 SPEED MT 2WD', '3283502900');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '3', 'Pedal - Pedal de Freno', 'Tipo de control: [L] - MANILLAR A LA IZQUIERDA, Transmisión: [B] 4 VELOCIDAD EN 2WD', '3281002710');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '3', 'Pedal - Pedal de Freno', 'Tipo de control: [L] - MANILLAR A LA IZQUIERDA, Transmisión: [5] 5 SPEED MT 2WD', '3281002110');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '3', 'Conjunto de Miembros - Embrague ', 'Tipo de control: [R] - CONDUCCIÓN A LA DERECHA, Transmisión: [5] 5 SPEED MT 2WD', '3283602900');

-- Insertar Piezas Vehiculo  ATOZ PRIME 01 | 5 Velocidad MT | Clasificación de piezas Cuerpo Panel de Techo   Verificar modelo de Vehiculo
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '14', 'Panel - Guardabarros, Panel Izquierdo', 'Códigos opcionales: [9231] LATERAL DE REPETIDOR [6501] GRADO ALTO', '6631102260');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '14', 'Panel - Guardabarros, Panel Derecho', 'Códigos opcionales: [9231] LATERAL DE REPETIDOR [6501] GRADO ALTO', '6632102260');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '14', 'Conjunto de paneles - Panel con capucha', 'Códigos opcionales: [6501] GRADO ALTO', '6640006010');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '14', 'Conjunto de bisagra - Capucha, Gancho LH LOOP', '', '7911002000');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '14', 'Conjunto de bisagra - Capucha, Gancho RH, OL', '', '7912002000');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '14', 'Conjunto de moldeo - Moldedura de extremo de la capa', 'Cuerpo: [A] 5 DR SEDAN Clase: [G] GRADO ALTO [+] Códigos opcionales: [863C] CR COAT', '8621106000');

-- Insertar Piezas Vehiculo  ATOZ PRIME 01 | 5 Velocidad MT | Clasificación de piezas Cuerpo Puerta   Verificar modelo de Vehiculo
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '15', 'Conjunto de paneles - Puerta delantera, LH', 'Códigos opcionales: [6501] GRADO ALTO', '7600306010');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '15', 'Conjunto de paneles - Puerta delantera, Derecha', 'Códigos opcionales: [6501] GRADO ALTO', '7600406010');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '15', 'Panel - Puerta delantera exterior, LH', 'Códigos opcionales: [6501] GRADO ALTO', '7611102010');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '15', 'Panel - Puerta delantera exterior, Derecha', 'Códigos opcionales: [6501] GRADO ALTO', '7612102010');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '15', 'Conjunto de bisagra - Puerta delantera, LH', '', '7931002000');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '15', 'Conjunto de bisagra - Puerta delantera, Derecha', '', '7932002000');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '15', 'Perno M6', '', '7935921000');

-- Insertar Piezas Vehiculo  ATOZ PRIME 01 | 5 Velocidad MT | Clasificación de piezas Cuerpo Panel de Techo   Verificar modelo de Vehiculo
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '21', 'Conjunto Ferroviario - Trasero cruzado trasero', '', '6713006000');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '21', 'Panel - Azotea del panel', '', '6711106000');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '21', 'Ferrocarril - Centro de techo, Centro de viga transversal del techo', '', '6712106000');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '21', 'Centro Ferroviarrio - Techo delantero Crossbar', '', '6731006000');

-- Insertar Piezas Vehiculo  ATOZ PRIME 01 | 5 Velocidad MT | Clasificación de piezas Cuerpo de Piso Verificar modelo de Vehiculo
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '22', 'Panel - Piso delantero', 'Transmisión: [5] 5 SPEED MT 2WD [+] Códigos opcionales: [6501] GRADO ALTO', '6511102300');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '22', 'Conjunto de refuerzo - Piso delantero o trasero', 'Códigos opcionales: [6501] Grado Alto', '6514102301');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '22', 'Refuerzo - Montaje de ESPS', '', '6514502000');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '22', 'Conjunto cruzado - Cruz cruzada del asiento delantero antes de LED', 'Transmisión: [5] 5 SPEED MT 2WD [+] Códigos opcionales: [6501] GRADO ALTO', '6516102300');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '22', 'Conjunto de paneles - Almohadilla lateral interior, LH', '', '6517002001');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '22', 'Conjunto de paneles - Almohadilla lateral interior, Derecha', '', '6518002001');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '22', 'Conjunto de miembros - Piso delantero lado, LH ', 'Códigos opcionales: [6501] GRADO ALTO', '6521002301');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '22', 'Conjunto de miembros - Piso delantero lado, Derecha ', 'Códigos opcionales: [6501] GRADO ALTO', '6522002301');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '22', 'Panel - Suelo Trasero', '', '6551102060');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '22', 'Soporte - Soporte de Montaje en Jack', '', '6552602000');

-- Insertar Piezas Vehiculo  ATOZ PRIME 01 | 5 Velocidad MT | Clasificación de piezas Cuerpo Panel puerta trasera   Verificar modelo de Vehiculo
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '23', 'Conjunto de Paneles - Puerta trasera, LH', 'Códigos opcionales: [6501] GRADO ALTO', '7700306010');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '23', 'Conjunto de Paneles - Puerta trasera, Derecha', 'Códigos opcionales: [6501] GRADO ALTO', '7700406010');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '23', 'Panel - Puerta trasera exterior, LH', 'Códigos opcionales: [6501] GRADO ALTO', '7711102011');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '23', 'Panel - Puerta trasera exterior, Derecha', 'Códigos opcionales: [6501] GRADO ALTO', '7712102011');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '23', 'Conjunto de bisagra - Puerta Trasera superior, Conjunto de bisagra IZQUIERDA', '', '7933002000');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '23', 'Conjunto de bisagra - Puerta Trasera superior, Conjunto de bisagra DERECHA', '', '7934002000');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '23', 'Conjunto de bisagra - Puerta Trasera inferior, Conjunto de bisagra IZQUIERDA', '', '7935002000');
INSERT INTO `ventas_partes`.`piezas_vehiculo` (`modelo_vehiculo_id`, `clasificacion_pieza_id`, `pie_nombre`, `pie_descripcion`, `pie_numero`) VALUES ('3', '23', 'Conjunto de bisagra - Puerta Trasera inferior, Conjunto de bisagra DERECHA', '', '7936002000');

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