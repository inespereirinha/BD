/* OLAP */
/*
Usando a vista desenvolvida para a Questão 4, escreva duas consultas SQL que permitam analisar o 
número total de artigos vendidos:
1. num dado período (i.e. entre duas datas), por dia da semana, por concelho e no total*/

SELECT dia_semana, concelho, SUM (unidades) as total
FROM vendas
WHERE make_date(CAST(ano AS INTEGER), CAST(mes AS INTEGER), CAST(dia_mes AS INTEGER)) BETWEEN '2020-1-1' AND '2020-12-31'
GROUP BY
GROUPING SETS(dia_semana, concelho, ()); 

/* OUUUUUUUUUUUUUUUU GROUPING SETS */

SELECT dia_semana, concelho, SUM (unidades) as total
FROM vendas
WHERE make_date(CAST(ano AS INTEGER), CAST(mes AS INTEGER), CAST(dia_mes AS INTEGER)) BETWEEN '2020-1-1' AND '2020-12-31'
GROUP BY
    CUBE(dia_semana, concelho)

/*2. num dado distrito (i.e. "Lisboa"), por concelho, categoria, dia da semana e no total */

SELECT distrito, concelho, cat, dia_semana, SUM (unidades) as total
FROM vendas
WHERE distrito = 'Lisboa'
GROUP BY 
GROUPING SETS((distrito, concelho), (distrito, cat), (distrito, dia_semana), ()); 

/* OUUUUUU CUBE PROB */

SELECT concelho, cat, dia_semana, SUM (unidades) as total
FROM vendas
WHERE distrito = 'Lisboa'
GROUP BY 
    CUBE (concelho, cat, dia_semana); 
