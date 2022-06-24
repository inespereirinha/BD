/* OLAP */
/*
Usando a vista desenvolvida para a Questão 4, escreva duas consultas SQL que permitam analisar o 
número total de artigos vendidos:
1. num dado período (i.e. entre duas datas), por dia da semana, por concelho e no total*/

SELECT dia_semana, concelho, SUM (unidades) as total
FROM vendas
WHERE ano BETWEEN 2020 AND 2022
GROUP BY 
GROUPING SETS(dia_semana, concelho, ()); 

/*2. num dado distrito (i.e. "Lisboa"), por concelho, categoria, dia da semana e no total*/

SELECT distrito, concelho, cat, dia_semana, SUM (unidades) as total
FROM vendas
WHERE distrito = 'Lisboa'
GROUP BY 
GROUPING SETS((distrito, concelho), (distrito, cat), (distrito, dia_semana), ()); 
