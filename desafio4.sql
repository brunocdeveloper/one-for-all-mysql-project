CREATE VIEW top_3_artistas AS
SELECT
artistas.artista AS artista,
COUNT(*) AS seguidores
FROM SpotifyClone.artistas AS artistas
INNER JOIN SpotifyClone.seguidores_artistas as seguidores_artistas
ON seguidores_artistas.artista_id = artistas.artista_id
GROUP BY seguidores_artistas.artista_id
ORDER BY `seguidores` DESC, `artista`
LIMIT 3;
