CREATE VIEW vendas (ean, cat, ano, trimestre, mes, dia_mes, dia_semana, distrito, concelho, unidades) AS 
SELECT R.ean, C.nome AS cat, 
	 EXTRACT(YEAR FROM R.instante) AS ano, EXTRACT(QUARTER FROM R.instante) AS trimestre,
	 EXTRACT(MONTH FROM R.instante) AS mes, EXTRACT(DAY FROM R.instante) AS dia_mes, 
	 EXTRACT(DOW FROM R.instante) AS dia_semana,
	 P.distrito, P.concelho, R.unidades
    FROM Evento_reposicao R JOIN Tem_categoria C ON  C.ean = R.ean
        JOIN Instalada_em I ON R.num_serie = I.num_serie JOIN Ponto_de_retalho P ON I.loc = P.nome;
