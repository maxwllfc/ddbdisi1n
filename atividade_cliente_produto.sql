CREATE TABLE cliente (
  endereco VARCHAR(50),
  telefone VARCHAR(50),
  nome_responsavel VARCHAR(50),
  ramo_ativ VARCHAR(50),
  razao_social VARCHAR(50),
  cnpj VARCHAR(50),
  nome_fantasia VARCHAR(50),
  id_cliente INTEGER,
  CONSTRAINT pk_cliente PRIMARY KEY(id_cliente)
);

-- ERRO: Tabela tb_pedido
-- O campo "id_cliente" estava definido como VARCHAR(50), mas deveria ser INTEGER para corresponder à chave primária da tabela "cliente".
-- A chave estrangeira "id_cliente" na tabela "tb_pedido" deve ter o tipo INTEGER, que é o tipo da chave primária da tabela "cliente".

CREATE TABLE tb_pedido (
  id_pedido INTEGER,
  data_pedido DATETIME,
  forma_pagamento VARCHAR(50),
  data_entrega_produto DATETIME,
  data_entrega_ef DATETIME,
  id_cliente INTEGER, -- Corrigido para INTEGER
  CONSTRAINT pk_pedido PRIMARY KEY (id_pedido),
  CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);

-- ERRO: Tabela estoque_produto
-- Faltava definir uma chave primária para a tabela, além disso, o relacionamento com a tabela "produto" não estava claro.
-- Agora, foi adicionada uma chave primária na coluna "id_produto" e um relacionamento com a tabela "produto".

CREATE TABLE estoque_produto (
  id_produto INTEGER,
  qt_estoque INTEGER,
  PRIMARY KEY (id_produto), -- Adicionada chave primária
  FOREIGN KEY (id_produto) REFERENCES produto(id_produto) -- Relacionamento com a tabela produto
);

-- ERRO: Tabela itens
-- O nome da chave estrangeira estava incorreto. A referência à tabela "pedido" deveria ser "tb_pedido", já que a tabela foi criada com esse nome.

CREATE TABLE itens (
  id_produto INTEGER,
  id_pedido INTEGER,
  CONSTRAINT fk_produto FOREIGN KEY (id_produto) REFERENCES produto (id_produto),
  CONSTRAINT fk_pedido FOREIGN KEY (id_pedido) REFERENCES tb_pedido (id_pedido) -- Corrigido para tb_pedido
);

-- ERRO: Tabela mprima_produto
-- A chave primária estava sendo definida apenas como "id_mprima", mas deveria ser uma combinação de "id_produto" e "id_mprima", pois é uma tabela de relacionamento entre essas duas entidades.

CREATE TABLE mprima_produto (
  id_produto INTEGER,
  id_mprima INTEGER,
  CONSTRAINT pk_mprima_produto PRIMARY KEY (id_produto, id_mprima), -- Corrigido para chave composta
  CONSTRAINT fk_mprima_produto_id_produto FOREIGN KEY (id_produto) REFERENCES produto (id_produto),
  CONSTRAINT fk_mprima_produto_id_mprima FOREIGN KEY (id_mprima) REFERENCES mprima (id_mprima)
);

-- ERRO: Tabela mprima_fornecedor
-- Na tabela "fornecedor", faltava uma vírgula antes da definição da "CONSTRAINT pk_fornecedor", além disso, a chave estrangeira "id_fornecedor" foi corrigida para fazer referência corretamente à tabela "fornecedor".

CREATE TABLE fornecedor (
  id_fornecedor INTEGER,
  endereco VARCHAR(200),
  nome_contato VARCHAR(50),
  cnpj VARCHAR(20),
  telefone VARCHAR(20),
  razao_social VARCHAR(50),
  CONSTRAINT pk_fornecedor PRIMARY KEY(id_fornecedor) -- Corrigido, vírgula estava faltando antes dessa linha
);

CREATE TABLE mprima_fornecedor (
  id_fornecedor INTEGER,
  id_mprima INTEGER,
  CONSTRAINT fk_mprima_fornecedor_id_fornecedor FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor),
  CONSTRAINT fk_mprima_fornecedor_id_mprima FOREIGN KEY (id_mprima) REFERENCES mprima(id_mprima)
);