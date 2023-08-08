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

--INSERT E SELECT TABELA PRODUTOS
insert into produtos values 
  (1, 'NOTEBOOK', 'NOTEBOOK DELL CORE I9, 1T-SSD', 500, 5000, 7, 5), 
  (2, 'SMART TV', 'SMART TV SONY FULL HD JKL700', 450, 3500, 7, 5),
  (3, 'SMARTPHONE', 'APPLE 12 PRO', 50, 8000, 7, 5),
  (4, 'FONE', 'FONE SEM FIO XIAOMI', 100, 170, 7, 5),
  (6, 'CAMISETA', 'CAMISETA NIKE SELEÇÃO BRASILEIRA 2022', 5000, 350, 7, 5),
  (7, 'RELOGIO', 'SMART WATCH APPLE 12', 213, 450, 7, 5),
  (9, 'NOTEBOOK', 'NOTEBOOK HP INTEL CORE I10', 50, 8500, 7, 5),
  (10, 'NOTEBOOK', 'NOTEBOOK ASUS AMD RAIZEN 10', 25, 7250, 7, 5),
  (11, 'CALCA', 'CALCA VINTAGE MASCULINA', 100, 56.20, 7, 5),
  (12, 'TENIS', 'TENIS NIKE TANJUN', 132, 500, 7, 5),
  (13, 'PENDRIVE', 'PEN-DRIVE HP 256GB', 101, 35, 7, 5),
  (14, 'NOTEBOOK', 'NOTEBOOK ASUS JKLO4587 INTEL CORE I7 556GB', 50, 7300, 7, 5),


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




