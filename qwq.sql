DROP DATABASE IF EXISTS aula_banco; -- se existir elimine aula_banco
CREATE DATABASE aula_banco; 		-- criar aula_banco
USE aula_banco;						-- selecionar aula_banco

/** criando a tabela pessoa **/
CREATE TABLE cliente(
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(100) NOT NULL 
,sobrenome VARCHAR(100) NOT NULL 
,telefone CHAR(15) NOT NULL 
,endereco CHAR(100) NOT NULL
,data_nascimento DATE NOT NULL 
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,CONSTRAINT pk_cliente PRIMARY KEY (id)
);

CREATE TABLE venda(
id INT NOT NULL AUTO_INCREMENT
,data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
,cliente_id int not null 
,CONSTRAINT pk_venda PRIMARY KEY (id)
,CONSTRAINT fk_venda_cliente FOREIGN KEY (cliente_id) REFERENCES cliente (id)
);

CREATE TABLE produto(
id INT NOT NULL AUTO_INCREMENT
,nome varchar(100) not null
,preco decimal(8,2) not null
,CONSTRAINT pk_produto PRIMARY KEY (id)
);

CREATE TABLE item_venda(
venda_id INT NOT NULL
,produto_id INT NOT NULL
,quantidade INT NOT NULL
,preco_unidade INT NOT NULL
,total DECIMAL(8,2) AS (quantidade * preco_unidade)
,CONSTRAINT pk_item_venda PRIMARY KEY (venda_id,produto_id)
,CONSTRAINT fk_item_venda_venda FOREIGN KEY (venda_id) REFERENCES venda (id)
,CONSTRAINT fk_item_venda_produto_id FOREIGN KEY (produto_id) REFERENCES produto (id)
);

CREATE TABLE conta_receber(
id INT NOT NULL AUTO_INCREMENT
,venda_id INT NOT NULL
,valor_total DECIMAL(8,2) NOT NULL -- total à receber
,valor_pago DECIMAL(8,2) NOT NULL 
,desconto DECIMAL(8,2) NOT NULL 
,juros DECIMAL(8,2) NOT NULL 
,CONSTRAINT pk_conta_receber PRIMARY KEY (id)
,CONSTRAINT fk_pessoa FOREIGN KEY (venda_id) REFERENCES venda (id)
);

/** inserindo pessoas **/
INSERT INTO cliente (nome,sobrenome,telefone,endereco,data_nascimento,data_cadastro,ativo) VALUES ('PAULA','SILVA','(11) 99447-3654','Rua Barbosa, 159','1976-05-06','1999-04-30','S');
INSERT INTO cliente (nome,sobrenome,telefone,endereco,data_nascimento,data_cadastro,ativo) VALUES ('RAUL','PEREIRA','(11) 99123-9852','Rua João Pessoa, 8523','1950-05-06','1980-11-04','S');
INSERT INTO cliente (nome,sobrenome,telefone,endereco,data_nascimento,data_cadastro,ativo) VALUES ('REGIANE','FERNANDES','(11) 99852-9631','Rua Getúlio Vargas, 895','2000-05-06','2019-08-26','S');
INSERT INTO cliente (nome,sobrenome,telefone,endereco,data_nascimento,data_cadastro,ativo) VALUES ('ALDO','SOUZA','(11) 99369-4512','Av. Rio Grande do Norte, 523','1996-11-12','2020-06-14','S');
INSERT INTO cliente (nome,sobrenome,telefone,endereco,data_nascimento,data_cadastro,ativo) VALUES ('PAULA','MATOS','(11) 99258-9512','Av. Pedro Afonso, 58','2001-03-01','2019-08-10','N');
INSERT INTO cliente (nome,sobrenome,telefone,endereco,data_nascimento,data_cadastro,ativo) VALUES ('SILVIA','HIPOLITO','(11) 99456-7412','Rua Miranda, 1598','1996-10-26','2022-09-14','S');

INSERT INTO produto (nome,preco) VALUES ('a',10);
INSERT INTO produto (nome,preco) VALUES ('b',20);
INSERT INTO produto (nome,preco) VALUES ('c',30);
INSERT INTO produto (nome,preco) VALUES ('d',40);
INSERT INTO produto (nome,preco) VALUES ('e',50);

INSERT INTO venda (cliente_id, data_cadastro) VALUES (1,'1999-06-02');
INSERT INTO venda (cliente_id, data_cadastro) VALUES (2,'1980-12-15');
INSERT INTO venda (cliente_id, data_cadastro) VALUES (1,'2010-05-30');
INSERT INTO venda (cliente_id, data_cadastro) VALUES (3,'2019-08-30');
INSERT INTO venda (cliente_id, data_cadastro) VALUES (4,'2022-05-30');
INSERT INTO venda (cliente_id, data_cadastro) VALUES (3,'2022-05-30');
INSERT INTO venda (cliente_id, data_cadastro) VALUES (1,'2022-05-30');

INSERT INTO item_venda (venda_id, produto_id,quantidade,preco_unidade) VALUES (1,1,5,10);
INSERT INTO item_venda (venda_id, produto_id,quantidade,preco_unidade) VALUES (1,3,2,30);
INSERT INTO item_venda (venda_id, produto_id,quantidade,preco_unidade) VALUES (1,5,1,50);
INSERT INTO item_venda (venda_id, produto_id,quantidade,preco_unidade) VALUES (2,2,2,20);
INSERT INTO item_venda (venda_id, produto_id,quantidade,preco_unidade) VALUES (2,4,2,40);
INSERT INTO item_venda (venda_id, produto_id,quantidade,preco_unidade) VALUES (3,1,5,9.5);
INSERT INTO item_venda (venda_id, produto_id,quantidade,preco_unidade) VALUES (3,3,5,30);
INSERT INTO item_venda (venda_id, produto_id,quantidade,preco_unidade) VALUES (3,2,5,20);
INSERT INTO item_venda (venda_id, produto_id,quantidade,preco_unidade) VALUES (3,4,5,40);
INSERT INTO item_venda (venda_id, produto_id,quantidade,preco_unidade) VALUES (4,1,3,25);
INSERT INTO item_venda (venda_id, produto_id,quantidade,preco_unidade) VALUES (5,3,3,29);
INSERT INTO item_venda (venda_id, produto_id,quantidade,preco_unidade) VALUES (5,5,3,50);
INSERT INTO item_venda (venda_id, produto_id,quantidade,preco_unidade) VALUES (6,5,10,42);
INSERT INTO item_venda (venda_id, produto_id,quantidade,preco_unidade) VALUES (7,1,1,10);
INSERT INTO item_venda (venda_id, produto_id,quantidade,preco_unidade) VALUES (7,2,1,20);
INSERT INTO item_venda (venda_id, produto_id,quantidade,preco_unidade) VALUES (7,3,1,30);

INSERT INTO conta_receber (venda_id,valor_total,valor_pago,desconto,juros) VALUES (1,100,70,0,0);
INSERT INTO conta_receber (venda_id,valor_total,valor_pago,desconto,juros) VALUES (2,200,180,20,0);
INSERT INTO conta_receber (venda_id,valor_total,valor_pago,desconto,juros) VALUES (2,30,33,0,3);
INSERT INTO conta_receber (venda_id,valor_total,valor_pago,desconto,juros) VALUES (2,150,0,0,0);
INSERT INTO conta_receber (venda_id,valor_total,valor_pago,desconto,juros) VALUES (1,250,50,0,3);
INSERT INTO conta_receber (venda_id,valor_total,valor_pago,desconto,juros) VALUES (2,120,108,12,0);
INSERT INTO conta_receber (venda_id,valor_total,valor_pago,desconto,juros) VALUES (1,10,10,0,0);
INSERT INTO conta_receber (venda_id,valor_total,valor_pago,desconto,juros) VALUES (1,30,70,0,0);
INSERT INTO conta_receber (venda_id,valor_total,valor_pago,desconto,juros) VALUES (1,20,70,0,0);
/*
DELIMITER // 
CREATE FUNCTION rola ()
RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
	RETURN 'ROLA';
END;

//
DELIMITER ;





DELIMITER //
CREATE FUNCTION ola2()
RETURNS varchar(51) DETERMINISTIC
BEGIN
	DECLARE oi VARCHAR(51);
    SET oi = 'EAIIIIIIIIIIIII';
    RETURN oi;
END;
//
DELIMITER ;

SELECT rola();

SELECT CONCAT(ola2()," ",rola()) AS "OLA ROLA";


DELIMITER //
CREATE FUNCTION ola(nome VARCHAR(50))
RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
	DECLARE frase VARCHAR(100) DEFAULT CONCAT('OLA ',nome);
    RETURN frase;
END;
//
DELIMITER ;

SELECT ola('jORGE ')
*/


DELIMITER //
CREATE FUNCTION se_cliente_ativo (ativo CHAR(1))
RETURNS VARCHAR(50) DETERMINISTIC 
BEGIN 
	DECLARE resultado VARCHAR (50) DEFAULT 'INATIVO';
    IF UPPER(ativo) = 'S' THEN
		SET resultado = 'ATIVO';
    END IF;
    RETURN resultado;
END;
//
DELIMITER ;

SELECT cliente.nome AS 'NOME', se_cliente_ativo(cliente.ativo) AS 'EH_ATIVO?' FROM cliente;

DROP FUNCTION IF EXISTS calcular_total_venda;
DELIMITER // 
CREATE FUNCTION calcular_total_venda(codigo_venda INT)
RETURNS DECIMAL(8,2) DETERMINISTIC
BEGIN
	DECLARE total_venda DECIMAL(8,2);
    SELECT SUM(item_venda.total) INTO total_venda
    FROM item_venda
    WHERE item_venda.venda_id = codigo_venda;
    RETURN total_venda;
END;
//
DELIMITER ;

SELECT calcular_total_venda(1);

SELECT data_cadastro, calcular_total_venda(venda.id)
FROM venda;


DROP FUNCTION IF EXISTS verificar_desconto_produto;
DELIMITER //
CREATE FUNCTION verificar_desconto_produto(codigo_venda INT,codigo_produto INT)
RETURNS BOOL DETERMINISTIC
BEGIN
	 DECLARE desconto_valido BOOL DEFAULT TRUE;
     DECLARE quantidade_vendida INT;
     DECLARE total_desconto DECIMAL(8,2);
     DECLARE LIMITE_desconto DECIMAL(8,2);
     DECLARE preco_unitario DECIMAL(8,2);
     DECLARE desconto_unidade DECIMAL(8,2);
     
     SELECT quantidade, desconto, preco_unidade INTO quantidade_vendida,total_desconto,preco_unitario
     FROM item_venda
     WHERE item_venda.venda_id = codigo_venda AND item_venda.produto_venda;
     
     SET limite_desconto =  preco_unitario / 0.5;
     SET desconto_unidade = total_desconto / quantidade_vendida; 
     IF desconto_unidade > limite_desconto THEN
		
        BEGIN
			SET desconto_valido = FALSE;
        END;
	END IF;
     RETURN desconto_valido;
     
END;
//
DELIMITER ;

SELECT verifica_desconto_produto(1,2)