DROP PROCEDURE IF EXISTS atribui_valor;

DELIMITER $$
CREATE PROCEDURE atribui_valor ()
BEGIN
DECLARE nome, sobrenome VARCHAR (20);

SET nome = 'Pafúncio';
SET sobrenome = 'Linoleros';

SELECT nome, sobrenome;
END $$
DELIMITER ;

CALL atribui_valor();

DROP PROCEDURE IF EXISTS ex_01;

DELIMITER $$
CREATE PROCEDURE ex_01 ()
BEGIN
DECLARE cliente VARCHAR(10);
DECLARE data_nasc DATE;
DECLARE idade INTEGER;
DECLARE saldo FLOAT;

SET cliente = 'Rodorfo';
SET data_nasc = '1987-03-31';
SET idade = TIMESTAMPDIFF(YEAR, data_nasc, NOW());
SET saldo = 6742.59;

SELECT 
	cliente,
    DATE_FORMAT(data_nasc, '%d/%m/%Y') AS `data nascimento`,
    idade,
    saldo;
END $$
DELIMITER ;

CALL ex_01();