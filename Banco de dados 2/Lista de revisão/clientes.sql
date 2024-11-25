--Base de dados Clientes
CREATE TABLE CLIENTE(CLIENTE_ID INTEGER,
CLIENTE_NOME VARCHAR(50),
CLIENTE_END VARCHAR(50),
CLIENTE_END_CIDADE CHAR(20),
ESTADO_CODIGO VARCHAR(2),
CLIENTE_END_CEP VARCHAR(8),
CLIENTE_TELEFONE VARCHAR(10),
CLIENTE_PERC_DESCONTO DECIMAL (2,0)
);

CREATE TABLE PRODUTO(
PRODUTO_CODIGO SMALLINT,
PRODUTO_NOME VARCHAR(40),
PRODUTO_PRECO NUMERIC(5,2),
UE_PRODUTO_COD VARCHAR(3)
);

CREATE TABLE ESTADO(
ESTADO_CODIGO VARCHAR(2),
ESTADO_NOME VARCHAR(25)
);

CREATE TABLE PEDIDO(
PEDIDO_IDENTIFICACAO INTEGER,
PEDIDO_TIPO INTEGER,
CLIENTE_ID INTEGER,
PEDIDO_DATA_ENTRADA DATE,
PEDIDO_VALOR_TOTAL NUMERIC(7,2),
PEDIDO_DESCONTO NUMERIC(7,2),
PEDIDO_DT_EMBARQUE DATE
);

CREATE TABLE UE_PRODUTO(
UE_PRODUTO_COD CHAR(3),
UE_PRODUTO_DESCR VARCHAR(50)
);

CREATE TABLE ITEM(
PEDIDO_IDENTIFICACAO INTEGER,
PRODUTO_CODIGO SMALLINT,
ITEM_QUANTIDADE SMALLINT,
ITEM_VALOR_UNITARIO NUMERIC(5,2),
ITEM_VALOR_TOTAL NUMERIC(5,2)
);

ALTER TABLE CLIENTE
ADD CONSTRAINT cliente_pkey  PRIMARY KEY (CLIENTE_ID);

ALTER TABLE ESTADO
ADD CONSTRAINT estado_pkey PRIMARY KEY (ESTADO_CODIGO);

ALTER TABLE ITEM
ADD CONSTRAINT item_pkey PRIMARY KEY (PEDIDO_IDENTIFICACAO,PRODUTO_CODIGO);

ALTER TABLE PEDIDO
ADD CONSTRAINT pedido_pkey PRIMARY KEY (PEDIDO_IDENTIFICACAO);

ALTER TABLE PRODUTO
ADD CONSTRAINT produto_pkey PRIMARY KEY (PRODUTO_CODIGO);

ALTER TABLE UE_PRODUTO
ADD CONSTRAINT ue_produto_pkey PRIMARY KEY (UE_PRODUTO_COD);

ALTER TABLE CLIENTE
ADD CONSTRAINT cliente_estado_fk FOREIGN KEY (ESTADO_CODIGO)
REFERENCES ESTADO(ESTADO_CODIGO);

ALTER TABLE PEDIDO
ADD CONSTRAINT pedido_cliente_fk FOREIGN KEY (CLIENTE_ID)
REFERENCES CLIENTE(CLIENTE_ID);

ALTER TABLE PRODUTO
ADD CONSTRAINT produto_ueproduto_fk FOREIGN KEY (UE_PRODUTO_COD)
REFERENCES UE_PRODUTO(UE_PRODUTO_COD);

ALTER TABLE ITEM
ADD CONSTRAINT item_produto_fk FOREIGN KEY (PRODUTO_CODIGO)
REFERENCES PRODUTO(PRODUTO_CODIGO);

CREATE TABLE produto_aux (produto_aux_nome VARCHAR(40),
produto_aux_preco numeric(5,2));

CREATE TABLE ue_produto_aux (ue_produto_aux_descr Varchar(50));

--2. Criar a chave primária para as duas tabelas através do comando ALTER TABLE.

--a. PK de UE_PRODUTO_AUX é ue_produto_aux_codigo CHAR(3);
ALTER TABLE ue_produto_aux
ADD COLUMN ue_produto_aux_codigo CHAR(3),
ADD CONSTRAINT ue_produto_aux_pkey PRIMARY KEY (ue_produto_aux_codigo);


--b. PK de PRODUTO_AUX é produto_aux_codigo SERIAL;
ALTER TABLE produto_aux
ADD COLUMN produto_aux_codigo SERIAL,
ADD CONSTRAINT produto_aux_pkey PRIMARY KEY (produto_aux_codigo);

/*3. Criar a chave estrangeira da tabela PRODUTO_AUX que aponta para a tabela
UE_PRODUTO_AUX. A integridade referencial é CASCADE tanto para exclusão quanto para
atualização;*/
ALTER TABLE produto_aux
ADD COLUMN ue_produto_aux_codigo VARCHAR(3) NOT NULL,
ADD CONSTRAINT ue_produto_aux_fkey FOREIGN KEY (ue_produto_aux_codigo)
REFERENCES ue_produto_aux (ue_produto_aux_codigo)
ON DELETE CASCADE
ON UPDATE CASCADE;

--4. Criar um Índice único na tabela PRODUTO_AUX para a coluna produto_aux_nome.
CREATE UNIQUE INDEX indice_produto_nome
ON produto_aux (produto_aux_nome);

--6. Copie cada registro da tabela PRODUTO e insira na tabela PRODUTO_AUX.
INSERT INTO produto_aux (produto_aux_nome, produto_aux_preco, ue_produto_aux_codigo)
SELECT produto_nome, produto_preco, ue_produto_cod
FROM produto;

/*7. Alterar os preços na tabela PRODUTO, aplicando um aumento de 50% sobre o preço, somente
para os produtos cujo preço for menor que R$ 2,00., aplicando um aumento de 50% sobre o
preço, somente para os produtos cujo preço for menor que R$ 2,00.*/
UPDATE produto
SET produto_preco = produto_preco * 1.5
WHERE produto_preco < 2;

--8. Excluir da tabela PRODUTO_AUX o produto cujo código seja igual a FEI;
DELETE FROM produto_aux
WHERE ue_produto_aux_codigo='FEI';

--9. Selecionar as seguintes colunas dos clientes de maneira distinta: cidade, estado e cep.
SELECT DISTINCT cliente_end_cidade,estado_codigo, cliente_end_cep
FROM cliente;

--10. Selecionar todos os pedidos cujo valor total seja menor que 100 ou maior que 500.
SELECT *
FROM pedido
WHERE pedido_valor_total < 100 OR pedido_valor_total > 500;


