CREATE DATABASE sesi_senai;
USE sesi_senai;

CREATE TABLE tb_ensino_basico(
	id_basic CHAR(4) PRIMARY KEY NOT NULL,
    materia VARCHAR(50) NOT NULL,
    professor_nome VARCHAR(50) NOT NULL
);

INSERT INTO tb_ensino_basico (id_basic, materia, professor_nome) VALUES
('B001', 'Linguagens e sua Tecnologias', 'Islane França'),
('B002', 'Ciências da Natureza', 'Marcos César'),
('B003', 'Ciências Humanas', 'Paulo Holanda'),
('B004', 'Matemática e suas Tecnologias', 'Karolyne Camile');
SELECT * FROM tb_ensino_basico;

CREATE TABLE tb_ensino_tecnico(
	id_tecnic CHAR(4) PRIMARY KEY NOT NULL,
    unidade VARCHAR(50) NOT NULL,
    professor_nome VARCHAR(50) NOT NULL
);

INSERT INTO tb_ensino_tecnico (id_tecnic, unidade, professor_nome) VALUES 
('T001', 'HTML/CSS', 'Carlos Wilton'),
('T002', 'Interação com API', 'Jonathas Maciel'),
('T003', 'Banco de dados', 'Bruno Matheus'),
('T004', 'Node.js', 'Leticia Dias');
SELECT * FROM tb_ensino_tecnico;

CREATE TABLE tb_ensino_robotica(
	id_robotic CHAR(4) PRIMARY KEY NOT NULL,
    tipo ENUM('Educacional','Competitiva'),
    professor_nome VARCHAR(50) NOT NULL
);

INSERT INTO tb_ensino_robotica (id_robotic, tipo, professor_nome) VALUES
('R001', 'Educacional', 'Ryan'),
('R002', 'Competitiva', 'Ivo'),
('R003', 'Educacional', 'Matheus');
SELECT * FROM tb_ensino_robotica;

CREATE TABLE tb_naped(
	profissional_nome VARCHAR(50) NOT NULL,
    id_comic_basic CHAR(4) NOT NULL,
    id_comic_tecnic CHAR(4) NOT NULL,
	FOREIGN KEY (id_comic_basic) REFERENCES tb_ensino_basico(id_basic),
    FOREIGN KEY (id_comic_tecnic) REFERENCES tb_ensino_tecnico(id_tecnic)
);

INSERT INTO tb_naped (profissional_nome, id_comic_basic, id_comic_tecnic) VALUES
('Givaldo', 'B001', 'T001'),
('Irys', 'B002', 'T002'),
('Santana', 'B003', 'T003'),
('Xavier', 'B004', 'T004');
SELECT * FROM tb_naped;

DROP TABLE tb_secretaria_geral;
CREATE TABLE tb_secretaria_geral(
	profissional_nome VARCHAR(50) NOT NULL,
    id_comic_robotic CHAR(4) NOT NULL,
    FOREIGN KEY (id_comic_robotic) REFERENCES tb_ensino_robotica(id_robotic)
);

INSERT INTO tb_secretaria_geral (profissional_nome, id_comic_robotic) VALUES
('Kevin', 'R001'),
('Glaucos', 'R002'),
('Giovanna', 'R003');
SELECT * FROM tb_secretaria_geral;

CREATE TABLE tb_cantina(
	id INT PRIMARY KEY NOT NULL,
	profissional_nome VARCHAR(50) NOT NULL
);

INSERT INTO tb_cantina (id, profissional_nome) VALUES
('1', 'Valéria'),
('2', 'Karla');
SELECT * FROM tb_cantina;

CREATE TABLE tb_bebidas(
	id_bebidas INT PRIMARY KEY NOT NULL,
    nome VARCHAR(25) NOT NULL,
    preco FLOAT NOT NULL
);
INSERT INTO tb_bebidas (id_bebidas, nome, preco) VALUES
(1, 'Coca-Cola', 3.50),
(2, 'Suco de laranja', 2.00),
(3, 'Água mineral', 1.50),
(4, 'Água com gás', 4.00),
(5, 'Energético', 10.00);
SELECT * FROM tb_bebidas ORDER BY preco ASC;

CREATE TABLE tb_lanches(
	id_lanches INT PRIMARY KEY NOT NULL,
    nome VARCHAR(25) NOT NULL,
    preco FLOAT NOT NULL
);

INSERT INTO tb_lanches (id_lanches, nome, preco) VALUES
 (1, 'X-burguer', 8.00),
 (2, 'Cachorro-quente', 5.00),
 (3, 'Salada', 6.00),
 (4, 'Pizza', 12.00),
 (5, 'Sanduíche natural', 7.00);
 SELECT * FROM tb_lanches ORDER BY preco ASC;
 
 CREATE TABLE tb_vendas(
	id_local_venda INT NOT NULL,
    id_bebida_vendida INT NOT NULL,
    id_lanche_vendido INT NOT NULL,
    FOREIGN KEY (id_local_venda) REFERENCES tb_cantina(id),
    FOREIGN KEY (id_bebida_vendida) REFERENCES tb_bebidas(id_bebidas),
    FOREIGN KEY (id_lanche_vendido) REFERENCES tb_lanches(id_lanches)
);
INSERT INTO tb_vendas(id_local_venda, id_bebida_vendida, id_lanche_vendido) VALUES
(1, 4, 5);
SELECT * FROM tb_vendas;