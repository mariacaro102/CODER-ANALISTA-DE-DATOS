--SECCION 1 - DROP TABLATE
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;


--SECCION 2- CREATETABLE
CREATE DATABASE Ventas_Tech_DB;
GO
USE Ventas_Tech_DB;
GO
--CREAR TABLAS
CREATE TABLE categorias (
    id_categoria     INT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL,
    descripcion      VARCHAR(200)
);

CREATE TABLE clientes (
    id_cliente     INT PRIMARY KEY,
    nombre         VARCHAR(100) NOT NULL,
    email          VARCHAR(100) NOT NULL UNIQUE,
    ciudad         VARCHAR(50),
    fecha_registro DATE NOT NULL
);

CREATE TABLE productos (
    id_producto     INT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    id_categoria    INT,
    precio          DECIMAL(10,2) NOT NULL,
    stock           INT DEFAULT 0,
    activo          BIT DEFAULT 1,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE ventas (
    id_venta        INT PRIMARY KEY,
    id_cliente      INT NULL,              
    id_producto     INT NOT NULL,
    cantidad        INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    fecha_venta     DATE NOT NULL,
    FOREIGN KEY (id_cliente)  REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- SECCION 3: INSERTDATA

INSERT INTO categorias VALUES 
(1 , 'Computacion', 'Laptops, monitores y almacenamiento'),
(2 , 'Accesorios',  'Perifericos y complementos'),
(3 , 'Audio',       'Auriculares y parlantes'),
(4 , 'Almacenamiento', 'Discos y memorias');


INSERT INTO clientes VALUES
(101, 'Maria Lopez',     'maria@mail.com',   'Posadas',      '2025-03-10'),
(102, 'Juan Benitez',    'juan@mail.com',    'Obera',        '2025-05-22'),
(103, 'Carla Gimenez',   'carla@mail.com',   'Resistencia',  '2025-06-01'),
(104, 'Diego Ramirez',   'diego@mail.com',   'Corrientes',   '2025-08-15'),
(105, 'Lucia Fernandez', 'lucia@mail.com',   'Posadas',      '2025-11-03');

INSERT INTO productos VALUES
(1, 'Laptop Pro 15',     1, 1200.00, 15, 1),
(2, 'Monitor 24',        1,  150.00, 30, 1),
(3, 'Teclado mecanico',  2,   80.00, 40, 1),
(4, 'Auriculares BT',    3,  250.00, 25, 1),
(5, 'Mouse inalambrico', 2,   50.00, 90, 1),
(6, 'Webcam HD',         2,   70.00, 20, 1);

-- SECCION 4- VALIDACIÓN
SELECT * FROM categorias;   
SELECT * FROM clientes;     
SELECT * FROM productos;   
SELECT * FROM ventas;


















