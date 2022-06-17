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
insert into Produto values ('1111222233309', 'Leite Matinal', 'Lacticinios');

insert into Tem_categoria values ('9780525555230', 'Peixe');
insert into Tem_categoria values ('9780312330873', 'Carne');
insert into Tem_categoria values ('9781471184307', 'Carne');
insert into Tem_categoria values ('9780571334650', 'Iogurte');
insert into Tem_categoria values ('9781501139239', 'Queijo');
insert into Tem_categoria values ('9781250111173', 'Lacticinios');
insert into Tem_categoria values ('9781786495259', 'Peixe');
insert into Tem_categoria values ('9781619634466', 'Iogurte');
insert into Tem_categoria values ('9780439023481', 'Queijo');
insert into Tem_categoria values ('1111222233309', 'Lacticinios');

insert into IVM values ('155310', 'Fabricante 1');
insert into IVM values ('209265', 'Fabricante 2');
insert into IVM values ('348164', 'Fabricante 3');
insert into IVM values ('432944', 'Fabricante 4');
insert into IVM values ('572734', 'Fabricante 5');

insert into Ponto de Retalho values ('Sage', 'Lisboa', 'Sintra');
insert into Ponto de Retalho values ('Olisoft', 'Lisboa', 'Mafra');
insert into Ponto de Retalho values ('Geocargo', 'Santarém', 'Ferreira do Zêzere');
insert into Ponto de Retalho values ('Vitopal', 'Leiria', 'Alcobaça');

insert into Instalada_em values ('572734', 'Fabricante 5', 'Rua Andreia');
insert into Instalada_em values ('432944', 'Fabricante 4', 'Rua Camila');
insert into Instalada_em values ('348164', 'Fabricante 3', 'Rua Inês');
insert into Instalada_em values ('209265', 'Fabricante 2', 'Rua Marta');
insert into Instalada_em values ('155310', 'Fabricante 1', 'Rua Teresa');

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

insert into Retalhista values ('4098484', 'Butcher Inc.');3
insert into Retalhista values ('3261780', 'João dos Queijos');
insert into Retalhista values ('2386323', 'Nazaré Pescadores');
insert into Retalhista values ('9860242', 'Butcher Inc.');
insert into Retalhista values ('1553610', 'Cheese Brothers');
