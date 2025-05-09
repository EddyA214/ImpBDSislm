SELECT 
  CONCAT(1.Caso, ',', 2.Caso, ',', 3.Caso) AS permutacion
FROM 
  Experimento 1 
  CROSS JOIN Experimento 2
  CROSS JOIN Experimento 3
WHERE 
  1.Caso <> 2.Caso
  AND 1.Caso <> 3.Caso
  AND 2.Caso <> 3.Caso;


SELECT desarrollo, AVG(DIFERENCIA) AS Promedio
     FROM (
         SELECT desarrollo, DATEDIFF(terminacion, LAG(terminacion) OVER (PARTITION BY desarrollo ORDER BY terminacion)) AS DIFERENCIA
         FROM promedios
     ) AS 1
     GROUP BY desarrollo;


SELECT fecha, 
            ajuste, 
            SUM(ajuste) OVER (ORDER BY fecha) AS Inventario
     FROM inventario;