INSERT INTO usuarios (login, password, apodo, email) VALUES ("ramsus85", "P@ssword0112", "ramsus", "ramsus@ramsus.lat");
ALTER TABLE usuarios ADD COLUMN pais VARCHAR(25) NULL AFTER email;
UPDATE usuarios SET pais = 'Colombia' WHERE id = 1;
INSERT INTO usuarios (login, password, apodo, email, pais) VALUES ("PeterKlauss97", "P@ssword0112", "PeterKlauss", "peter@ramsus.lat", "Colombia");
CREATE TABLE IF NOT EXISTS etiquetas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_etiqueta VARCHAR(30) NOT NULL);

CREATE TABLE IF NOT EXISTS categorias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_categoria VARCHAR(30) NOT NULL);

ALTER TABLE usuarios DROP COLUMN pais;

CREATE TABLE IF NOT EXISTS posts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    contenido TEXT NOT NULL,
    fecha TIMESTAMP NOT NULL,
    estatus CHAR(1) NOT NULL DEFAULT 'A',
    id_usuario INT NOT NULL,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id));

-- set cascade to foreign keys
ALTER TABLE posts DROP FOREIGN KEY posts_ibfk_1;
ALTER TABLE posts DROP FOREIGN KEY posts_ibfk_2;
ALTER TABLE posts ADD FOREIGN KEY (id_usuario) REFERENCES usuarios(id) ON DELETE CASCADE;
ALTER TABLE posts ADD FOREIGN KEY (id_categoria) REFERENCES categorias(id) ON DELETE CASCADE;

CREATE TABLE IF NOT EXISTS comentarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    contenido TEXT NOT NULL,
    id_usuario INT NOT NULL,
    id_post INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_post) REFERENCES posts(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS post_etiquetas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_post INT NOT NULL,
    id_etiqueta INT NOT NULL,
    FOREIGN KEY (id_post) REFERENCES posts(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_etiqueta) REFERENCES etiquetas(id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO etiquetas (nombre_etiqueta) VALUES ("PHP");
INSERT INTO etiquetas (nombre_etiqueta) VALUES ("MySQL");
INSERT INTO etiquetas (nombre_etiqueta) VALUES ("HTML");
INSERT INTO etiquetas (nombre_etiqueta) VALUES ("CSS");
INSERT INTO etiquetas (nombre_etiqueta) VALUES ("JavaScript");
INSERT INTO etiquetas (nombre_etiqueta) VALUES ("Java");

INSERT INTO categorias (nombre_categoria) VALUES ("Programación");
INSERT INTO categorias (nombre_categoria) VALUES ("Diseño");
INSERT INTO categorias (nombre_categoria) VALUES ("Tecnología");

INSERT INTO usuarios (login, password, apodo, email) VALUES ("random1", "P@ssword0112", "random1", "r1@ghost.com");
INSERT INTO usuarios (login, password, apodo, email) VALUES ("random2", "P@ssword0112", "random2", "r2@gost.com");
INSERT INTO usuarios (login, password, apodo, email) VALUES ("random3", "P@ssword0112", "random3", "r3@gost.com");
INSERT INTO usuarios (login, password, apodo, email) VALUES ("random4", "P@ssword0112", "random4", "r4@gost.com");
INSERT INTO usuarios (login, password, apodo, email) VALUES ("random5", "P@ssword0112", "random5", "r5@gost.com");


INSERT INTO posts (titulo, contenido, fecha, id_usuario, id_categoria) VALUES ("Mi primer post", "Este es el contenido de mi primer post", NOW(), 1, 1);
INSERT INTO posts (titulo, contenido, fecha, id_usuario, id_categoria) VALUES ("Mi segundo post", "Este es el contenido de mi segundo post", NOW(), 1, 2);
INSERT INTO posts (titulo, contenido, fecha, id_usuario, id_categoria) VALUES ("Mi tercer post", "Este es el contenido de mi tercer post", NOW(), 1, 3);
INSERT INTO posts (titulo, contenido, fecha, id_usuario, id_categoria) VALUES ("Mi cuarto post", "Este es el contenido de mi cuarto post", NOW(), 2, 1);
INSERT INTO posts (titulo, contenido, fecha, id_usuario, id_categoria) VALUES ("Mi quinto post", "Este es el contenido de mi quinto post", NOW(), 2, 2);

INSERT INTO comentarios (contenido, id_usuario, id_post) VALUES ("Este es el contenido de mi primer comentario", 1, 1);
INSERT INTO comentarios (contenido, id_usuario, id_post) VALUES ("Este es el contenido de mi segundo comentario", 1, 1);
INSERT INTO comentarios (contenido, id_usuario, id_post) VALUES ("Este es el contenido de mi tercer comentario", 1, 1);
INSERT INTO comentarios (contenido, id_usuario, id_post) VALUES ("Este es el contenido de mi cuarto comentario", 2, 1);

INSERT INTO post_etiquetas (id_post, id_etiqueta) VALUES (1, 1);
INSERT INTO post_etiquetas (id_post, id_etiqueta) VALUES (1, 2);
INSERT INTO post_etiquetas (id_post, id_etiqueta) VALUES (1, 3);
INSERT INTO post_etiquetas (id_post, id_etiqueta) VALUES (2, 4);
INSERT INTO post_etiquetas (id_post, id_etiqueta) VALUES (2, 5);
INSERT INTO post_etiquetas (id_post, id_etiqueta) VALUES (2, 6);
INSERT INTO post_etiquetas (id_post, id_etiqueta) VALUES (3, 1);
INSERT INTO post_etiquetas (id_post, id_etiqueta) VALUES (3, 2);

-- create more posts

INSERT INTO posts (titulo, contenido, fecha, id_usuario, id_categoria) VALUES ("Mi sexto post", "Este es el contenido de mi sexto post", NOW(), 2, 3);
INSERT INTO posts (titulo, contenido, fecha, id_usuario, id_categoria) VALUES ("Mi septimo post", "Este es el contenido de mi septimo post", NOW(), 2, 1);
INSERT INTO posts (titulo, contenido, fecha, id_usuario, id_categoria) VALUES ("Mi octavo post", "Este es el contenido de mi octavo post", NOW(), 2, 2);
INSERT INTO posts (titulo, contenido, fecha, id_usuario, id_categoria) VALUES ("Mi noveno post", "Este es el contenido de mi noveno post", NOW(), 2, 3);
INSERT INTO posts (titulo, contenido, fecha, id_usuario, id_categoria) VALUES ("Mi decimo post", "Este es el contenido de mi decimo post", NOW(), 2, 1);

INSERT INTO comentarios (contenido, id_usuario, id_post) VALUES ("Este es el contenido de mi quinto comentario", 1, 2);
INSERT INTO comentarios (contenido, id_usuario, id_post) VALUES ("Este es el contenido de mi sexto comentario", 1, 2);
INSERT INTO comentarios (contenido, id_usuario, id_post) VALUES ("Este es el contenido de mi septimo comentario", 1, 2);
INSERT INTO comentarios (contenido, id_usuario, id_post) VALUES ("Este es el contenido de mi octavo comentario", 2, 2);

INSERT INTO post_etiquetas (id_post, id_etiqueta) VALUES (4, 1);
INSERT INTO post_etiquetas (id_post, id_etiqueta) VALUES (4, 2);
INSERT INTO post_etiquetas (id_post, id_etiqueta) VALUES (4, 3);
INSERT INTO post_etiquetas (id_post, id_etiqueta) VALUES (5, 4);
INSERT INTO post_etiquetas (id_post, id_etiqueta) VALUES (5, 5);
INSERT INTO post_etiquetas (id_post, id_etiqueta) VALUES (5, 6);
INSERT INTO post_etiquetas (id_post, id_etiqueta) VALUES (6, 1);
INSERT INTO post_etiquetas (id_post, id_etiqueta) VALUES (6, 2);
INSERT INTO post_etiquetas (id_post, id_etiqueta) VALUES (7, 3);
INSERT INTO post_etiquetas (id_post, id_etiqueta) VALUES (7, 4);
INSERT INTO post_etiquetas (id_post, id_etiqueta) VALUES (8, 5);
INSERT INTO post_etiquetas (id_post, id_etiqueta) VALUES (8, 6);
INSERT INTO post_etiquetas (id_post, id_etiqueta) VALUES (9, 1);
INSERT INTO post_etiquetas (id_post, id_etiqueta) VALUES (9, 2);
INSERT INTO post_etiquetas (id_post, id_etiqueta) VALUES (10, 3);
INSERT INTO post_etiquetas (id_post, id_etiqueta) VALUES (10, 4);

-- change status post 1
UPDATE posts SET status = 'I' WHERE id_post = 1;

-- CREAR POST HUERFANO
INSERT INTO posts (titulo, contenido, fecha, id_usuario, id_categoria) VALUES ("Mi post huerfano", "Este es el contenido de mi post huerfano", NOW(), 15, 1);


-- Para resolver este desafío debes contar la cantidad de reviews de todos los cursos de un mismo profesor y ordenarlos de forma descendente.

--    Vas a recibir 2 tablas: courses (con los campos id, name, n_reviews y teacher_id) y teachers (con los campos id y name).
--    Un mismo profesor puede estar asignado a múltiples cursos.
--    Por cada profesor con cursos asociados debes sumar la cantidad total de reviews de todos sus cursos.
--    Debes imprimir el nombre del profesor en una columna teacher y la suma total de sus reviews en una columna total_reviews.
--    Finalmente debes ordenar la agrupación de profesores y su cantidad total de reviews usando su propiedad total_reviews de forma descendente.
--    No debes contar profesores sin cursos asociados ni cursos sin al menos 1 review.
SELECT * FROM teachers LEFT JOIN courses ON teachers.id = courses.teacher_id;
SELECT  name AS teacher, SUM(n_reviews) AS total_reviews FROM teachers LEFT JOIN courses ON teachers.id = courses.teacher_id GROUP BY teacher ORDER BY total_reviews DESC;


CREATE TABLE IF NOT EXISTS comentarios (
    id INT PRIMARY KEY NOT NULL,
    cuerpo_comentario TEXT NOT NULL,
    usuario_id INT NOT NULL,
    post_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (post_id) REFERENCES posts(id)
);


INSERT INTO comentarios (id, cuerpo_comentario, usuario_id, post_id) VALUES (1, "Este es el contenido de mi primer comentario", 1, 45);
INSERT INTO comentarios (id, cuerpo_comentario, usuario_id, post_id) VALUES (2, "Este es el contenido de mi segundo comentario", 1, 45);
INSERT INTO comentarios (id, cuerpo_comentario, usuario_id, post_id) VALUES (3, "Este es el contenido de mi tercer comentario", 2, 45);
INSERT INTO comentarios (id, cuerpo_comentario, usuario_id, post_id) VALUES (4, "Este es el contenido de mi cuarto comentario", 2, 46);

SELECT * FROM comentarios;

SELECT c.cuerpo_comentario AS comentario, u.login AS usuario, p.titulo AS post
FROM comentarios AS c LEFT JOIN usuarios AS u ON c.usuario_id = u.id LEFT JOIN posts AS p  ON c.post_id = p.id
WHERE c.usuario_id = 1;

