insert into Categoria values ('Lacticinios');
insert into Categoria values ('Peixe');
insert into Categoria values ('Carne');
insert into Categoria values ('Queijo');
insert into Categoria values ('Iogurte');

insert into Categoria_simples values ('Peixe');
insert into Categoria_simples values ('Carne');
insert into Categoria_simples values ('Queijo');
insert into Categoria_simples values ('Iogurte');

insert into Super_categoria values ('Lacticinios');

insert into Tem_outra values ('Lacticinios', 'Queijo');
insert into Tem_outra values ('Lacticinios', 'Iogurte');

insert into Produto values ('9780525555230', 'Sardinha', 'Peixe');
insert into Produto values ('9780312330873', 'Picanha', 'Carne');
insert into Produto values ('9781471184307', 'Costoletas de Borrego', 'Carne');
insert into Produto values ('9780571334650', 'Iogurte Danone', 'Iogurte');
insert into Produto values ('9781501139239', 'Queijo da Serra', 'Queijo');
insert into Produto values ('9781250111173', 'Leite Vigor', 'Lacticinios');
insert into Produto values ('9781786495259', 'Bacalhau', 'Peixe');
insert into Produto values ('9781619634466', 'Iogurte Nestle', 'Iogurte');
insert into Produto values ('9780439023481', 'Queijo da Ilha', 'Queijo');
insert into Produto values ('9781786235459', 'Leite Matinal', 'Lacticinios');

insert into Tem_categoria values ('9780525555230', 'Peixe');
insert into Tem_categoria values ('9780312330873', 'Carne');
insert into Tem_categoria values ('9781471184307', 'Carne');
insert into Tem_categoria values ('9780571334650', 'Iogurte');
insert into Tem_categoria values ('9781501139239', 'Queijo');
insert into Tem_categoria values ('9781250111173', 'Lacticinios');
insert into Tem_categoria values ('9781619634466', 'Iogurte');
insert into Tem_categoria values ('9780439023481', 'Queijo');
insert into Tem_categoria values ('9781786495259', 'Lacticinios');

insert into IVM values ('155310', 'Fabricante 1');
insert into IVM values ('209265', 'Fabricante 2');
insert into IVM values ('348164', 'Fabricante 3');
insert into IVM values ('432944', 'Fabricante 4');
insert into IVM values ('572734', 'Fabricante 5');
insert into IVM values ('111111', 'Fabricante 6');

insert into Ponto_de_Retalho values ('Sage', 'Lisboa', 'Sintra');
insert into Ponto_de_Retalho values ('Olisoft', 'Lisboa', 'Mafra');
insert into Ponto_de_Retalho values ('Geocargo', 'Santarém', 'Ferreira do Zêzere');
insert into Ponto_de_Retalho values ('Vitopal', 'Leiria', 'Alcobaça');

insert into Instalada_em values ('572734', 'Fabricante 5', 'Sage');
insert into Instalada_em values ('432944', 'Fabricante 4', 'Olisoft');
insert into Instalada_em values ('348164', 'Fabricante 3', 'Geocargo');
insert into Instalada_em values ('209265', 'Fabricante 2', 'Vitopal');
insert into Instalada_em values ('155310', 'Fabricante 1', 'Sage');

insert into Prateleira values (1, '572734', 'Fabricante 5', 2.1, 'Peixe');
insert into Prateleira values (2, '572734', 'Fabricante 5', 1.7, 'Carne');
insert into Prateleira values (1, '432944', 'Fabricante 4', 4.3, 'Queijo');
insert into Prateleira values (2, '432944', 'Fabricante 4', 2.6, 'Iogurte');
insert into Prateleira values (1, '348164', 'Fabricante 3', 1.0, 'Lacticinios');
insert into Prateleira values (2, '348164', 'Fabricante 3', 3.5, 'Queijo');
insert into Prateleira values (1, '209265', 'Fabricante 2', 2.7, 'Carne');
insert into Prateleira values (2, '209265', 'Fabricante 2', 4.0, 'Peixe');
insert into Prateleira values (1, '155310', 'Fabricante 1', 1.8, 'Peixe');
insert into Prateleira values (2, '155310', 'Fabricante 1', 1.5, 'Iogurte');

insert into Planograma values ('9780525555230', 1, '572734', 'Fabricante 5', 2, 10, 'LOC1');
insert into Planograma values ('9780312330873', 2, '572734', 'Fabricante 5', 1, 8, 'LOC2');
insert into Planograma values ('9781619634466', 1, '432944', 'Fabricante 4', 4, 5, 'LOC3');
insert into Planograma values ('9781471184307', 2, '432944', 'Fabricante 4', 2, 12, 'LOC4');
insert into Planograma values ('9781250111173', 1, '348164', 'Fabricante 3', 1, 7, 'LOC2');
insert into Planograma values ('9781786495259', 2, '348164', 'Fabricante 3', 3, 16, 'LOC6');
insert into Planograma values ('9781786495259', 1, '209265', 'Fabricante 2', 2, 4, 'LOC7');
insert into Planograma values ('9780439023481', 2, '209265', 'Fabricante 2', 4, 11, 'LOC8');
insert into Planograma values ('9781250111173', 1, '155310', 'Fabricante 1', 1, 9, 'LOC9');
insert into Planograma values ('9780571334650', 2, '155310', 'Fabricante 1', 2, 2, 'LOC8');

insert into Retalhista values ('4098484', 'Butcher Inc.');
insert into Retalhista values ('3261780', 'João dos Queijos');
insert into Retalhista values ('2386323', 'Nazaré Pescadores');
insert into Retalhista values ('9860242', 'Talhos Silau');
insert into Retalhista values ('1553610', 'Iogu');
insert into Retalhista values ('0129249', 'Sweet Drop');


/*insert into Responsavel_por values ('Carne', '4098484', '155310', 'Fabricante 1');
insert into Responsavel_por values ('Queijo', '3261780', '209265', 'Fabricante 2');
insert into Responsavel_por values ('Peixe', '2386323', '348164', 'Fabricante 3');*/
/*insert into Responsavel_por values ('Carne', '9860242', '432944', 'Fabricante 4');*/
/*insert into Responsavel_por values ('Iogurte', '1553610', '572734', 'Fabricante 5');*/
insert into Responsavel_por values ('Peixe', '0129249', '348164', 'Fabricante 3');
insert into Responsavel_por values ('Carne', '0129249', '155310', 'Fabricante 1');
insert into Responsavel_por values ('Carne', '0129249', '209265', 'Fabricante 2');
insert into Responsavel_por values ('Iogurte', '0129249', '572734', 'Fabricante 5');
insert into Responsavel_por values ('Lacticinios', '0129249', '432944', 'Fabricante 4');


insert into Evento_reposicao values ('9780525555230', 1, '572734', 'Fabricante 5', '2018-01-12 13:30:15', 10, '1553610');
insert into Evento_reposicao values ('9780312330873', 2, '572734', 'Fabricante 5', '2018-02-12 13:30:15', 8, '1553610');
insert into Evento_reposicao values ('9781619634466', 1, '432944', 'Fabricante 4', '2019-03-12 13:30:15', 5, '9860242');
insert into Evento_reposicao values ('9781471184307', 2, '432944', 'Fabricante 4', '2019-04-12 13:30:15', 12, '9860242');
insert into Evento_reposicao values ('9781250111173', 1, '348164', 'Fabricante 3', '2019-05-12 13:30:15', 7, '2386323');
insert into Evento_reposicao values ('9781786495259', 2, '348164', 'Fabricante 3', '2020-06-12 13:30:15', 16, '2386323');
insert into Evento_reposicao values ('9781786495259', 1, '209265', 'Fabricante 2', '2020-07-12 13:30:15', 4, '3261780');
insert into Evento_reposicao values ('9780439023481', 2, '209265', 'Fabricante 2', '2021-08-12 13:30:15', 11, '3261780');
insert into Evento_reposicao values ('9780571334650', 2, '155310', 'Fabricante 1', '2022-10-12 13:30:15', 2, '4098484');
