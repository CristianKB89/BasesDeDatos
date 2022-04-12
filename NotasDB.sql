-- -----------------------------------------------------
-- Schema notadDB1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS notadDB1 DEFAULT CHARACTER SET utf8 ;
USE notadDB1 ;

-- -----------------------------------------------------
-- Table notadDB1.usuarios
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS notadDB1.usuarios (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NULL,
  email VARCHAR(45) NULL,
  PRIMARY KEY (id)
)

-- -----------------------------------------------------
-- Table notadDB1.notas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS notadDB1.notas (
  id INT NOT NULL AUTO_INCREMENT,
  titulo VARCHAR(100) NULL,
  fecha_creacion DATE NULL,
  fecha_modifiacion DATE NULL,
  descripcion VARCHAR(45) NULL,
  importante TINYINT NULL,
  usuarios_id INT NOT NULL,
  PRIMARY KEY (id, usuarios_id),
  FOREIGN KEY (usuarios_id) REFERENCES notadDB1.usuarios (id)
)

-- -----------------------------------------------------
-- Table notadDB1.categorias
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS notadDB1.categorias (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NULL,
  PRIMARY KEY (id)
)

-- -----------------------------------------------------
-- Table notadDB1.notas_has_categorias
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS notadDB1.notas_has_categorias (
  notas_id INT NOT NULL,
  notas_usuarios_id INT NOT NULL AUTO_INCREMENT,
  categorias_id INT NOT NULL,
  PRIMARY KEY (notas_usuarios_id),
  FOREIGN KEY (notas_id)
  REFERENCES notadDB1.notas (id)
  FOREIGN KEY (categorias_id)
  REFERENCES notadDB1.categorias (id)
)

-- -----------------------------------------------------
-- Insertar Datos en las tablas
-- -----------------------------------------------------

INSERT INTO notaddb1.usuarios
values (DEFAULT, 'Shakira Marbell', 'shakiblack@gmail.com'),
(DEFAULT, 'Ernesto Perez', 'ernesto@gmail.com'),
(DEFAULT, 'Camilo Vargas', 'camilo@gmail.com'),
(DEFAULT, 'Omar Chaparro', 'omar@gmail.com'),
(DEFAULT, 'Cristian Camilo', 'cristiancam@gmail.com'),
(DEFAULT, 'Kevin Camacho', 'kevin@gmail.com'),
(DEFAULT, 'Roberto Gomez Bolañoz', 'roberto@gmail.com'),
(DEFAULT, 'Zoe de Brijaldo', 'zoe@gmail.com')


DELETE FROM notaddb1.usuarios
WHERE id>=2;


SELECT id, nombre, email
FROM notaddb1.usuarios;


INSERT INTO notaddb1.notas
(titulo, fecha_creacion, fecha_modifiacion, descripcion, importante, usuarios_id)
VALUES('Desaprobado', NOW(), NOW(), 'Paso raspando, estudie vago', 0, 1),
('Aprobado', NOW(), NOW(), 'Paso raspando, estudie vago', 0, 16),
('Desaprobado', NOW(), NOW(), 'Paso raspando, estudie vago', 0, 17),
('Aprobado', NOW(), NOW(), 'Paso raspando, estudie vago', 0, 18),
('Desaprobado', NOW(), NOW(), 'Paso raspando, estudie vago', 0, 19),
('Aprobado', NOW(), NOW(), 'Paso raspando, estudie vago', 0, 20),
('Aprobado', NOW(), NOW(), 'Paso raspando, estudie vago', 0, 22),
('Aprobado', NOW(), NOW(), 'Paso raspando, estudie vago', 0, 23),
('Aprobado', NOW(), NOW(), 'Paso raspando, estudie vago', 0, 24);

SELECT id, titulo, fecha_creacion, fecha_modifiacion, descripcion, importante, usuarios_id
FROM notaddb1.notas;


INSERT INTO notaddb1.categorias
(nombre)
VALUES("Matemáticas"),
("Física"),
("Español"),
("Ciencias"),
("Música"),
("Religión"),
("Calculo"),
("Soldadura"),
("Termodinamica"),
("Ingles");


SELECT id, nombre
FROM notaddb1.categorias;

INSERT INTO notaddb1.notas_has_categorias
(notas_id, categorias_id)
VALUES(1, 1);


SELECT notas_id, notas_usuarios_id, categorias_id
FROM notaddb1.notas_has_categorias;