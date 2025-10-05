/*
Autor: Anwar D. Caravantes
Actividad 2. Consultas
Octubre 2025
*/ 
Use AkirasBoutiques
Go

-- 1. Clientes del Año 2021
SELECT DISTINCT
    C.nombre, 
    C.apellido,
    YEAR(F.fecha) AS Fecha_Compra
FROM 
    cliente AS C
INNER JOIN 
    factura AS F ON C.id_cliente = F.id_cliente
WHERE 
    YEAR(F.fecha) = 2021;


-- 2. Clientes de 2022 (Hasta el Momento)
SELECT DISTINCT
    C.nombre, 
    C.apellido,
    F.fecha AS Fecha_de_Compra
FROM 
    cliente AS C
INNER JOIN 
    factura AS F ON C.id_cliente = F.id_cliente
WHERE 
    F.fecha >= '2022-01-01' 
    AND F.fecha <= GETDATE() 
ORDER BY
    F.fecha DESC; 


-- 3. Clientes de Diciembre de 2021
SELECT DISTINCT
    C.nombre, 
    C.apellido,
    F.fecha AS Fecha_de_Compra
FROM 
    cliente AS C
INNER JOIN 
    factura AS F ON C.id_cliente = F.id_cliente
WHERE 
    YEAR(F.fecha) = 2021 AND MONTH(F.fecha) = 12;



-- 4. Compras Realizadas por Clientes Específicos
SELECT
    C.nombre + ' ' + C.apellido AS Cliente,
    F.fecha AS Fecha_Factura,
    P.nombre AS Producto_Comprado,
    D.cantidad AS Cantidad

FROM 
    cliente AS C
INNER JOIN 
    factura AS F ON C.id_cliente = F.id_cliente
INNER JOIN 
    detalle AS D ON F.id_detalle = D.id_detalle
INNER JOIN 
    producto AS P ON D.id_producto = P.id_producto
WHERE 
    C.nombre + ' ' + C.apellido IN (
        'Valentina Anastasia Huerta Corral',
        'Zayra Manuela Gómez López',
        'Dante Eduardo Dolores Meza',
        'Ana Maribel Cedillo Núñez',
        'Rodrigo Ismael Silva Ugarte'
    )
ORDER BY 
    Cliente, F.fecha;



-- 5. Producto con Más Ventas
SELECT TOP 1
    P.nombre,
    SUM(D.cantidad) AS Cantidad_Total_Vendida
FROM
    producto AS P
INNER JOIN
    detalle AS D ON P.id_producto = D.id_producto
GROUP BY
    P.nombre
ORDER BY
    Cantidad_Total_Vendida DESC;



-- 6. Producto con Mayor Cantidad en Stock
SELECT
    nombre AS Nombre_Producto,
    stock AS Cantidad_en_Stock
FROM
    producto
WHERE
    stock = (SELECT MAX(stock) FROM producto);



-- 7. Compras Ordenadas de Más Antigua a Más Reciente
SELECT
    id_factura,
    fecha,
    id_cliente
FROM
    factura
ORDER BY
    fecha ASC;



-- 8. Clientes Ordenados Alfabéticamente
SELECT
    apellido AS Apellido,
    nombre AS Nombre
FROM
    cliente
ORDER BY
    apellido ASC, nombre ASC;


-- 9. Productos por Categoría (Falda, Pantalón, Chamarra, Zapatos, Accesorios)
SELECT
    CA.nombre AS Categoria,
    P.nombre AS Nombre_del_Producto
FROM
    producto AS P
INNER JOIN
    categoria AS CA ON P.id_categoria = CA.id_categoria
WHERE
    CA.nombre IN ('Falda', 'Pantalón', 'Chamarra', 'Zapatos', 'Accesorios')
ORDER BY
    Categoria, P.nombre;




-- 10. Encargados de las Sucursales
SELECT
    nombre_sucursal AS Sucursal,
    nombre_encargado AS Encargado
FROM
    Sucursal
ORDER BY
    nombre_sucursal;



-- 11. Empleados de la Sucursal 'Constitución'
SELECT
    E.nombre AS Nombre_Empleado,
    S.nombre_sucursal AS Sucursal
FROM
    Empleado AS E
INNER JOIN
    Sucursal AS S ON E.id_sucursal = S.id_sucursal
WHERE
    S.nombre_sucursal = 'Akira''s Boutique: Constitución'
ORDER BY
    E.nombre;



-- 12. Clientes Mayores de 30 Años
SELECT
    nombre + ' ' + apellido AS Nombre_Completo,
    fec_nac AS Fecha_Nacimiento,
       DATEDIFF(YY, fec_nac, GETDATE()) -
    CASE
        WHEN MONTH(fec_nac) > MONTH(GETDATE()) OR 
             (MONTH(fec_nac) = MONTH(GETDATE()) AND DAY(fec_nac) > DAY(GETDATE()))
        THEN 1 
        ELSE 0
    END AS Edad_Actual
FROM
    cliente
WHERE
    DATEDIFF(YY, fec_nac, GETDATE()) - 
    CASE
        WHEN MONTH(fec_nac) > MONTH(GETDATE()) OR 
             (MONTH(fec_nac) = MONTH(GETDATE()) AND DAY(fec_nac) > DAY(GETDATE()))
        THEN 1 
        ELSE 0
    END > 30
ORDER BY
    Edad_Actual DESC;