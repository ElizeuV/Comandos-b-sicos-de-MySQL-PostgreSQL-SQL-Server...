/*CREATE DATABASE "BD_Maple"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

COMMENT ON DATABASE "BD_"
    IS 'Feito por Elizeu Vito Santos';*/
	
--O ESCRIPT POSSUÍ 6 TABELAS


--TABELA DE FUNCIONÁRIOS
create table funcionarios
(
  cod_fun int not null primary key,
  nome text not null,
  cpf numeric(11) not null unique,
  cargo text, 
  setor text,
  cod_superior int not null references funcionarios (cod_fun)
);

--TABELA DE CLIENTES
create table clientes 
(
  cod_cliente int not null primary key ,
  nome_cliente text not null,
  cpf numeric (11) not null unique,
  endereco varchar(100) not null,
  telefone numeric (11),
  cod_fun int not null references funcionarios (cod_fun)
);

--TABELA DE PRODUTOS
create table produtos
(
  cod_produto int not null primary key,
  nome_produto varchar(100) not null,
  descricao_prod text,
  quantidade_estoque int,
  valor_produto numeric (8,2),
  cod_fun int references funcionarios (cod_fun),
  cod_adm int references funcionarios (cod_fun)
);


--TABELA CARRINHO
create table carrinho 
(
  checkout int primary key not null, 
  cod_produto int not null unique references produtos (cod_produto),
  cod_cliente int not null references clientes (cod_cliente),
  nome_produto varchar(100),
  descricao_prod text,
  valor_produto numeric (8,2),
  quantidade_pedido int not null
);


--TABELA PAGAMENTOS
create table pagamentos
(
  cod_compra int primary key not null,
  checkout int not null unique references carrinho (checkout), 
  nome_cliente varchar(100) not null,
  cpf_cliente  numeric (11) not null References clientes (cpf),
  endereco_cliente varchar (100) not null,
  telefone_cliente numeric (11),
  forma_pagamento varchar(100),
  valor_pedido numeric(8, 2) not null,
  cod_nf int
);


--TABELA DE PEDIDOS
create table pedidos
(
  cod_pedido int not null primary key,
  cod_compra int not null unique references pagamentos (cod_compra),
  nome_cliente text not null,
  cpf_cliente numeric (11) references clientes (cpf),
  endereco varchar(100) not null,
  telefone_cliente numeric (11),
  quantidade_pedido int not null,
  desricao_pedido text,
  data_entrega date,
  cod_fun int references funcionarios (cod_fun),
  cod_adm int references funcionarios (cod_fun)
);


--INSERT E SELECT TABELA FUNCIONARIOS
--GERENTES
insert into funcionarios values 
  (0,'CARLOS EDUARDO NOGUEIRA', 12345678901, 'CEO', 'DIRETORIA', 0),
  (1,'ARMANDO BENICIO JUNIOR', 12345678902, 'DIRETOR DE TI', 'TI', 0),
  (2,'JULIO CESAR AUGUSTO', 12345678903, 'GERENTE DE TI', 'TI', 1),
  (3,'CARLOS AUGUSTO', 12345678904, 'GERENTE DE VENDAS', 'VENDAS', 0),
  
--ADM
  (4, 'CARLOS ALBERTO MADUREIRA', 012365678902, 'DBA', 'DATABASE', 2),
  (5, 'MARIA JULIA OLIVEIRA', 012345678905, 'ANALISTA DE SISTEMAS', 'SISTEMAS', 2),
  (6, 'DARIO DA SILVA', 012345678900, 'ESTAGIÁRIO DE TI', 'SISTEMAS', 2),
  
--FUNCIONARIOS
  (7,'ALBERTO TORRES SANTOS', 012345678907, 'VENDEDOR SR', 'VENDAS', 3),
  (8,'AFONSO DAVIS SILVA', 012345678906, 'VENDEDOR PL', 'VENDAS', 3),
  (9,'DAVID SOUZA DA SILVA', 012345678908, 'VENDEDOR JR', 'VENDAS', 3),
  (10, 'ANTETOKUMPHO WIILLIANS FOX', 23165498751, 'ESTAGIÁRIO DE VENDAS', 'VENDAS', 3);
--SELECT

--select* from funcionarios;


--INSERT E SELECT TABELA CLIENTES
insert into clientes values 
  (1, 'MARIA FERNANDA DA SILVA', 11423560489, 'RUA OLGA, 526', 1170809642, 6),   
  (2, 'JULIO DA SILVA', 11423560488, 'RUA OLGA, 515', 1170809643, 6),
  (3, 'ALICE DE SÁ', 11423560487, 'RUA PERNAMBUCO, 126', 1170809644, 6),
  (4, 'BENJAMIN ARNALDO', 11423560486, 'RUA TEL AVIV, 138', 1170809647, 6),
  (5, 'NEYMAR SANTOS', 11423560485, 'RUA PARIS PSG, 2022', 1170809648, 6);
--SELECT

--select * from clientes;


--INSERT E SELECT TABELA PRODUTOS
insert into produtos values 
  (1, 'NOTEBOOK', 'NOTEBOOK DELL CORE I9, 1T-SSD', 500, 5000, 7, 5), 
  (2, 'SMART TV', 'SMART TV SONY FULL HD JKL700', 450, 3500, 7, 5),
  (3, 'SMARTPHONE', 'APPLE 12 PRO', 50, 8000, 7, 5),
  (4, 'FONE', 'FONE SEM FIO XIAOMI', 100, 170, 7, 5),
  (5, 'RELOGIO', 'SMART WATCH XIAOMI', 200, 1200, 7, 5),
  (6, 'CAMISETA', 'CAMISETA NIKE SELEÇÃO BRASILEIRA 2022', 5000, 350, 7, 5),
  (7, 'RELOGIO', 'SMART WATCH APPLE 12', 213, 450, 7, 5),
  (8, 'SMARTPHONE ', 'SAMSUNG PRO-K', 56, 1560, 7, 5),
  (9, 'NOTEBOOK', 'NOTEBOOK HP INTEL CORE I10', 50, 8500, 7, 5),
  (10, 'NOTEBOOK', 'NOTEBOOK ASUS AMD RAIZEN 10', 25, 7250, 7, 5),
  (11, 'CALCA', 'CALCA VINTAGE MASCULINA', 100, 56.20, 7, 5),
  (12, 'TENIS', 'TENIS NIKE TANJUN', 132, 500, 7, 5),
  (13, 'PENDRIVE', 'PEN-DRIVE HP 256GB', 101, 35, 7, 5),
  (14, 'NOTEBOOK', 'NOTEBOOK ASUS JKLO4587 INTEL CORE I7 556GB', 50, 7300, 7, 5),
  (15, 'NOTEBOOK', 'NOTEBOOK ASUS JKL2023 INTEL CORE I5 356GB', 50, 6200, 7, 5);
  
--SELECT


--INSERT E SELECT TABELA CARRINHO
insert into carrinho values 
  (100001, 1, 1, 'NOTEBOOK', 'NOTEBOOK DELL CORE I9, 1T-SSD', 5000, 120),
  (100002, 2, 1, 'SMART TV', 'SMART TV SONY FULL HD JKL700', 3500, 30),
  (100003, 3, 3, 'SMARTPHONE', 'APPLE 12 PRO', 8000, 2),
  (100004, 4, 3, 'FONE', 'FONE SEM FIO XIAOMI', 170, 1),
  (100005, 5, 1, 'RELOGIO', 'SMART WATCH XIAOMI', 1200, 1);
--SELECT

--select * from carrinho;


--INSERT E SELECT TABELA PAGAMENTOS
insert into pagamentos values 
  (123456, 100001, 'MARIA FERNANDA DA SILVA', 11423560489, 'RUA OLGA, 526', 1170809642, 'CARTÃO_C', 600000),
  (123457, 100002, 'MARIA FERNANDA DA SILVA', 11423560489, 'RUA OLGA, 526', 1170809642, 'CARTÃO_C', 105000),
  (123458, 100003, 'ALICE DE SÁ', 11423560487, 'RUA PERNAMBUCO, 126', 1170809644, 'CARTÃO_C',16000),
  (123459, 100004, 'ALICE DE SÁ', 11423560487, 'RUA PERNAMBUCO, 126', 1170809644, 'CARTÃO_C',170),
  (123460, 100005, 'MARIA FERNANDA DA SILVA', 11423560489, 'RUA OLGA, 526', 1170809642, 'PIX', 1200);
--SELECT

--select * from pagamentos;


--INSERT E SELECT TABELA PEDIDOS
insert into pedidos values 
  (654321, 123456, 'MARIA FERNANDA DA SILVA', 11423560489, 'RUA OLGA, 526', 1170809642, 120, 'NOTEBOOK DELL CORE I9, 1T-SSD', '2022-12-25', 7, 5),
  (654322, 123457, 'MARIA FERNANDA DA SILVA', 11423560489, 'RUA OLGA, 526', 1170809642, 120, 'SMART TV SONY FULL HD JKL700', '2022-12-25', 7, 5),
  (654323, 123458, 'ALICE DE SÁ', 11423560487, 'RUA PERNAMBUCO, 126', 1170809644, 2, 'APPLE 12 PRO', '2022-11-24', 7, 5),
  (654324, 123459, 'ALICE DE SÁ', 11423560487, 'RUA PERNAMBUCO, 126', 1170809644, 1, 'FONE SEM FIO XIAOMI', '2022-12-05', 7, 5),
  (654325, 123460, 'MARIA FERNANDA DA SILVA', 11423560489, 'RUA OLGA, 526', 1170809642, 1,'SMART WATCH XIAOMI', '2022-12-01', 7, 5);


--SELECT * FROM produtos;

--SELECT descricao_prod, valor_produto from produtos where nome_produto like '%NOTEBOOK%'

--SELECT nome_produto, valor_produto from produtos order BY valor_produto ASC;

--SELECT nome_produto, valor_produto, * from produtos where nome_produto like '%%'

--SELECT nome_produto, descricao_prod, valor_produto from produtos where nome_produto like '%SMART%'

/*SELECT * FROM produtos
WHERE nome_produto like '%NOT%' 
AND valor_produto <= 7300.00 
AND descricao_prod like '%ASUS%'
ORDER BY valor_produto DESC;*/

SELECT cod_compra, cod_pedido, desricao_pedido, data_entrega FROM pedidos WHERE data_entrega='2022-12-25';




