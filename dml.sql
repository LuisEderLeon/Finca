INSERT INTO tiposProducto (id, nombre) VALUES
(1, 'Agrícola'),
(2, 'Ganadero'),
(3, 'Lácteo'),
(4, 'Derivado'),
(5, 'Frutas'),
(6, 'Vegetales'),
(7, 'Cereales'),
(8, 'Carne'),
(9, 'Bebidas'),
(10,'Otros');

INSERT INTO productos (id, nombre, precio, idTipo, unidades) VALUES
(0, 'Vacio', 0.0, null, 'unidades'),
(1, 'Aguacate', 3.50, 1, 'kilogramos'),
(2, 'Maíz', 1.20, 1, 'kilogramos'),
(3, 'Leche', 0.85, 3, 'litros'),
(4, 'Queso', 5.00, 4, 'kilogramos'),
(5, 'Mantequilla', 4.00, 4, 'kilogramos'),
(6, 'Res', 6.50, 8, 'kilogramos'),
(7, 'Huevos', 2.50, 2, 'unidades'),
(8, 'Pato', 3.00, 8, 'kilogramos'),
(9, 'Conejo', 2.20, 8, 'kilogramos'),
(10, 'Carne molida', 1.80, 8, 'kilogramos'),
(11, 'Zanahorias', 1.50, 6, 'kilogramos'),
(12, 'Lechuga', 1.00, 6, 'kilogramos'),
(13, 'Tomates', 2.50, 6, 'kilogramos'),
(14, 'Cebollas', 1.70, 6, 'kilogramos'),
(15, 'Avena', 1.90, 7, 'kilogramos'),
(16, 'Arroz', 2.30, 7, 'kilogramos'),
(17, 'Trigo', 1.60, 7, 'kilogramos'),
(18, 'Pollo', 5.50, 8, 'kilogramos'),
(19, 'Cerdo', 7.00, 8, 'kilogramos'),
(20, 'Cerveza artesanal', 3.50, 9, 'litros'),
(21, 'Vino tinto', 12.00, 9, 'litros'),
(22, 'Jugo de naranja', 2.50, 9, 'litros'),
(23, 'Aceite de oliva', 8.50, 4, 'litros'),
(24, 'Harina de maíz', 1.30, 4, 'kilogramos'),
(25, 'Yogurt', 2.00, 3, 'litros'),
(26, 'Crema', 3.50, 3, 'litros'),
(27, 'Miel', 6.00, 2, 'kilogramos'),
(28, 'Fresas', 4.00, 5, 'kilogramos'),
(29, 'Uvas', 3.70, 5, 'kilogramos'),
(30, 'Peras', 2.90, 5, 'kilogramos'),
(31, 'Espinacas', 1.20, 6, 'kilogramos'),
(32, 'Brócoli', 2.00, 6, 'kilogramos'),
(33, 'Pepinos', 1.30, 6, 'kilogramos'),
(34, 'Almendras', 10.00, 7, 'kilogramos'),
(35, 'Nueces', 12.00, 7, 'kilogramos'),
(36, 'Cordero', 15.00, 8, 'kilogramos'),
(37, 'Salmón', 20.00, 8, 'kilogramos'),
(38, 'Tilapia', 7.50, 8, 'kilogramos'),
(39, 'Lana', 3.00, 2, 'kilogramos'),
(40, 'Leche de almendra', 3.20, 4, 'litros'),
(41, 'Cuajada', 4.50, 3, 'kilogramos'),
(42, 'Chorizo', 9.00, 8, 'kilogramos'),
(43, 'Plumas', 18.00, 2, 'kilogramos'),
(44, 'Cerveza rubia', 2.80, 9, 'litros'),
(45, 'Tortillas de maíz', 1.50, 4, 'kilogramos'),
(46, 'Cuero', 2.00, 2, 'unidades'),
(47, 'Lentejas', 1.70, 7, 'kilogramos'),
(48, 'Garbanzos', 2.00, 7, 'kilogramos'),
(49, 'Frijoles', 4.00, 7, 'kilogramos'),
(50, 'Café', 15.00, 1, 'kilogramos');

INSERT INTO alimentos (nombre, precio, stock) VALUES
('Pasto', 10.00, 100),
('Heno', 12.50, 80),
('Granos', 15.00, 150),
('Maíz', 8.75, 200),
('Avena', 9.50, 120),
('Néctar', 20.00, 50),
('Frutas', 18.00, 90),
('Verduras', 7.50, 110),
('Alfalfa', 14.00, 70),
('Zanahorias', 6.00, 130),
('Peces pequeños', 25.00, 5),
('Insectos', 30.00, 60),
('Soja', 16.00, 100),
('Cebada', 11.50, 140),
('Salvado', 9.00, 160),
('Melaza', 22.00, 70),
('Semillas de girasol', 13.00, 80),
('Hierbas frescas', 12.00, 90),
('Frutas deshidratadas', 28.00, 50),
('Piensos compuestos', 17.50, 120),
('Harina de pescado', 24.00, 60),
('Cáscara de arroz', 5.00, 180),
('Cereales integrales', 19.00, 110),
('Trigo', 8.50, 150),
('Remolacha', 7.00, 130),
('Aceite de linaza', 27.00, 40),
('Proteína de soja', 23.00, 70),
('Trozos de carne', 35.00, 30),
('Harina de hueso', 20.00, 50),
('Miel para abejas', 50.00, 10);

INSERT INTO especies (nombre) VALUES
('Vaca'),
('Oveja'),
('Cabra'),
('Pollo'),
('Cerdo'),
('Colmena de abejas'),
('Pato'),
('Conejo'),
('Caballo');

INSERT INTO especieAlimento (idEspecie, idAlimento) VALUES
(1, 1),  -- Vaca - Pasto
(1, 2),  -- Vaca - Heno
(1, 4),  -- Vaca - Maíz
(1, 13), -- Vaca - Soja
(1, 15), -- Vaca - Salvado
(2, 1),  -- Oveja - Pasto
(2, 2),  -- Oveja - Heno
(2, 9),  -- Oveja - Alfalfa
(2, 13), -- Oveja - Soja
(2, 14), -- Oveja - Cebada
(3, 1),  -- Cabra - Pasto
(3, 2),  -- Cabra - Heno
(3, 4),  -- Cabra - Maíz
(3, 9),  -- Cabra - Alfalfa
(3, 16), -- Cabra - Melaza
(4, 3),  -- Pollo - Granos
(4, 5),  -- Pollo - Avena
(4, 11), -- Pollo - Peces pequeños
(4, 12), -- Pollo - Insectos
(4, 19), -- Pollo - Piensos compuestos
(5, 3),  -- Cerdo - Granos
(5, 4),  -- Cerdo - Maíz
(5, 24), -- Cerdo - Remolacha
(5, 27), -- Cerdo - Trozos de carne
(5, 15), -- Cerdo - Salvado
(6, 6),  -- Colmena de abejas - Néctar
(6, 30), -- Colmena de abejas - Miel para abejas
(7, 1),  -- Pato - Pasto
(7, 11), -- Pato - Peces pequeños
(7, 19), -- Pato - Piensos compuestos
(7, 12), -- Pato - Insectos
(7, 9),  -- Pato - Alfalfa
(8, 7),  -- Conejo - Frutas
(8, 8),  -- Conejo - Verduras
(8, 9),  -- Conejo - Alfalfa
(8, 18), -- Conejo - Hierbas frescas
(8, 10), -- Conejo - Zanahorias
(9, 1),  -- Caballo - Pasto
(9, 2),  -- Caballo - Heno
(9, 5),  -- Caballo - Avena
(9, 16), -- Caballo - Melaza
(9, 14); -- Caballo - Cebada

INSERT INTO animales (idEspecie, fechaNacimiento, precio, cantidadAlimento, estadoSalud) VALUES
(1, '2020-03-15', 150.00, 10, 'saludable'),
(1, '2019-05-10', 160.00, 12, 'saludable'),
(1, '2021-01-20', 140.00, 9, 'enfermo'),
(2, '2020-07-11', 200.00, 8, 'saludable'),
(2, '2018-08-25', 180.00, 7, 'muerto'),
(2, '2022-04-13', 210.00, 9, 'saludable'),
(3, '2021-05-07', 220.00, 10, 'saludable'),
(3, '2019-12-15', 230.00, 8, 'saludable'),
(3, '2020-09-25', 190.00, 7, 'enfermo'),
(4, '2021-07-14', 250.00, 5, 'saludable'),
(4, '2022-02-21', 240.00, 4, 'saludable'),
(4, '2019-11-30', 200.00, 6, 'muerto'),
(5, '2020-08-01', 300.00, 15, 'saludable'),
(5, '2019-03-22', 290.00, 13, 'enfermo'),
(5, '2021-11-12', 310.00, 12, 'saludable'),
(6, '2023-05-17', 350.00, 10000, 'saludable'),
(6, '2023-04-10', 340.00, 9500, 'enfermo'),
(6, '2022-09-03', 330.00, 8000, 'saludable'),
(7, '2020-06-25', 370.00, 9, 'saludable'),
(7, '2021-08-05', 360.00, 10, 'muerto'),
(7, '2022-12-30', 380.00, 8, 'enfermo'),
(8, '2021-01-11', 390.00, 6, 'saludable'),
(8, '2020-10-20', 400.00, 7, 'saludable'),
(8, '2019-02-09', 410.00, 5, 'enfermo'),
(9, '2019-06-18', 420.00, 12, 'saludable'),
(9, '2018-03-27', 430.00, 10, 'saludable'),
(9, '2020-09-11', 440.00, 11, 'enfermo'),
(1, '2021-05-23', 450.00, 13, 'saludable'),
(1, '2022-07-14', 460.00, 12, 'muerto'),
(1, '2023-01-03', 470.00, 14, 'saludable'),
(1, '2020-06-30', 150.00, 9, 'saludable'),
(1, '2021-04-25', 160.00, 8, 'enfermo'),
(1, '2018-12-05', 155.00, 10, 'saludable'),
(2, '2019-11-19', 170.00, 7, 'saludable'),
(2, '2021-03-09', 165.00, 9, 'enfermo'),
(2, '2020-02-12', 175.00, 8, 'saludable'),
(3, '2021-09-18', 180.00, 6, 'saludable'),
(3, '2022-12-24', 185.00, 7, 'enfermo'),
(3, '2019-04-04', 190.00, 8, 'saludable'),
(4, '2020-08-15', 195.00, 6, 'muerto'),
(4, '2019-05-21', 200.00, 7, 'saludable'),
(4, '2021-10-02', 205.00, 5, 'saludable'),
(5, '2022-03-05', 210.00, 11, 'enfermo'),
(5, '2020-09-08', 215.00, 12, 'saludable'),
(5, '2021-06-19', 220.00, 13, 'muerto'),
(6, '2023-04-22', 225.00, 10500, 'saludable'),
(6, '2022-10-12', 230.00, 9700, 'enfermo'),
(6, '2020-05-16', 235.00, 9000, 'saludable'),
(7, '2020-05-16', 235.00, 9, 'saludable'),
(7, '2020-05-16', 235.00, 8, 'saludable'),
(5, '2022-03-05', 210.00, 11, 'saludable'),
(5, '2023-09-08', 215.00, 12, 'saludable'),
(5, '2021-06-19', 220.00, 13, 'saludable'),
(5, '2022-03-05', 210.00, 11, 'saludable'),
(5, '2023-09-08', 215.00, 12, 'saludable'),
(5, '2021-06-19', 220.00, 13, 'saludable'),
(5, '2022-03-05', 210.00, 11, 'saludable'),
(5, '2023-09-08', 215.00, 12, 'saludable'),
(5, '2021-06-19', 220.00, 13, 'saludable'),
(5, '2022-03-05', 210.00, 11, 'saludable'),
(5, '2023-09-08', 215.00, 12, 'saludable'),
(5, '2021-06-19', 220.00, 13, 'saludable'),
(5, '2022-03-05', 210.00, 11, 'saludable'),
(5, '2023-09-08', 215.00, 12, 'saludable'),
(5, '2021-06-19', 220.00, 13, 'saludable'),
(5, '2022-03-05', 210.00, 11, 'saludable'),
(5, '2023-09-08', 215.00, 12, 'saludable'),
(5, '2021-06-19', 220.00, 13, 'saludable'),
(5, '2022-03-05', 210.00, 11, 'saludable'),
(6, '2023-09-08', 215.00, 12, 'saludable');

INSERT INTO proveedores (nombre, telefono) VALUES
('Agricultura Verde', '1234567890'),
('Fertilizantes Naturales S.A.', '2345678901'),
('Semillas del Futuro', '3456789012'),
('Herramientas Agropecuarias', '4567890123'),
('Vivero Tropical', '5678901234'),
('Cosechas del Campo', '6789012345'),
('Suministros Rurales', '7890123456'),
('Miel y Pollen', '8901234567'),
('Frutas Frescas Ltda.', '9012345678'),
('Maquinaria Avanzada', '0123456789'),
('Proveedores de Granos', '1234567890'),
('Riego Eficiente', '2345678901'),
('Alimentos para Ganado', '3456789012'),
('Insumos Orgánicos', '4567890123'),
('Servicios Veterinarios', '5678901234'),
('Cuidado del Suelo', '6789012345'),
('Cultivos Sostenibles', '7890123456'),
('Agroquímicos Ecológicos', '8901234567'),
('Productos Lácteos', '9012345678'),
('Finca Orgánica', '0123456789'),
('Abejas y Flores', '1234567890'),
('Productos de Granja', '2345678901'),
('Sistemas de Riego', '3456789012'),
('Cultivo de Aguacate', '4567890123'),
('Tierra Fértil', '5678901234'),
('Ganadería Premium', '6789012345'),
('Cultivos Diversos', '7890123456'),
('Forrajes y Semillas', '8901234567'),
('Tecnología Agrícola', '9012345678'),
('Verde Esperanza', '0123456789'),
('Alimentación Saludable', '1234567890'),
('Abonos Naturales', '2345678901'),
('Semillas de Calidad', '3456789012'),
('Nutrición Animal', '4567890123'),
('Cosecha Verde', '5678901234'),
('Cultivo Sostenible', '6789012345'),
('Agroservicios', '7890123456'),
('Productos del Campo', '8901234567'),
('Energía Solar Agrícola', '9012345678'),
('Asesoría Agronómica', '0123456789'),
('Equipos de Cosecha', '1234567890'),
('Exportación Agrícola', '2345678901'),
('Abonos Orgánicos', '3456789012'),
('Desarrollo Rural', '4567890123'),
('Servicios de Irrigación', '5678901234'),
('Proyectos Agropecuarios', '6789012345'),
('Distribución de Productos', '7890123456'),
('Cosechas Selectas', '8901234567'),
('Aliados Agropecuarios', '9012345678'),
('Soluciones Agrícolas', '0123456789'),
('Cultivos Innovadores', '1234567890');


INSERT INTO compras (fecha, idProveedor, total) VALUES
('2023-01-01', 1, 0),
('2023-01-02', 2, 0),
('2023-01-03', 3, 0),
('2023-01-04', 4, 0),
('2023-01-05', 5, 0),
('2023-01-06', 6, 0),
('2023-01-07', 7, 0),
('2023-01-08', 8, 0),
('2023-01-09', 9, 0),
('2023-01-10', 10, 0),
('2023-01-11', 11, 0),
('2023-01-12', 12, 0),
('2023-01-13', 13, 0),
('2023-01-14', 14, 0),
('2023-01-15', 15, 0),
('2023-01-16', 16, 0),
('2023-01-17', 17, 0),
('2023-01-18', 18, 0),
('2023-01-19', 19, 0),
('2023-01-20', 20, 0),
('2023-01-21', 21, 0),
('2023-01-22', 22, 0),
('2023-01-23', 23, 0),
('2023-01-24', 24, 0),
('2023-01-25', 25, 0),
('2023-01-26', 26, 0),
('2023-01-27', 27, 0),
('2023-01-28', 28, 0),
('2023-01-29', 29, 0),
('2023-01-30', 30, 0),
('2023-01-31', 31, 0),
('2023-02-01', 32, 0),
('2023-02-02', 33, 0),
('2023-02-03', 34, 0),
('2023-02-04', 35, 0),
('2023-02-05', 36, 0),
('2023-02-06', 37, 0),
('2023-02-07', 38, 0),
('2023-02-08', 39, 0),
('2023-02-09', 40, 0),
('2023-02-10', 41, 0),
('2023-02-11', 42, 0),
('2023-02-12', 43, 0),
('2023-02-13', 44, 0),
('2023-02-14', 45, 0),
('2023-02-15', 46, 0),
('2023-02-16', 47, 0),
('2023-02-17', 48, 0),
('2023-02-18', 49, 0),
('2024-10-19', 50, 0);

INSERT INTO maquinarias (marca, modelo, estado, cantidad, precio, fechaCompra) VALUES
('John Deere', 'JD-5055E', 'uso', 2, 25000, '2021-03-15'),
('Case IH', 'Farmall 75A', 'uso', 2, 27000, '2020-07-10'),
('New Holland', 'T4.75', 'stock', 2, 23000, '2022-01-20'),
('Kubota', 'M7060', 'uso', 2, 26000, '2019-05-10'),
('Massey Ferguson', 'MF 4710', 'stock', 2, 24000, '2021-06-18'),
('John Deere', 'JD-5075E', 'uso', 2, 28000, '2022-04-14'),
('Kubota', 'L4701', 'stock', 2, 22000, '2020-09-25'),
('Case IH', 'Magnum 250', 'uso', 2, 32000, '2021-07-10'),
('Massey Ferguson', 'MF 5700', 'stock', 2, 25000, '2018-11-30'),
('New Holland', 'T5.95', 'uso', 2, 29000, '2023-02-01'),
('John Deere', 'JD-5065E', 'stock', 2, 26000, '2019-08-25'),
('Kubota', 'M5-111', 'uso', 2, 28000, '2020-12-20'),
('Case IH', 'Maxxum 150', 'stock', 2, 31000, '2021-11-25'),
('Massey Ferguson', 'MF 6713', 'uso', 2, 27000, '2019-03-22'),
('New Holland', 'T6.145', 'stock', 2, 32000, '2020-05-15'),
('John Deere', 'JD-5090E', 'uso', 2, 30000, '2021-09-05'),
('Case IH', 'Puma 185', 'stock', 2, 35000, '2022-07-18'),
('Kubota', 'M6-141', 'uso', 2, 33000, '2021-10-30'),
('Massey Ferguson', 'MF 6715', 'stock', 2, 34000, '2023-03-25'),
('New Holland', 'T7.165', 'uso', 2, 31000, '2020-04-11'),
('John Deere', 'JD-6105E', 'uso', 2, 28000, '2019-07-15'),
('Case IH', 'Farmall 115A', 'stock', 2, 29000, '2021-01-08'),
('Massey Ferguson', 'MF 4708', 'uso', 2, 26000, '2022-05-23'),
('Kubota', 'L6060', 'stock', 2, 27000, '2020-06-20'),
('New Holland', 'T6.180', 'uso', 2, 32000, '2021-12-17'),
('John Deere', 'JD-5115M', 'stock', 2, 29000, '2019-02-15'),
('Case IH', 'Farmall 130A', 'uso', 2, 28000, '2022-03-19'),
('Massey Ferguson', 'MF 4709', 'stock', 2, 25000, '2020-08-14'),
('Kubota', 'M135GX', 'uso', 2, 34000, '2021-04-22'),
('New Holland', 'T8.275', 'stock', 2, 36000, '2022-09-08'),
('John Deere', 'JD-6145M', 'uso', 2, 35000, '2023-05-11'),
('Case IH', 'Farmall 110A', 'stock', 2, 30000, '2020-07-05'),
('Massey Ferguson', 'MF 7720', 'uso', 2, 37000, '2019-06-21'),
('Kubota', 'M7-151', 'stock', 2, 33000, '2021-03-12'),
('New Holland', 'T9.565', 'uso', 2, 40000, '2022-10-27'),
('John Deere', 'JD-5125R', 'stock', 2, 31000, '2019-09-10'),
('Case IH', 'Puma 200', 'uso', 2, 34000, '2020-01-03'),
('Massey Ferguson', 'MF 8727', 'stock', 2, 38000, '2023-04-02'),
('Kubota', 'M8-181', 'uso', 2, 35000, '2020-03-08'),
('New Holland', 'T7.270', 'stock', 2, 37000, '2021-06-30'),
('John Deere', 'JD-6130M', 'uso', 2, 29000, '2018-10-25'),
('Case IH', 'Maxxum 145', 'stock', 2, 32000, '2022-02-12'),
('Massey Ferguson', 'MF 5710', 'uso', 2, 30000, '2021-05-09'),
('Kubota', 'L3560', 'stock', 2, 27000, '2020-11-04'),
('New Holland', 'T5.110', 'uso', 2, 28000, '2023-06-19'),
('John Deere', 'JD-6155R', 'stock', 2, 35000, '2020-04-18'),
('Case IH', 'Magnum 315', 'uso', 2, 37000, '2022-08-01'),
('Massey Ferguson', 'MF 8740', 'stock', 2, 40000, '2021-12-09'),
('John Deere', 'TB-4030', 'uso', 2, 29000, '2022-06-22'),
('Kubota', 'BX1880', 'uso', 2, 22000, '2020-09-22');


INSERT INTO compraAnimales (idCompra, idAnimal) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 7),
(3, 8),
(3, 9),
(4, 10),
(4, 11),
(4, 12),
(5, 13),
(5, 14),
(5, 15),
(6, 16),
(6, 17),
(6, 18),
(7, 19),
(7, 20),
(7, 21),
(8, 22),
(8, 23),
(8, 24),
(9, 25),
(9, 26),
(9, 27),
(10, 28),
(10, 29),
(10, 30),
(11, 31),
(11, 32),
(11, 33),
(12, 34),
(12, 35),
(12, 36),
(13, 37),
(13, 38),
(13, 39),
(14, 40),
(14, 41),
(14, 42),
(15, 43),
(15, 44),
(15, 45),
(16, 46),
(16, 47),
(16, 48),
(17, 49),
(17, 50);

INSERT INTO compraAlimentos (idCompra, idAlimento, cantidad, subtotal) VALUES
(1, 1, 100, null),
(1, 2, 50, null),
(2, 3, 150, null),
(2, 4, 80, null),
(3, 5, 200, null),
(3, 6, 60, null),
(4, 7, 100, null),
(4, 8, 120, null),
(5, 9, 90, null),
(5, 10, 70, null),
(6, 11, 40, null),
(6, 12, 30, null),
(7, 13, 110, null),
(7, 14, 80, null),
(8, 15, 50, null),
(8, 1, 150, null),
(9, 2, 100, null),
(9, 3, 70, null),
(10, 4, 90, null),
(10, 5, 60, null),
(11, 6, 80, null),
(11, 7, 150, null),
(12, 8, 120, null),
(12, 9, 100, null),
(13, 10, 90, null),
(13, 11, 80, null),
(14, 12, 50, null),
(14, 13, 200, null),
(15, 14, 60, null),
(15, 15, 70, null),
(16, 1, 90, null),
(16, 2, 50, null),
(17, 3, 100, null),
(17, 4, 80, null),
(18, 5, 110, null),
(18, 6, 90, null),
(19, 7, 120, null),
(19, 8, 80, null),
(20, 9, 70, null),
(20, 10, 60, null),
(21, 11, 50, null),
(21, 12, 100, null),
(22, 13, 70, null),
(22, 14, 80, null),
(23, 15, 90, null),
(23, 1, 50, null),
(24, 2, 60, null),
(24, 3, 80, null),
(25, 4, 90, null),
(25, 5, 100, null),
(26, 6, 70, null),
(26, 7, 110, null),
(27, 8, 60, null),
(27, 9, 50, null),
(28, 10, 90, null),
(28, 11, 80, null),
(29, 12, 100, null),
(29, 13, 70, null),
(30, 14, 50, null);

INSERT INTO compraMaquinaria (idCompra, idMaquinaria, cantidad, subtotal) VALUES
(31, 1  , 1, null),
(31, 2  , 1, null),
(32, 3  , 1, null),
(32, 4  , 1, null),
(33, 5  , 1, null),
(33, 6  , 1, null),
(34, 7  , 1, null),
(34, 8  , 1, null),
(35, 9  , 1, null),
(35, 10 , 1, null),
(36, 11 , 1, null),
(36, 12 , 1, null),
(37, 13 , 1, null),
(37, 14 , 1, null),
(38, 15 , 1, null),
(38, 16 , 1, null),
(39, 17 , 1, null),
(39, 18 , 1, null),
(40, 19 , 1, null),
(40, 20 , 1, null),
(41, 21 , 1, null),
(41, 22 , 1, null),
(42, 23 , 1, null),
(42, 24 , 1, null),
(43, 25 , 1, null),
(43, 26 , 1, null),
(44, 27 , 1, null),
(44, 28 , 1, null),
(45, 29 , 1, null),
(45, 30 , 1, null),
(46, 31 , 1, null),
(46, 32 , 1, null),
(47, 33 , 1, null),
(47, 34 , 1, null),
(48, 35 , 1, null),
(48, 36 , 1, null),
(49, 37 , 1, null),
(49, 38 , 1, null),
(50, 39 , 1, null),
(50, 40 , 1, null),
(31, 41 , 1, null),
(31, 42 , 1, null),
(32, 43 , 1, null),
(32, 44 , 1, null),
(33, 45 , 1, null),
(33, 46 , 1, null),
(34, 47 , 1, null),
(34, 48 , 1, null),
(35, 49 , 1, null),
(35, 50 , 1, null),
(36, 1  , 1, null),
(36, 2  , 1, null),
(37, 3  , 1, null),
(37, 4  , 1, null),
(38, 5  , 1, null),
(38, 6  , 1, null),
(39, 7  , 1, null),
(39, 8  , 1, null),
(40, 9  , 1, null);



INSERT INTO funciones (nombre) VALUES
('Gestión de animales'),
('Gestión de cultivos'),
('Gestión de maquinas');

INSERT INTO empleados (nombre, fechaNacimiento, idFuncion, telefono, fechaContratacion) VALUES
('Juan Pérez', '1985-03-15', 1, '555-1234', '2020-01-10'),
('Ana Gómez', '1990-07-22', 2, '555-5678', '2019-06-05'),
('Carlos Fernández', '1978-11-30', 3, '555-9101', '2018-09-12'),
('María López', '1995-02-11', 1, '555-1122', '2021-03-01'),
('Luis Martínez', '1982-04-25', 2, '555-3344', '2020-05-22'),
('Laura Sánchez', '1988-09-10', 3, '555-5566', '2019-11-14'),
('José Rodríguez', '1992-06-18', 1, '555-7788', '2021-07-23'),
('Clara Ortega', '1987-12-05', 2, '555-9900', '2018-08-30'),
('Pedro Romero', '1980-01-20', 3, '555-2211', '2019-02-17'),
('Lucía Torres', '1993-03-09', 1, '555-4433', '2021-11-08'),
('Andrés Muñoz', '1979-05-14', 2, '555-6655', '2020-04-12'),
('Sofía Herrera', '1994-08-02', 3, '555-8877', '2019-10-05'),
('Diego Ruiz', '1985-10-22', 1, '555-9909', '2020-06-15'),
('Eva Rivas', '1990-01-30', 2, '555-1212', '2021-08-20'),
('Daniel Castro', '1976-12-19', 3, '555-2323', '2018-12-10'),
('Sara Mendoza', '1996-04-07', 1, '555-3434', '2019-07-15'),
('Roberto Vargas', '1981-09-13', 2, '555-4545', '2020-09-09'),
('Carmen Ibáñez', '1984-11-04', 3, '555-5656', '2019-01-18'),
('Miguel Gil', '1991-03-25', 1, '555-6767', '2021-02-20'),
('Elena Castro', '1989-06-07', 2, '555-7878', '2020-05-11'),
('Raúl Villanueva', '1986-09-29', 3, '555-8989', '2018-07-22'),
('Paula Ramos', '1994-11-19', 1, '555-9090', '2021-03-31'),
('Enrique León', '1983-02-12', 2, '555-0101', '2019-11-28'),
('Gloria Serrano', '1995-05-30', 3, '555-1213', '2020-07-02'),
('Alfredo Espinoza', '1987-07-16', 1, '555-1314', '2019-06-03'),
('Esteban Flores', '1990-10-26', 2, '555-1415', '2021-12-07'),
('Patricia Aguilar', '1982-03-07', 3, '555-1516', '2020-08-25'),
('Jorge Paredes', '1993-05-11', 1, '555-1617', '2019-09-10'),
('Manuel Vega', '1989-08-28', 2, '555-1718', '2021-05-29'),
('Sandra Rivera', '1984-10-05', 3, '555-1819', '2020-01-21'),
('Gabriel Romero', '1978-12-25', 1, '555-1920', '2018-11-11'),
('Beatriz Silva', '1991-03-14', 2, '555-2021', '2019-04-05'),
('Álvaro Reyes', '1980-07-08', 3, '555-2122', '2021-10-17'),
('Adriana Campos', '1988-09-21', 1, '555-2223', '2020-03-08'),
('Felipe Suárez', '1979-06-17', 2, '555-2324', '2019-12-30'),
('Isabel Figueroa', '1986-02-22', 3, '555-2425', '2021-07-14'),
('David Miranda', '1990-11-09', 1, '555-2526', '2020-05-19'),
('David Miranda', '1990-11-09', 1, '555-2526', '2020-05-19'),
('Marisol Reyes', '1993-04-13', 2, '555-2627', '2018-06-25'),
('Pablo Ramos', '1982-05-22', 3, '555-2728', '2020-11-22'),
('Silvia Ortiz', '1987-10-28', 1, '555-2829', '2019-07-29'),
('Fernando Molina', '1985-01-16', 2, '555-2930', '2020-02-03'),
('Alicia Durán', '1992-12-03', 3, '555-3031', '2021-08-05'),
('Javier Lara', '1977-08-18', 1, '555-3132', '2020-04-06'),
('Javier Lara', '1977-08-18', 1, '555-3132', '2020-04-06'),
('Camila López', '1983-03-09', 2, '555-3233', '2019-10-18'),
('Mateo Bravo', '1989-11-05', 3, '555-3334', '2021-06-21'),
('Daniela Acosta', '1996-01-27', 1, '555-3435', '2020-12-15'),
('Daniela Acosta', '1996-01-27', 1, '555-3435', '2020-12-15'),
('Antonio Pérez', '1982-02-17', 2, '555-3536', '2021-09-27');

INSERT INTO produccion (idAnimal, idProducto, idEmpleado, idMaquinaria, cantidad) VALUES
(1, 3, 12, 5, 7),
(2, 4, 23, 10, 3),
(7, 5, 34, 15, 15),
(8, 25, 41, 20, 9),
(31, 26, 19, 25, 12),
(33, 41, 10, 30, 5),
(37, 3, 27, 35, 18),
(39, 4, 48, 40, 2),
(1, 5, 15, 45, 10),
(2, 25, 30, 50, 8),
(7, 26, 11, 6, 4),
(8, 41, 38, 7, 11),
(31, 3, 29, 12, 14),
(33, 4, 3, 18, 6),
(37, 5, 20, 26, 17),
(39, 25, 44, 34, 13),
(1, 26, 7, 8, 1),
(2, 41, 42, 22, 16),
(7, 3, 25, 39, 19),
(8, 4, 1, 46, 20),
(10, 6, 5, 1, 3),
(11, 6, 8, 2, 1),
(19, 6, 15, 3, 4),
(41, 6, 22, 4, 2),
(42, 6, 25, 5, 5),
(49, 6, 30, 6, 2),
(50, 6, 35, 7, 1),
(10, 6, 40, 8, 4),
(11, 6, 45, 9, 3),
(19, 6, 12, 10, 5),
(41, 6, 14, 11, 1),
(42, 6, 18, 12, 2),
(49, 6, 20, 13, 3),
(50, 6, 24, 14, 4),
(10, 6, 26, 15, 5),
(11, 6, 29, 16, 2),
(19, 6, 31, 17, 1),
(41, 6, 33, 18, 4),
(42, 6, 37, 19, 3),
(49, 6, 39, 20, 5);

INSERT INTO parcelas (idProducto, cantidad, area, fechaCultivo)
VALUES
(0, 0, 10.5, now()),
(0, 0, 15.2, now()),
(0, 0, 5.0, now()),
(0, 0, 3.8, now()),
(0, 0, 4.5, now()),
(0, 0, 2.7, now()),
(0, 0, 3.0, now()),
(0, 0, 12.3, now()),
(0, 0, 20.0, now()),
(0, 0, 20.0, now()),
(0, 0, 20.0, now()),
(0, 0, 20.0, now()),
(0, 0, 18.0, now()),
(0, 0, 3.0, now()),
(0, 0, 4.8, now()),
(0, 0, 5.7, now()),
(0, 0, 6.0, now()),
(0, 0, 2.5, now()),
(0, 0, 4.2, now()),
(0, 0, 8.5, now()),
(0, 0, 7.3, now()),
(0, 0, 10.0, now());

INSERT INTO clientes (nombre, telefono, fechaNacimiento) VALUES
('Carlos Martínez', '5512345678', '1980-05-12'),
('María González', '5519876543', '1992-08-23'),
('Juan Pérez', '5587654321', '1985-11-30'),
('Ana Torres', '5598765432', '1990-01-15'),
('Pedro Sánchez', '5581234567', '1978-07-09'),
('Luisa Morales', '5595432167', '1982-03-28'),
('Rosa Fernández', '5523456789', '1995-12-03'),
('Miguel Romero', '5567894321', '1988-09-19'),
('Sofía Méndez', '5587659876', '1989-04-27'),
('Daniel Herrera', '5511122334', '1991-02-11'),
('Andrea Jiménez', '5534567890', '1983-10-22'),
('Ricardo López', '5522334455', '1993-05-07'),
('Clara Ríos', '5576543210', '1986-06-14'),
('Sergio Navarro', '5511223344', '1979-11-05'),
('Elena Castillo', '5599998888', '1994-07-21'),
('Héctor Aguirre', '5588776655', '1981-04-04'),
('Laura Rivera', '5523459876', '1990-03-10'),
('Fernando Paredes', '5532109876', '1987-09-30'),
('Patricia Mendoza', '5589012345', '1992-12-25'),
('Roberto Vargas', '5591234567', '1984-08-02'),
('Carmen Silva', '5578123456', '1989-07-18'),
('Oscar Rojas', '5543210987', '1985-06-05'),
('Gloria Castro', '5513456789', '1977-09-12'),
('Javier Reyes', '5565432109', '1991-02-28'),
('Alicia García', '5598764321', '1986-10-14'),
('Julio Vega', '5587651234', '1983-01-25'),
('Emilia Ortega', '5529876543', '1994-11-11'),
('Adrián Peña', '5532104321', '1987-03-03'),
('Mónica Flores', '5576123456', '1992-06-20'),
('Francisco Campos', '5512340987', '1988-05-01'),
('Diana León', '5545678912', '1985-08-15'),
('Santiago Núñez', '5521234567', '1990-09-08'),
('Verónica Ruiz', '5587658765', '1984-07-04'),
('Luis Ortega', '5512345670', '1995-01-17'),
('Natalia Suárez', '5590123456', '1989-11-25'),
('Guillermo Torres', '5576540987', '1983-02-14'),
('Blanca Ramírez', '5586543210', '1979-10-31'),
('Raúl Morales', '5534561234', '1993-06-28'),
('Lucía Gómez', '5523458901', '1987-12-19'),
('Armando Espinoza', '5547890123', '1990-04-05'),
('Viviana Estrada', '5598761234', '1992-09-26'),
('Carlos Ortega', '5528765432', '1985-05-19'),
('Marina Villalobos', '5581234321', '1988-03-22'),
('Eduardo Cabrera', '5517654321', '1991-07-30'),
('Estefanía Lara', '5593210987', '1989-11-14'),
('Iván Castillo', '5567891234', '1983-04-12'),
('Valeria Aguayo', '5589543210', '1992-02-09'),
('Manuel Duarte', '5590127654', '1984-06-18'),
('Irene Herrera', '5523456780', '1987-10-25');


INSERT INTO mantenimiento (idEmpleado, idMaquinaria, fechaInicio, fechaFin)
VALUES
(1, 1, '2024-01-01 08:00:00', '2024-01-05 17:00:00'),
(2, 2, '2024-01-02 09:00:00', '2024-01-06 16:00:00'),
(3, 3, '2024-01-03 10:00:00', '2024-01-07 15:00:00'),
(4, 4, '2024-01-04 08:30:00', '2024-01-08 14:30:00'),
(5, 5, '2024-01-05 07:45:00', '2024-01-09 13:45:00'),
(6, 6, '2024-01-06 08:15:00', '2024-01-10 15:15:00'),
(7, 7, '2024-01-07 09:00:00', '2024-01-11 16:00:00'),
(8, 8, '2024-01-08 10:00:00', '2024-01-12 17:00:00'),
(9, 9, '2024-01-09 08:00:00', '2024-01-13 18:00:00'),
(10, 10, '2024-01-10 08:30:00', '2024-01-14 14:30:00'),
(11, 11, '2024-01-11 09:15:00', '2024-01-15 15:15:00'),
(12, 12, '2024-01-12 10:30:00', '2024-01-16 16:30:00'),
(13, 13, '2024-01-13 07:45:00', '2024-01-17 14:45:00'),
(14, 14, '2024-01-14 09:00:00', '2024-01-18 15:00:00'),
(15, 15, '2024-01-15 08:15:00', '2024-01-19 16:15:00'),
(16, 16, '2024-01-16 10:00:00', '2024-01-20 18:00:00'),
(17, 17, '2024-01-17 08:00:00', '2024-01-21 17:00:00'),
(18, 18, '2024-01-18 09:30:00', '2024-01-22 15:30:00'),
(19, 19, '2024-01-19 07:45:00', '2024-01-23 16:45:00'),
(20, 20, '2024-01-20 08:15:00', '2024-01-24 14:15:00'),
(21, 21, '2024-01-21 09:00:00', '2024-01-25 15:00:00'),
(22, 22, '2024-01-22 10:00:00', '2024-01-26 16:00:00'),
(23, 23, '2024-01-23 08:30:00', '2024-01-27 14:30:00'),
(24, 24, '2024-01-24 09:15:00', '2024-01-28 15:15:00'),
(25, 25, '2024-01-25 10:30:00', '2024-01-29 16:30:00'),
(26, 26, '2024-01-26 08:00:00', '2024-01-30 17:00:00'),
(27, 27, '2024-01-27 09:30:00', '2024-01-31 15:30:00'),
(28, 28, '2024-01-28 08:15:00', '2024-02-01 14:15:00'),
(29, 29, '2024-01-29 09:00:00', '2024-02-02 15:00:00'),
(30, 30, '2024-01-30 10:00:00', '2024-02-03 16:00:00'),
(31, 31, '2024-01-31 08:30:00', '2024-02-04 14:30:00'),
(32, 32, '2024-02-01 09:15:00', '2024-02-05 15:15:00'),
(33, 33, '2024-02-02 10:30:00', '2024-02-06 16:30:00'),
(34, 34, '2024-02-03 08:00:00', '2024-02-07 17:00:00'),
(35, 35, '2024-02-04 09:30:00', '2024-02-08 15:30:00'),
(36, 36, '2024-02-05 08:15:00', '2024-02-09 14:15:00'),
(37, 37, '2024-02-06 09:00:00', '2024-02-10 15:00:00'),
(38, 38, '2024-02-07 10:00:00', '2024-02-11 16:00:00'),
(39, 39, '2024-02-08 08:30:00', '2024-02-12 14:30:00'),
(40, 40, '2024-02-09 09:15:00', '2024-02-13 15:15:00'),
(41, 41, '2024-02-10 10:30:00', '2024-02-14 16:30:00'),
(42, 42, '2024-02-11 08:00:00', '2024-02-15 17:00:00'),
(43, 43, '2024-02-12 09:30:00', '2024-02-16 15:30:00'),
(44, 44, '2024-02-13 08:15:00', '2024-02-17 14:15:00'),
(45, 45, '2024-02-14 09:00:00', '2024-02-18 15:00:00'),
(46, 46, '2024-02-15 10:00:00', '2024-02-19 16:00:00'),
(47, 47, '2024-02-16 08:30:00', '2024-02-20 14:30:00'),
(48, 48, '2024-02-17 09:15:00', '2024-02-21 15:15:00'),
(49, 49, '2024-02-18 10:30:00', '2024-02-22 16:30:00'),
(50, 50, '2024-02-19 08:00:00', '2024-02-23 17:00:00');

insert into ventas (fecha,idCliente,idEmpleado,total) values
(now(),1,1,10)
;

insert into detallesventa (idVenta,idProducto,cantidad,subtotal) values
(1,1,10,null),
(1,2,5,null),
(2,2,3,null),
(3,3,11,null)
;

-- ventas 
-- cosecha
-- cultivo
-- detalles ventas  

call cultivar(1,    1,  2,  1,  5);
call cultivar(2,    2,  2,  2,  6);
call cultivar(11,   3,  5,  3,  2);
call cultivar(12,   4,  5,  4,  3);
call cultivar(13,   5,  8,  5,  1);
call cultivar(14,   6,  8,  6,  8);
call cultivar(15,   7,  11, 7,  9);
call cultivar(16,   8,  11, 8,  10);
call cultivar(17,   9,  14, 9,  2);

-- cosechar

call cosechar(1,    1,  2,  1,  5);
call cosechar(2,    2,  2,  2,  6);
call cosechar(11,   3,  5,  3,  2);
call cosechar(12,   4,  5,  4,  3);
call cosechar(13,   5,  8,  5,  1);
call cosechar(14,   6,  8,  6,  8);
call cosechar(15,   7,  11, 7,  9);
call cosechar(16,   8,  11, 8,  10);
