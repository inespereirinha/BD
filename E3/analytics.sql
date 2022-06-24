/* OLAP */
/* 1. num dado período (i.e. entre duas datas), por dia da semana, por concelho e no total */

SELECT dia_semana, concelho, SUM (unidades) as total
FROM vendas
WHERE make_date(CAST(ano AS INTEGER), CAST(mes AS INTEGER), CAST(dia_mes AS INTEGER)) BETWEEN '2020-1-1' AND '2020-12-31'
GROUP BY
    CUBE(dia_semana, concelho)

/* 2. num dado distrito (i.e. "Lisboa"), por concelho, categoria, dia da semana e no total */

SELECT concelho, cat, dia_semana, SUM (unidades) as total
FROM vendas
WHERE distrito = 'Lisboa'
GROUP BY 
    CUBE (concelho, cat, dia_semana); 
