


CREATE DATABASE biblioteca;
USE biblioteca;


-- TABLA AUTORES
-- ===============================
CREATE TABLE autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(50)
);


-- TABLA LIBROS
-- ===============================
CREATE TABLE libros (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    anio_publicacion INT,
    id_autor INT,
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


-- INSERTAR AUTORES
-- ===============================
INSERT INTO autores (nombre, nacionalidad) VALUES
('Gabriel García Márquez', 'Colombiano'),
('Mario Vargas Llosa', 'Peruano'),
('Juan Bosch', 'Dominicano');


-- INSERTAR LIBROS
-- ===============================
INSERT INTO libros (titulo, anio_publicacion, id_autor) VALUES
('Cien años de soledad', 1967, 1),
('El amor en los tiempos del cólera', 1985, 1),
('La ciudad y los perros', 1963, 2),
('La mañosa', 1936, 3);

-- CONSULTAS
-- ===============================

-- Ver todos los autores
SELECT * FROM autores;

-- Ver todos los libros
SELECT * FROM libros;

-- Ver libros con su autor
SELECT 
    libros.titulo,
    libros.anio_publicacion,
    autores.nombre AS autor
FROM libros
INNER JOIN autores ON libros.id_autor = autores.id_autor;

-- Libros publicados después de 1960
SELECT titulo, anio_publicacion
FROM libros
WHERE anio_publicacion > 1960;
