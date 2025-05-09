SELECT Categoria, id, Marcador
FROM (
    SELECT id, Marcador,
        CASE 
            WHEN RANK() OVER (ORDER BY Marcador DESC) <= 3 THEN 1
            ELSE 2
        END AS Categoria
    FROM seleccion
) AS sub
ORDER BY Categoria ASC, Marcador DESC;


with LOL AS ( select id_Orden, id_Cliente, Fecha, Cantidad, Estado FROM Pedidos ) SELECT * FROM LOL LIMIT 48,5;


SELECT id_Cliente, Proveedor
FROM (
    SELECT 
        id_Cliente, 
        Proveedor,
        COUNT(*) AS TotalPedidos,
        ROW_NUMBER() OVER (PARTITION BY id_Cliente ORDER BY COUNT(*) DESC) AS xd
    FROM proveedores
    GROUP BY id_Cliente, Proveedor
) AS sub
WHERE xd = 1;