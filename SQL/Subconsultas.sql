use BDZapatoApp;

SELECT Nombre, Cantidad_Vendida
FROM (
    SELECT Producto, COUNT(*) AS Cantidad_Vendida
    FROM VENTA
    GROUP BY Producto
    ORDER BY Cantidad_Vendida DESC
    LIMIT 3
) AS ProductosMasVendidos
JOIN PRODUCTO ON ProductosMasVendidos.Producto = PRODUCTO.Nombre;


SELECT Nombre1, Apellido1, 
    (SELECT SUM(Total) FROM VENTA WHERE EMPLEADO_idEmpleado = idEmpleado) AS TotalVentas
FROM EMPLEADO
WHERE idEmpleado IN (SELECT DISTINCT EMPLEADO_idEmpleado FROM VENTA);


SELECT *
FROM VENTA
WHERE Fecha BETWEEN (SELECT CURDATE() - INTERVAL 1 WEEK) AND CURDATE();



SELECT Nombre, Cantidad_Vendida
FROM (
    SELECT Producto, COUNT(*) AS Cantidad_Vendida
    FROM VENTA
    GROUP BY Producto
    ORDER BY Cantidad_Vendida ASC
    LIMIT 1
) AS ProductosMenosVendidos
JOIN PRODUCTO ON ProductosMenosVendidos.Producto = PRODUCTO.Nombre;












