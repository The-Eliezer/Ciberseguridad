-- ===============================
-- CREAR BASE DE DATOS
-- ===============================
CREATE DATABASE colegio;
USE colegio;

-- ===============================
-- TABLA ESTUDIANTES
-- ===============================
CREATE TABLE estudiantes (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    correo VARCHAR(100)
);

-- ===============================
-- TABLA CURSOS
-- ===============================
CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre_curso VARCHAR(100) NOT NULL,
    creditos INT NOT NULL
);

-- ===============================
-- TABLA MATRICULAS
-- ===============================
CREATE TABLE matriculas (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT,
    id_curso INT,
    fecha_matricula DATE NOT NULL,
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ===============================
-- INSERTAR ESTUDIANTES
-- ===============================
INSERT INTO estudiantes (nombre, fecha_nacimiento, correo) VALUES
('Carlos Rodríguez', '2006-05-14', 'carlos@correo.com'),
('Ana Martínez', '2007-08-22', 'ana@correo.com'),
('Luis Pérez', '2006-11-02', 'luis@correo.com');

-- ===============================
-- INSERTAR CURSOS
-- ===============================
INSERT INTO cursos (nombre_curso, creditos) VALUES
('Matemáticas', 4),
('Lengua Española', 3),
('Informática', 2);

-- ===============================
-- INSERTAR MATRICULAS
-- ===============================
INSERT INTO matriculas (id_estudiante, id_curso, fecha_matricula) VALUES
(1, 1, '2025-01-05'),
(1, 3, '2025-01-05'),
(2, 2, '2025-01-06'),
(3, 1, '2025-01-06'),
(3, 2, '2025-01-06');

-- ===============================
-- CONSULTAS
-- ===============================

-- Ver todos los estudiantes
SELECT * FROM estudiantes;

-- Ver todos los cursos
SELECT * FROM cursos;

-- Ver matrículas con estudiante y curso
SELECT 
    m.id_matricula,
    e.nombre AS estudiante,
    c.nombre_curso AS curso,
    m.fecha_matricula
FROM matriculas m
INNER JOIN estudiantes e ON m.id_estudiante = e.id_estudiante
INNER JOIN cursos c ON m.id_curso = c.id_curso;

-- Ver cursos matriculados por estudiante
SELECT 
    e.nombre AS estudiante,
    c.nombre_curso AS curso
FROM matriculas m
INNER JOIN estudiantes e ON m.id_estudiante = e.id_estudiante
INNER JOIN cursos c ON m.id_curso = c.id_curso
ORDER BY e.nombre;

-- Cantidad de estudiantes por curso
SELECT 
    c.nombre_curso,
    COUNT(m.id_estudiante) AS total_estudiantes
FROM matriculas m
INNER JOIN cursos c ON m.id_curso = c.id_curso
GROUP BY c.nombre_curso;
