-- consultas, funciones definidas por usuario y procedimiento almacenado 

--. consultas 
--1 ranking de cursos  por unidades vendidas
SELECT
    c.nombre AS Curso,
    COUNT(co.id) AS Numero_Ventas
FROM
    compra AS co
JOIN
    curso AS c ON co.curso_id = c.id
WHERE
    co.estado_de_compra = 'confirmada'
GROUP BY
    c.nombre
ORDER BY
    Numero_Ventas DESC;

--2 total de ventas por categoria ( curso/especilización)
SELECT 
    c.categoría AS Categoría,
    COUNT(co.id) AS Total_Ventas,
    SUM(co.monto_de_compra) AS Total_Monto
FROM 
    compra AS co
JOIN 
    curso AS c ON co.curso_id = c.id
GROUP BY 
    c.categoría
ORDER BY 
    Total_Monto DESC;


--3 total de ventas por asesor y supervisor
SELECT 
    sup.nombres_trabajador + ' ' + sup.apellidos_trabajador AS Supervisor,
    ases.nombres_trabajador + ' ' + ases.apellidos_trabajador AS Asesor,
    COUNT(co.id) AS Total_Ventas,
    SUM(co.monto_de_compra) AS Total_Monto
FROM 
    compra AS co
JOIN 
    trabajadores AS ases ON co.asesor_id = ases.id
JOIN 
    trabajadores AS sup ON ases.supervisor_id = sup.id
GROUP BY 
    sup.nombres_trabajador, sup.apellidos_trabajador,
    ases.nombres_trabajador, ases.apellidos_trabajador
ORDER BY 
    Total_Monto DESC;



--4 pagos pendientes por cliente 

	SELECT 
    cl.nombres_cliente + ' ' + cl.apellidos_cliente AS Cliente,
    COUNT(p.id) AS Cantidad_Pagos_Pendientes,
    SUM(p.monto_pagado) AS Monto_Total_Pendiente
FROM 
    pagos AS p
JOIN 
    compra_pagos AS cp ON p.id = cp.pago_id
JOIN 
    compra AS co ON cp.compra_id = co.id
JOIN 
    clientes AS cl ON co.cliente_id = cl.id
WHERE 
    p.estado_de_pago = 'pendiente'
GROUP BY 
    cl.nombres_cliente, cl.apellidos_cliente
ORDER BY 
    Monto_Total_Pendiente DESC;


--5 cantidad de pagos anulados 
SELECT 
    cu.nombre AS Curso,
    COUNT(p.id) AS Cantidad_Pagos_Anulados
FROM 
    pagos AS p
JOIN 
    compra_pagos AS cp ON p.id = cp.pago_id
JOIN 
    compra AS co ON cp.compra_id = co.id
JOIN 
    curso AS cu ON co.curso_id = cu.id
WHERE 
    p.estado_de_pago = 'anulado'
GROUP BY 
    cu.nombre
ORDER BY 
    Cantidad_Pagos_Anulados DESC;

--6Ranking de cursos por ganancias 
SELECT 
    c.nombre AS Curso,
    SUM(co.monto_de_compra) AS Monto_Total_Ventas
FROM 
    compra AS co
JOIN 
    curso AS c ON co.curso_id = c.id
WHERE 
    co.estado_de_compra = 'confirmada'
GROUP BY 
    c.nombre
ORDER BY 
    Monto_Total_Ventas DESC;

--7 cursos con mayor número de compra
SELECT 
    c.nombre AS Curso,
    COUNT(co.id) AS Numero_Compras
FROM 
    compra AS co
JOIN 
    curso AS c ON co.curso_id = c.id
WHERE 
    co.estado_de_compra = 'confirmada'
GROUP BY 
    c.nombre
ORDER BY 
    Numero_Compras DESC;


--8 impacto de la duración del curso en ventas
--Analiza si la duración del curso afecta el monto de las ventas.

SELECT 
    cu.duración_horas AS Duracion_Curso,
    AVG(co.monto_de_compra) AS Monto_Promedio_Venta
FROM 
    compra AS co
JOIN 
    curso AS cu ON co.curso_id = cu.id
WHERE 
    co.estado_de_compra = 'confirmada'
GROUP BY 
    cu.duración_horas
ORDER BY 
 AVG(co.monto_de_compra) DESC;

---funciones definidas por el usuario

---- total de ventas  de curso 1 

-- Ejemplo de uso:
CREATE FUNCTION dbo.TotalVentasPorCurso (@cursoId INT)

RETURNS MONEY
AS
BEGIN
    DECLARE @totalVentas MONEY;

    SELECT @totalVentas = SUM(c.monto_de_compra)
    FROM compra c
    WHERE c.curso_id = @cursoId AND c.estado_de_compra = 'confirmada';

    RETURN @totalVentas;
END;
SELECT dbo.TotalVentasPorCurso(1) AS totalVentasPorCurso;  -- Promedio de ventas para el cliente con ID 1

GO

---total de ventas confirmadas 2024 

-- Ejemplo de uso:

CREATE FUNCTION dbo.ContarComprasConfirmadas (@fechaInicio DATETIME, @fechaFin DATETIME)
RETURNS INT
AS
BEGIN
    DECLARE @cantidadCompras INT;

    SELECT @cantidadCompras = COUNT(*)
    FROM compra
    WHERE estado_de_compra = 'confirmada' AND fecha_compra BETWEEN @fechaInicio AND @fechaFin;

    RETURN @cantidadCompras;
END;
SELECT dbo.ContarComprasConfirmadas('2024-01-01', '2024-12-31') AS ComprasConfirmadas2024;  -- Compras confirmadas en 2024

GO


----procedimiento almacenado

---1.inserción nueva compra
CREATE PROCEDURE registrar_compra
    @cliente_id INT,
    @asesor_id INT,
    @curso_id INT,
    @monto_de_compra MONEY,
    @estado_de_compra VARCHAR(55)
AS
BEGIN
	
	IF EXISTS (SELECT 1 FROM clientes WHERE id = @cliente_id)
    BEGIN
    INSERT INTO compra (fecha_compra, estado_de_compra, monto_de_compra, cliente_id, asesor_id, curso_id)
    VALUES (GETDATE(), @estado_de_compra, @monto_de_compra, @cliente_id, @asesor_id, @curso_id);
	END
	ELSE
    BEGIN
        -- Opcional: Manejar el caso en el que el celular ya existe
        PRINT 'El cliente no existe y no se registrará compra.';
    END
END;
GO

--- de ejemplo registrar nvo compra (SI SE REGISTRA)
EXEC registrar_compra
    @cliente_id = 15,      -- Reemplaza con el ID del cliente
    @asesor_id = 4,       -- Reemplaza con el ID del asesor
    @curso_id = 3,        -- Reemplaza con el ID del curso
    @monto_de_compra = 2500.00,  -- Reemplaza con el monto de la compra
    @estado_de_compra = 'Completa';  -- Reemplaza con el estado deseado

--- de ejemplo registrar nvo compra (NO SE REGISTRA)
EXEC registrar_compra
    @cliente_id = 90,      -- DATO A VERIFICAR
    @asesor_id = 4,       -- Reemplaza con el ID del asesor
    @curso_id = 3,        -- Reemplaza con el ID del curso
    @monto_de_compra = 2500.00,  -- Reemplaza con el monto de la compra
    @estado_de_compra = 'Completa';  -- Reemplaza con el estado deseado

-----2.insertar nuevo cliente

CREATE PROCEDURE agregar_cliente
    @nombres_cliente NVARCHAR(200),
    @apellidos_cliente NVARCHAR(200),
    @celular VARCHAR(20),
    @email VARCHAR(255)
AS
BEGIN
    -- Verificamos si ya existe un cliente con el mismo celular
    IF NOT EXISTS (SELECT 1 FROM clientes WHERE celular = @celular)
    BEGIN
        -- Si no existe, insertamos el nuevo cliente
        INSERT INTO clientes (nombres_cliente, apellidos_cliente, celular, email)
        VALUES (@nombres_cliente, @apellidos_cliente, @celular, @email);
    END
	ELSE
    BEGIN
        -- Opcional: Manejar el caso en el que el celular ya existe
        PRINT 'El celular ya está registrado para otro cliente.';
    END
END;

---ejemplo de insertar nuevo cliente 
--si celular no existe en la tabla clientes, inserta.

-- SI SE REGISTRA
EXEC agregar_cliente
    @nombres_cliente = N'carmen',
    @apellidos_cliente = N'salazar',
    @celular = '911333456',
    @email = 'carmen.salazar@gmail.com'; 


-- NO SE REGISTRA 
EXEC agregar_cliente
    @nombres_cliente = N'Jeanpier',
    @apellidos_cliente = N'Morales',
    @celular = '935678901',
    @email = 'gregory.morales@gmail.com'; 