CREATE VIEW top_2_hits_do_momento AS
SELECT
cancoes.cancoes_nome AS 'cancao',
COUNT(*) AS 'reproducoes'
FROM SpotifyClone.cancoes AS cancoes
INNER JOIN SpotifyClone.historico_cancoes AS historico
ON historico.cancoes_id = cancoes.cancoes_id
GROUP BY historico.cancoes_id
ORDER BY `reproducoes` DESC, `cancao`
LIMIT 2;
