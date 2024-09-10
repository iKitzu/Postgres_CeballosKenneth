-- Tabla gama_producto
CREATE TABLE gama_producto (
    gama VARCHAR(50) PRIMARY KEY,
    descripcion_texto TEXT,
    descripcion_html TEXT,
    imagen VARCHAR(256)
);

-- Tabla producto
CREATE TABLE producto (
    codigo_producto VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(70),
    gama VARCHAR(50) REFERENCES gama_producto(gama),
    dimensiones VARCHAR(25),
    proveedor VARCHAR(50),
    descripcion TEXT,
    cantidad_en_stock SMALLINT,
    precio_venta DECIMAL(15, 2),
    precio_proveedor DECIMAL(15, 2)
);

-- Tabla oficina
CREATE TABLE oficina (
    codigo_oficina VARCHAR(10) PRIMARY KEY,
    ciudad VARCHAR(30),
    pais VARCHAR(50),
    region VARCHAR(50),
    codigo_postal VARCHAR(10),
    telefono VARCHAR(20),
    linea_direccion1 VARCHAR(50),
    linea_direccion2 VARCHAR(50)
);

-- Tabla empleado
CREATE TABLE empleado (
    codigo_empleado INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    extension VARCHAR(10),
    email VARCHAR(100),
    codigo_oficina VARCHAR(10) REFERENCES oficina(codigo_oficina),
    jefe INT,
    puesto VARCHAR(50)
);

-- Tabla cliente
CREATE TABLE cliente (
    codigo_cliente INT PRIMARY KEY,
    nombre_cliente VARCHAR(50),
    nombre_contacto VARCHAR(30),
    apellido_contacto VARCHAR(30),
    telefono VARCHAR(15),
    fax VARCHAR(15),
    linea_direccion1 VARCHAR(50),
    linea_direccion2 VARCHAR(50),
    ciudad VARCHAR(50),
    region VARCHAR(50),
    pais VARCHAR(50),
    codigo_postal VARCHAR(10),
    codigo_empleado_rep_ventas INT REFERENCES empleado(codigo_empleado),
    limite_credito DECIMAL(15, 2)
);

-- Tabla pedido
CREATE TABLE pedido (
    codigo_pedido INT PRIMARY KEY,
    fecha_pedido DATE,
    fecha_esperada DATE,
    fecha_entrega DATE,
    estado VARCHAR(15),
    comentarios TEXT,
    codigo_cliente INT REFERENCES cliente(codigo_cliente)
);

-- Tabla detalle_pedido
CREATE TABLE detalle_pedido (
    codigo_pedido INT REFERENCES pedido(codigo_pedido),
    codigo_producto VARCHAR(15) REFERENCES producto(codigo_producto),
    cantidad INT,
    precio_unidad DECIMAL(15, 2),
    numero_linea SMALLINT,
    PRIMARY KEY (codigo_pedido, codigo_producto)
);

-- Tabla pago
CREATE TABLE pago (
    codigo_cliente INT REFERENCES cliente(codigo_cliente),
    forma_pago VARCHAR(40),
    id_transaccion VARCHAR(50),
    fecha_pago DATE,
    total DECIMAL(15, 2),
    PRIMARY KEY (codigo_cliente, id_transaccion)
);
