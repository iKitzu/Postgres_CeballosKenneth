-- Datos para gama_producto
INSERT INTO gama_producto (gama, descripcion_texto, descripcion_html, imagen)
VALUES 
('Ornamentales', 'Productos decorativos y de diseño especial', '<p>Productos <b>decorativos</b> para el hogar y oficina</p>', 'imagen1.jpg'),
('Electrónica', 'Dispositivos electrónicos de alta calidad', '<p>Dispositivos <i>electrónicos</i> de última generación</p>', 'imagen2.jpg');

-- Datos para producto
INSERT INTO producto (codigo_producto, nombre, gama, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor)
VALUES
('P001', 'Figura Anime Edición Limitada', 'Ornamentales', '30x20x15', 'AnimeCorp', 'Figura coleccionable edición limitada.', 150, 120.50, 90.00),
('P002', 'Teclado Gamer RGB', 'Electrónica', '45x15x5', 'TechSolutions', 'Teclado mecánico con retroiluminación RGB.', 80, 75.99, 50.00);

-- Datos para oficina
INSERT INTO oficina (codigo_oficina, ciudad, pais, region, codigo_postal, telefono, linea_direccion1, linea_direccion2)
VALUES
('OF01', 'Madrid', 'España', 'Madrid', '28001', '+34 913 123 456', 'Calle Mayor 123', 'Edificio Central'),
('OF02', 'Barcelona', 'España', 'Cataluña', '08002', '+34 932 456 789', 'Calle Gran Vía 45', 'Piso 3');

-- Datos para empleado
INSERT INTO empleado (codigo_empleado, nombre, apellido1, apellido2, extension, email, codigo_oficina, jefe, puesto)
VALUES
(1, 'Juan', 'Pérez', 'López', 'EXT100', 'jperez@example.com', 'OF01', NULL, 'Gerente General'),
(2, 'Ana', 'García', 'Martínez', 'EXT101', 'agarcia@example.com', 'OF01', 1, 'Representante de ventas'),
(3, 'Carlos', 'Sánchez', 'Gómez', 'EXT102', 'csanchez@example.com', 'OF02', 1, 'Representante de ventas');

-- Datos para cliente
INSERT INTO cliente (codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, codigo_empleado_rep_ventas, limite_credito)
VALUES
(1001, 'Comercial Madrid', 'Alberto', 'Ramírez', '+34 911 123 123', NULL, 'Calle Luna 12', NULL, 'Madrid', 'Madrid', 'España', '28003', 2, 5000.00),
(1002, 'Tiendas Barcelona', 'María', 'Díaz', '+34 932 654 321', '+34 932 654 322', 'Calle Sol 45', NULL, 'Barcelona', 'Cataluña', 'España', '08008', 3, 10000.00);

-- Datos para pedido
INSERT INTO pedido (codigo_pedido, fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, codigo_cliente)
VALUES
(2001, '2023-01-15', '2023-01-20', '2023-01-19', 'Entregado', 'Entrega sin incidencias', 1001),
(2002, '2023-01-17', '2023-01-22', '2023-01-23', 'Entregado', 'Retraso en el envío', 1002);

-- Datos para detalle_pedido
INSERT INTO detalle_pedido (codigo_pedido, codigo_producto, cantidad, precio_unidad, numero_linea)
VALUES
(2001, 'P001', 2, 120.50, 1),
(2002, 'P002', 1, 75.99, 1);

-- Datos para pago
INSERT INTO pago (codigo_cliente, forma_pago, id_transaccion, fecha_pago, total)
VALUES
(1001, 'Paypal', 'TRX001', '2023-01-19', 241.00),
(1002, 'Tarjeta de crédito', 'TRX002', '2023-01-23', 75.99);
