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
    super_categoria VARCHAR(255) UNIQUE,
    categoria VARCHAR(255) UNIQUE,
    PRIMARY KEY (super_categoria),
    FOREIGN KEY (super_categoria) REFERENCES Super_categoria(nome),
    FOREIGN KEY (categoria) REFERENCES Categoria(nome)
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
    FOREIGN KEY (ean) REFERENCES Produto(ean)
    FOREIGN KEY (nome) REFERENCES Categoria(nome)
);

CREATE TABLE IVM(
    num_serie INTEGER,
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
    num_serie INTEGER,
    fabricante VARCHAR(255),
    local VARCHAR(255),
    FOREIGN KEY(num_serie, fabricante) REFERENCES IVM(num_serie, fabricante)
    FOREIGN KEY(local) REFERENCES Ponto_de_retalho
);

CREATE TABLE Prateleira(
    nro INTEGER,
    num_serie INTEGER,
    fabricante VARCHAR(255),
    altura FLOAT,
    nome VARCHAR(255),
    PRIMARY KEY (nro, num_serie, fabricante),
    FOREIGN KEY (nome) REFERENCES Categoria(nome)
);

CREATE TABLE Planograma(
    ean CHAR(13),
    nro INTEGER,
    num_serie INTEGER,
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
    num_serie INTEGER,
    fabricante VARCHAR(255), 
    PRIMARY KEY (num_serie, fabricante),
    FOREIGN KEY(num_serie, fabricante) REFERENCES IVM(num_serie, fabricante),
    FOREIGN KEY(tin) REFERENCES Retalhista(tin),
    FOREIGN KEY(nome_cat) REFERENCES Categoria(nome)
);

CREATE TABLE Evento_reposicao(
    ean CHAR(13),
    nro INTEGER,
    num_serie INTEGER,
    fabricante VARCHAR(255),
    instante INTEGER,
    unidades INTEGER,
    tin VARCHAR(255),
    PRIMARY KEY (ean, nro, num_serie, fabricante, instante),
    FOREIGN KEY (ean, nro, num_serie, fabricante) REFERENCES Planograma(ean, nro, num_serie, fabricante),
    FOREIGN KEY (tin) REFERENCES Retalhista(tin)
);


Vendas (ean, cat, ano, trimestre, dia_mes, dia_semana, distrito, concelho, unidades)
-> unidades: corresponde ao atributo com o mesmo nome da relação evento_reposicao
-> ean e cat: correspondem às chaves primárias das relações produto e categoria, respectivamente
-> distrito e concelho: correspondem aos atributos com o mesmo nome de ponto_de_retalho
-> ano, trimestre, mes e dia_semana: atributos derivados do atributo instante

CREATE VIEW vendas AS 
SELECT ean, nome AS cat, distrito, concelho, unidades
FROM Evento_reposicao JOIN Categoria JOIN Instalada_em JOIN Ponto_de_retalho
WHERE 
