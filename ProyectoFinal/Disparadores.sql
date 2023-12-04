use BDZapatoApp;

DELIMITER //

CREATE TRIGGER RegistrarHistorialVentas
AFTER INSERT ON VENTA
FOR EACH ROW
BEGIN
    INSERT INTO HISTORIAL_VENTAS (idVenta, Fecha, Producto, Cantidad, Total)
    VALUES (NEW.idVenta, NEW.Fecha, NEW.Producto, NEW.Cantidad, NEW.Total);
END;

//

DELIMITER ;
INSERT INTO VENTA (EMPLEADO_idEmpleado, Fecha, Metodo_Pago, Producto, Cantidad, Total)
VALUES (1, '2023-11-21', 'Tarjeta de crédito', 'Zapatillas de Running Avanzadas', 2, 239.98);
SELECT * FROM bdzapatoapp.historial_ventas;


DELIMITER //
CREATE TRIGGER RegistrarCambioPrecio
BEFORE UPDATE ON PRODUCTO
FOR EACH ROW
BEGIN
  IF NEW.Precio != OLD.Precio THEN
    INSERT INTO HISTORIAL_CAMBIOS_PRECIOS (idProducto, PrecioAnterior, PrecioNuevo)
    VALUES (NEW.idProducto, OLD.Precio, NEW.Precio);
  END IF;
END;
//
DELIMITER ;
-- Actualizar el precio del producto con idProducto = 1 a 139.99
UPDATE PRODUCTO SET Precio = 139.99 WHERE idProducto = 1;
SELECT * FROM bdzapatoapp.historial_cambios_precios;


-- Crear el disparador para actualizar automáticamente el total de ventas
DELIMITER //
CREATE TRIGGER ActualizarTotalVentas
BEFORE INSERT ON VENTA
FOR EACH ROW
BEGIN
    SET NEW.Total = NEW.Cantidad * (SELECT Precio FROM PRODUCTO WHERE Nombre = NEW.Producto);
END;
//
DELIMITER ;
-- Insertar una nueva venta
INSERT INTO VENTA (EMPLEADO_idEmpleado, Fecha, Metodo_Pago, Producto, Cantidad)
VALUES (3, '2023-11-21', 'Tarjeta de crédito', 'Zapatos para Trail Running Resistentes', 2);
SELECT * FROM bdzapatoapp.venta;







