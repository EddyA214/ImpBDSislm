SELECT 
   o.id,
   o.componente AS Producto,
   SUM(t.manufactura) AS Dias_para_armar,
   o.entrega AS Dias_para_entregar,
   CASE
     WHEN SUM(t.manufactura) < o.entrega THEN 'Adelantado'
     WHEN SUM(t.manufactura) = o.entrega THEN 'En tiempo'
     ELSE 'Atrasado'
   END AS Calendario
 FROM ordenes o
JOIN tiempo_manufactura t ON o.componente = t.producto GROUP BY o.id, o.componente, o.entrega
 ORDER BY o.id;