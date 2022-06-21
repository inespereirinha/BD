DROP VIEW IF EXISTS vendas;
DROP TABLE IF EXISTS Evento_reposicao;
DROP TABLE IF EXISTS Responsavel_por;
DROP TABLE IF EXISTS Retalhista;
DROP TABLE IF EXISTS Planograma;
DROP TABLE IF EXISTS Prateleira;
DROP TABLE IF EXISTS Instalada_em;
DROP TABLE IF EXISTS Ponto_de_retalho;
DROP TABLE IF EXISTS IVM;
DROP TABLE IF EXISTS Tem_categoria;
DROP TABLE IF EXISTS Produto;
DROP TABLE IF EXISTS Tem_outra;
DROP TABLE IF EXISTS Super_categoria;
DROP TABLE IF EXISTS Categoria_simples;
DROP TABLE IF EXISTS Categoria;

CREATE TABLE Categoria(
    nome VARCHAR(255),
    PRIMARY KEY(nome)
);

CREATE TABLE Categoria_simples(
    nome VARCHAR(255),
    PRIMARY KEY (nome),
    FOREIGN KEY (nome) REFERENCES Categoria(nome)
);

CREATE TABLE Super_categoria(
    nome VARCHAR(255),
    PRIMARY KEY (nome),
    FOREIGN KEY (nome) REFERENCES Categoria(nome)
);

CREATE TABLE Tem_outra(
    super_categoria VARCHAR(255),
    categoria VARCHAR(255),
    PRIMARY KEY (categoria),
    FOREIGN KEY (super_categoria) REFERENCES Super_categoria(nome),
    FOREIGN KEY (categoria) REFERENCES Categoria(nome),
    CHECK(categoria != super_categoria)
);

CREATE TABLE Produto(
    ean CHAR(13),
    descr VARCHAR(255),
    cat VARCHAR(255),
    PRIMARY KEY (ean),
    FOREIGN KEY (cat) REFERENCES Categoria(nome)
);

CREATE TABLE Tem_categoria(
    ean CHAR(13),
    nome VARCHAR(255),
    FOREIGN KEY (ean) REFERENCES Produto(ean),
    FOREIGN KEY (nome) REFERENCES Categoria(nome)
);

CREATE TABLE IVM(
    num_serie VARCHAR(255),
    fabricante VARCHAR(255),
    PRIMARY KEY(num_serie, fabricante),
    CHECK(num_serie > 0)
);

CREATE TABLE Ponto_de_retalho(
    nome VARCHAR(255),
    distrito VARCHAR(255),
    concelho VARCHAR(255),
    PRIMARY KEY (nome)
);

CREATE TABLE Instalada_em(
    num_serie VARCHAR(255),
    fabricante VARCHAR(255),
    loc VARCHAR(255),
    FOREIGN KEY(num_serie, fabricante) REFERENCES IVM(num_serie, fabricante),
    FOREIGN KEY(loc) REFERENCES Ponto_de_retalho
);

CREATE TABLE Prateleira(
    nro INTEGER,
    num_serie VARCHAR(255),
    fabricante VARCHAR(255),
    altura FLOAT,
    nome VARCHAR(255),
    PRIMARY KEY (nro, num_serie, fabricante),
    FOREIGN KEY (nome) REFERENCES Categoria(nome)
);

CREATE TABLE Planograma(
    ean CHAR(13),
    nro INTEGER,
    num_serie VARCHAR(255),
    fabricante VARCHAR(255),
    faces INTEGER, /* ADDED: */ 
    unidades INTEGER,
    loc VARCHAR(255),
    PRIMARY KEY(ean, nro, num_serie, fabricante),
    FOREIGN KEY(nro, num_serie, fabricante) REFERENCES Prateleira(nro, num_serie, fabricante)
);

CREATE TABLE Retalhista(
    tin VARCHAR(255),
    nome VARCHAR(255) UNIQUE,
    PRIMARY KEY (tin) 
);

CREATE TABLE Responsavel_por(
    nome_cat VARCHAR(255),
    tin VARCHAR(255),
    num_serie VARCHAR(255),
    fabricante VARCHAR(255), 
    PRIMARY KEY (num_serie, fabricante),
    FOREIGN KEY(num_serie, fabricante) REFERENCES IVM(num_serie, fabricante),
    FOREIGN KEY(tin) REFERENCES Retalhista(tin),
    FOREIGN KEY(nome_cat) REFERENCES Categoria(nome)
);

CREATE TABLE Evento_reposicao(
    ean CHAR(13),
    nro INTEGER,
    num_serie VARCHAR(255),
    fabricante VARCHAR(255),
    instante TIMESTAMP, /* DATE? */
    unidades INTEGER,
    tin VARCHAR(255),
    PRIMARY KEY (ean, nro, num_serie, fabricante, instante),
    FOREIGN KEY (ean, nro, num_serie, fabricante) REFERENCES Planograma(ean, nro, num_serie, fabricante),
    FOREIGN KEY (tin) REFERENCES Retalhista(tin)
);

/*VIEW*/

CREATE VIEW vendas (ean, cat, ano, trimestre, mes, dia_mes, dia_semana, distrito, concelho, unidades) AS 
SELECT R.ean, C.nome AS cat, 
	 EXTRACT(YEAR FROM R.instante) AS ano, EXTRACT(QUARTER FROM R.instante) AS trimestre,
	 EXTRACT(MONTH FROM R.instante) AS mes, EXTRACT(DAY FROM R.instante) AS dia_mes, 
	 EXTRACT(DOW FROM R.instante) AS dia_semana,
	 P.distrito, P.concelho, R.unidades
    FROM Evento_reposicao R JOIN Tem_categoria C ON  C.ean = R.ean
        JOIN Instalada_em I ON R.num_serie = I.num_serie JOIN Ponto_de_retalho P ON I.loc = P.nome;

/* SQL */




