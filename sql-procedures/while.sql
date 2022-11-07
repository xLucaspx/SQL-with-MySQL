-- CREATE TABLE tab_loop (id INT);

DROP PROCEDURE IF EXISTS loop_while;

DELIMITER $$
CREATE PROCEDURE loop_while (numInicial INT, numFinal INT)
BEGIN
	DECLARE i INT;
    SET i = numInicial;
    
    DELETE FROM tab_loop;
    
    WHILE i <= numFinal DO
		INSERT INTO tab_loop (id) VALUES (i);
		SET i = i + 1;
	END WHILE;
    
    SELECT * FROM tab_loop;
END $$
DELIMITER ;

CALL loop_while(1, 10);

DROP PROCEDURE IF EXISTS somaDiasVendas;

DELIMITER $$
CREATE PROCEDURE somaDiasVendas (dataInicio DATE, dataFinal DATE)
BEGIN
	DECLARE dataInicial DATE;
    DECLARE contador, notas INTEGER;
    SET dataInicial = dataInicio;
    SET notas = 0;
    
    WHILE dataInicial <= dataFinal DO
		SELECT COUNT(*) INTO contador FROM notas_fiscais WHERE data_venda = dataInicial;
        IF contador > 0 THEN
			SET notas = notas + contador;
		END IF;
        SELECT ADDDATE(dataInicial, INTERVAL 1 DAY) INTO dataInicial;
	END WHILE;
    
    SELECT notas AS vendas,
		 DATE_FORMAT(dataInicio, '%d/%m/%Y') AS `data inicial`,
		 DATE_FORMAT(dataFinal, '%d/%m/%Y') AS `data final`,
         CONCAT(DATEDIFF(dataFinal, dataInicio), ' dias') AS periodo;
END $$
DELIMITER ;

CALL somaDiasVendas ('2016-03-31', '2016-07-01');