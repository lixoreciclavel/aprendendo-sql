CREATE DATABASE rede_social;
USE rede_social;

CREATE TABLE tb_user(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    username VARCHAR(250) NOT NULL,
    senha VARCHAR(50) NOT NULL,
    email VARCHAR(250) NOT NULL
);

CREATE TABLE tb_publi(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    video INT(1),
    foto INT(1),
    likes INT,
    id_user_publi INT NOT NULL,
    FOREIGN KEY (id_user_publi) REFERENCES tb_user(id)
);

CREATE TABLE tb_rt(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	id_likes INT NOT NULL,
	id_foto INT NOT NULL,
	FOREIGN KEY (id_likes) REFERENCES tb_publi(id),
	FOREIGN KEY (id_foto) REFERENCES tb_publi(id)
);

INSERT INTO tb_user (username, senha, email) VALUES
('João Silva', 'senha123', 'joao.silva@email.com'),
('Maria Santos', 'senha456', 'maria.santos@email.com'),
('Pedro Oliveira', 'senha789', 'pedro.oliveira@email.com'),
('Ana Souza', 'senha321', 'ana.souza@email.com'),
('Lucas Costa', 'senha654', 'lucas.costa@email.com'),
('Julia Lima', 'senha987', 'julia.lima@email.com'),
('Bruno Almeida', 'senha147', 'bruno.almeida@email.com'),
('Fernanda Rocha', 'senha258', 'fernanda.rocha@email.com'),
('Rafael Gomes', 'senha369', 'rafael.gomes@email.com'),
('Carla Dias', 'senha159', 'carla.dias@email.com');

SET SQL_SAFE_UPDATES = 0;
UPDATE tb_user SET username = "Zé Ciço" WHERE email="maria.santos@email.com";
UPDATE tb_user SET email = "enzo@enzo.com" WHERE username="Júlia Lima"; 






