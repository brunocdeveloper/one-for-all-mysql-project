SELECT
artistas.artista AS artista,
albuns.album AS album,
COUNT(seguidor.usuario_id) AS seguidores
FROM SpotifyClone.artistas AS artistas
INNER JOIN SpotifyClone.seguidores_artistas AS seguidor
ON artistas.artista_id = seguidor.artista_id
INNER JOIN SpotifyClone.albuns AS albuns ON albuns.artista_id = seguidor.artista_id
GROUP BY album, artista
ORDER BY seguidores DESC, artista ASC, album ASC;
