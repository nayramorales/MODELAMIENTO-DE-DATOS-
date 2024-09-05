

CREATE DATABASE db_prestamos_financieros;
Go

USE db_prestamos_financieros;
GO

-- Tabla Clientes
CREATE TABLE [clientes] (
    [id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [persona_id] INT NOT NULL,
    [tipo_cliente] NVARCHAR(20) NOT NULL,
    [fecha_registro] DATETIME DEFAULT GETDATE()
);
GO

-- Tabla Personas Naturales
CREATE TABLE [personas_naturales] (
    [id] INT PRIMARY KEY NOT NULL,
    [numero_documento] NVARCHAR(20) NOT NULL UNIQUE,
    [nombres] NVARCHAR(255) NOT NULL,
    [apellido_paterno] NVARCHAR(255) NOT NULL,
    [apellido_materno] NVARCHAR(255) NOT NULL,
    [direccion] NVARCHAR(255),
    [celular] NVARCHAR(25) NOT NULL
);
GO

-- Tabla Personas Jurídicas
CREATE TABLE [personas_juridicas] (
    [id] INT PRIMARY KEY NOT NULL,
    [RUC] NVARCHAR(11) NOT NULL UNIQUE,
    [razon_social] NVARCHAR(255) NOT NULL,
    [fecha_constitucion] DATE NOT NULL,
    [direccion_fiscal] NVARCHAR(255)
);
GO

-- Tabla Modalidades de Préstamo
CREATE TABLE [modalidades_prestamo] (
    [id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [nombre] NVARCHAR(100) NOT NULL,
    [descripcion] NVARCHAR(255) NOT NULL
);
GO

-- Tabla Préstamos
CREATE TABLE [prestamos] (
    [id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [cliente_id] INT NOT NULL,
    [modalidad_id] INT NOT NULL,
    [monto_prestamo] MONEY NOT NULL,
    [tasa_interes] DECIMAL(9,4) NOT NULL,
    [plazo_meses] INT NOT NULL,
    [estado] NVARCHAR(50) NOT NULL,
    [num_poliza_seguro] NVARCHAR(100),
    [fecha_desembolso] DATE NOT NULL,
    CONSTRAINT fk_prestamo_cliente FOREIGN KEY ([cliente_id]) REFERENCES [clientes]([id]),
    CONSTRAINT fk_prestamo_modalidad FOREIGN KEY ([modalidad_id]) REFERENCES [modalidades_prestamo]([id])
);
GO

-- Tabla Detalle Cuotas
CREATE TABLE [detalle_cuotas] (
    [id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [prestamo_id] INT NOT NULL,
    [numero_cuota] INT NOT NULL,
    [monto] MONEY NOT NULL,
    [fecha_vencimiento] DATE NOT NULL,
    [estado_cuota] NVARCHAR(20) NOT NULL,
    CONSTRAINT fk_cuota_prestamo FOREIGN KEY ([prestamo_id]) REFERENCES [prestamos]([id])
);
GO

-- Tabla Pagos
CREATE TABLE [pagos] (
    [id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [cuota_id] INT NOT NULL,
    [cliente_id] INT NOT NULL,
    [monto_pago] MONEY NOT NULL,
    [fecha_pago] DATETIME DEFAULT GETDATE(),
    [metodo_pago] NVARCHAR(100) NOT NULL,
    CONSTRAINT fk_pago_cuota FOREIGN KEY ([cuota_id]) REFERENCES [detalle_cuotas]([id]),
    CONSTRAINT fk_pago_cliente FOREIGN KEY ([cliente_id]) REFERENCES [clientes]([id])
);
GO
-- Tabla Pagos
CREATE TABLE [pagos] (
    [id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [cuota_id] INT NOT NULL,
    [cliente_id] INT NOT NULL,
    [monto_pago] MONEY NOT NULL,
    [fecha_pago] DATETIME DEFAULT GETDATE(),
    [metodo_pago] NVARCHAR(100) NOT NULL,
    CONSTRAINT fk_pago_cuota FOREIGN KEY ([cuota_id]) REFERENCES [detalle_cuotas]([id]),
    CONSTRAINT fk_pago_cliente FOREIGN KEY ([cliente_id]) REFERENCES [clientes]([id])