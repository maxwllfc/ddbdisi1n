CREATE TABLE enderecos (
	id_endereco	INTEGER,
  	pais		VARCHAR(25),
  	estado		VARCHAR(25),
  	cidade		VARCHAR(25),
  	bairro		VARCHAR(25),
  	rua			VARCHAR(25),
  	num_casa	VARCHAR(25),
  	num_ap		VARCHAR(25),
  		CONSTRAINT pk_enderecos 
  			PRIMARY KEY (id_endereco)
);

CREATE TABLE funcionarios (
	id_funcionario				INTEGER,
  	ra 							VARCHAR(20) UNIQUE,
  	idade_funcionario			INTEGER,
  	nacionalidade_funcionario 	VARCHAR(50),
  	sexo_funcionario			VARCHAR(20),
  	tel_funcionario				VARCHAR(15),
  	nome_funcionario			VARCHAR(100),
  	endereco_id					INTEGER,
  		CONSTRAINT pk_funcionarios 
  			PRIMARY KEY (id_funcionario),
  		CONSTRAINT fk_funcionarios_id_endereco 
  			FOREIGN KEY (endereco_id)
  				REFERENCES enderecos(id_endereco)
);

CREATE TABLE cursos (
	id_curso	INTEGER,
    cod_curso	INTEGER NOT NULL UNIQUE,
    nome_curso	VARCHAR(100),
		CONSTRAINT pk_cursos 
  			PRIMARY KEY (id_curso)
);

CREATE TABLE inscricoes (
	id_inscricao	INTEGER,
  	id_funcionario	INTEGER,
  	id_curso		INTEGER,
  		CONSTRAINT pk_inscricoes 
  			PRIMARY KEY (id_inscricao),
  		CONSTRAINT fk_inscricoes_id_funcionario 
  			FOREIGN KEY (id_funcionario)
  				REFERENCES funcionarios(id_funcionario),
  	  CONSTRAINT fk_inscricoes_id_curso
  			FOREIGN KEY (id_curso)
  				REFERENCES cursos(id_curso)
);