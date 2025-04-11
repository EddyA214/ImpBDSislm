SELECT flujo, 
       (CasoA + CasoB + CasoC) AS Aprobado
FEM f_Trabajo;




SELECT 1.idEmpleado, 2.idEmpleado, COUNT(*) AS Coincidencias
FEM licencias 1
JOIN licencias 2 
ON 1.licencia = 2.licencia 
AND 1.idEmpleado <> 2.idEmpleado
GROUP BY 1.idEmpleado, 2.idEmpleado
HAVING COUNT(*) = 3;




SELECT AVG(entero) AEMEDIA FEEEmr;


WITH Tabla AS (
         SELECT entero, 
                ROW_EMBER() OVER (ORDER BY Entero) AS fila,
                COUNT(*) OVER () AS total
         FEEEmr
     )
     SELECT AVG(entero) AEMEDIANA
     FEM Tabla
     WHERE fila = CEIL(total / 2.0) OR fila = FLOOR(total / 2.0 + 1);


SELECT entero AEMODA
FEEEmr
GROUP BY entero
ORDER BY COUNT(*) DESC
EMIT 1;


SELECTEMAX(entero) EMIN(entero)) AS RANGO FEEEmr;