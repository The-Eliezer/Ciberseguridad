
-- CREAR BASE DE DATOS

CREATE DATABASE sistema_educativo;
USE sistema_educativo;


-- TABLA DEPARTAMENTOS

CREATE TABLE departamentos (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre_departamento VARCHAR(100) NOT NULL
);


-- TABLA ESTUDIANTES

CREATE TABLE estudiantes (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


-- TABLA PROFESORES

CREATE TABLE profesores (
    id_profesor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);


-- TABLA CURSOS

CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre_curso VARCHAR(100) NOT NULL,
    id_profesor INT,
    FOREIGN KEY (id_profesor) REFERENCES profesores(id_profesor)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


-- TABLA CALIFICACIONES

CREATE TABLE calificaciones (
    id_calificacion INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT,
    id_curso INT,
    nota DECIMAL(5,2),
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

-- Departamentos
INSERT INTO departamentos (nombre_departamento) VALUES
('Informática'),
('Administración'),
('Contabilidad');

-- Estudiantes
INSERT INTO estudiantes (nombre, apellido, fecha_nacimiento, id_departamento) VALUES
('Ana', 'García', '2004-02-15', 1),
('Luis', 'Pérez', '2003-07-10', 2),
('Andrea', 'Martínez', '2005-01-20', 1),
('Carlos', 'García', '2002-09-05', 3),
('Alberto', 'Ramírez', '2001-12-01', 2),
('María', 'López', '2004-06-18', 1);

-- Profesores
INSERT INTO profesores (nombre) VALUES
('Juan Torres'),
('Pedro Santana');

-- Cursos
INSERT INTO cursos (nombre_curso, id_profesor) VALUES
('Base de Datos', 1),
('Programación', 1),
('Contabilidad Básica', 2);

-- Calificaciones
INSERT INTO calificaciones (id_estudiante, id_curso, nota) VALUES
(1, 1, 95),
(1, 2, 90),
(2, 3, 85),
(3, 1, 92),
(3, 2, 94),
(4, 3, 88),
(5, 1, 91),
(6, 2, 96);

-- CONSULTAS


SELECT * FROM estudiantes;
SELECT nombre, apellido FROM estudiantes;
SELECT e.nombre, e.apellido
FROM estudiantes e
INNER JOIN departamentos d ON e.id_departamento = d.id_departamento
WHERE d.nombre_departamento = 'Informática';

SELECT nombre, apellido, fecha_nacimiento
FROM estudiantes
ORDER BY fecha_nacimiento ASC;

SELECT COUNT(*) AS total_estudiantes FROM estudiantes;

SELECT * FROM estudiantes
WHERE apellido = 'García';

SELECT * FROM estudiantes
WHERE nombre LIKE 'A%';

SELECT 
    e.nombre,
    e.apellido,
    d.nombre_departamento
FROM estudiantes e
INNER JOIN departamentos d ON e.id_departamento = d.id_departamento;

SELECT 
    e.nombre,
    e.apellido,
    AVG(c.nota) AS promedio
FROM estudiantes e
INNER JOIN calificaciones c ON e.id_estudiante = c.id_estudiante
GROUP BY e.id_estudiante;

SELECT 
    d.nombre_departamento,
    COUNT(e.id_estudiante) AS total_estudiantes
FROM departamentos d
LEFT JOIN estudiantes e ON d.id_departamento = e.id_departamento
GROUP BY d.nombre_departamento;

SELECT 
    p.nombre AS profesor,
    c.nombre_curso
FROM profesores p
INNER JOIN cursos c ON p.id_profesor = c.id_profesor;


SELECT 
    e.nombre,
    e.apellido,
    AVG(c.nota) AS promedio
FROM estudiantes e
INNER JOIN calificaciones c ON e.id_estudiante = c.id_estudiante
GROUP BY e.id_estudiante
HAVING promedio > 90;


SELECT 
    e.nombre,
    e.apellido,
    AVG(c.nota) AS promedio
FROM estudiantes e
INNER JOIN calificaciones c ON e.id_estudiante = c.id_estudiante
GROUP BY e.id_estudiante
ORDER BY promedio DESC
LIMIT 5;












