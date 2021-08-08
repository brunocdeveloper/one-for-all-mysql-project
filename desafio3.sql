CREATE VIEW historico_reproducao_usuarios AS
SELECT usuario.usuario AS usuario, c.cancoes_nome AS nome
FROM SpotifyClone.cancoes AS c
INNER JOIN SpotifyClone.historico_cancoes AS historico
ON c.cancoes_id = historico.cancoes_id
INNER JOIN SpotifyClone.usuarios AS usuario
ON historico.usuario_id = usuario.usuario_id
ORDER BY usuario.usuario, c.cancoes_nome;
