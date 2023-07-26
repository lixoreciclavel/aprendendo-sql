CREATE DATABASE escobar;
USE escobar;

CREATE TABLE tb_empresa(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	telefone INT(11) UNIQUE NOT NULL,
    cfdf CHAR(17) UNIQUE NOT NULL,
    cnpj  CHAR(18) UNIQUE NOT NULL
);

DROP TABLE tb_empresa;

CREATE TABLE tb_produto(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    sku VARCHAR(10) UNIQUE NOT NULL,
    preco FLOAT NOT NULL
);
ALTER TABLE tb_produto ADD COLUMN descricao VARCHAR(255) NOT NULL;
ALTER TABLE tb_produto DROP COLUMN tipo;
ALTER TABLE tb_produto DROP COLUMN nome;
ALTER TABLE tb_produto DROP COLUMN sku;

CREATE TABLE tb_cliente(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nome VARCHAR(100) NOT NULL,
    cpf INT(11) UNIQUE NOT NULL,
    telefone INT(11) UNIQUE NOT NULL
);

CREATE TABLE tb_endereco_cliente(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    cep VARCHAR(9) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    logradouro VARCHAR(200) NOT NULL,
    numero_casa CHAR(10) NOT NULL,
    complemento VARCHAR(250) NOT NULL,
    cliente_id INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES tb_cliente(id)
);

CREATE TABLE tb_vendas(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    data_venda TIMESTAMP,
    cliente_id INT NOT NULL,
    produto_id INT NOT NULL,
    preco_total FLOAT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES tb_cliente(id),
    FOREIGN KEY (produto_id) REFERENCES tb_produto(id)
);