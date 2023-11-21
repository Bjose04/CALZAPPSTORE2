use BDZapatoApp;

DELIMITER //

CREATE FUNCTION ObtenerNombreCompletoEmpleado(empleado_id INT) RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
    DECLARE nombre_completo VARCHAR(100);
    SELECT CONCAT(Nombre1, ' ', Nombre2, ' ', Apellido1, ' ', Apellido2) INTO nombre_completo
    FROM EMPLEADO
    WHERE idEmpleado = empleado_id;
    RETURN nombre_completo;
END //

DELIMITER ;
SELECT ObtenerNombreCompletoEmpleado(1) AS NombreCompleto;


DELIMITER //

CREATE FUNCTION ObtenerPrecioPromedioCategoria(categoria_id INT) RETURNS DECIMAL(10, 2) DETERMINISTIC
BEGIN
    DECLARE precio_promedio DECIMAL(10, 2);
    SELECT AVG(Precio) INTO precio_promedio
    FROM PRODUCTO
    WHERE CATEGORIA_idCategoria = categoria_id;
    RETURN precio_promedio;
END //

DELIMITER ;
SELECT ObtenerPrecioPromedioCategoria(6);

DELIMITER //

CREATE FUNCTION ObtenerProveedorMasProductos() RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
    DECLARE proveedor_mas_productos VARCHAR(50);
    SELECT PROVEEDOR.Nombre INTO proveedor_mas_productos
    FROM PRODUCTO
    JOIN PROVEEDOR ON PRODUCTO.PROVEEDOR_idProveedor = PROVEEDOR.idProveedor
    GROUP BY PRODUCTO.PROVEEDOR_idProveedor
    ORDER BY COUNT(*) DESC
    LIMIT 1;
    RETURN proveedor_mas_productos;
END //

DELIMITER ;
SELECT ObtenerProveedorMasProductos();

