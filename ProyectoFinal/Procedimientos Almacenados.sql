use BDZapatoApp;

DELIMITER //

CREATE PROCEDURE InsertarVenta(
    IN empleadoID INT,
    IN fechaVenta DATE,
    IN metodoPago VARCHAR(50),
    IN producto VARCHAR(50),
    IN cantidad VARCHAR(5),
    IN total DECIMAL(10, 2)
)
BEGIN
    INSERT INTO VENTA (EMPLEADO_idEmpleado, Fecha, Metodo_Pago, Producto, Cantidad, Total)
    VALUES (empleadoID, fechaVenta, metodoPago, producto, cantidad, total);
END //

DELIMITER ;
CALL InsertarVenta(1, '2023-11-21', 'Tarjeta de crédito', 'Zapatos de Vestir con Bordados', '2', 339.98);
SELECT * FROM bdzapatoapp.venta;

DELIMITER //

CREATE PROCEDURE ActualizarInventarioDespuesVenta(
    IN productoID INT,
    IN cantidadVendida INT
)
BEGIN
    UPDATE INVENTARIO
    SET Cantidad_Disponible = Cantidad_Disponible - cantidadVendida
    WHERE idInventario = productoID;
END //

DELIMITER ;
CALL ActualizarInventarioDespuesVenta(19, 2);
SELECT * FROM bdzapatoapp.inventario;

DELIMITER //

CREATE PROCEDURE ObtenerTotalVentasPorCategoria()
BEGIN
    SELECT C.Nombre AS Categoria, SUM(V.Total) AS TotalVentas
    FROM VENTA V
    JOIN PRODUCTO P ON V.Producto = P.Nombre
    JOIN CATEGORIA C ON P.CATEGORIA_idCategoria = C.idCategoria
    GROUP BY C.idCategoria;
END //

DELIMITER ;
CALL ObtenerTotalVentasPorCategoria();
