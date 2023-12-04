create database BDZapatoApp;
use BDZapatoApp;

CREATE TABLE INVENTARIO (
  idInventario INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Ubicacion VARCHAR(100)  NULL  ,
  Cantidad_Disponible INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(idInventario));



CREATE TABLE PROVEEDOR (
  idProveedor INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Nombre VARCHAR(50)  NULL  ,
  Informacion_Contacto VARCHAR(100)  NULL  ,
  Direccion VARCHAR(100)  NULL    ,
PRIMARY KEY(idProveedor));



CREATE TABLE CATEGORIA (
  idCategoria INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Nombre VARCHAR(50)  NULL  ,
  Descripcion TEXT  NULL    ,
PRIMARY KEY(idCategoria));



CREATE TABLE EMPLEADO (
  idEmpleado INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Nombre1 VARCHAR(25)  NULL  ,
  Nombre2 VARCHAR(25)  NULL  ,
  Apellido1 VARCHAR(25)  NULL  ,
  Apellido2 VARCHAR(25)  NULL  ,
  Cargo VARCHAR(35)  NULL  ,
  Informacion_Contacto VARCHAR(100)  NULL    ,
PRIMARY KEY(idEmpleado));



CREATE TABLE VENTA (
  idVenta INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  EMPLEADO_idEmpleado INTEGER UNSIGNED  NOT NULL  ,
  Fecha DATE  NULL  ,
  Metodo_Pago VARCHAR(50)  NULL  ,
  Producto VARCHAR(50)  NULL  ,
  Cantidad VARCHAR(5)  NULL  ,
  Total DECIMAL(10, 2)  NULL    ,
PRIMARY KEY(idVenta, EMPLEADO_idEmpleado)  ,
INDEX VENTA_FKIndex1(EMPLEADO_idEmpleado),
  FOREIGN KEY(EMPLEADO_idEmpleado)
    REFERENCES EMPLEADO(idEmpleado)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE PRODUCTO (
  idProducto INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  PROVEEDOR_idProveedor INTEGER UNSIGNED  NOT NULL  ,
  CATEGORIA_idCategoria INTEGER UNSIGNED  NOT NULL  ,
  Nombre VARCHAR(40)  NULL  ,
  Descripcion TEXT  NULL  ,
  Precio INTEGER UNSIGNED  NULL  ,
  Marca VARCHAR(20)  NULL  ,
  Proveedor VARCHAR(40)  NULL  ,
  Categoria VARCHAR(50)  NULL  ,
  Cantidad_Inventario INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(idProducto, PROVEEDOR_idProveedor, CATEGORIA_idCategoria)  ,
INDEX PRODUCTO_FKIndex1(PROVEEDOR_idProveedor)  ,
INDEX PRODUCTO_FKIndex2(CATEGORIA_idCategoria),
  FOREIGN KEY(PROVEEDOR_idProveedor)
    REFERENCES PROVEEDOR(idProveedor)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(CATEGORIA_idCategoria)
    REFERENCES CATEGORIA(idCategoria)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE VENTA_has_PRODUCTO (
  VENTA_idVenta INTEGER UNSIGNED  NOT NULL  ,
  PRODUCTO_CATEGORIA_idCategoria INTEGER UNSIGNED  NOT NULL  ,
  PRODUCTO_PROVEEDOR_idProveedor INTEGER UNSIGNED  NOT NULL  ,
  PRODUCTO_idProducto INTEGER UNSIGNED  NOT NULL  ,
  VENTA_EMPLEADO_idEmpleado INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(VENTA_idVenta, PRODUCTO_CATEGORIA_idCategoria, PRODUCTO_PROVEEDOR_idProveedor, PRODUCTO_idProducto, VENTA_EMPLEADO_idEmpleado)  ,
INDEX VENTA_has_PRODUCTO_FKIndex1(VENTA_idVenta, VENTA_EMPLEADO_idEmpleado)  ,
INDEX VENTA_has_PRODUCTO_FKIndex2(PRODUCTO_idProducto, PRODUCTO_PROVEEDOR_idProveedor, PRODUCTO_CATEGORIA_idCategoria),
  FOREIGN KEY(VENTA_idVenta, VENTA_EMPLEADO_idEmpleado)
    REFERENCES VENTA(idVenta, EMPLEADO_idEmpleado)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(PRODUCTO_idProducto, PRODUCTO_PROVEEDOR_idProveedor, PRODUCTO_CATEGORIA_idCategoria)
    REFERENCES PRODUCTO(idProducto, PROVEEDOR_idProveedor, CATEGORIA_idCategoria)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE INVENTARIO_has_PRODUCTO (
  INVENTARIO_idInventario INTEGER UNSIGNED  NOT NULL  ,
  PRODUCTO_CATEGORIA_idCategoria INTEGER UNSIGNED  NOT NULL  ,
  PRODUCTO_PROVEEDOR_idProveedor INTEGER UNSIGNED  NOT NULL  ,
  PRODUCTO_idProducto INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(INVENTARIO_idInventario, PRODUCTO_CATEGORIA_idCategoria, PRODUCTO_PROVEEDOR_idProveedor, PRODUCTO_idProducto)  ,
INDEX INVENTARIO_has_PRODUCTO_FKIndex1(INVENTARIO_idInventario)  ,
INDEX INVENTARIO_has_PRODUCTO_FKIndex2(PRODUCTO_idProducto, PRODUCTO_PROVEEDOR_idProveedor, PRODUCTO_CATEGORIA_idCategoria),
  FOREIGN KEY(INVENTARIO_idInventario)
    REFERENCES INVENTARIO(idInventario)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(PRODUCTO_idProducto, PRODUCTO_PROVEEDOR_idProveedor, PRODUCTO_CATEGORIA_idCategoria)
    REFERENCES PRODUCTO(idProducto, PROVEEDOR_idProveedor, CATEGORIA_idCategoria)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);
      
CREATE TABLE HISTORIAL_VENTAS (
  idHistorial INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  idVenta INTEGER UNSIGNED  NOT NULL,
  Fecha DATE  NULL  ,
  Metodo_Pago VARCHAR(50)  NULL  ,
  Producto VARCHAR(50)  NULL  ,
  Cantidad VARCHAR(5)  NULL  ,
  Total DECIMAL(10, 2)  NULL,
  PRIMARY KEY(idHistorial),
  FOREIGN KEY(idVenta)
    REFERENCES VENTA(idVenta)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE HISTORIAL_CAMBIOS_PRECIOS (
  idHistorial INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idProducto INTEGER UNSIGNED NOT NULL,
  Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PrecioAnterior DECIMAL(10, 2),
  PrecioNuevo DECIMAL(10, 2),
  PRIMARY KEY(idHistorial),
  FOREIGN KEY(idProducto)
    REFERENCES PRODUCTO(idProducto)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
);

INSERT INTO INVENTARIO (Ubicacion, Cantidad_Disponible) VALUES
('Almacén A', 50),
('Almacén B', 30),
('Tienda Principal', 25),
('Tienda Secundaria', 15),
('Depósito Central', 40),
('Tienda Outlet', 10),
('Almacén C', 20),
('Tienda Online', 5),
('Tienda de Barrio', 12),
('Almacén D', 18),
('Almacén E', 22),
('Tienda Especializada', 8),
('Almacén F', 35),
('Almacén G', 28),
('Almacén H', 45),
('Tienda de Lujo', 3),
('Almacén I', 14),
('Almacén J', 32),
('Tienda de Descuentos', 7),
('Almacén K', 19);

INSERT INTO PROVEEDOR (Nombre, Informacion_Contacto, Direccion) VALUES
('Zapatos Express', 'info@zapatosexpress.com', 'Calle de la Moda 123, Ciudad Estilosa'),
('Calzados Rápidos', 'info@calzadosrapidos.com', 'Avenida de la Elegancia 456, Ciudad Chic'),
('Distribuidora ModaVIP', 'info@modavip.com', 'Bulevar de la Tendencia 789, Ciudad Fashion'),
('FashionFeet', 'info@fashionfeet.com', 'Carrera de la Elegancia 321, Ciudad Trendy'),
('Estilo Urbano', 'info@estilourbano.com', 'Pasaje de la Modernidad 654, Ciudad Urbana'),
('Pies a la Moda', 'info@piesalamoda.com', 'Plaza de la Tendencia 987, Ciudad Fashionista'),
('Calzados Elegantes', 'info@calzadoselegantes.com', 'Avenida de la Sofisticación 234, Ciudad Chic'),
('Zapatería de Vanguardia', 'info@vanguardiazapatos.com', 'Calle de la Innovación 567, Ciudad Moderna'),
('Moda para los Pies', 'info@modapies.com', 'Bulevar de la Estilización 890, Ciudad Estilosa'),
('Trendy Shoes Co.', 'info@trendyshoes.com', 'Carrera de la Modernidad 432, Ciudad Trendy'),
('Elegance Footwear', 'info@elegancefootwear.com', 'Pasaje de la Elegancia 765, Ciudad Elegante'),
('Zapatos a la Moda', 'info@zapatosalamoda.com', 'Plaza de la Tendencia 109, Ciudad Fashionista'),
('Fashion Forward Shoes', 'info@fashionforwardshoes.com', 'Avenida de la Vanguardia 876, Ciudad Moderna'),
('Chic Styles Footwear', 'info@chicstylesfootwear.com', 'Calle de la Sofisticación 543, Ciudad Chic'),
('Moda y Estilo Zapatería', 'info@modayestilozapatos.com', 'Bulevar de la Moda 210, Ciudad Estilosa'),
('Trendsetter Shoes', 'info@trendsettershoes.com', 'Carrera de la Tendencia 789, Ciudad Trendy'),
('Innovative Footwear Co.', 'info@innovativefootwear.com', 'Pasaje de la Innovación 876, Ciudad Moderna'),
('Urban Chic Shoes', 'info@urbanchicshoes.com', 'Plaza de la Elegancia 543, Ciudad Elegante'),
('Moda Urbana Zapatería', 'info@modaurbanazapatos.com', 'Avenida de la Modernidad 210, Ciudad Urbana'),
('Sofisticados Pies', 'info@sofisticadospies.com', 'Calle de la Sofisticación 987, Ciudad Chic');

INSERT INTO CATEGORIA (Nombre, Descripcion) VALUES
('Running', 'Zapatos diseñados específicamente para correr y actividades deportivas'),
('Casuales Deportivos', 'Zapatos casuales con un toque deportivo para un estilo relajado'),
('Botas', 'Calzado que cubre el tobillo o parte de la pierna, ideal para diversas condiciones'),
('Formales de Lujo', 'Zapatos de alta calidad y diseño elegante para eventos formales'),
('Sandalias', 'Calzado abierto y ligero, perfecto para climas cálidos y uso informal'),
('Botines', 'Zapatos que cubren el tobillo pero son más bajos que las botas, versátiles para diferentes ocasiones');

INSERT INTO PRODUCTO (PROVEEDOR_idProveedor, CATEGORIA_idCategoria, Nombre, Descripcion, Precio, Marca, Proveedor, Categoria, Cantidad_Inventario) VALUES
(1, 1, 'Zapatillas de Running Avanzadas', 'Diseñadas para corredores exigentes', 119.99, 'RunMax', 'Zapatos Express', 'Running', 25),
(2, 1, 'Zapatos para Trail Running Resistentes', 'Perfectos para terrenos accidentados', 129.99, 'TrailBlazer', 'Calzados Rápidos', 'Running', 30),
(3, 2, 'Sneakers de Estilo Deportivo', 'Combinan moda y comodidad', 79.99, 'SportyChic', 'Distribuidora ModaVIP', 'Casuales Deportivos', 35),
(4, 2, 'Zapatos Casuales Urbanos', 'Estilo moderno para el día a día', 69.99, 'UrbanCasual', 'FashionFeet', 'Casuales Deportivos', 40),
(5, 3, 'Botas de Montaña Resistentes al Agua', 'Protección total para aventuras al aire libre', 149.99, 'WaterproofHiker', 'Estilo Urbano', 'Botas', 18),
(6, 3, 'Botas de Cuero con Estilo Casual', 'Elegancia y comodidad en un solo diseño', 129.99, 'CasualLeatherBoots', 'Calzados Elegantes', 'Botas', 22),
(7, 4, 'Zapatos Oxford de Lujo', 'Elegancia atemporal para eventos formales', 189.99, 'LuxuryOxford', 'Zapatería de Vanguardia', 'Formales de Lujo', 12),
(8, 4, 'Zapatos de Vestir de Piel de Cocodrilo', 'Exclusividad y estilo para ocasiones especiales', 229.99, 'CrocodileElegance', 'Pies a la Moda', 'Formales de Lujo', 8),
(9, 5, 'Sandalias Planas con Diseño Bohemio', 'Estilo relajado para días soleados', 49.99, 'BohoFlats', 'Moda para los Pies', 'Sandalias', 20),
(10, 5, 'Sandalias de Tacón Alto para Fiesta', 'Elegancia y sofisticación en cada paso', 69.99, 'HighHeelParty', 'Trendsetter Shoes', 'Sandalias', 25),
(11, 6, 'Botines de Ante con Hebillas', 'Diseño moderno para un look atrevido', 89.99, 'SuedeBuckleBooties', 'Innovative Footwear Co.', 'Botines', 15),
(12, 6, 'Botines de Cuero con Tacones Gruesos', 'Estilo versátil y cómodo', 79.99, 'LeatherChunkyHeel', 'Urban Chic Shoes', 'Botines', 18),
(13, 1, 'Zapatos para Correr Minimalistas', 'Diseño ligero y flexible para una experiencia natural', 99.99, 'MinimalRun', 'Fashion Forward Shoes', 'Running', 30),
(14, 1, 'Zapatillas de Running con Amortiguación', 'Confort y soporte para largas distancias', 119.99, 'CushionRun', 'Chic Styles Footwear', 'Running', 25),
(15, 2, 'Sneakers con Detalles Reflectantes', 'Estilo deportivo con toques modernos', 84.99, 'ReflectiveSport', 'Moda Urbana Zapatería', 'Casuales Deportivos', 35),
(16, 2, 'Zapatos Deportivos de Malla Transpirable', 'Comodidad y frescura para actividades diarias', 74.99, 'BreathableMesh', 'Sofisticados Pies', 'Casuales Deportivos', 30),
(17, 3, 'Botas de Combate de Cuero', 'Estilo militar con durabilidad excepcional', 119.99, 'CombatLeather', 'Zapatos a la Moda', 'Botas', 25),
(18, 3, 'Botas de Moda con Detalles Metálicos', 'Diseño moderno para un look vanguardista', 129.99, 'MetallicFashionBoots', 'FashionFeet', 'Botas', 22),
(19, 4, 'Zapatos de Vestir con Bordados', 'Elegancia con detalles sofisticados', 169.99, 'EmbroideredElegance', 'Trendy Shoes Co.', 'Formales de Lujo', 10),
(20, 4, 'Mocasines de Lujo con Hebilla', 'Estilo atemporal con un toque moderno', 149.99, 'LuxuryLoafers', 'Elegance Footwear', 'Formales de Lujo', 15);

-- Inserciones de ejemplo para la tabla EMPLEADO
INSERT INTO EMPLEADO (Nombre1, Nombre2, Apellido1, Apellido2, Cargo, Informacion_Contacto)
VALUES
('Juan', 'Carlos', 'Gomez', 'Lopez', 'Vendedor', 'juan.gomez@example.com'),
('Maria', 'Isabel', 'Martinez', 'Santos', 'Cajero', 'maria.martinez@example.com'),
('Pedro', 'Antonio', 'Rodriguez', 'Perez', 'Gerente', 'pedro.rodriguez@example.com'),
('Ana', 'Carmen', 'Sanchez', 'Rios', 'Vendedor', 'ana.sanchez@example.com'),
('Carlos', 'Manuel', 'Lopez', 'Diaz', 'Cajero', 'carlos.lopez@example.com'),
('Laura', 'Isabel', 'Gutierrez', 'Fernandez', 'Vendedor', 'laura.gutierrez@example.com'),
('Francisco', 'Javier', 'Romero', 'Garcia', 'Cajero', 'francisco.romero@example.com'),
('Sofia', 'Luisa', 'Perez', 'Alvarez', 'Vendedor', 'sofia.perez@example.com'),
('Alberto', 'Luis', 'Fernandez', 'Jimenez', 'Gerente', 'alberto.fernandez@example.com'),
('Elena', 'Maria', 'Torres', 'Vega', 'Vendedor', 'elena.torres@example.com'),
('Alejandro', 'Jose', 'Garcia', 'Santos', 'Cajero', 'alejandro.garcia@example.com'),
('Carmen', 'Rosa', 'Martinez', 'Diaz', 'Vendedor', 'carmen.martinez@example.com'),
('Pablo', 'Antonio', 'Sanchez', 'Lopez', 'Gerente', 'pablo.sanchez@example.com'),
('Isabel', 'Maria', 'Gomez', 'Rodriguez', 'Vendedor', 'isabel.gomez@example.com'),
('Manuel', 'Jose', 'Lopez', 'Perez', 'Cajero', 'manuel.lopez@example.com'),
('Luis', 'Fernando', 'Garcia', 'Romero', 'Vendedor', 'luis.garcia@example.com'),
('Monica', 'Cristina', 'Rodriguez', 'Martinez', 'Gerente', 'monica.rodriguez@example.com'),
('Javier', 'Miguel', 'Perez', 'Gomez', 'Cajero', 'javier.perez@example.com'),
('Raquel', 'Patricia', 'Sanchez', 'Fernandez', 'Vendedor', 'raquel.sanchez@example.com'),
('Roberto', 'Carlos', 'Gutierrez', 'Vega', 'Gerente', 'roberto.gutierrez@example.com');

-- Inserciones de ejemplo para la tabla VENTA
INSERT INTO VENTA (EMPLEADO_idEmpleado, Fecha, Metodo_Pago, Producto, Cantidad, Total)
VALUES
(1, '2023-11-01', 'Tarjeta de crédito', 'Zapatillas de Running Avanzadas', '2', 239.98),
(2, '2023-11-02', 'Efectivo', 'Zapatos para Trail Running Resistentes', '1', 129.99),
(3, '2023-11-03', 'Transferencia bancaria', 'Sneakers de Estilo Deportivo', '3', 239.97),
(4, '2023-11-04', 'Tarjeta de débito', 'Zapatillas de Running Avanzadas', '1', 119.99),
(5, '2023-11-05', 'Efectivo', 'Zapatos para Trail Running Resistentes', '2', 259.98),
(6, '2023-11-06', 'Tarjeta de crédito', 'Sneakers de Estilo Deportivo', '1', 79.99),
(7, '2023-11-07', 'Efectivo', 'Zapatillas de Running Avanzadas', '3', 359.97),
(8, '2023-11-08', 'Transferencia bancaria', 'Zapatos para Trail Running Resistentes', '1', 129.99),
(9, '2023-11-09', 'Tarjeta de débito', 'Sneakers de Estilo Deportivo', '2', 159.98),
(10, '2023-11-10', 'Efectivo', 'Zapatillas de Running Avanzadas', '1', 119.99),
(1, '2023-11-11', 'Tarjeta de crédito', 'Zapatos para Trail Running Resistentes', '2', 259.98),
(2, '2023-11-12', 'Transferencia bancaria', 'Sneakers de Estilo Deportivo', '1', 79.99),
(3, '2023-11-13', 'Efectivo', 'Zapatillas de Running Avanzadas', '3', 359.97),
(4, '2023-11-14', 'Tarjeta de débito', 'Zapatos para Trail Running Resistentes', '1', 129.99),
(5, '2023-11-15', 'Efectivo', 'Sneakers de Estilo Deportivo', '2', 159.98),
(6, '2023-11-16', 'Tarjeta de crédito', 'Zapatillas de Running Avanzadas', '1', 119.99),
(7, '2023-11-17', 'Efectivo', 'Zapatos para Trail Running Resistentes', '2', 259.98),
(8, '2023-11-18', 'Transferencia bancaria', 'Sneakers de Estilo Deportivo', '1', 79.99),
(9, '2023-11-19', 'Tarjeta de débito', 'Zapatillas de Running Avanzadas', '3', 359.97),
(10, '2023-11-20', 'Efectivo', 'Zapatos para Trail Running Resistentes', '1', 129.99);

