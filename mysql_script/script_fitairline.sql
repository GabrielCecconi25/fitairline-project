CREATE DATABASE IF NOT EXISTS fitairline;

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

CREATE TABLE `assento` (
  codigo BIGINT NOT NULL AUTO_INCREMENT,
  id_aeronave BIGINT NOT NULL,
  n_de_assento INTEGER NOT NULL,
  l_de_assento VARCHAR(2) NOT NULL,
  PRIMARY KEY(codigo),
  FOREIGN KEY(id_aeronave) REFERENCES `aeronave`(idaeronave)
);

CREATE TABLE `itinerario` (
  aeroporto_sigla VARCHAR(255) NOT NULL,
  id_aeronave BIGINT NOT NULL,
  chegada VARCHAR(255) NOT NULL,
  partida VARCHAR(255) NOT NULL,
  FOREIGN KEY(aeroporto_sigla) REFERENCES `aeroporto`(sigla),
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

-- Adicionando 10 aeroportos Brasileiros
INSERT INTO aeroporto (sigla, nome, localidade) VALUES
('GRU', 'Aeroporto Internacional de São Paulo-Guarulhos', 'São Paulo'),
('GIG', 'Aeroporto Internacional do Rio de Janeiro-Galeão', 'Rio de Janeiro'),
('BSB', 'Aeroporto Internacional de Brasília', 'Brasília'),
('CNF', 'Aeroporto Internacional de Belo Horizonte-Confins', 'Belo Horizonte'),
('REC', 'Aeroporto Internacional do Recife', 'Recife'),
('JFK', 'John F. Kennedy International Airport', 'New York, USA'),
('LHR', 'Heathrow Airport', 'London, UK'),
('CDG', 'Charles de Gaulle Airport', 'Paris, France'),
('HND', 'Tokyo Haneda Airport', 'Tokyo, Japan'),
('DXB', 'Dubai International Airport', 'Dubai, UAE');

-- Adicionando aeronaves
INSERT INTO aeronave (total_assentos, modelo) VALUES
(120, 'Boeing 737'),
(120, 'Airbus A320'),
(120, 'Boeing 777'),
(120, 'Embraer E190'),
(120, 'Airbus A321'),
(120, 'Boeing 787'),
(120, 'Airbus A330'),
(120, 'Boeing 737 MAX');

-- Inserir 10 passageiros fixos
INSERT INTO passageiro (cpf, nome, rg, telefone) VALUES
('11111111111', 'Gabriel', 'RG111111', '555555555'),
('22222222222', 'Luiz', 'RG222222', '555555556'),
('33333333333', 'Alcenir', 'RG333333', '555555557'),
('44444444444', 'Lucas Vassalo', 'RG444444', '555555558'),
('55555555555', 'Lucas Helama', 'RG555555', '555555559'),
('66666666666', 'Matheus', 'RG666666', '555555560'),
('77777777777', 'Elthon Jhon', 'RG777777', '555555561'),
('88888888888', 'Guilherme', 'RG888888', '555555562'),
('99999999999', 'Felipe', 'RG999999', '555555563'),
('10101010101', 'Ahmad', 'RG101010', '555555564');

-- Viagem GRU para JFK
INSERT INTO itinerario (aeroporto_sigla, id_aeronave, chegada, partida) VALUES
('GRU', 1, '2024-06-01 20:00:00', '2024-06-01 22:00:00'),
('JFK', 1, '2024-06-02 10:00:00', '2024-06-02 12:00:00');

-- Viagem GIG para LHR
INSERT INTO itinerario (aeroporto_sigla, id_aeronave, chegada, partida) VALUES
('GIG', 2, '2024-06-15 21:00:00', '2024-06-15 23:00:00'),
('LHR', 2, '2024-06-17 07:00:00', '2024-06-17 09:00:00');

-- Viagem CNF para HND
INSERT INTO itinerario (aeroporto_sigla, id_aeronave, chegada, partida) VALUES
('CNF', 3, '2024-06-10 17:00:00', '2024-06-10 19:00:00'),
('HND', 3, '2024-06-11 09:00:00', '2024-06-11 11:00:00');

-- Viagem BSB para CDG
INSERT INTO itinerario (aeroporto_sigla, id_aeronave, chegada, partida) VALUES
('BSB', 4, '2024-07-05 19:00:00', '2024-07-05 21:00:00'),
('CDG', 4, '2024-07-06 09:00:00', '2024-07-06 11:00:00');

-- Viagem REC para DXB
INSERT INTO itinerario (aeroporto_sigla, id_aeronave, chegada, partida) VALUES
('REC', 5, '2024-06-19 23:00:00', '2024-06-20 01:00:00'),
('DXB', 5, '2024-06-20 11:00:00', '2024-06-20 13:00:00');

-- Viagem GRU para LHR
INSERT INTO itinerario (aeroporto_sigla, id_aeronave, chegada, partida) VALUES
('GRU', 6, '2024-06-24 14:00:00', '2024-06-24 16:00:00'),
('LHR', 6, '2024-06-25 04:00:00', '2024-06-25 06:00:00');

-- Viagem GIG para CDG
INSERT INTO itinerario (aeroporto_sigla, id_aeronave, chegada, partida) VALUES
('GIG', 7, '2024-06-29 16:00:00', '2024-06-29 18:00:00'),
('CDG', 7, '2024-06-30 06:00:00', '2024-06-30 08:00:00');

-- Viagem BSB para JFK
INSERT INTO itinerario (aeroporto_sigla, id_aeronave, chegada, partida) VALUES
('BSB', 8, '2024-07-04 19:00:00', '2024-07-04 21:00:00'),
('JFK', 8, '2024-07-05 09:00:00', '2024-07-05 11:00:00');

-- Viagem CNF para DXB
INSERT INTO itinerario (aeroporto_sigla, id_aeronave, chegada, partida) VALUES
('CNF', 7, '2024-07-09 20:00:00', '2024-07-09 22:00:00'),
('DXB', 7, '2024-07-10 08:00:00', '2024-07-10 10:00:00');

-- Viagem REC para HND
INSERT INTO itinerario (aeroporto_sigla, id_aeronave, chegada, partida) VALUES
('REC', 4, '2024-07-14 18:00:00', '2024-07-14 20:00:00'),
('HND', 4, '2024-07-16 08:00:00', '2024-07-16 10:00:00');

-- Para a primeira aeronave (Boeing 737)
INSERT INTO assento (id_aeronave, n_de_assento, l_de_assento)
SELECT 1 as id_aeronave, n as n_de_assento, 'a' as l_de_assento
FROM (
    SELECT ROW_NUMBER() OVER () as n
    FROM information_schema.tables
    LIMIT 40 -- Total de assentos para esta aeronave
) as assentos;

INSERT INTO assento (id_aeronave, n_de_assento, l_de_assento)
SELECT 1 as id_aeronave, n as n_de_assento, 'b' as l_de_assento
FROM (
    SELECT ROW_NUMBER() OVER () as n
    FROM information_schema.tables
    LIMIT 40 -- Total de assentos para esta aeronave
) as assentos;

INSERT INTO assento (id_aeronave, n_de_assento, l_de_assento)
SELECT 1 as id_aeronave, n as n_de_assento, 'c' as l_de_assento
FROM (
    SELECT ROW_NUMBER() OVER () as n
    FROM information_schema.tables
    LIMIT 40 -- Total de assentos para esta aeronave
) as assentos;


-- Para a segunda aeronave (Airbus A320)
INSERT INTO assento (id_aeronave, n_de_assento, l_de_assento)
SELECT 2 as id_aeronave, n as n_de_assento, 'a' as l_de_assento
FROM (
    SELECT ROW_NUMBER() OVER () as n
    FROM information_schema.tables
    LIMIT 40 -- Total de assentos para esta aeronave
) as assentos;

INSERT INTO assento (id_aeronave, n_de_assento, l_de_assento)
SELECT 2 as id_aeronave, n as n_de_assento, 'b' as l_de_assento
FROM (
    SELECT ROW_NUMBER() OVER () as n
    FROM information_schema.tables
    LIMIT 40 -- Total de assentos para esta aeronave
) as assentos;

INSERT INTO assento (id_aeronave, n_de_assento, l_de_assento)
SELECT 2 as id_aeronave, n as n_de_assento, 'c' as l_de_assento
FROM (
    SELECT ROW_NUMBER() OVER () as n
    FROM information_schema.tables
    LIMIT 40 -- Total de assentos para esta aeronave
) as assentos;

-- Para a terceira aeronave (Boeing 777)
INSERT INTO assento (id_aeronave, n_de_assento, l_de_assento)
SELECT 3 as id_aeronave, n as n_de_assento, 'a' as l_de_assento
FROM (
    SELECT ROW_NUMBER() OVER () as n
    FROM information_schema.tables
    LIMIT 40 -- Total de assentos para esta aeronave
) as assentos;

INSERT INTO assento (id_aeronave, n_de_assento, l_de_assento)
SELECT 3 as id_aeronave, n as n_de_assento, 'b' as l_de_assento
FROM (
    SELECT ROW_NUMBER() OVER () as n
    FROM information_schema.tables
    LIMIT 40 -- Total de assentos para esta aeronave
) as assentos;

INSERT INTO assento (id_aeronave, n_de_assento, l_de_assento)
SELECT 3 as id_aeronave, n as n_de_assento, 'c' as l_de_assento
FROM (
    SELECT ROW_NUMBER() OVER () as n
    FROM information_schema.tables
    LIMIT 40 -- Total de assentos para esta aeronave
) as assentos;

-- Para a primeira aeronave (Embraer E190)
INSERT INTO assento (id_aeronave, n_de_assento, l_de_assento)
SELECT 4 as id_aeronave, n as n_de_assento, 'a' as l_de_assento
FROM (
    SELECT ROW_NUMBER() OVER () as n
    FROM information_schema.tables
    LIMIT 40 -- Total de assentos para esta aeronave
) as assentos;

INSERT INTO assento (id_aeronave, n_de_assento, l_de_assento)
SELECT 4 as id_aeronave, n as n_de_assento, 'b' as l_de_assento
FROM (
    SELECT ROW_NUMBER() OVER () as n
    FROM information_schema.tables
    LIMIT 40 -- Total de assentos para esta aeronave
) as assentos;

INSERT INTO assento (id_aeronave, n_de_assento, l_de_assento)
SELECT 4 as id_aeronave, n as n_de_assento, 'c' as l_de_assento
FROM (
    SELECT ROW_NUMBER() OVER () as n
    FROM information_schema.tables
    LIMIT 40 -- Total de assentos para esta aeronave
) as assentos;

-- Para a primeira aeronave (Airbus A321)
INSERT INTO assento (id_aeronave, n_de_assento, l_de_assento)
SELECT 5 as id_aeronave, n as n_de_assento, 'a' as l_de_assento
FROM (
    SELECT ROW_NUMBER() OVER () as n
    FROM information_schema.tables
    LIMIT 40 -- Total de assentos para esta aeronave
) as assentos;

INSERT INTO assento (id_aeronave, n_de_assento, l_de_assento)
SELECT 5 as id_aeronave, n as n_de_assento, 'b' as l_de_assento
FROM (
    SELECT ROW_NUMBER() OVER () as n
    FROM information_schema.tables
    LIMIT 40 -- Total de assentos para esta aeronave
) as assentos;

INSERT INTO assento (id_aeronave, n_de_assento, l_de_assento)
SELECT 5 as id_aeronave, n as n_de_assento, 'c' as l_de_assento
FROM (
    SELECT ROW_NUMBER() OVER () as n
    FROM information_schema.tables
    LIMIT 40 -- Total de assentos para esta aeronave
) as assentos;

-- Para a primeira aeronave (Boeing 787)
INSERT INTO assento (id_aeronave, n_de_assento, l_de_assento)
SELECT 6 as id_aeronave, n as n_de_assento, 'a' as l_de_assento
FROM (
    SELECT ROW_NUMBER() OVER () as n
    FROM information_schema.tables
    LIMIT 40 -- Total de assentos para esta aeronave
) as assentos;

INSERT INTO assento (id_aeronave, n_de_assento, l_de_assento)
SELECT 6 as id_aeronave, n as n_de_assento, 'b' as l_de_assento
FROM (
    SELECT ROW_NUMBER() OVER () as n
    FROM information_schema.tables
    LIMIT 40 -- Total de assentos para esta aeronave
) as assentos;

INSERT INTO assento (id_aeronave, n_de_assento, l_de_assento)
SELECT 6 as id_aeronave, n as n_de_assento, 'c' as l_de_assento
FROM (
    SELECT ROW_NUMBER() OVER () as n
    FROM information_schema.tables
    LIMIT 40 -- Total de assentos para esta aeronave
) as assentos;

-- Para a primeira aeronave (Boeing 787)
INSERT INTO assento (id_aeronave, n_de_assento, l_de_assento)
SELECT 7 as id_aeronave, n as n_de_assento, 'a' as l_de_assento
FROM (
    SELECT ROW_NUMBER() OVER () as n
    FROM information_schema.tables
    LIMIT 40 -- Total de assentos para esta aeronave
) as assentos;

INSERT INTO assento (id_aeronave, n_de_assento, l_de_assento)
SELECT 7 as id_aeronave, n as n_de_assento, 'b' as l_de_assento
FROM (
    SELECT ROW_NUMBER() OVER () as n
    FROM information_schema.tables
    LIMIT 40 -- Total de assentos para esta aeronave
) as assentos;

INSERT INTO assento (id_aeronave, n_de_assento, l_de_assento)
SELECT 7 as id_aeronave, n as n_de_assento, 'c' as l_de_assento
FROM (
    SELECT ROW_NUMBER() OVER () as n
    FROM information_schema.tables
    LIMIT 40 -- Total de assentos para esta aeronave
) as assentos;

-- Para a primeira aeronave (Boeing 737 MAX)
INSERT INTO assento (id_aeronave, n_de_assento, l_de_assento)
SELECT 8 as id_aeronave, n as n_de_assento, 'a' as l_de_assento
FROM (
    SELECT ROW_NUMBER() OVER () as n
    FROM information_schema.tables
    LIMIT 40 -- Total de assentos para esta aeronave
) as assentos;

INSERT INTO assento (id_aeronave, n_de_assento, l_de_assento)
SELECT 8 as id_aeronave, n as n_de_assento, 'b' as l_de_assento
FROM (
    SELECT ROW_NUMBER() OVER () as n
    FROM information_schema.tables
    LIMIT 40 -- Total de assentos para esta aeronave
) as assentos;

INSERT INTO assento (id_aeronave, n_de_assento, l_de_assento)
SELECT 8 as id_aeronave, n as n_de_assento, 'c' as l_de_assento
FROM (
    SELECT ROW_NUMBER() OVER () as n
    FROM information_schema.tables
    LIMIT 40 -- Total de assentos para esta aeronave
) as assentos;

-- Viagem 1 --
INSERT INTO passagem (passageiro_cpf, assento_codigo, aeroporto_sigla, partida, destino, classe, valor)
SELECT
    '11111111111' AS passageiro_cpf,
    a.codigo AS assento_codigo,
    'GRU',
    '2024-06-01 20:00:00' AS partida,
    'JFK' AS destino,
    'Economica' AS classe,
    ROUND(RAND() * 1000 + 300, 2) AS valor
FROM 
    (SELECT 
        codigo
    FROM 
        assento
    WHERE 
        n_de_assento BETWEEN 1 AND 10
        AND l_de_assento = 'c'
    ORDER BY 
        RAND()
    LIMIT 10) a;

-- Viagem 2 --
INSERT INTO passagem (passageiro_cpf, assento_codigo, aeroporto_sigla, partida, destino, classe, valor)
SELECT
    '22222222222' AS passageiro_cpf,
    a.codigo AS assento_codigo,
    'GIG',
    '2024-06-15 21:00:00' AS partida,
    'LHR' AS destino,
    'Economica' AS classe,
    ROUND(RAND() * 1000 + 300, 2) AS valor
FROM 
    (SELECT 
        codigo
    FROM 
        assento
    WHERE 
        n_de_assento BETWEEN 1 AND 10
        AND l_de_assento = 'a'
    ORDER BY 
        RAND()
    LIMIT 10) a;

-- Viagem 3 --
INSERT INTO passagem (passageiro_cpf, assento_codigo, aeroporto_sigla, partida, destino, classe, valor)
SELECT
    '33333333333' AS passageiro_cpf,
    a.codigo AS assento_codigo,
    'CNF',
    '2024-06-10 17:00:00' AS partida,
    'HND' AS destino,
    'Economica' AS classe,
    ROUND(RAND() * 1000 + 300, 2) AS valor
FROM 
    (SELECT 
        codigo
    FROM 
        assento
    WHERE 
        n_de_assento BETWEEN 1 AND 10
        AND l_de_assento = 'b'
    ORDER BY 
        RAND()
    LIMIT 10) a;

-- Viagem 4 --
INSERT INTO passagem (passageiro_cpf, assento_codigo, aeroporto_sigla, partida, destino, classe, valor)
SELECT
    '44444444444' AS passageiro_cpf,
    a.codigo AS assento_codigo,
    'BSB',
    '2024-07-05 19:00:00' AS partida,
    'CDG' AS destino,
    'Economica' AS classe,
    ROUND(RAND() * 1000 + 300, 2) AS valor
FROM 
    (SELECT 
        codigo
    FROM 
        assento
    WHERE 
        n_de_assento BETWEEN 1 AND 10
        AND l_de_assento = 'c'
    ORDER BY 
        RAND()
    LIMIT 10) a;

-- Viagem 5 --
INSERT INTO passagem (passageiro_cpf, assento_codigo, aeroporto_sigla, partida, destino, classe, valor)
SELECT
    '55555555555' AS passageiro_cpf,
    a.codigo AS assento_codigo,
    'REC',
    '2024-06-19 23:00:00' AS partida,
    'DXB' AS destino,
    'Economica' AS classe,
    ROUND(RAND() * 1000 + 300, 2) AS valor
FROM 
    (SELECT 
        codigo
    FROM 
        assento
    WHERE 
        n_de_assento BETWEEN 1 AND 15
        AND l_de_assento = 'a'
    ORDER BY 
        RAND()
    LIMIT 15) a;

-- Viagem 6 --
INSERT INTO passagem (passageiro_cpf, assento_codigo, aeroporto_sigla, partida, destino, classe, valor)
SELECT
    '66666666666' AS passageiro_cpf,
    a.codigo AS assento_codigo,
    'GRU',
    '2024-06-24 14:00:00' AS partida,
    'LHR' AS destino,
    'Economica' AS classe,
    ROUND(RAND() * 1000 + 300, 2) AS valor
FROM 
    (SELECT 
        codigo
    FROM 
        assento
    WHERE 
        n_de_assento BETWEEN 1 AND 10
        AND l_de_assento = 'b'
    ORDER BY 
        RAND()
    LIMIT 10) a;

-- Viagem 7 --

INSERT INTO passagem (passageiro_cpf, assento_codigo, aeroporto_sigla, partida, destino, classe, valor)
SELECT
    '77777777777' AS passageiro_cpf,
    a.codigo AS assento_codigo,
    'GIG',
    '2024-06-29 16:00:00' AS partida,
    'CDG' AS destino,
    'Economica' AS classe,
    ROUND(RAND() * 1000 + 300, 2) AS valor
FROM 
    (SELECT 
        codigo
    FROM 
        assento
    WHERE 
        n_de_assento BETWEEN 1 AND 10
        AND l_de_assento = 'c'
    ORDER BY 
        RAND()
    LIMIT 10) a;

-- Viagem 8 --

INSERT INTO passagem (passageiro_cpf, assento_codigo, aeroporto_sigla, partida, destino, classe, valor)
SELECT
    '88888888888' AS passageiro_cpf,
    a.codigo AS assento_codigo,
    'BSB',
    '2024-07-04 19:00:00' AS partida,
    'JFK' AS destino,
    'Economica' AS classe,
    ROUND(RAND() * 1000 + 300, 2) AS valor
FROM 
    (SELECT 
        codigo
    FROM 
        assento
    WHERE 
        n_de_assento BETWEEN 1 AND 10
        AND l_de_assento = 'a'
    ORDER BY 
        RAND()
    LIMIT 10) a;

-- Viagem 9 --

INSERT INTO passagem (passageiro_cpf, assento_codigo, aeroporto_sigla, partida, destino, classe, valor)
SELECT
    '99999999999' AS passageiro_cpf,
    a.codigo AS assento_codigo,
    'CNF',
    '2024-07-09 20:00:00' AS partida,
    'DXB' AS destino,
    'Economica' AS classe,
    ROUND(RAND() * 1000 + 300, 2) AS valor
FROM 
    (SELECT 
        codigo
    FROM 
        assento
    WHERE 
        n_de_assento BETWEEN 1 AND 10
        AND l_de_assento = 'b'
    ORDER BY 
        RAND()
    LIMIT 10) a;

-- Viagem 10 --

INSERT INTO passagem (passageiro_cpf, assento_codigo, aeroporto_sigla, partida, destino, classe, valor)
SELECT
    '10101010101' AS passageiro_cpf,
    a.codigo AS assento_codigo,
    'REC',
    '2024-07-14 18:00:00' AS partida,
    'HND' AS destino,
    'Economica' AS classe,
    ROUND(RAND() * 1000 + 300, 2) AS valor
FROM 
    (SELECT 
        codigo
    FROM 
        assento
    WHERE 
        n_de_assento BETWEEN 1 AND 10
        AND l_de_assento = 'c'
    ORDER BY 
        RAND()
    LIMIT 10) a;