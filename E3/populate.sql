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

insert into Produto values ('9780000000000', 'Leite Matinal', 'Lacticinios');
insert into Produto values ('9780000000001', 'Leite Vigor', 'Lacticinios');
insert into Produto values ('9781111111111', 'Sardinha', 'Peixe');
insert into Produto values ('9781111111112', 'Bacalhau', 'Peixe');
insert into Produto values ('9782222222222', 'Picanha', 'Carne');
insert into Produto values ('9782222222223', 'Costoletas de Borrego', 'Carne');
insert into Produto values ('9783333333333', 'Queijo da Serra', 'Queijo');
insert into Produto values ('9783333333334', 'Queijo da Ilha', 'Queijo');
insert into Produto values ('9784444444444', 'Iogurte Danone', 'Iogurte');
insert into Produto values ('9784444444445', 'Iogurte Nestle', 'Iogurte');

insert into Tem_categoria values ('9780000000000', 'Lacticinios');
insert into Tem_categoria values ('9780000000001', 'Lacticinios');
insert into Tem_categoria values ('9781111111111', 'Peixe');
insert into Tem_categoria values ('9781111111112', 'Peixe');
insert into Tem_categoria values ('9782222222222', 'Carne');
insert into Tem_categoria values ('9782222222223', 'Carne');
insert into Tem_categoria values ('9783333333333', 'Queijo');
insert into Tem_categoria values ('9783333333334', 'Queijo');
insert into Tem_categoria values ('9784444444444', 'Iogurte');
insert into Tem_categoria values ('9784444444445', 'Iogurte');

insert into IVM values ('111111', 'Fabricante 1');
insert into IVM values ('222222', 'Fabricante 2');
insert into IVM values ('333333', 'Fabricante 3');
insert into IVM values ('444444', 'Fabricante 4');
insert into IVM values ('555555', 'Fabricante 5');
insert into IVM values ('666666', 'Fabricante 6');
insert into IVM values ('777777', 'Fabricante 7');
insert into IVM values ('888888', 'Fabricante 8');
insert into IVM values ('999999', 'Fabricante 9');

insert into Ponto_de_Retalho values ('Sage', 'Lisboa', 'Sintra');
insert into Ponto_de_Retalho values ('Olisoft', 'Lisboa', 'Mafra');
insert into Ponto_de_Retalho values ('Geocargo', 'Santarém', 'Ferreira do Zêzere'); 
insert into Ponto_de_Retalho values ('Vitopal', 'Leiria', 'Alcobaça');

insert into Instalada_em values ('999999', 'Fabricante 9', 'Geocargo');
insert into Instalada_em values ('888888', 'Fabricante 8', 'Olisoft');
insert into Instalada_em values ('777777', 'Fabricante 7', 'Sage');
insert into Instalada_em values ('666666', 'Fabricante 6', 'Geocargo');
insert into Instalada_em values ('555555', 'Fabricante 5', 'Vitopal');
insert into Instalada_em values ('444444', 'Fabricante 4', 'Olisoft');
insert into Instalada_em values ('333333', 'Fabricante 3', 'Geocargo');
insert into Instalada_em values ('222222', 'Fabricante 2', 'Vitopal');
insert into Instalada_em values ('111111', 'Fabricante 1', 'Sage');

insert into Prateleira values (1, '999999', 'Fabricante 9', 2.1, 'Iogurte');
insert into Prateleira values (2, '999999', 'Fabricante 9', 1.7, 'Iogurte');
insert into Prateleira values (1, '888888', 'Fabricante 8', 4.3, 'Carne');
insert into Prateleira values (2, '888888', 'Fabricante 8', 2.6, 'Carne');
insert into Prateleira values (1, '777777', 'Fabricante 7', 1.0, 'Queijo');
insert into Prateleira values (2, '777777', 'Fabricante 7', 3.5, 'Queijo');
insert into Prateleira values (1, '666666', 'Fabricante 6', 2.7, 'Peixe');
insert into Prateleira values (2, '666666', 'Fabricante 6', 4.0, 'Peixe');
insert into Prateleira values (1, '555555', 'Fabricante 5', 2.1, 'Carne');
insert into Prateleira values (2, '555555', 'Fabricante 5', 1.7, 'Carne');
insert into Prateleira values (1, '444444', 'Fabricante 4', 4.3, 'Iogurte');
insert into Prateleira values (2, '444444', 'Fabricante 4', 2.6, 'Iogurte');
insert into Prateleira values (1, '333333', 'Fabricante 3', 1.0, 'Peixe');
insert into Prateleira values (2, '333333', 'Fabricante 3', 3.5, 'Peixe');
insert into Prateleira values (1, '222222', 'Fabricante 2', 2.7, 'Queijo');
insert into Prateleira values (2, '222222', 'Fabricante 2', 4.0, 'Queijo');
insert into Prateleira values (1, '111111', 'Fabricante 1', 1.8, 'Carne');
insert into Prateleira values (2, '111111', 'Fabricante 1', 1.5, 'Carne');


insert into Planograma values ('9784444444444', 1, '999999', 'Fabricante 9', 13, 10, 'LOC1');
insert into Planograma values ('9784444444445', 2, '999999', 'Fabricante 9', 13, 18, 'LOC2');
insert into Planograma values ('9782222222222', 1, '888888', 'Fabricante 8', 14, 15, 'LOC3');
insert into Planograma values ('9782222222223', 2, '888888', 'Fabricante 8', 12, 12, 'LOC4');
insert into Planograma values ('9783333333333', 1, '777777', 'Fabricante 7', 13, 16, 'LOC2');
insert into Planograma values ('9783333333334', 2, '777777', 'Fabricante 7', 15, 14, 'LOC6');
insert into Planograma values ('9781111111112', 1, '666666', 'Fabricante 6', 15, 14, 'LOC7');
insert into Planograma values ('9781111111111', 2, '666666', 'Fabricante 6', 14, 11, 'LOC8');
insert into Planograma values ('9782222222222', 1, '555555', 'Fabricante 5', 20, 10, 'LOC1');
insert into Planograma values ('9782222222222', 2, '555555', 'Fabricante 5', 10, 18, 'LOC2');
insert into Planograma values ('9784444444445', 1, '444444', 'Fabricante 4', 14, 15, 'LOC3');
insert into Planograma values ('9784444444444', 2, '444444', 'Fabricante 4', 12, 12, 'LOC4');
insert into Planograma values ('9781111111112', 1, '333333', 'Fabricante 3', 10, 17, 'LOC2');
insert into Planograma values ('9781111111112', 2, '333333', 'Fabricante 3', 13, 16, 'LOC6');
insert into Planograma values ('9783333333334', 1, '222222', 'Fabricante 2', 12, 14, 'LOC7');
insert into Planograma values ('9783333333333', 2, '222222', 'Fabricante 2', 14, 11, 'LOC8');
insert into Planograma values ('9782222222222', 1, '111111', 'Fabricante 1', 11, 19, 'LOC9');
insert into Planograma values ('9782222222222', 2, '111111', 'Fabricante 1', 12, 21, 'LOC8');

insert into Retalhista values ('RET001', 'Nazaré Pescadores');
insert into Retalhista values ('RET002', 'Butcher Inc.');
insert into Retalhista values ('RET022', 'Talhos Silau');
insert into Retalhista values ('RET003', 'João dos Queijos');
insert into Retalhista values ('RET004', 'Iogu');
insert into Retalhista values ('RET005', 'Sweet Drop');

insert into Responsavel_por values ('Carne', 'RET005', '111111', 'Fabricante 1');
insert into Responsavel_por values ('Queijo', 'RET005', '222222', 'Fabricante 2');
insert into Responsavel_por values ('Peixe', 'RET005', '333333', 'Fabricante 3');
insert into Responsavel_por values ('Iogurte', 'RET005', '444444', 'Fabricante 4');
insert into Responsavel_por values ('Carne', 'RET002', '555555', 'Fabricante 5');
insert into Responsavel_por values ('Peixe', 'RET001', '666666', 'Fabricante 6');
insert into Responsavel_por values ('Queijo', 'RET003', '777777', 'Fabricante 7');
insert into Responsavel_por values ('Carne', 'RET022', '888888', 'Fabricante 8');
insert into Responsavel_por values ('Iogurte', 'RET004', '999999', 'Fabricante 9');

insert into Evento_reposicao values ('9784444444444', 1, '999999', 'Fabricante 9', '2018-01-14 13:30:15', 10, 'RET004');
insert into Evento_reposicao values ('9784444444445', 2, '999999', 'Fabricante 9', '2018-02-10 13:30:15', 8, 'RET004');
insert into Evento_reposicao values ('9782222222222', 1, '888888', 'Fabricante 8', '2019-03-2 13:30:15', 5, 'RET022');
insert into Evento_reposicao values ('9782222222223', 2, '888888', 'Fabricante 8', '2019-04-25 13:30:15', 9, 'RET022');
insert into Evento_reposicao values ('9783333333333', 1, '777777', 'Fabricante 7', '2019-05-11 13:30:15', 7, 'RET003');
insert into Evento_reposicao values ('9783333333334', 2, '777777', 'Fabricante 7', '2020-06-17 13:30:15', 8, 'RET003');
insert into Evento_reposicao values ('9781111111112', 1, '666666', 'Fabricante 6', '2020-07-30 13:30:15', 6, 'RET001');
insert into Evento_reposicao values ('9781111111111', 2, '666666', 'Fabricante 6', '2021-08-28 13:30:15', 10, 'RET001');
insert into Evento_reposicao values ('9782222222222', 1, '555555', 'Fabricante 5', '2018-01-6 13:30:15', 10, 'RET002');
insert into Evento_reposicao values ('9782222222222', 2, '555555', 'Fabricante 5', '2018-02-15 13:30:15', 8, 'RET002');
insert into Evento_reposicao values ('9784444444445', 1, '444444', 'Fabricante 4', '2019-03-13 13:30:15', 5, 'RET005');
insert into Evento_reposicao values ('9784444444444', 2, '444444', 'Fabricante 4', '2019-04-21 13:30:15', 9, 'RET005');
insert into Evento_reposicao values ('9781111111112', 1, '333333', 'Fabricante 3', '2019-05-4 13:30:15', 7, 'RET005');
insert into Evento_reposicao values ('9781111111112', 2, '333333', 'Fabricante 3', '2020-06-23 13:30:15', 6, 'RET005');
insert into Evento_reposicao values ('9783333333334', 1, '222222', 'Fabricante 2', '2020-07-12 13:30:15', 4, 'RET005');
insert into Evento_reposicao values ('9783333333333', 2, '222222', 'Fabricante 2', '2021-08-15 13:30:15', 10, 'RET005');
insert into Evento_reposicao values ('9782222222222', 2, '111111', 'Fabricante 1', '2022-10-7 13:30:15', 2, 'RET005');
