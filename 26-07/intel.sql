CREATE DATABASE intel;
USE intel;

ALTER TABLE tb_funcionario ADD COLUMN genero ENUM("M","F","N");
CREATE TABLE tb_funcionario(
	id_fun CHAR(4) PRIMARY KEY NOT NULL,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    data_nascimento DATE NOT NULL,
    data_contratacao DATE NOT NULL,
    genero ENUM("M", "F", "N")
);

CREATE TABLE tb_salario(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    salario FLOAT(8) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    funcionario_id CHAR(4) NOT NULL,
    FOREIGN KEY (funcionario_id) REFERENCES tb_funcionario(id_fun)
);

CREATE TABLE tb_cargo(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    fun_id CHAR(4) NOT NULL,
    FOREIGN KEY (fun_id) REFERENCES tb_funcionario(id_fun)
);

CREATE TABLE tb_departamento(
	id CHAR(4) PRIMARY KEY NOT NULL,
    nome VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE tb_dept_fun(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    fun_id CHAR(4) NOT NULL,
    dept_id CHAR(4) NOT NULL,
    FOREIGN KEY (fun_id) REFERENCES tb_funcionario(id_fun),
    FOREIGN KEY (dept_id) REFERENCES tb_departamento(id)
);



# OPERADORES SQL - FILTRAR DADOS
-- COMPARAÇÃO (<, >, <=, >=, =)
-- BETWEEN: seleção entre os intervalos
-- LIKE: seleciona por meio de um padrão
-- IN: seleção entre um conjunto de valores

SELECT * FROM tb_funcionario WHERE sobrenome= "Costa";
SELECT * FROM tb_funcionario WHERE id_fun = "F005"; -- específico
SELECT * FROM tb_salario WHERE salario = 3000;

-- DISTINCT
SELECT DISTINCT genero FROM tb_funcionario;
SELECT DISTINCT cargo FROM tb_cargo;

#Operadores lógicos
-- AND: todas condições verdadeiras
-- OR (||): alguma das condições
-- NOT: nenhuma

#AND 
SELECT * FROM tb_salario WHERE salario >= 2000 AND salario <= 4000;
SELECT * FROM tb_salario WHERE salario >= 2000 AND salario <=4000 AND funcionario_id > 'F002';

#OR
SELECT * FROM cargo;
SELECT * FROM tb_cargo WHERE cargo= "Supervisor" OR cargo = "Estagiário"; 
 
#NOT -- INVERTE UMA CLÁUSULA
SELECT * FROM tb_cargo WHERE NOT cargo = "Estagiário" AND NOT cargo ="Gerente";

# ORDENANDO RESULTADOS
-- ORDER BY -> utiliza dois parâmetros e utilizamos o "ORDER BY" após o WHERE
-- ASC: ordem ascendente
-- DESC: ordem descendente

SELECT * FROM tb_salario ORDER BY salario DESC;

-- SELECIONAR NA TABELA CARGOS TODAS AS COLUNAS, PORÉM, COM OS CARGOS EM ORDEM DESC E ASC
SELECT * FROM tb_cargo ORDER BY cargo DESC;
SELECT * FROM tb_cargo ORDER BY cargo ASC;

#LIMITANDO RESULTADOS EM UMA CONSULTA
-- LIMIT: comando utilizado para limitar uma consulta
-- podemos unir com o WHERE

SELECT * FROM tb_cargo;
SELECT * FROM tb_funcionario WHERE id_fun ="F003";

