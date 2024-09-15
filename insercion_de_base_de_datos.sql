
--CREATE DATABASE reporte_ventas_cursos
--GO
--USE reporte_ventas_cursos


-- 1. Tabla Clientes
CREATE TABLE [clientes] (
    [id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [nombres_cliente] NVARCHAR(200) NOT NULL,
    [apellidos_cliente] NVARCHAR(200) NOT NULL,
	 [celular] varchar (20) NOT NULL, 
	 [email] varchar (255) NOT NULL,
    [fecha_registro] DATETIME DEFAULT GETDATE()
);
GO

INSERT INTO [clientes] ( nombres_cliente, apellidos_cliente, celular, email, fecha_registro) VALUES
( 'Juan', 'Pérez', '912345678', 'juan.perez@gmail.com', '2024-01-15'),
( 'Ana', 'Gómez', '923456789', 'ana.gomez@gmail.com', '2024-01-20'),
('Luis', 'Martínez', '934567890', 'luis.martinez@gmail.com', '2024-02-05'),
('María', 'López', '945678901', 'maria.lopez@gmail.com', '2024-02-15'),
( 'Carlos', 'Hernández', '956789012', 'carlos.hernandez@gmail.com', '2024-03-01'),
( 'Isabel', 'Morales', '971234567', 'isabel.morales@gmail.com', '2024-03-10'),
( 'Pedro', 'Ruiz', '982345678', 'pedro.ruiz@gmail.com', '2024-03-20'),
( 'Laura', 'Fernández', '993456789', 'laura.fernandez@gmail.com', '2024-04-05'),
( 'Ricardo', 'Santos', '904567890', 'ricardo.santos@gmail.com', '2024-04-15'),
( 'Patricia', 'Vásquez', '915678901', 'patricia.vasquez@gmail.com', '2024-05-01'),
( 'Marta', 'Ramos', '926789012', 'marta.ramos@gmail.com', '2024-05-10'),
( 'Javier', 'Torres', '937890123', 'javier.torres@gmail.com', '2024-05-20'),
( 'Sandra', 'Mendoza', '948901234', 'sandra.mendoza@gmail.com', '2024-06-05'),
( 'Oscar', 'Castro', '959012345', 'oscar.castro@gmail.com', '2024-06-15'),
('Verónica', 'García', '970123456', 'veronica.garcia@gmail.com', '2024-07-01'),
('Gabriel', 'Jiménez', '981234567', 'gabriel.jimenez@gmail.com', '2024-07-10'),
( 'Elena', 'Moreno', '992345678', 'elena.moreno@gmail.com', '2024-07-20'),
('Ricardo', 'Hidalgo', '903456789', 'ricardo.hidalgo@gmail.com', '2024-08-05'),
( 'Raquel', 'Silva', '914567890', 'raquel.silva@gmail.com', '2024-08-15'),
( 'Julio', 'Paredes', '925678901', 'julio.paredes@gmail.com', '2024-09-01'),
( 'Ana', 'Cruz', '936789012', 'ana.cruz@gmail.com', '2024-09-10'),
('Carlos', 'Núñez', '947890123', 'carlos.nunez@gmail.com', '2024-09-20'),
( 'Julia', 'Medina', '958901234', 'julia.medina@gmail.com', '2024-10-05'),
( 'Manuel', 'Gómez', '969012345', 'manuel.gomez@gmail.com', '2024-10-15'),
('Rosa', 'Córdoba', '980123456', 'rosa.cordoba@gmail.com', '2024-11-01'),
( 'Alberto', 'Ortiz', '991234567', 'alberto.ortiz@gmail.com', '2024-11-10'),
('Silvia', 'Vargas', '902345678', 'silvia.vargas@gmail.com', '2024-11-20'),
('David', 'Rivas', '913456789', 'david.rivas@gmail.com', '2024-12-01'),
( 'Carmen', 'Arias', '924567890', 'carmen.arias@gmail.com', '2024-12-10'),
( 'Luis', 'Reyes', '935678901', 'luis.reyes@gmail.com', '2024-12-15');




-- 2. Tabla curso
CREATE TABLE [curso] (
    [id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [nombre] NVARCHAR(100) NOT NULL,
    [categoría] NVARCHAR(255) NOT NULL,
	[duración_horas] numeric(4) NOT NULL,

);
GO

INSERT INTO [curso] (nombre, categoría, duración_horas) VALUES
('Machine Learning', 'curso', 120),
('Apache Spark', 'curso', 90),
('Power BI', 'especialización', 100),
('Data Science', 'curso', 150),
('Big Data', 'especialización', 200),
('Deep Learning', 'curso', 110),
('Data Engineering', 'curso', 80),
('AI Fundamentals', 'especialización', 120),
('Advanced SQL', 'curso', 140),
('Cloud Computing', 'especialización', 180);


-- 3. Tabla  trabajadores
CREATE TABLE [trabajadores] (
    [id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [nombres_trabajador] NVARCHAR(200) NOT NULL,
    [apellidos_trabajador] NVARCHAR(200) NOT NULL,
	[supervisor_id] INT NULL,
	[fecha_ingreso] DATE NOT NULL,
	FOREIGN KEY (supervisor_id) references trabajadores(id), 
);
GO

-- Supervisores
INSERT INTO [trabajadores] (nombres_trabajador, apellidos_trabajador, supervisor_id, fecha_ingreso) VALUES
('Pedro', 'Ruiz', NULL, '2023-01-15'),
('Laura', 'Fernández', NULL, '2023-02-01'),

-- Empleados para el supervisor 1
('Gabriel', 'Mendoza', 1, '2023-03-20'),
('Sofía', 'Vásquez', 1, '2023-04-10'),
('Javier', 'Cano', 1, '2023-05-15'),
('Marta', 'Ramos', 1, '2023-06-10'),
('Oscar', 'Castro', 1, '2023-07-05'),

-- Empleados para el supervisor 2
('Carlos', 'Núñez', 2, '2023-08-15'),
('Ana', 'Cruz', 2, '2023-09-20'),
('Julia', 'Medina', 2, '2023-10-25'),
('Manuel', 'Gómez', 2, '2023-11-10'),
('Rosa', 'Córdoba', 2, '2023-12-01');




-- 4. Tabla compra
CREATE TABLE [compra] (
    [id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[fecha_compra] DATETIME DEFAULT GETDATE(),
	[estado_de_compra] VARCHAR(55) NOT NULL,
	[monto_de_compra] MONEY NOT NULL,
    [cliente_id] INT NOT NULL,
	[asesor_id] INT NOT NULL,
	[curso_id] INT NOT NULL, 
	FOREIGN KEY ([cliente_id]) REFERENCES [clientes]([id]),
   FOREIGN KEY ([curso_id]) REFERENCES [curso]([id]),
   FOREIGN KEY ([asesor_id]) REFERENCES [trabajadores]([id]),
	
);
GO

-- Inserciones en la Tabla compra
INSERT INTO [compra] (fecha_compra, estado_de_compra, monto_de_compra, cliente_id, asesor_id, curso_id) VALUES
('2024-09-01', 'confirmada', 200.00, 1, 11, 1),
('2024-09-02', 'confirmada', 150.00, 2, 12, 2),
('2024-09-03', 'cancelada', 120.00, 3, 12, 3),
('2024-09-04', 'confirmada', 100.00, 4, 11, 6),
('2024-09-05', 'confirmada', 75.00, 5, 6, 7),
('2024-09-06', 'confirmada', 200.00, 6, 11, 5),
('2024-09-07', 'cancelada', 150.00, 7, 12, 4),
('2024-09-08', 'confirmada', 250.00, 8, 7, 8),
('2024-09-09', 'confirmada', 300.00, 9, 4, 9),
('2024-09-10', 'confirmada', 100.00, 10, 8, 10),
('2024-09-11', 'confirmada', 150.00, 1, 11, 3),
('2024-09-12', 'confirmada', 200.00, 2, 12, 4),
('2024-09-13', 'cancelada', 120.00, 3, 3, 3),
('2024-09-14', 'confirmada', 180.00, 4, 10, 1),
('2024-09-15', 'confirmada', 75.00, 5, 5, 2),
('2024-09-16', 'confirmada', 90.00, 6, 9, 3),
('2024-09-17', 'cancelada', 200.00, 7, 12, 4),
('2024-09-18', 'confirmada', 160.00, 8, 9, 5),
('2024-09-19', 'confirmada', 210.00, 9, 4, 1),
('2024-09-20', 'confirmada', 250.00, 10, 5, 2);


-- 5. Tabla  Cuotas
CREATE TABLE [cuotas] (
    [id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [numero_cuota] INT NOT NULL,
    [monto] MONEY NOT NULL,
    [fecha_vencimiento] DATE NOT NULL,
    [estado_cuota] NVARCHAR(20) NOT NULL,
);
GO
INSERT INTO [cuotas] (numero_cuota, monto, fecha_vencimiento, estado_cuota) VALUES
(1, 400.00, '2024-10-15', 'pendiente'),
(2, 400.00, '2024-11-15', 'pendiente'),
(1, 500.00, '2024-10-20', 'pagado'),
(2, 500.00, '2024-11-20', 'pendiente'),
(1, 3000.00, '2024-09-30', 'vencida'),
(1, 450.00, '2024-10-25', 'pendiente'),
(1, 3500.00, '2024-11-05', 'pendiente'),
(1, 600.00, '2024-12-01', 'pagado'),
(1, 400.00, '2024-12-10', 'pendiente'),
(1, 3200.00, '2024-12-15', 'anulado'),
(1, 500.00, '2024-12-20', 'vencido'),
(1, 4500.00, '2024-12-25', 'pagado'),
(2, 600.00, '2024-12-01', 'pagado'),
(2, 400.00, '2024-12-10', 'pendiente'),
(2, 3200.00, '2024-12-15', 'anulado'),
(2, 500.00, '2024-12-20', 'vencido'),
(2, 4500.00, '2024-12-25', 'pagado'),
(3, 400.00, '2024-10-30', 'reembolsado'),
(3, 500.00, '2024-11-30', 'reembolsado'),
(2, 3000.00, '2024-09-15', 'vencida'),
(2, 450.00, '2024-10-20', 'pagado'),
(2, 3500.00, '2024-11-15', 'pendiente');

-- 6. Tabla Pagos
CREATE TABLE [pagos] (
    [id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [cuota_id] INT NOT NULL,
	[medio_de_pago] NVARCHAR(100) NOT NULL,
	[codigo_operacion] VARCHAR(20) NOT NULL,
    [monto_pagado] MONEY NOT NULL,
	[estado_de_pago] VARCHAR(55) NOT NULL,
    [fecha_pago] DATETIME DEFAULT GETDATE(),
	 FOREIGN KEY ([cuota_id]) REFERENCES [cuotas]([id]),
	 );
GO

-- Inserciones en la tabla pagos actualizadas
INSERT INTO [pagos] (cuota_id, medio_de_pago, codigo_operacion, monto_pagado, estado_de_pago) VALUES
-- Pagos para los cursos
(1, 'Transferencia bancaria', 'TXN001', 200.00, 'pagado'),
(2, 'Efectivo', 'CASH002', 200.00, 'pendiente'),
(3, 'Tarjeta de crédito', 'CARD003', 250.00, 'pagado'),
(4, 'Plin', 'PLN004', 250.00, 'pendiente'),
(5, 'Yape', 'YAP005', 300.00, 'pendiente'),
(6, 'Transferencia bancaria', 'TXN006', 300.00, 'pendiente'),
(7, 'Efectivo', 'CASH007', 200.00, 'pendiente'),
(8, 'Tarjeta de crédito', 'CARD008', 200.00, 'pendiente'),
(9, 'Plin', 'PLN009', 250.00, 'vencido'),
(10, 'Yape', 'YAP010', 300.00, 'pagado'),

-- Pagos para las especializaciones
(11, 'Transferencia bancaria', 'TXN011', 1500.00, 'vencido'),
(12, 'Efectivo', 'CASH012', 1500.00, 'pendiente'),
(13, 'Tarjeta de crédito', 'CARD013', 2000.00, 'pendiente'),
(14, 'Plin', 'PLN014', 2000.00, 'pendiente'),
(15, 'Yape', 'YAP015', 2500.00, 'anulado'),
(16, 'Transferencia bancaria', 'TXN016', 2500.00, 'anulado'),
(17, 'Efectivo', 'CASH017', 2500.00, 'pagado'),
(18, 'Tarjeta de crédito', 'CARD018', 2500.00, 'pagado'),
(19, 'Plin', 'PLN019', 2000.00, 'pagado'),
(20, 'Yape', 'YAP020', 2000.00, 'pagado');

-- 7. Tabla compra_Pagos

CREATE TABLE [compra_pagos] (
    [id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [compra_id] INT NOT NULL,
    [monto_pago] MONEY NOT NULL,
    [cantidad_curso]numeric(20) NOT NULL,
    [pago_id] INT NOT NULL,
   
     FOREIGN KEY ([pago_id]) REFERENCES [pagos]([id]),
    FOREIGN KEY (compra_id) REFERENCES [compra]([id]),
	);
GO


INSERT INTO [compra_pagos] (compra_id, monto_pago, cantidad_curso, pago_id) VALUES
-- Cursos (total entre 400 y 600)
(1, 250.00, 1, 1),   -- Compra ID 1, Curso ID 1, Pago ID 1
(1, 250.00, 1, 2),   -- Compra ID 1, Curso ID 1, Pago ID 2
(2, 250.00, 1, 3),   -- Compra ID 2, Curso ID 2, Pago ID 3
(2, 250.00, 1, 4),   -- Compra ID 2, Curso ID 2, Pago ID 4
(3, 250.00, 1, 5),   -- Compra ID 3, Curso ID 3, Pago ID 5
(3, 250.00, 1, 6),   -- Compra ID 3, Curso ID 3, Pago ID 6
(4, 250.00, 1, 7),   -- Compra ID 4, Curso ID 4, Pago ID 7
(4, 250.00, 1, 8),   -- Compra ID 4, Curso ID 4, Pago ID 8
(5, 250.00, 1, 9),   -- Compra ID 5, Curso ID 5, Pago ID 9
(5, 250.00, 1, 10),  -- Compra ID 5, Curso ID 5, Pago ID 10
(6, 250.00, 1, 11),  -- Compra ID 6, Curso ID 6, Pago ID 11
(6, 250.00, 1, 12),  -- Compra ID 6, Curso ID 6, Pago ID 12

-- Especializaciones (total entre 2000 y 5000)
(7, 1250.00, 1, 13), -- Compra ID 7, Especialización ID 7, Pago ID 13
(7, 1250.00, 1, 14), -- Compra ID 7, Especialización ID 7, Pago ID 14
(8, 1250.00, 1, 15), -- Compra ID 8, Especialización ID 8, Pago ID 15
(8, 1250.00, 1, 16), -- Compra ID 8, Especialización ID 8, Pago ID 16
(9, 1250.00, 1, 17), -- Compra ID 9, Especialización ID 9, Pago ID 17
(9, 1250.00, 1, 18), -- Compra ID 9, Especialización ID 9, Pago ID 18
(10, 1250.00, 1, 19),-- Compra ID 10, Especialización ID 10, Pago ID 19
(10, 1250.00, 1, 20)-- Compra ID 10, Especialización ID 10, Pago ID 20
;


