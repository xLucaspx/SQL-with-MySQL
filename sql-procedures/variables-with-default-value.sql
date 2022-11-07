DROP procedure IF EXISTS mesmo_tipo;

/*Default abrange todas as variáveis na mesma linha:*/
DELIMITER $$
CREATE PROCEDURE mesmo_tipo ()
BEGIN
DECLARE nome, sobrenome VARCHAR(15) DEFAULT 'Hello world!';
SELECT nome, sobrenome;
END $$
DELIMITER ;

CALL mesmo_tipo();

DROP procedure IF EXISTS data_types;

DELIMITER $$
CREATE PROCEDURE data_types ()
BEGIN
DECLARE texto VARCHAR(15) DEFAULT 'string';
DECLARE inteiro INTEGER DEFAULT 123;
DECLARE quebrado DECIMAL(6, 2) DEFAULT 13.52;
DECLARE data_nasc DATE DEFAULT '2000-02-29';
DECLARE agora TIMESTAMP DEFAULT NOW();

SELECT
	texto, inteiro, quebrado, DATE_FORMAT(data_nasc, '%d/%m/%Y') AS `data`, agora;
END $$
DELIMITER ;

CALL data_types();