CREATE DATABASE rede_social;
USE rede_social;

DROP TABLE tb_usuario;
CREATE TABLE tb_usuario(
	
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) NOT NULL,
    senha VARCHAR(50) NOT NULL
);

CREATE TABLE tb_publi(
	
    foto INT,
    video INT
    
);

CREATE TABLE tb_republi(
	nome VARCHAR(100) NOT NULL
);

SELECT * FROM tb_usuario;
INSERT INTO tb_usuario (username, email, senha) VALUES ("yvel_sla", "levy@levy.com", "Levy_2006");
INSERT INTO tb_usuario (usermane, email, senha) VALUES ("viniloss", "carlos@vinicius.com", "carlos_2005");
INSERT INTO tb_usuario (usermane, email, senha) VALUES ("mimi", "mimi@crepusculo.com", "mimi_2005");
INSERT INTO tb_usuario (usermane, email, senha) VALUES ("ansie", "ansie@vomito.com", "ansie_2005");
INSERT INTO tb_usuario (usermane, email, senha) VALUES ("tonitoto", "tonho@lovecrianca.com", "tonho_2006");
INSERT INTO tb_usuario (usermane, email, senha) VALUES ("cacau_show", "amo@abelhinha.com", "amo_abelhinha");
INSERT INTO tb_usuario (usermane, email, senha) VALUES ("irysRH", "irys@rosa.com", "irys_2000");
INSERT INTO tb_usuario (usermane, email, senha) VALUES ("anao_bombado", "glaucos@glauquito.com", "glauquinha_s2");
INSERT INTO tb_usuario (usermane, email, senha) VALUES ("kevinS2emilia", "kevin@faltou.com", "Kevin_2005");
INSERT INTO tb_usuario (usermane, email, senha) VALUES ("gui_bebun", "gui@gui.com", "gui_2005"); 

