DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nome VARCHAR(20))
BEGIN
SELECT
artistas.artista AS artista,
albuns.album AS album
FROM SpotifyClone.artistas AS artistas
INNER JOIN SpotifyClone.albuns AS albuns
ON artistas.artista_id = albuns.artista_id
WHERE artistas.artista = nome
ORDER BY album;
END $$

DELIMITER ;
