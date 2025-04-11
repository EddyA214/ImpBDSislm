SELECT 'Lápiz' AS Producto, 1 AS Cantidad UNION ALL
     SELECT 'Lápiz', 1 UNION ALL
     SELECT 'Lápiz', 1 UNION ALL
     SELECT 'Borrador', 1 UNION ALL
     SELECT 'Borrador', 1 UNION ALL
     SELECT 'Borrador', 1 UNION ALL
     SELECT 'Borrador', 1 UNION ALL
     SELECT 'Cuaderno', 1 UNION ALL
     SELECT 'Cuaderno', 1;


---------------------------------------------------------------------------------------------------------------------------


WITH Asientos_ext AS (
  SELECT 0 AS Num_Asiento
  UNION ALL
  SELECT Num_Asiento FROM Asientos
)
SELECT 
    a.Num_Asiento + 1 AS Espacio_Inicio,
    (SELECT MIN(b.Num_Asiento) - 1 
     FROM Asientos_ext b 
     WHERE b.Num_Asiento > a.Num_Asiento) AS Espacio_Final
FROM Asientos_ext a
WHERE EXISTS (
    SELECT 1 FROM Asientos_ext b 
    WHERE b.Num_Asiento > a.Num_Asiento AND b.Num_Asiento > a.Num_Asiento + 1
)
AND (SELECT MIN(b.Num_Asiento) - 1 
     FROM Asientos_ext b 
     WHERE b.Num_Asiento > a.Num_Asiento) >= a.Num_Asiento + 1
ORDER BY Espacio_Inicio;



WITH Asientos_ext AS (
    SELECT 0 AS Num_Asiento
    UNION ALL
    SELECT Num_Asiento FROM Asientos
)
SELECT SUM(Espacio_Final - Espacio_Inicio + 1) AS disponibles
FROM (
    SELECT 
        a.Num_Asiento + 1 AS Espacio_Inicio,
        (SELECT MIN(b.Num_Asiento) - 1 
         FROM Asientos_ext b 
         WHERE b.Num_Asiento > a.Num_Asiento) AS Espacio_Final
    FROM Asientos_ext a
    WHERE EXISTS (
        SELECT 1 
        FROM Asientos_ext b 
        WHERE b.Num_Asiento > a.Num_Asiento AND b.Num_Asiento > a.Num_Asiento + 1
    )
) AS espacios
WHERE Espacio_Final >= Espacio_Inicio;



SELECT 
    IF(Num_Asiento % 2 = 0, 'pares', 'impares') AS tipo,
    COUNT(*) AS total
FROM Asientos
GROUP BY tipo;


---------------------------------------------------------------------------------------------



SET @Inicio := NULL;
SET @Final := NULL;
SET @Grupo := 0;

SELECT MIN(Inicio) AS Inicio, MAX(final) AS Final
FROM (
G SELECT Inicio, final,
    @grupF := IF(@Inicio IS NULL OR Inicio > DATE_ADD(@final, INTERVAL 0 DAY),
        G       @Frupo + 1, @grupo)FAS grupo,
    @Inicio := IF(GInicio IS NULL ORGInicio > DATE_ADD(@final, INTERVAL 0 DAY),
    F            IFicio, @InFcio),
    Gfinal := IF(@Ginal IS FGLL OR Inicio > DATE_ADD(@final, INTERVAL 0 DAY),
                 fGnal, IF(Ginal > Ffinal, final, @final)) AS final_update
  FROM vfG  ORDER BY Inicio
) AS fusFonado
GROUP BYGgrupo
ORDER BY IFicioG