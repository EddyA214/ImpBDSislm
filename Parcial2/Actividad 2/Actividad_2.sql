SELECT * FROM carritoA LEFT OUTER JOIN carritoB ON articuloscA =articuloscB union SELECT * FROM carritoA RIGHT OUTER JOIN carritoB
ON articuloscA=articuloscB;


WITH RECURSIVE Jerarquia AS (
    SELECT IdEmpleado, IdGerente, Puesto, 0 AS Nivel
    FROM GyE
    WHERE IdGerente IS NULL
    union all
    SELECT e.IdEmpleado, e.IdGerente, e.Puesto, j.Nivel + 1
    FROM GyE e
    JOIN Jerarquia j ON e.IdGerente = j.IdEmpleado
    )
    SELECT * FROM Jerarquia ORDER BY Nivel, IdEmpleado;
    

select * FROM Pedidos where idCliente=1001 AND Destino='CDMX';