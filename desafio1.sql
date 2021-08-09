DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE planos(
plano_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
plano VARCHAR(20) NOT NULL,
valor DECIMAL(10, 2) NOT NULL
);

CREATE TABLE usuarios(
usuario_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
usuario VARCHAR(50) NOT NULL,
idade INT NOT NULL,
plano_id INT NOT NULL,
CONSTRAINT FOREIGN KEY (plano_id) REFERENCES planos (plano_id)
);

CREATE TABLE artistas(
artista_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
artista VARCHAR(50) NOT NULL
);

CREATE TABLE albuns(
album_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
album VARCHAR(20) NOT NULL,
artista_id INT NOT NULL,
CONSTRAINT FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
);

CREATE TABLE cancoes(
cancoes_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
cancoes_nome VARCHAR(50) NOT NULL,
artista_id INT NOT NULL,
album_id INT NOT NULL,
CONSTRAINT FOREIGN KEY (artista_id) REFERENCES artistas (artista_id),
CONSTRAINT FOREIGN KEY (album_id) REFERENCES albuns (album_id)
);

CREATE TABLE historico_cancoes(
cancoes_id INT NOT NULL,
usuario_id INT NOT NULL,
CONSTRAINT PRIMARY KEY (cancoes_id, usuario_id),
CONSTRAINT FOREIGN KEY (cancoes_id) REFERENCES cancoes (cancoes_id),
CONSTRAINT FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id)
);

CREATE TABLE seguidores_artistas(
seguidor_id INT NOT NULL AUTO_INCREMENT,
usuario_id INT NOT NULL,
artista_id INT NOT NULL,
CONSTRAINT PRIMARY KEY(seguidor_id, usuario_id, artista_id),
CONSTRAINT FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
CONSTRAINT FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
);

INSERT INTO planos(plano, valor)
VALUES
('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99);

INSERT INTO usuarios(usuario, idade, plano_id)
VALUES
('Thati', 23,1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

INSERT INTO artistas(artista)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO albuns(album, artista_id)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO seguidores_artistas(artista_id, usuario_id)
VALUES
(1, 1),
(4, 1),
(3, 1),
(1, 2),
(3, 2),
(2, 3),
(1, 2),
(4, 4);

INSERT INTO cancoes(cancoes_nome, artista_id, album_id)
VALUES
('Soul For Us', 1, 1),
('Reflections Of Magic', 1, 1),
('Dance With Her Own', 1, 1),
('Troubles Of My Inner Fire', 1, 2),
('Time Fireworks', 1, 2),
('Magic Circus', 2, 3),
('Hovey, So Do I', 2, 3),
("Sweetie, Let's Go Wild", 2, 3),
('She Knows', 2, 3),
('Fantasy For Me', 3, 4),
('Celebration Of More', 3, 4),
('Rock His Everthing',3 ,4),
('Home Forever', 3, 4),
('Diamond Power', 3, 4),
("Honey, Let's Be Silly", 3, 4),
('Thang Of Thunder', 4, 5),
('Words Of Her Life', 4, 5),
('Without My Streets', 4, 5);

INSERT INTO historico_cancoes(cancoes_id, usuario_id)
VALUES
(1, 1),
(6, 1),
(14, 1),
(16, 1),
(13, 2),
(17, 2),
(2, 2),
(15, 2),
(4, 3),
(16, 3),
(6, 3),
(3, 4),
(18, 4),
(11, 4);
