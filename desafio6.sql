CREATE VIEW faturamento_atual AS
SELECT
MIN(plano.valor) AS faturamento_minimo,
MAX(plano.valor) AS faturamento_maximo,
ROUND(AVG(plano.valor), 2) AS faturamento_medio,
SUM(plano.valor) AS faturamento_total
FROM SpotifyClone.planos AS plano
INNER JOIN SpotifyClone.usuarios AS usuarios
ON usuarios.plano_id = plano.plano_id
