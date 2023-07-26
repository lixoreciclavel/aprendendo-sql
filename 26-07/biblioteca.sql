CREATE DATABASE livraria;
USE livraria;

CREATE TABLE tb_cliente(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    email CHAR(150) UNIQUE NOT NULL,
    telefone INT(11) UNIQUE NOT NULL
);
INSERT INTO tb_cliente (nome, email, telefone) VALUES ("Don Pablo","pabloescobar93@gmail.com", 829990391);
INSERT INTO tb_cliente (nome, email, telefone) VALUES ("Kauã Xavier","kaua032@gmail.com", 829990392);
INSERT INTO tb_cliente (nome, email, telefone) VALUES ("Débora","abelhinhaS2@gmail.com", 829990393);
INSERT INTO tb_cliente (nome, email, telefone) VALUES ("Tonho","tonhao69@gmail.com", 829990394);

SELECT * FROM tb_cliente;

ALTER TABLE tb_endereco_cliente ADD COLUMN complemento VARCHAR(250) NOT NULL;
ALTER TABLE tb_endereco_cliente ADD COLUMN cliente_id INT NOT NULL;
ALTER TABLE tb_endereco_cliente ADD FOREIGN KEY (cliente_id) REFERENCES tb_cliente(id);
CREATE TABLE tb_endereco_cliente (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    cap VARCHAR(9) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    logradouro VARCHAR(200) NOT NULL,
    numero_casa CHAR(10) NOT NULL,
    complemento VARCHAR(250) NOT NULL,
    cliente_id INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES tb_cliente(id)
);

CREATE TABLE tb_genero(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    genero VARCHAR(50) NOT NULL UNIQUE
);

# 3º forma normal
DROP TABLE tb_genero_livros;
CREATE TABLE tb_genero_livros(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    genero_id INT NOT NULL,
    livros_id INT NOT NULL,
    FOREIGN KEY (genero_id) REFERENCES tb_genero(id),
    FOREIGN KEY (livros_id) REFERENCES tb_livros(id)
);

ALTER TABLE tb_livros ADD COLUMN sku VARCHAR(10) UNIQUE NOT NULL;
ALTER TABLE tb_livros ADD COLUMN preco FLOAT NOT NULL;
CREATE TABLE tb_livros(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    autor VARCHAR(50) NOT NULL,
    editora VARCHAR(50) NOT NULL,
    edicao CHAR(4)
);

ALTER TABLE tb_revistas ADD COLUMN sku VARCHAR(10) UNIQUE NOT NULL;
ALTER TABLE tb_revistas ADD COLUMN preco FLOAT NOT NULL;
CREATE TABLE tb_revistas(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    autor VARCHAR(50) NOT NULL,
    editora VARCHAR(50) NOT NULL,
    eidicao CHAR(4)
);

CREATE TABLE tb_genero_revistas(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    genero_id INT NOT NULL,
    revistas_id INT NOT NULL,
    FOREIGN KEY (genero_id) REFERENCES tb_genero(id),
    FOREIGN KEY (revistas_id) REFERENCES tb_revistas(id)
);
# FIM DA 3º FORMA

ALTER TABLE tb_material_escolar ADD COLUMN preco FLOAT NOT NULL;
CREATE TABLE tb_material_escolar(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    tipo VARCHAR(25) NOT NULL,
    sku VARCHAR(10) UNIQUE NOT NULL
);

CREATE TABLE tb_estoque(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    quantidade INT NOT NULL,
    livros_id INT NOT NULL,
    revistas_id INT NOT NULL,
    material_escolar_id INT NOT NULL,
    FOREIGN KEY (livros_id) REFERENCES tb_livros (id),
    FOREIGN KEY (revistas_id) REFERENCES tb_revistas (id),
    FOREIGN KEY (material_escolar_id) REFERENCES tb_material_escolar (id)
);

CREATE TABLE tb_vendas(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    valor_total FLOAT NOT NULL,
    quantidade_vendas INT NOT NULL,
    data_venda TIMESTAMP,
    cliente_id INT NOT NULL,
    estoque_id INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES tb_cliente(id),
    FOREIGN KEY (estoque_id) REFERENCES tb_estoque(id)
);