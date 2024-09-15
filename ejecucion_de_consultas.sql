--QUERYS PARA REPORTE:

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

