-- ===============================
-- CREAR BASE DE DATOS
-- ===============================
CREATE DATABASE ventas;
USE ventas;

-- ===============================
-- TABLA CLIENTES
-- ===============================
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    correo VARCHAR(100)
);

-- ===============================
-- TABLA PRODUCTOS
-- ===============================
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL
);

-- ===============================
-- TABLA FACTURAS
-- ===============================
CREATE TABLE facturas (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    id_cliente INT,
    id_producto INT,
    cantidad INT NOT NULL,
    total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ===============================
-- INSERTAR CLIENTES
-- ===============================
INSERT INTO clientes (nombre, telefono, correo) VALUES
('Juan Pérez', '809-555-1234', 'juan@email.com'),
('María Gómez', '829-555-5678', 'maria@email.com');

-- ===============================
-- INSERTAR PRODUCTOS
-- ===============================
INSERT INTO productos (nombre, precio, stock) VALUES
('Laptop', 45000.00, 10),
('Mouse', 750.00, 50),
('Teclado', 1500.00, 30);

-- ===============================
-- INSERTAR FACTURAS
-- ===============================
INSERT INTO facturas (fecha, id_cliente, id_producto, cantidad, total) VALUES
('2025-01-10', 1, 1, 1, 45000.00),
('2025-01-10', 1, 2, 2, 1500.00),
('2025-01-11', 2, 3, 1, 1500.00);

-- ===============================
-- CONSULTAS
-- ===============================

-- Ver clientes
SELECT * FROM clientes;

-- Ver productos
SELECT * FROM productos;

-- Ver facturas con cliente y producto
SELECT 
    f.id_factura,
    f.fecha,
    c.nombre AS cliente,
    p.nombre AS producto,
    f.cantidad,
    f.total
FROM facturas f
INNER JOIN clientes c ON f.id_cliente = c.id_cliente
INNER JOIN productos p ON f.id_producto = p.id_producto;

-- Total vendido por cliente
SELECT 
    c.nombre AS cliente,
    SUM(f.total) AS total_vendido
FROM facturas f
INNER JOIN clientes c ON f.id_cliente = c.id_cliente
GROUP BY c.nombre;

-- Productos con stock bajo (menos de 20)
SELECT nombre, stock
FROM productos
WHERE stock < 20;
