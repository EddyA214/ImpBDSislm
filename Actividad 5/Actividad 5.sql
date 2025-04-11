SELECT Flujo,
       CASE 
           WHEN COUNT(DISTINCT Estado) = 1 THEN MAX(Estado)
           WHEN SUM(Estado = 'Error') > 0 
                AND (SUM(Estado = 'Finalizado') > 0 OR SUM(Estado = 'Corriendo') > 0) 
           THEN 'Indeterminado'
           WHEN SUM(Estado = 'Finalizado') > 0 
                AND SUM(Estado = 'Corriendo') > 0 
           THEN 'Corriendo'
       END AS Estadol
FROM procesos
GROUP BY flujo;



SELECT CONCAT('SELECT ', GROUP_CONCAT(Columna ORDER BY Columna SEPARATOR ', '), ' FROM concatenacion WHERE Precio >100') 
AS Sintaxis
FROM (SELECT 'Producto' AS Columna UNION ALL 
      SELECT 'Precio' UNION ALL 
      SELECT 'Disponibilidad') AS Columnas;



SELECT 
    LEAST(j1, j2) AS jugador1, 
    GREATEST(j1, j2) AS jugador2, 
    SUM(marcador) AS Marcador
FROM Marcadores
GROUP BY LEAST(j1, j2), GREATEST(j1, j2);