
-- CREAR BASE DE DATOS

CREATE DATABASE gestion_academica;
USE gestion_academica;

-- =========================================
-- TABLA DEPARTAMENTO
-- =========================================
CREATE TABLE departamento (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre_departamento VARCHAR(100) NOT NULL
);

-- =========================================
-- TABLA ESTUDIANTE
-- =========================================
CREATE TABLE estudiante (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================================
-- TABLA PROFESOR
-- =========================================
CREATE TABLE profesor (
    id_profesor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================================
-- TABLA CURSO
-- =========================================
CREATE TABLE curso (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre_curso VARCHAR(100) NOT NULL,
    id_profesor INT,
    FOREIGN KEY (id_profesor) REFERENCES profesor(id_profesor)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================================
-- TABLA CLASE
-- =========================================
CREATE TABLE clase (
    id_clase INT AUTO_INCREMENT PRIMARY KEY,
    id_curso INT,
    aula VARCHAR(20),
    horario VARCHAR(50),
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================================
-- TABLA INSCRIPCION
-- =========================================
CREATE TABLE inscripcion (
    id_inscripcion INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT,
    id_clase INT,
    fecha_inscripcion DATE,
    FOREIGN KEY (id_estudiante) REFERENCES estudiante(id_estudiante)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_clase) REFERENCES clase(id_clase)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================================
-- TABLA CALIFICACION
-- =========================================
CREATE TABLE calificacion (
    id_calificacion INT AUTO_INCREMENT PRIMARY KEY,
    id_inscripcion INT,
    nota DECIMAL(5,2),
    FOREIGN KEY (id_inscripcion) REFERENCES inscripcion(id_inscripcion)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================================
-- INSERCIÓN DE DATOS
-- =========================================

-- Departamentos
INSERT INTO departamento (nombre_departamento) VALUES
('Informática'),
('Administración'),
('Contabilidad');

-- Estudiantes
INSERT INTO estudiante (nombre, apellido, fecha_nacimiento, id_departamento) VALUES
('Ana', 'García', '2004-02-15', 1),
('Luis', 'Pérez', '2003-06-10', 2),
('Carlos', 'Ramírez', '2002-11-01', 1),
('Andrea', 'López', '2005-03-20', 3);

-- Profesores
INSERT INTO profesor (nombre, id_departamento) VALUES
('Juan Torres', 1),
('María Gómez', 2);

-- Cursos
INSERT INTO curso (nombre_curso, id_profesor) VALUES
('Base de Datos', 1),
('Programación', 1),
('Administración I', 2);

-- Clases
INSERT INTO clase (id_curso, aula, horario) VALUES
(1, 'A-101', 'Lunes 8-10'),
(2, 'A-102', 'Miércoles 10-12'),
(3, 'B-201', 'Martes 2-4');

-- Inscripciones
INSERT INTO inscripcion (id_estudiante, id_clase, fecha_inscripcion) VALUES
(1, 1, '2025-01-10'),
(1, 2, '2025-01-10'),
(2, 3, '2025-01-11'),
(3, 1, '2025-01-12'),
(4, 3, '2025-01-12');

-- Calificaciones
INSERT INTO calificacion (id_inscripcion, nota) VALUES
(1, 95),
(2, 90),
(3, 88),
(4, 92),
(5, 85);

-- =========================================
-- CONSULTAS BÁSICAS
-- =========================================

-- Todos los estudiantes
SELECT * FROM estudiante;

-- Estudiantes con su departamento
SELECT 
    e.nombre,
    e.apellido,
    d.nombre_departamento
FROM estudiante e
INNER JOIN departamento d ON e.id_departamento = d.id_departamento;

-- Cursos con profesores
SELECT 
    c.nombre_curso,
    p.nombre AS profesor
FROM curso c
INNER JOIN profesor p ON c.id_profesor = p.id_profesor;

-- =========================================
-- CONSULTAS ESTADÍSTICAS
-- =========================================

-- Cantidad de estudiantes por departamento
SELECT 
    d.nombre_departamento,
    COUNT(e.id_estudiante) AS total_estudiantes
FROM departamento d
LEFT JOIN estudiante e ON d.id_departamento = e.id_departamento
GROUP BY d.nombre_departamento;

-- Promedio de calificaciones por estudiante
SELECT 
    e.nombre,
    e.apellido,
    AVG(ca.nota) AS promedio
FROM estudiante e
INNER JOIN inscripcion i ON e.id_estudiante = i.id_estudiante
INNER JOIN calificacion ca ON i.id_inscripcion = ca.id_inscripcion
GROUP BY e.id_estudiante;

-- =========================================
-- MANIPULACIÓN DE DATOS (CRUD)
-- =========================================

-- INSERTAR
INSERT INTO estudiante (nombre, apellido, fecha_nacimiento, id_departamento)
VALUES ('Pedro', 'Martínez', '2004-09-18', 2);

-- ACTUALIZAR
UPDATE estudiante
SET apellido = 'Gómez'
WHERE id_estudiante = 1;

-- ELIMINAR
DELETE FROM estudiante
WHERE id_estudiante = 2;
