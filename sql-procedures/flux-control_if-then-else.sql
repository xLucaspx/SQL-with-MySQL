DROP PROCEDURE IF EXISTS retornaJovemOuVelho;

DELIMITER $$
CREATE PROCEDURE retornaJovemOuVelho (cpfCliente VARCHAR(11))
BEGIN
	DECLARE nomeCliente VARCHAR(100);
    DECLARE dataNascimento DATE;
	DECLARE resultado VARCHAR(5);
    
    SELECT nome INTO nomeCliente FROM tabela_de_clientes WHERE cpf = cpfCliente;
    SELECT data_de_nascimento INTO dataNascimento FROM tabela_de_clientes WHERE cpf = cpfCliente;
    
    IF YEAR(dataNascimento) < 2000 THEN
		SET resultado = 'Velho';
	ELSE
		SET resultado = 'Jovem';
	END IF;
    
    SELECT nomeCliente, resultado;
END $$
DELIMITER ;

CALL retornaJovemOuVelho('19290992743');

DROP PROCEDURE IF EXISTS calculaNumeroDeNotas;

DELIMITER $$
CREATE PROCEDURE calculaNumeroDeNotas (dataNotas DATE)
BEGIN
	DECLARE numeroNotas INT;
    DECLARE resultado VARCHAR(15);
    
    SELECT COUNT(*) INTO numeroNotas FROM notas_fiscais WHERE data_venda = dataNotas;
    
    IF numeroNotas > 70 THEN
		SET resultado = 'Muitas notas';
	ELSE
		SET resultado = 'Poucas notas';
	END IF;
    
    SELECT numeroNotas, resultado;
END $$
DELIMITER ;

CALL calculaNumeroDeNotas('2016-08-25');
