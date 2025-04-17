CREATE TABLE engenheiros (
	engenheiro_id		INTEGER,
  	crea 				VARCHAR (10),
  	engenheiro_nome		VARCHAR (100),
  	engenheiro_tel		VARCHAR (20),
  	endereco_id			INTEGER,
  		CONSTRAINT pk_engenheiros
  			PRIMARY KEY (engenheiro_id)
);
CREATE TABLE enderecos (
	endereco_id 	INTEGER,
  	pais			VARCHAR (100),
  	estado 			VARCHAR (100),
  	cidade			VARCHAR (100),
  	bairro 			VARCHAR (100),
  	rua 			VARCHAR (100),
  	num_casa		VARCHAR (100),
  	num_ap			VARCHAR (10),
  		CONSTRAINT pk_enderecos
  			PRIMARY KEY (endereco_id)
);
CREATE TABLE atuacoes (
	atuacao_id		INTEGER,
  	engenheiro_id	INTEGER,
  	projeto_id		INTEGER,
  	horas			DECIMAL (10, 2),
  	funcao			VARCHAR (100),
  		CONSTRAINT pk_atuacoes
  			PRIMARY KEY (atuacao_id),
  		CONSTRAINT uk_engenheiro_projeto
  			UNIQUE (engenheiro_id, projeto_id)
  		CONSTRAINT fk_atuacoes_engenheiros_id
  			FOREIGN KEY (engenheiro_id)
  			REFERENCES engenheiros (engenheiro_id),
  	  	CONSTRAINT fk_atuacoes_projeto_id
  			FOREIGN KEY (projeto_id)
  			REFERENCES projetos (projeto_id)
);
CREATE TABLE projetos (
	projeto_id			INTEGER,
  	duracao_dias		INTEGER,
  	projeto_descricao	TEXT (1000),
  	projeto_local		VARCHAR (100),
  	equipamento_id		INTEGER NULL,
  		CONSTRAINT pk_projetos
  			PRIMARY KEY (projeto_id),
  		CONSTRAINT fk_projetos_equipamento_id
  			FOREIGN KEY (equipamento_id)
  			REFERENCES equipamentos (equipamento_id)
);
CREATE TABLE equipamentos (
	equipamento_id			INTEGER,
  	equipamento_descricao	TEXT (1000),
  		CONSTRAINT pk_equipamentos
  			PRIMARY KEY (equipamento_id)
);