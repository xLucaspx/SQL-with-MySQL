DROP PROCEDURE IF EXISTS testeCursor;

DELIMITER $$
CREATE PROCEDURE testeCursor()
BEGIN
	DECLARE nomeCliente VARCHAR(50);
    DECLARE i INT DEFAULT 0;
    DECLARE cursorClientes CURSOR FOR SELECT nome FROM tabela_de_clientes LIMIT 5;
    
    OPEN cursorClientes;
		WHILE i < 5 DO
			FETCH cursorClientes INTO nomeCliente;
            SELECT nomeCliente;
            SET i = i + 1;
		END WHILE;
	CLOSE cursorClientes;
END $$
DELIMITER ;

CALL testeCursor();

DROP PROCEDURE IF EXISTS testeCursor2;

DELIMITER $$
CREATE PROCEDURE testeCursor2()
BEGIN
	DECLARE nomeCliente VARCHAR(50);
    DECLARE fimCursor INT DEFAULT 0;
    DECLARE cursorClientes CURSOR FOR SELECT nome FROM tabela_de_clientes;
    -- Quando não houver mais elementos tratamos o erro e encontramos o fim do CURSOR:
    DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET fimCursor = 1;
    
    OPEN cursorClientes;
		WHILE fimCursor = 0 DO
			FETCH cursorClientes INTO nomeCliente;
			IF fimCursor = 0 THEN -- Para não repetir a última linha
				SELECT nomeCliente;
			END IF;
		END WHILE;
	CLOSE cursorClientes;
END $$
DELIMITER ;

CALL testeCursor2();

DROP PROCEDURE IF EXISTS somaLimiteCredito;

DELIMITER $$
CREATE PROCEDURE somaLimiteCredito()
BEGIN
	DECLARE limiteCliente, limiteTotal FLOAT DEFAULT 0;
    DECLARE fimCursor INT DEFAULT 0;
    DECLARE cValores CURSOR FOR SELECT limite_de_credito FROM tabela_de_clientes;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET fimCursor = 1;
        
	OPEN cValores;
		WHILE fimCursor = 0 DO
			FETCH cValores INTO limiteCliente;
            IF fimCursor = 0 THEN
				SET limiteTotal = limiteTotal + limiteCliente;
            END IF;
        END WHILE;
    CLOSE cValores;
    
    SELECT limiteTotal;
END $$
DELIMITER ;

CALL somaLimiteCredito();