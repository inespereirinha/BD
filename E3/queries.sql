
/* SQL */

/* Qual o nome do retalhista (ou retalhistas) responsáveis pela reposição do maior número de 
categorias? */
SELECT nome FROM retalhista WHERE tin IN(
	SELECT R.tin
	FROM Retalhista E JOIN Responsavel_por R ON R.tin = E.tin
	GROUP BY R.tin
	HAVING COUNT(*) >= ALL (
		SELECT COUNT(*)
		FROM Responsavel_por T
		GROUP BY tin)
);

/* Qual o nome do ou dos retalhistas que são responsáveis por todas as categorias simples? */
SELECT nome FROM retalhista WHERE tin IN(
	SELECT R.tin
	FROM responsavel_por R
	WHERE nome_cat IN (SELECT nome FROM categoria_simples)
	GROUP BY R.tin
	HAVING COUNT(nome_cat) = (SELECT COUNT(*) FROM categoria_simples)
)

/* Quais os produtos (ean) que nunca foram repostos? */
(SELECT ean FROM Produto)
EXCEPT
(SELECT ean FROM Produto WHERE ean IN (SELECT ean FROM Evento_reposicao));


/* Quais os produtos (ean) que foram repostos sempre pelo mesmo retalhista? */
SELECT ean FROM Produto WHERE ean IN(
	SELECT E.ean
	FROM Evento_reposicao E
	GROUP BY E.ean
	HAVING COUNT(DISTINCT E.tin) = 1);