USE fitairline;

CREATE TABLE `passageiro` (
  cpf VARCHAR(255) NOT NULL,
  nome VARCHAR(255) NOT NULL,
  rg VARCHAR(255) NOT NULL,
  telefone VARCHAR(255) NOT NULL,
  PRIMARY KEY(cpf)
);

CREATE TABLE `aeronave` (
  idaeronave BIGINT NOT NULL AUTO_INCREMENT,
  total_assentos INTEGER NOT NULL,
  modelo VARCHAR(255) NOT NULL,
  PRIMARY KEY(idaeronave)
);

CREATE TABLE `aeroporto` (
  sigla VARCHAR(255) NOT NULL,
  nome VARCHAR(255) NOT NULL,
  localidade VARCHAR(255) NOT NULL,
  PRIMARY KEY(sigla)
);

--CREATE TABLE `voo` (
--  codigo_de_voo BIGINT NOT NULL AUTO_INCREMENT,
--  id_aeronave BIGINT NOT NULL,
--  PRIMARY KEY(codigo_de_voo),
--  FOREIGN KEY(id_aeronave) REFERENCES `aeronave`(idaeronave)
--);

CREATE TABLE `assento` (
  codigo BIGINT NOT NULL AUTO_INCREMENT,
  id_aeronave BIGINT NOT NULL,
  n_de_assento INTEGER NOT NULL,
  PRIMARY KEY(codigo),
  FOREIGN KEY(id_aeronave) REFERENCES `aeronave`(idaeronave)
);

CREATE TABLE `bagegem` (
  codigo BIGINT NOT NULL AUTO_INCREMENT,
  passageiro_cpf VARCHAR(255) NOT NULL,
  peso FLOAT NULL,
  PRIMARY KEY(codigo),
  FOREIGN KEY(passageiro_cpf) REFERENCES `passageiro`(cpf)
);

CREATE TABLE `itinerario` (
  aereporto_sigla VARCHAR(255) NOT NULL,
  id_aeronave BIGINT NOT NULL,
  chegada VARCHAR(255) NULL,
  partida INTEGER NOT NULL,
  FOREIGN KEY(aereporto_sigla) REFERENCES `aeroporto`(sigla),
  FOREIGN KEY(id_aeronave) REFERENCES `aeronave`(idaeronave)
);

CREATE TABLE `passagem` (
  codigo BIGINT NOT NULL AUTO_INCREMENT,
  passageiro_cpf VARCHAR(255) NOT NULL,
  assento_codigo BIGINT NOT NULL,
  aeroporto_sigla VARCHAR(255) NOT NULL,
  partida VARCHAR(255) NOT NULL,
  destino VARCHAR(255) NOT NULL,
  classe VARCHAR(255) NOT NULL,
  valor DECIMAL(10,2) NOT NULL,
  PRIMARY KEY(codigo),
  FOREIGN KEY(passageiro_cpf) REFERENCES `passageiro`(cpf),
  FOREIGN KEY(aeroporto_sigla) REFERENCES `aeroporto`(sigla),
  FOREIGN KEY(assento_codigo) REFERENCES `assento`(codigo)
);