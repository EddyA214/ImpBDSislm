SELECT e.name Employee AS Empleados
FROM Employee e
JOIN Employee Gerentes
ON e.managerId = Gerentes.id 
WHEN e.salary > Gerentes.salary