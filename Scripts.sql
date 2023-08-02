CREATE TABLE Usuario (
  id INT NOT NULL,
  Email VARCHAR(45) NOT NULL,
  Senha VARCHAR(45) NOT NULL,
  Nome VARCHAR(45) NOT NULL,
  Telefone VARCHAR(11) NOT NULL,
  CPF VARCHAR(11) NOT NULL,
  Endereco VARCHAR(45) NOT NULL,
  Cartao VARCHAR(45) NOT NULL,
  Avatar OID,
  PRIMARY KEY (id));

CREATE TABLE Mensalidades (
  idMensalidades INT NOT NULL,
  idUsuarios INT NULL,
  MesCobranca VARCHAR(45),
  MesPago VARCHAR(45),
  valor VARCHAR(45),
  StatusPagamento VARCHAR(45),
  PRIMARY KEY (idMensalidades),
  FOREIGN KEY (idUsuarios) REFERENCES Usuario (id)
  );

CREATE TABLE Catalogo (
	idCatalogo	INT,
	NomeCategoria	VARCHAR(45),
	Imagem OID,
	PRIMARY KEY(idCatalogo)
);

CREATE TABLE Catalogo_Usuario (
	catalogo_id	INT,
	usuario_id	INT,
	CONSTRAINT catalogo_id
		FOREIGN	KEY(catalogo_id)
			REFERENCES Catalogo(idCatalogo),
	CONSTRAINT usuario_id
		FOREIGN KEY(usuario_id)
			REFERENCES Usuario(id)
);


CREATE TABLE Filmes (
  idFilmes INT NOT NULL,
  idCatalogo INT NOT NULL,
  Titulo VARCHAR(45) NOT NULL,
  AnoProducao INT NOT NULL,
  DuracaoMinutos INT NOT NULL,
  avaliacao int,
  PRIMARY KEY (idFilmes),
  FOREIGN KEY (idCatalogo) REFERENCES Catalogo (idCatalogo)
  );

CREATE TABLE Series (
  idSeries INT NOT NULL,
  idCatalogo INT NOT NULL,
  Titulo VARCHAR(45) NOT NULL,
  avaliacao int,
  PRIMARY KEY (idSeries),
  FOREIGN KEY (idCatalogo) REFERENCES Catalogo (idCatalogo)
  );

CREATE TABLE Episodio (
  idepisodio INT NOT NULL,
  idserie INT NOT NULL,
  Id_prox_ep INT NOT NULL,
  Titulo VARCHAR(45) NOT NULL,
  Ano INT NOT NULL,
  duracao_min INT NOT NULL,
  Temporada INT NOT NULL,
  Numero_ep INT NOT NULL,
  avaliacao int,
  PRIMARY KEY (idepisodio),
  FOREIGN KEY (idserie) REFERENCES Series (idSeries),
  FOREIGN KEY (Id_prox_ep) REFERENCES Episodio (idepisodio)
  );

CREATE TABLE Documentarios(
  idDocumentarios INT NOT NULL,
  idCatalogo INT NOT NULL,
  Titulo VARCHAR(45) NOT NULL,
  Ano INT NOT NULL,
  duracao_min INT NOT NULL,
  Nome_Produtora VARCHAR(45) NOT NULL,
  avaliacao INT,
  PRIMARY KEY (idDocumentarios),
  FOREIGN KEY (idCatalogo) REFERENCES Catalogo (idCatalogo)
  );

CREATE TABLE Atores(
  idAtores INT NOT NULL,
  Nome VARCHAR(45) NOT NULL,
  Data_nasc DATE NOT NULL,
  Local_nasc VARCHAR(45) NOT NULL,
  PRIMARY KEY (idAtores)
  );

CREATE TABLE Documentario_atores (
	idDocumentario	INT,
	idAtores	INT,
	CONSTRAINT idDocumentario
		FOREIGN	KEY(idDocumentario)
			REFERENCES Documentarios(idDocumentarios),
	CONSTRAINT idAtores
		FOREIGN	KEY(idAtores)
			REFERENCES Atores(idAtores)
);

CREATE TABLE Filmes_Atores (
	idAtores	INT,
	idFilmes	INT,
	CONSTRAINT idAtores
		FOREIGN	KEY(idAtores)
			REFERENCES Atores(idAtores),
	CONSTRAINT idFilmes
		FOREIGN	KEY(idFilmes)
			REFERENCES Filmes(idFilmes)
);

CREATE TABLE Serie_Atores (
	idSerie		INT,
	idAtores	INT,
	CONSTRAINT idAtores
		FOREIGN	KEY(idAtores)
			REFERENCES Atores(idAtores),
	CONSTRAINT idSerie
		FOREIGN	KEY(idSerie)
			REFERENCES Series(idSeries)
);

INSERT INTO Usuario VALUES (1, 'rafael@gmail.com', 1790, 'Rafael', 3197486464, 17906539298, 'Rua Jose Francisco', 078000000000, lo_import('C:\Avatar1.jpg'));
INSERT INTO Usuario VALUES (2, 'rodrigo@hotmail.com', 8181, 'Rodrigo', 37998435050, 07567812399, 'Rua Pedro Afonso', 078843000777, lo_import('C:\Avatar2.jpg'));
INSERT INTO Usuario VALUES (3, 'jorge@gmail.com.br', 5455, 'Jorge', 34992338786, 32145678992, 'Rua Sao Paulo', 214821000567, lo_import('C:\Avatar3.jpg'));

INSERT INTO Mensalidades VALUES (1, 1, 6, 5, 200, 'Pago');
INSERT INTO Mensalidades VALUES (2, 2, 4, 3, 100, 'Pendente');
INSERT INTO Mensalidades VALUES (3, 3, 10, 9, 60, 'Pago');

INSERT INTO Catalogo VALUES (1, 'Filme', lo_import('C:\Imagem1.jpg'));
INSERT INTO Catalogo VALUES (2, 'Serie', lo_import('C:\Imagem2.jpg'));
INSERT INTO Catalogo VALUES (3, 'Documentario', lo_import('C:\Imagem3.jpg'));

INSERT INTO Catalogo_Usuario VALUES (1, 1);
INSERT INTO Catalogo_Usuario VALUES (2, 2);
INSERT INTO Catalogo_Usuario VALUES (3, 3);

INSERT INTO Filmes VALUES (1, 1, 'Busca Implacavel', 2008, 93, 10);
INSERT INTO Filmes VALUES (2, 2, 'O protetor', 2014, 132, 9);
INSERT INTO Filmes VALUES (3, 3, 'Interestelar', 2014, 169, 8);

INSERT INTO Series VALUES (1, 1, 'Breaking Bad', 5);
INSERT INTO Series VALUES (2, 2, 'Better Call Saul', 8);
INSERT INTO Series VALUES (3, 3, 'Black Mirror', 10);

INSERT INTO Episodio VALUES (1, 1, 1, 'Materia cinzenta', 2008, 48, 1, 5, 7);
INSERT INTO Episodio VALUES (2, 2, 2, 'Nacho', 2015, 47, 1, 3, 4);
INSERT INTO Episodio VALUES (3, 3, 3, 'Loch Henry', 2023, 55, 6, 2, 6);

INSERT INTO Documentarios VALUES (1, 1, 'A Arte de Economizar', 2022, 93, 'Netflix', 8);
INSERT INTO Documentarios VALUES (2, 2, 'Magos do Cubo', 2020, 40, 'Netflix', 7);
INSERT INTO Documentarios VALUES (3, 3, 'O assasino da minha filha', 2022, 84, 'Netflix', 5);

INSERT INTO Atores VALUES (1, 'Denzel Washington', '28/12/1954', 'Mount Vernon, Nova York' );
INSERT INTO Atores VALUES (2, 'Liam Neeson', '7/6/1952', 'Ballymena, Reino Unido');
INSERT INTO Atores VALUES (3, 'leonardo dicaprio', '11/11/1974', 'Los Angeles, California');

INSERT INTO Documentario_atores VALUES (1, 1);
INSERT INTO Documentario_atores VALUES (2, 2);
INSERT INTO Documentario_atores VALUES (3, 3);

INSERT INTO Filmes_atores VALUES (1, 1);
INSERT INTO Filmes_atores VALUES (2, 2);
INSERT INTO Filmes_atores VALUES (3, 3);

INSERT INTO Serie_atores VALUES (1, 1);
INSERT INTO Serie_atores VALUES (2, 2);
INSERT INTO Serie_atores VALUES (3, 3);

CREATE TABLE log_MoviesPrime (
  nome_tabela VARCHAR(20),
  data_hora TIMESTAMP,
  usuario VARCHAR(20),
  comando VARCHAR(20)
);
  
CREATE OR REPLACE RULE rl_log_MoviesPrime AS
ON UPDATE TO usuario DO
INSERT INTO log_MoviesPrime(nome_tabela, data_hora, usuario, comando) values ('usuario', current_timestamp, current_user, 'UPDATE');

CREATE OR REPLACE RULE rl_log_MoviesPrime AS
ON DELETE TO usuario DO
INSERT INTO log_MoviesPrime(nome_tabela, data_hora, usuario, comando) values ('usuario', current_timestamp, current_user, 'REMOVE');
  
CREATE OR REPLACE RULE rl_log_MoviesPrime AS
ON UPDATE TO Mensalidades DO
INSERT INTO log_MoviesPrime(nome_tabela, data_hora, usuario, comando) values ('pagamento', current_timestamp, current_user, 'UPDATE');

CREATE OR REPLACE RULE rl_log_MoviesPrime AS
ON DELETE TO Mensalidades DO
INSERT INTO log_MoviesPrime(nome_tabela, data_hora, usuario, comando) values ('pagamento', current_timestamp, current_user, 'REMOVE');
  
CREATE OR REPLACE RULE rl_log_MoviesPrime AS
ON UPDATE TO catalogo DO
INSERT INTO log_MoviesPrime(nome_tabela, data_hora, usuario, comando) values ('catalogo', current_timestamp, current_user, 'UPDATE');

CREATE OR REPLACE RULE rl_log_MoviesPrime AS
ON DELETE TO catalogo DO
INSERT INTO log_MoviesPrime(nome_tabela, data_hora, usuario, comando) values ('catalogo', current_timestamp, current_user, 'REMOVE');  
  
CREATE OR REPLACE RULE rl_log_MoviesPrime AS
ON UPDATE TO Filmes DO
INSERT INTO log_MoviesPrime(nome_tabela, data_hora, usuario, comando) values ('Filmes', current_timestamp, current_user, 'UPDATE');

CREATE OR REPLACE RULE rl_log_MoviesPrime AS
ON DELETE TO Filmes DO
INSERT INTO log_MoviesPrime(nome_tabela, data_hora, usuario, comando) values ('Filmes', current_timestamp, current_user, 'REMOVE');  

CREATE OR REPLACE RULE rl_log_MoviesPrime AS
ON UPDATE TO Series DO
INSERT INTO log_MoviesPrime(nome_tabela, data_hora, usuario, comando) values ('Series', current_timestamp, current_user, 'UPDATE');

CREATE OR REPLACE RULE rl_log_MoviesPrime AS
ON DELETE TO Series DO
INSERT INTO log_MoviesPrime(nome_tabela, data_hora, usuario, comando) values ('Series', current_timestamp, current_user, 'REMOVE');

CREATE OR REPLACE RULE rl_log_MoviesPrime AS
ON UPDATE TO Episodio DO
INSERT INTO log_MoviesPrime(nome_tabela, data_hora, usuario, comando) values ('Episodio', current_timestamp, current_user, 'UPDATE');

CREATE OR REPLACE RULE rl_log_MoviesPrime AS
ON DELETE TO Episodio DO
INSERT INTO log_MoviesPrime(nome_tabela, data_hora, usuario, comando) values ('Episodio', current_timestamp, current_user, 'REMOVE');

CREATE OR REPLACE RULE rl_log_MoviesPrime AS
ON UPDATE TO Documentarios DO
INSERT INTO log_MoviesPrime(nome_tabela, data_hora, usuario, comando) values ('Documentarios', current_timestamp, current_user, 'UPDATE');

CREATE OR REPLACE RULE rl_log_MoviesPrime AS
ON DELETE TO Documentarios DO
INSERT INTO log_MoviesPrime(nome_tabela, data_hora, usuario, comando) values ('Documentarios', current_timestamp, current_user, 'REMOVE');

CREATE OR REPLACE RULE rl_log_MoviesPrime AS
ON UPDATE TO Atores DO
INSERT INTO log_MoviesPrime(nome_tabela, data_hora, usuario, comando) values ('Atores', current_timestamp, current_user, 'UPDATE');

CREATE OR REPLACE RULE rl_log_MoviesPrime AS
ON DELETE TO Atores DO
INSERT INTO log_MoviesPrime(nome_tabela, data_hora, usuario, comando) values ('Atores', current_timestamp, current_user, 'REMOVE');

CREATE OR REPLACE RULE DeleteUsuarioBlob AS ON DELETE TO Usuario DO
SELECT lo_unlink(old.Avatar);

CREATE OR REPLACE RULE DeleteCatalogoBlob AS ON DELETE TO Catalogo DO
SELECT lo_unlink(old.Imagem);






