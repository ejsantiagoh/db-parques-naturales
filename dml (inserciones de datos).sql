-- Inserciones:
-- Inserciones para la base de datos parques_naturales
use parques_naturales;

-- Inserciones en la tabla entidad_responsable
insert into entidad_responsable (nombre) values
('Ministerio de Ambiente Colombia'),
('Corporación Autónoma Regional de Cundinamarca'),
('Parques Nacionales Naturales de Colombia'),
('Autoridad Nacional de Licencias Ambientales'),	
('Corporación Autónoma Regional del Valle del Cauca'),
('Corporación Autónoma Regional de Antioquia'),
('Instituto Humboldt'),
('Secretaría de Ambiente de Bogotá'),
('Corporación Autónoma Regional de Santander'),
('Corporación Autónoma Regional del Magdalena'),
('Corporación Autónoma Regional del Amazonas'),
('Corporación Autónoma Regional de Nariño'),
('Corporación Autónoma Regional del Putumayo'),
('Corporación Autónoma Regional del Chocó'),
('Corporación Autónoma Regional de la Guajira'),
('Corporación Autónoma Regional del Tolima'),
('Corporación Autónoma Regional del Huila'),
('Corporación Autónoma Regional del Cesar'),
('Corporación Autónoma Regional del Quindío'),
('Corporación Autónoma Regional del Risaralda'),
('Corporación Autónoma Regional del Cauca'),
('Corporación Autónoma Regional del Caquetá'),
('Corporación Autónoma Regional del Guaviare'),
('Corporación Autónoma Regional del Vaupés'),
('Corporación Autónoma Regional del Vichada'),
('Corporación Autónoma Regional del Arauca'),
('Corporación Autónoma Regional del Casanare'),
('Corporación Autónoma Regional del Chocó'),
('Corporación Autónoma Regional del Magdalena Medio'),
('Corporación Autónoma Regional del Urabá'),
('Corporación Autónoma Regional del Piedemonte Llanero'),
('Corporación Autónoma Regional de San Andrés y Providencia'),
('Corporación Autónoma Regional del Caribe'),
('Corporación Autónoma Regional del Suroriente Colombiano'),
('Corporación Autónoma Regional del Alto Magdalena'),
('Corporación Autónoma Regional del Bajo Magdalena'),
('Corporación Autónoma Regional del Centro'),
('Corporación Autónoma Regional del Oriente'),
('Corporación Autónoma Regional del Norte'),
('Corporación Autónoma Regional del Sur'),
('Corporación Autónoma Regional del Occidente'),
('Corporación Autónoma Regional del Suroccidente'),
('Corporación Autónoma Regional del Noroccidente'),
('Corporación Autónoma Regional del Nororiente'),
('Corporación Autónoma Regional del Eje Cafetero'),
('Corporación Autónoma Regional del Altiplano'),
('Corporación Autónoma Regional del Macizo Colombiano'),
('Corporación Autónoma Regional del Amazonas Medio'),
('Corporación Autónoma Regional del Pacifico Colombiano');


-- Inserciones en la tabla departamento
insert into departamento (nombre, id_ent_responsable) values
('Cundinamarca', 2),
('Antioquia', 6),
('Valle del Cauca', 5),
('Santander', 9),
('Magdalena', 10),
('Meta', 3),
('Cauca', 4),
('Bolívar', 1),
('Nariño', 7),
('Boyacá', 8),
('Cesar', 18),
('Huila', 17),
('Tolima', 16),
('La Guajira', 15),
('Chocó', 14),
('Putumayo', 13),
('Norte de Santander', 9),
('Casanare', 27),
('Guaviare', 23),
('Vaupés', 24),
('Vichada', 25),
('Arauca', 26),
('San Andrés y Providencia', 32),
('Risaralda', 20),
('Quindío', 19),
('Amazonas', 11),
('Sucre', 5),
('Córdoba', 5),
('Atlántico', 5),
('Caquetá', 22),
('Guainía', 24),
('Amazonas Medio', 48),
('Urabá', 30),
('Macizo Colombiano', 47),
('Altiplano', 46),
('Eje Cafetero', 45),
('Nororiente', 44),
('Noroccidente', 43),
('Suroccidente', 42),
('Occidente', 41),
('Sur', 40),
('Norte', 39),
('Oriente', 38),
('Centro', 37),
('Bajo Magdalena', 36),
('Alto Magdalena', 35),
('Suroriente Colombiano', 34),
('Caribe', 33);

-- Inserciones en la tabla parque_natural
insert into parque_natural (nombre, fecha_declaracion) values
('Parque Nacional Natural Serranía de los Churumbelos', '2007-05-21'),
('Parque Nacional Natural Bahía Portete', '2000-11-30'),
('Parque Nacional Natural Los Colorados', '1977-06-04'),
('Parque Nacional Natural Serranía de San Lucas', '2016-09-15'),
('Parque Nacional Natural Alto Orinoco', '1993-10-02'),
('Parque Nacional Natural La Macarena', '1971-02-03'),
('Parque Nacional Natural Cahuinarí', '1987-09-18'),
('Parque Nacional Natural Chiribiquete', '1989-09-21'),
('Parque Nacional Natural Utría', '1987-02-28'),
('Parque Nacional Natural El Tuparro', '1970-07-06'),
('Parque Nacional Natural Los Flamencos', '1977-10-23'),
('Parque Nacional Natural Gorgona', '1984-06-19'),
('Parque Nacional Natural Amacayacu', '1975-08-14'),
('Parque Nacional Natural Corales del Rosario', '1977-03-23'),
('Parque Nacional Natural Munchique', '1977-02-28'),
('Parque Nacional Natural Puracé', '1975-06-08'),
('Parque Nacional Natural La Paya', '1984-07-23'),
('Parque Nacional Natural Cueva de los Guácharos', '1960-11-09'),
('Parque Nacional Natural Tatamá', '1987-07-26'),
('Parque Nacional Natural Old Providence McBean Lagoon', '1995-06-20'),
('Parque Nacional Natural Sanquianga', '1977-10-23'),
('Parque Nacional Natural Alto Fragua Indi Wasi', '2002-08-14'),
('Parque Nacional Natural Río Puré', '2002-06-12'),
('Parque Nacional Natural Doña Juana Cascabel', '1988-12-09'),
('Parque Nacional Natural Los Estoraques', '1998-07-06'),
('Parque Nacional Natural Tamá', '1977-04-20'),
('Parque Nacional Natural Isla de la Corota', '1977-05-18'),
('Parque Nacional Natural Bahía Málaga', '2010-07-20'),
('Parque Nacional Natural Serranía del Perijá', '2016-08-15'),
('Parque Nacional Natural Paya', '1984-06-14'),
('Parque Nacional Natural Nukak', '1989-07-21'),
('Parque Nacional Natural Tinigua', '1989-06-04'),
('Parque Nacional Natural Los Katíos', '1974-08-06'),
('Parque Nacional Natural Pisba', '1977-08-25'),
('Parque Nacional Natural Otún Quimbaya', '1996-10-17'),
('Parque Nacional Natural Paramillo', '1977-07-19'),
('Parque Nacional Natural Yaigojé Apaporis', '2009-10-07'),
('Parque Nacional Natural Cahuinarí', '1987-09-18'),
('Parque Nacional Natural Macuira', '1977-05-23'),
('Parque Nacional Natural Tinigua', '1989-06-04'),
('Parque Nacional Natural Gorgona', '1984-06-19'),
('Parque Nacional Natural Chingaza', '1977-06-07'),
('Parque Nacional Natural Sumapaz', '1977-10-09'),
('Parque Nacional Natural Farallones de Cali', '1968-01-01'),
('Parque Nacional Natural Catatumbo Barí', '1981-10-13'),
('Parque Nacional Natural Serranía de los Churumbelos', '2007-05-21'),
('Parque Nacional Natural Isla de Salamanca', '1964-06-04'),
('Parque Nacional Natural real de minas', '2025-10-13'),
('Parque Nacional Natural Serranía de piedecuesta', '2017-05-21'),
('Parque Nacional Natural Isla de Floridablanca', '1924-06-04');

-- Inserciones en la tabla parque_departamento
INSERT INTO parque_departamento (id_parque, id_departamento) VALUES
(1, 7),  -- Serranía de los Churumbelos -> Cauca
(2, 14), -- Bahía Portete -> La Guajira
(3, 8),  -- Los Colorados -> Bolívar
(4, 1),  -- Serranía de San Lucas -> Cundinamarca
(5, 25), -- Alto Orinoco -> Vichada
(6, 6),  -- La Macarena -> Meta
(7, 11), -- Cahuinarí -> Amazonas
(8, 11), -- Chiribiquete -> Amazonas
(9, 15), -- Utría -> Chocó
(10, 25), -- El Tuparro -> Vichada
(11, 14), -- Los Flamencos -> La Guajira
(12, 7),  -- Gorgona -> Cauca
(13, 11), -- Amacayacu -> Amazonas
(14, 8),  -- Corales del Rosario -> Bolívar
(15, 7),  -- Munchique -> Cauca
(16, 7),  -- Puracé -> Cauca
(17, 16), -- La Paya -> Putumayo
(18, 12), -- Cueva de los Guácharos -> Huila
(19, 20), -- Tatamá -> Risaralda
(20, 23), -- Old Providence McBean Lagoon -> San Andrés y Providencia
(21, 9),  -- Sanquianga -> Nariño
(22, 22), -- Alto Fragua Indi Wasi -> Caquetá
(23, 11), -- Río Puré -> Amazonas
(24, 9),  -- Doña Juana Cascabel -> Nariño
(25, 17), -- Los Estoraques -> Norte de Santander
(26, 17), -- Tamá -> Norte de Santander
(27, 9),  -- Isla de la Corota -> Nariño
(28, 3),  -- Bahía Málaga -> Valle del Cauca
(29, 10), -- Serranía del Perijá -> Cesar
(30, 16), -- Paya -> Putumayo
(31, 19), -- Nukak -> Guaviare
(32, 6),  -- Tinigua -> Meta
(33, 33), -- Los Katíos -> Chocó
(34, 10), -- Pisba -> Boyacá
(35, 20), -- Otún Quimbaya -> Risaralda
(36, 28), -- Paramillo -> Córdoba
(37, 31), -- Yaigojé Apaporis -> Guainía
(38, 11), -- Cahuinarí -> Amazonas
(39, 14), -- Macuira -> La Guajira
(40, 6),  -- Tinigua -> Meta
(41, 7),  -- Gorgona -> Cauca
(42, 1),  -- Chingaza -> Cundinamarca
(43, 1),  -- Sumapaz -> Cundinamarca
(44, 3),  -- Farallones de Cali -> Valle del Cauca
(45, 17), -- Catatumbo Barí -> Norte de Santander
(46, 7),  -- Serranía de los Churumbelos -> Cauca
(47, 10), -- Isla de Salamanca -> Magdalena
(48, 5),  -- Real de Minas -> Antioquia
(49, 4),  -- Serranía de Piedecuesta -> Santander
(50, 10); -- Isla de Floridablanca -> Magdalena


-- Inserciones en la tabla area
insert into area (nombre, extension, id_parque) values
('Área Norte', 15000, 1),
('Área Sur', 12000, 1),
('Área Central', 18000, 2),
('Área Este', 14000, 3),
('Área Oeste', 16000, 4),
('Área Amazónica', 22000, 5),
('Área Andina', 20000, 6),
('Área Litoral', 17500, 7),
('Área Selvática', 19000, 8),
('Área Montañosa', 21000, 9),
('Reserva del Jaguar', 18000, 1),
('Santuario de Palmas', 15000, 2),
('Bosque Seco', 17000, 3),
('Ecosistema de Páramo', 22000, 4),
('Humedales del Parque', 20000, 5),
('Zona de Manglares', 19000, 6),
('Cueva de los Murciélagos', 21000, 7),
('Altiplano Andino', 23000, 8),
('Cánovas del Amazonas', 25000, 9),
('Cordillera Oriental', 24000, 10),
('Lagos Andinos', 18000, 1),
('Cuevas del Río', 17000, 2),
('Valles Interandinos', 19000, 3),
('Montes de Guayana', 16000, 4),
('Reserva Ecológica', 22000, 5),
('Cataratas del Orinoco', 21000, 6),
('Bosques Nublados', 20000, 7),
('Estepa Colombiana', 19500, 8),
('Selva Primaria', 18500, 9),
('Sabana de la Orinoquía', 23000, 10),
('Montes Escarpados', 24000, 1),
('Arenales del Caribe', 25000, 2),
('Planicie Litoraleña', 16000, 3),
('Cascadas Secretas', 15000, 4),
('Llanos Orientales', 22000, 5),
('Valle de los Volcanes', 21000, 6),
('Bosque de niebla', 20000, 7),
('Cúanas Tropicales', 19500, 8),
('Costa Rocosa', 18500, 9),
('Macizo Colombiano', 23000, 10);


-- Inserciones en la tabla especie
insert into especie (denominacion_cientifica, denominacion_vulgar, tipo, id_area) values
('Panthera onca', 'Jaguar', 'animal', 1),
('Amazona amazónica', 'Loro amazónico', 'animal', 2),
('Cedrela odorata', 'Cedro', 'vegetal', 3),
('Anacardium excelsum', 'Caracolí', 'vegetal', 4),
('Batrachospermum sp.', 'Algas rojas', 'mineral', 5),
('Coccoloba uvifera', 'Uva de mar', 'vegetal', 6),
('Tremarctos ornatus', 'Oso de anteojos', 'animal', 7),
('Podocnemis expansa', 'Tortuga charapa', 'animal', 8),
('Dipteryx odorata', 'Cumaru', 'vegetal', 9),
('Cinnamomum verum', 'Canela', 'vegetal', 10),
('Ara macao', 'Guacamaya roja', 'animal', 1),
('Tapirus terrestris', 'Tapir', 'animal', 2),
('Ficus insipida', 'Higuerón', 'vegetal', 3),
('Euterpe precatoria', 'Palma de azaí', 'vegetal', 4),
('Lycopodium clavatum', 'Licopodio', 'vegetal', 5),
('Boa constrictor', 'Boa', 'animal', 6),
('Atta cephalotes', 'Hormiga arriera', 'animal', 7),
('Orchidaceae sp.', 'Orquídea', 'vegetal', 8),
('Caiman crocodilus', 'Babilla', 'animal', 9),
('Ceiba pentandra', 'Ceiba', 'vegetal', 10),
('Rhinella marina', 'Sapo gigante', 'animal', 1),
('Lontra longicaudis', 'Nutria', 'animal', 2),
('Caryocar costaricense', 'Árbol de almendra', 'vegetal', 3),
('Dendrobates tinctorius', 'Rana venenosa', 'animal', 4),
('Ochroma pyramidale', 'Balsa', 'vegetal', 5),
('Harpia harpyja', 'Águila harpía', 'animal', 6),
('Anthurium andraeanum', 'Anturio', 'vegetal', 7),
('Philodendron bipinnatifidum', 'Filodendro', 'vegetal', 8),
('Erythrina fusca', 'Palo bobo', 'vegetal', 9),
('Myristica fragrans', 'Nuez moscada', 'vegetal', 10);
-- Inserciones adicionales en la tabla especie para tipo "mineral"
insert into especie (denominacion_cientifica, denominacion_vulgar, tipo, id_area) values
('Quartz', 'Cuarzo', 'mineral', 1),
('Feldspar', 'Feldespato', 'mineral', 2),
('Calcite', 'Calcita', 'mineral', 3),
('Pyrite', 'Pirita', 'mineral', 4),
('Gypsum', 'Yeso', 'mineral', 5),
('Halite', 'Halita', 'mineral', 6),
('Magnetite', 'Magnetita', 'mineral', 7),
('Hematite', 'Hematita', 'mineral', 8),
('Bauxite', 'Bauxita', 'mineral', 9),
('Graphite', 'Grafito', 'mineral', 10);

delete from personal;
-- Inserciones en la tabla personal
insert into personal (cedula, nombre, direccion, telefono, telefono_movil, sueldo) values
(1000001, 'Juan Perez', 'Calle 123 #45-67, Bogot\u00e1', '6011234567', '3101234567', 2500000.00),
(1000002, 'Maria Gomez', 'Carrera 12 #34-56, Medell\u00edn', '6042345678', '3112345678', 2700000.00),
(1000003, 'Carlos Rodriguez', 'Avenida 1 #23-45, Cali', '6023456789', '3123456789', 2900000.00),
(1000004, 'Ana Torres', 'Diagonal 56 #78-90, Barranquilla', '6054567890', '3134567890', 3100000.00),
(1000005, 'Luis Martinez', 'Transversal 67 #89-12, Bucaramanga', '6075678901', '3145678901', 3300000.00),
(1000006, 'Diana Rios', 'Calle 98 #76-54, Cartagena', '6056789012', '3156789012', 3500000.00),
(1000007, 'Fernando Lopez', 'Carrera 21 #43-21, Manizales', '6067890123', '3167890123', 3700000.00),
(1000008, 'Paola Castro', 'Avenida 10 #65-32, Pereira', '6068901234', null, 3900000.00),
(1000009, 'Jorge Ramirez', 'Calle 5 #4-3, Ibagu\u00e9', '6089012345', '3189012345', 4100000.00),
(1000010, 'Sofia Fernandez', 'Carrera 78 #12-45, Neiva', '6080123456', '3190123456', 4300000.00),
(1000011, 'Andres Suarez', 'Calle 45 #23-56, Pasto', '6021112233', '3201234567', 2700000.00),
(1000012, 'Carolina Vargas', 'Carrera 8 #9-10, Monter\u00eda', '6041122334', '3212345678', 2800000.00),
(1000013, 'Ricardo Mendoza', 'Avenida 50 #15-80, Villavicencio', '6082233445', '3223456789', 2900000.00),
(1000014, 'Liliana Quintero', 'Diagonal 20 #30-40, Armenia', '6063344556', '3234567890', 3000000.00),
(1000015, 'Oscar Mej\u00eda', 'Calle 77 #66-55, Popay\u00e1n', '6024455667', '3245678901', 3100000.00),
(1000016, 'Esteban Rueda', 'Carrera 100 #50-23, Florencia', '6085566778', '3256789012', 3200000.00),
(1000017, 'Natalia Benitez', 'Calle 11 #22-33, Tunja', '6086677889', '3267890123', 3300000.00),
(1000018, 'Julian Pardo', 'Transversal 9 #8-7, Sincelejo', '6057788990', '3278901234', 3400000.00),
(1000019, 'Margarita Vargas', 'Diagonal 100 #20-30, Riohacha', '6058899001', '3289012345', 3500000.00),
(1000020, 'Pedro Sanchez', 'Calle 56 #78-90, Quibd\u00f3', '6049900112', '3290123456', 3600000.00),
(1000021, 'Angela Diaz', 'Carrera 23 #45-67, Santa Marta', '6050011223', '3301234567', 3700000.00),
(1000022, 'Roberto Marin', 'Avenida 12 #34-56, Valledupar', '6051122334', '3312345678', 3800000.00),
(1000023, 'Sergio Trujillo', 'Diagonal 78 #90-12, Yopal', '6082233445', '3323456789', 3900000.00),
(1000024, 'Mariana Gomez', 'Calle 8 #9-10, Leticia', '6083344556', null, 4000000.00),
(1000025, 'Alberto Hurtado', 'Carrera 99 #88-77, Mocoa', '6084455667', '3345678901', 4100000.00),
(1000026, 'Clara Jimenez', 'Avenida 55 #44-33, Mit\u00fa', '6085566778', '3356789012', 4200000.00),
(1000027, 'Javier Castellanos', 'Transversal 7 #6-5, Inirida', '6086677889', '3367890123', 4300000.00),
(1000028, 'Gabriela Mu\u00f1oz', 'Diagonal 3 #2-1, Puerto Carre\u00f1o', '6087788990', '3378901234', 4400000.00),
(1000029, 'Rodrigo Duarte', 'Calle 90 #80-70, Arauca', '6088899001', '3389012345', 4500000.00),
(1000030, 'Camila Fernandez', 'Carrera 11 #22-33, San Andr\u00e9s','3390123456' , null, 4600000.00),
(1000031, 'Victor Rios', 'Calle 14 #24-36, Villagarz\u00f3n', '6081112233', '3401234567', 2700000.00),
(1000032, 'Luisa Mendez', 'Carrera 5 #3-1, Puerto In\u00edrida', '6082223344', '3412345678', 2800000.00),
(1000033, 'Daniel Ocampo', 'Avenida 67 #45-12, Cumaribo', '6083334455', '3423456789', 2900000.00),
(1000034, 'Andrea Vargas', 'Transversal 88 #99-11, Mit\u00fa', '6084445566', '3434567890', 3000000.00),
(1000035, 'Felipe Ariza', 'Diagonal 23 #45-67, La Macarena', '6085556677', '3445678901', 3100000.00),
(1000036, 'Camila Restrepo', 'Calle 20 #10-50, Cali', '6029988776', '3201112233', 2900000.00),
(1000037, 'Rodrigo Peña', 'Carrera 45 #12-34, Medellín', '6048877665', '3212223344', 3000000.00),
(1000038, 'Laura Quintero', 'Avenida 7 #89-12, Barranquilla', '6057766554', '3223334455', 3100000.00),
(1000039, 'Santiago Pardo', 'Transversal 33 #56-78, Cartagena', '6056655443', '3234445566', 3200000.00),
(1000040, 'Valeria Arango', 'Diagonal 98 #45-67, Bucaramanga', '6075544332', '3245556677', 3300000.00),
(1000041, 'Felipe Herrera', 'Calle 11 #22-33, Manizales', '6064433221', '3256667788', 3400000.00),
(1000042, 'Andrea Mendoza', 'Carrera 9 #30-40, Armenia', '6063322110', '3267778899', 3500000.00),
(1000043, 'Julián Castaño', 'Avenida 50 #99-88, Pereira', '6062211009', '3278889900', 3600000.00),
(1000044, 'Natalia Osorio', 'Calle 77 #12-34, Neiva', '6081100998', '3289990011', 3700000.00),
(1000045, 'Ricardo López', 'Carrera 4 #56-78, Montería', '6040099887', '3290001122', 3800000.00),
(1000046, 'Daniela Silva', 'Diagonal 65 #43-21, Pasto', '6028988776', '3301112233', 2900000.00),
(1000047, 'Oscar Ramírez', 'Calle 8 #7-56, Villavicencio', '6087877665', '3312223344', 3000000.00),
(1000048, 'Alejandra Vargas', 'Avenida 34 #99-11, Ibagué', '6086766554', '3323334455', 3100000.00),
(1000049, 'Sebastián Moreno', 'Carrera 12 #45-67, Santa Marta', '6055655443', '3334445566', 3200000.00),
(1000050, 'Carla Ruiz', 'Calle 55 #67-89, Cúcuta', '6074544332', '3345556677', 3300000.00);


-- Inserciones en la tabla proyecto_investigacion
insert into proyecto_investigacion (nombre, presupuesto, fecha_inicio, fecha_fin) values
('Conservación del Jaguar', 15000000, '2023-01-10', '2025-06-15'),
('Monitoreo de Aves Migratorias', 12000000, '2022-05-20', '2024-12-30'),
('Estudio de Ecosistemas Andinos', 18000000, '2023-07-01', '2026-02-28'),
('Impacto del Cambio Climático en la Amazonia', 14000000, '2021-11-15', '2024-09-10'),
('Protección del Oso de Anteojos', 16000000, '2022-03-05', '2025-08-20'),
('Recuperación de Corales del Caribe', 22000000, '2023-09-12', '2026-05-18'),
('Reforestación del Chocó Biogeográfico', 20000000, '2021-06-30', '2024-11-25'),
('Estudio de la Biodiversidad en Sumapaz', 17500000, '2022-08-15', '2025-12-10'),
('Preservación del Cóndor Andino', 19000000, '2023-04-25', '2026-07-30'),
('Control de Especies Invasoras en Parques Nacionales', 21000000, '2021-12-05', '2025-03-22'),
('Investigación de Plantas Medicinales en la Sierra Nevada', 13000000, '2022-10-01', '2024-06-17'),
('Seguimiento a Poblaciones de Tortugas Charapa', 12500000, '2023-02-14', '2026-09-11'),
('Manejo Sostenible del Agua en Ecosistemas de Alta Montaña', 14500000, '2022-07-21', '2025-10-05'),
('Evaluación de la Calidad del Suelo en Parques Naturales', 13500000, '2021-09-10', '2024-12-01'),
('Plan de Manejo del Manatí Amazónico', 15500000, '2023-11-30', '2026-08-22'),
('Rescate y Rehabilitación de Fauna Silvestre', 16500000, '2022-12-15', '2025-07-15'),
('Estudio de Polinizadores en Ecosistemas Naturales', 17500000, '2021-05-18', '2024-10-25'),
('Cartografía y Monitoreo de Bosques Secos', 18500000, '2023-06-07', '2026-03-30'),
('Restauración de Manglares en el Pacífico Colombiano', 19500000, '2022-04-12', '2025-09-18'),
('Uso de Drones para Vigilancia Ambiental', 20500000, '2023-08-25', '2026-11-10'),
('Evaluación de Reservas Hídricas en PNN', 21500000, '2021-03-11', '2024-06-27'),
('Estudio de Adaptabilidad de Mamíferos a Cambio Climático', 22500000, '2022-06-19', '2025-12-05'),
('Impacto de la Contaminación en Fauna Acuática', 23500000, '2023-05-02', '2026-04-15'),
('Reintroducción de Especies en Peligro de Extinción', 24500000, '2021-07-09', '2024-11-03'),
('Investigación en Endemismo de Flora Colombiana', 25500000, '2022-02-21', '2025-05-29'),
('Análisis de la Erosión en Zonas de Alta Montaña', 26500000, '2023-09-05', '2026-07-19'),
('Estudio de Microorganismos en Suelos Amazónicos', 27500000, '2021-11-14', '2025-02-24'),
('Manejo de Residuos en Áreas Protegidas', 28500000, '2022-01-30', '2025-08-09'),
('Uso de Tecnología Satelital en Conservación', 29500000, '2023-10-10', '2026-05-28'),
('Evaluación de Hábitats de Grandes Felinos', 30500000, '2021-08-20', '2024-12-13'),
('Seguimiento de Anfibios en Ecosistemas Húmedos', 31500000, '2022-12-07', '2026-03-15'),
('Estudio de Relación Entre Especies y Cambio de Hábitat', 32500000, '2023-04-28', '2026-06-22'),
('Resiliencia de Bosques Secos a Incendios', 33500000, '2021-05-05', '2024-09-30'),
('Detección de Tráfico Ilegal de Flora y Fauna', 34500000, '2022-07-14', '2025-11-17'),
('Plan de Restauración Ecológica en Zonas Afectadas por Minería', 35500000, '2023-01-23', '2026-08-05'),
('Efectos de la Agricultura en la Biodiversidad', 36500000, '2021-09-17', '2024-10-29'),
('Monitoreo de Niveles de CO2 en Parques Naturales', 37500000, '2022-06-08', '2025-12-20'),
('Evaluación del Turismo Sostenible en Áreas Protegidas', 38500000, '2023-11-02', '2026-07-14'),
('Rehabilitación de Humedales en Colombia', 39500000, '2021-03-30', '2024-09-11'),
('Investigación de Insectos Polinizadores en la Amazonia', 40500000, '2022-08-27', '2025-06-04'),
('Manejo Integrado de Plagas en Ecosistemas Naturales', 41500000, '2023-02-12', '2026-05-17'),
('Estudio del Comportamiento de Aves Nocturnas', 42500000, '2021-11-06', '2024-07-26'),
('Desarrollo de Programas de Educación Ambiental', 43500000, '2022-04-05', '2025-10-18'),
('Evaluación de la Diversidad Genética en Fauna Silvestre', 44500000, '2023-06-21', '2026-09-07'),
('Reducción de Conflictos entre Humanos y Fauna Silvestre', 45500000, '2021-10-11', '2025-08-12'),
('Análisis de la Migración de Especies Marinas', 46500000, '2022-01-19', '2025-11-23'),
('Impacto del Fuego en Regiones de Bosques Tropicales', 47500000, '2023-07-08', '2026-10-02');

-- Inserciones personal_investigador
INSERT INTO personal_investigador (id, campo_investigacion, publicaciones)
VALUES (1, 'Biología de la conservación', 5),
       (2, 'Ecología de ecosistemas', 8),
       (3, 'Genética de especies en peligro', 4),
       (4, 'Cambio climático', 6),
       (5, 'Fauna silvestre', 7),
       (6, 'Flora endémica', 3),
       (7, 'Microbiología ambiental', 5),
       (8, 'Ecosistemas marinos', 6),
       (9, 'Ornitología', 4),
       (10, 'Herpetología', 2),
       (11, 'Manejo de especies invasoras', 3),
       (12, 'Restauración ecológica', 7);


-- Inserciones personal_conservacion
INSERT INTO personal_conservacion (id, especialidad, anios_experiencia, id_area)
VALUES (13, 'Botánica', 10, 1),
       (14, 'Ecología', 8, 2),
       (15, 'Zoología', 12, 3),
       (16, 'Restauración Ambiental', 9, 4),
       (17, 'Manejo de Flora', 11, 5),
       (18, 'Manejo de Fauna', 7, 1),
       (19, 'Reforestación', 6, 2),
       (20, 'Conservación de Suelos', 8, 3),
       (21, 'Control Biológico', 5, 4),
       (22, 'Ecosistemas Acuáticos', 10, 5),
       (23, 'Manejo de especies exóticas', 4, 1),
       (24, 'Protección de humedales', 7, 2);


-- Inserciones personal_vigilancia
INSERT INTO personal_vigilancia (id, rango, horario_patrulla, id_area)
VALUES (25, 'Guardaparque', '06:00 - 14:00', 3),
       (26, 'Guardaparque', '14:00 - 22:00', 4),
       (27, 'Guardaparque', '22:00 - 06:00', 1),
       (28, 'Supervisor', '08:00 - 16:00', 2),
       (29, 'Coordinador', '09:00 - 17:00', 5),
       (30, 'Guardaparque', '06:00 - 14:00', 3),
       (31, 'Guardaparque', '14:00 - 22:00', 4),
       (32, 'Guardaparque', '22:00 - 06:00', 1),
       (33, 'Supervisor', '08:00 - 16:00', 2),
       (34, 'Coordinador', '09:00 - 17:00', 5),
       (35, 'Patrullero', '10:00 - 18:00', 3),
       (36, 'Patrullero', '18:00 - 02:00', 4);


-- Inserciones personal_gestion
INSERT INTO personal_gestion (id, rol, oficina)
VALUES (37, 'Director', 'Oficina Central'),
       (38, 'Administrador', 'Oficina Regional 1'),
       (39, 'Coordinador de proyectos', 'Oficina Regional 2'),
       (40, 'Jefe de recursos humanos', 'Oficina Central'),
       (41, 'Contador', 'Oficina Central'),
       (42, 'Asistente administrativo', 'Oficina Regional 3'),
       (43, 'Gerente de logística', 'Oficina Regional 4'),
       (44, 'Coordinador de comunicación', 'Oficina Central'),
       (45, 'Gestor de relaciones públicas', 'Oficina Central'),
       (46, 'Tesorero', 'Oficina Regional 2'),
       (47, 'Analista financiero', 'Oficina Central'),
       (48, 'Supervisor de personal', 'Oficina Regional 3'),
       (49, 'Jefe de operaciones', 'Oficina Central'),
       (50, 'Gerente de TI', 'Oficina Central');

delete from proyecto_especie_investigador;
INSERT INTO proyecto_especie_investigador (id_proyecto, id_especie, id_investigador)
VALUES 
    (1, 10, 1),  -- Proyecto 1, Especie 10, Investigador 1
    (2, 15, 2),  -- Proyecto 1, Especie 15, Investigador 2
    (3, 12, 3),  -- Proyecto 2, Especie 12, Investigador 3
    (4, 20, 4),  -- Proyecto 2, Especie 20, Investigador 4
    (5, 25, 5),  -- Proyecto 3, Especie 25, Investigador 5
    (6, 30, 6),  -- Proyecto 3, Especie 30, Investigador 6
    (7, 35, 7),  -- Proyecto 4, Especie 35, Investigador 7
    (8, 40, 8),  -- Proyecto 4, Especie 40, Investigador 8
    (9, 11, 9),  -- Proyecto 5, Especie 45, Investigador 9
    (10, 12, 10); -- Proyecto 5, Especie 50, Investigador 10

    
INSERT INTO vehiculo_vigilancia (tipo, marca, id_vigilante) VALUES
('moto', 'Yamaha', 25),
('automovil', 'Toyota', 26),
('camioneta 4x4', 'Ford', 27),
('moto', 'Honda', 28),
('automovil', 'Chevrolet', 29),
('camioneta 4x4', 'Nissan', 30),
('moto', 'Suzuki', 31),
('automovil', 'Hyundai', 32),
('camioneta 4x4', 'Mitsubishi', 33),
('moto', 'Kawasaki', 34);



insert into visitante (cedula, nombre, direccion, profesion) values
(2000001, 'Pedro Gómez', 'Calle 10 #5-20, Bogotá', 'Biólogo'),
(2000002, 'Ana Ramírez', 'Carrera 15 #23-45, Medellín', 'Ingeniera Ambiental'),
(2000003, 'Luis Torres', 'Avenida 30 #12-56, Cali', 'Docente'),
(2000004, 'Carla Mendoza', 'Diagonal 78 #90-12, Barranquilla', 'Turista'),
(2000005, 'Jorge López', 'Transversal 45 #67-89, Bucaramanga', 'Estudiante'),
(2000006, 'Diana Suárez', 'Calle 98 #76-54, Cartagena', 'Fotógrafa'),
(2000007, 'Fernando Rojas', 'Avenida 21 #43-21, Manizales', 'Investigador'),
(2000008, 'Paola Castro', 'Calle 3 #10-65, Pereira', 'Turista'),
(2000009, 'Jorge Ramírez', 'Carrera 5 #4-3, Ibagué', 'Periodista'),
(2000010, 'Sofia Fernández', 'Calle 12 #4-45, Neiva', 'Ecologista');


INSERT INTO registro_entrada (cedula_visitante, id_parque, fecha_visita, id_personal_gestion) VALUES
(2000001, 1, '2024-03-01', 37),
(2000002, 5, '2024-03-02', 38),
(2000003, 10, '2024-03-03', 39),
(2000004, 15, '2024-03-04', 40),
(2000005, 20, '2024-03-05', 41),
(2000006, 25, '2024-03-06', 42),
(2000007, 30, '2024-03-07', 43),
(2000008, 35, '2024-03-08', 44),
(2000009, 40, '2024-03-09', 45),
(2000010, 45, '2024-03-10', 46);


select * from registro_entrada;

insert into alojamiento (id, nombre, capacidad, categoria, id_parque) values
(1, 'Eco Lodge Amazonas', 20, 'sencillo', 5),
(2, 'Cabañas del Bosque', 15, 'standard', 10),
(3, 'Refugio Andino', 30, 'premium', 15),
(4, 'Posada del Río', 25, 'sencillo', 20),
(5, 'Hotel Selva Viva', 50, 'premium', 25),
(6, 'Camping Natural', 40, 'sencillo', 30),
(7, 'Estancia Los Pinos', 35, 'standard', 35),
(8, 'Hostal La Cascada', 45, 'standard', 40),
(9, 'Resort El Paraíso', 60, 'premium', 45),
(10, 'Cabañas Mirador', 10, 'sencillo', 47);


insert into estancia_visitante (cedula_visitante, id_alojamiento, fecha_entrada, fecha_salida) values
(2000001, 1, '2024-01-05', '2024-01-10'),
(2000002, 2, '2024-02-12', '2024-02-18'),
(2000003, 3, '2024-03-20', '2024-03-25'),
(2000004, 4, '2024-04-15', '2024-04-20'),
(2000005, 5, '2024-05-10', '2024-05-15'),
(2000006, 6, '2024-06-01', '2024-06-06'),
(2000007, 7, '2024-07-07', '2024-07-12'),
(2000008, 8, '2024-08-15', '2024-08-20'),
(2000009, 9, '2024-09-05', '2024-09-10'),
(2000010, 10, '2024-10-22', '2024-10-28');
