# CRUD
-- CREATE  -> Criar ou inserir dados
-- READ    -> Ler dados
-- UPDATE  -> Atualizar dados
-- DELETE  -> Deletar/Remover Dados

CREATE DATABASE crud;
USE crud;

CREATE TABLE pessoas(
	nome VARCHAR(255),
    rg VARCHAR(9),
    cpf VARCHAR(11),
    limite INT(5)
);

# CREATE
INSERT INTO pessoas (nome, rg, cpf, limite) VALUES ("Levy Cordeiro", "123456789", "12345678910", 1000);
INSERT INTO pessoas (nome, rg, cpf, limite) VALUES ("Carlos Vinícius", "123456785", "12345678911", 500);
INSERT INTO pessoas (nome, rg, cpf, limite) VALUES ("Carlos Vinícius", "123456786", "12345678911", 4000);
INSERT INTO pessoas (nome, rg, cpf, limite) VALUES ("Carlos Vinícius", "123456787", "12345678911", 80000);
INSERT INTO pessoas (nome, rg, cpf, limite) VALUES ("Kauã Xavier", "123456782", "12345678912", 1000);
INSERT INTO pessoas (nome, rg, cpf, limite) VALUES ("Tonhão", "123456783", "12345678913", 1000);
INSERT INTO pessoas (nome, rg, cpf, limite) VALUES ("Irys Rhose", "123456784", "12345678914", 1000);

# READ - Selecionar
-- Selecionar todos os dados
SELECT * FROM pessoas;
-- Selecionar uma coluna específica
SELECT nome, limite FROM pessoas;
-- Selecionar só um elemento (dupla)
SELECT * FROM pessoas WHERE nome="Carlos Vinícius"; -- Linha
SELECT cpf FROM pessoas WHERE nome="Levy Cordeiro"; -- Dupla

# UPDATE - Atualizo os dados
SET SQL_SAFE_UPDATES = 0;
UPDATE pessoas SET limite = 50000 WHERE nome="Levy Cordeiro";
UPDATE pessoas SET limite = 90000 WHERE nome="Carlos Vinícius";

# Atualizo uma única informação na tabela
UPDATE pessoas SET limite = 50000 WHERE nome="Kauã Xavier";
UPDATE pessoas SET rg = 123456788, cpf = "11111111111" WHERE nome="Tonhão";


# DELETE - Apagar os dados
-- Deletar uma única pessoa da tabela
DELETE FROM pessoas WHERE nome="Carlos Vinícius";
DELETE FROM pessoas WHERE limite < 600;
DELETE FROM pessoas