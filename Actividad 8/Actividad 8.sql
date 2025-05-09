SELECT ID, fecha, precio
FROM Productos
WHERE (ID, fecha) IN (
    SELECT ID, MAX(fecha)
    FROM Productos
    GROUP BY ID
);


SELECT DISTINCT estado
FROM (
    SELECT id_cliente, estado, 
           EXTRACT(MONTH FROM Fecha) AS Mes,
           AVG(Total) OVER (PARTITION BY id_cliente, EXTRACT(MONTH FROM fecha)) AS Promedio
    FROM Ventas
) AS sub
GROUP BY estado, id_cliente
HAVING MIN(Promedio) > 100;


SELECT proceso, mensaje, MAX(ocurrencia) AS ocurrencia
FROM NumErrores
GROUP BY mensaje, proceso
HAVING ocurrencia = (
    SELECT MAX(ocurrencia)
    FROM NumErrores AS p2
    WHERE p2.mensaje = NumErrores.mensaje
);