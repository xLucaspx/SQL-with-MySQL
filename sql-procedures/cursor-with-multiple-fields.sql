DROP PROCEDURE IF EXISTS retornaEndereco;

DELIMITER $$
CREATE PROCEDURE retornaEndereco()
BEGIN
	DECLARE fimCursor INT DEFAULT 0;
	DECLARE cNome VARCHAR (100);
    DECLARE cCep VARCHAR(8);
    DECLARE cEndereco VARCHAR(150);
    DECLARE cBairro, cCidade VARCHAR(50);
    DECLARE cEstado VARCHAR(2);
    DECLARE cValores CURSOR FOR SELECT nome, cep, endereco_1, bairro, cidade, estado FROM tabela_de_clientes;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET fimCursor = 1;
	
    OPEN cValores;
		WHILE fimCursor = 0 DO
			FETCH cValores INTO cNome, cCep, cEndereco, cBairro, cCidade, cEstado;
            IF fimCursor = 0 THEN
				SELECT cNome AS `Nome`,
					cCep AS `CEP`,
					CONCAT(cEndereco, ', ', cBairro, ', ', cCidade, ' - ', cEstado) AS `Endereço`;
            END IF;
        END WHILE;
	CLOSE cValores;
END $$
DELIMITER ;

CALL retornaEndereco();

DROP PROCEDURE IF EXISTS calculaFaturamento;

DELIMITER $$
CREATE PROCEDURE calculaFaturamento(ano INT, mes INT)
BEGIN
	DECLARE fimCursor, quantidade INT DEFAULT 0;
    DECLARE preco, total FLOAT DEFAULT 0.0;
    DECLARE valores CURSOR FOR 
		SELECT i.quantidade, i.preco FROM itens_notas_fiscais i
			INNER JOIN
		notas_fiscais n ON i.numero = n.numero
        WHERE YEAR(n.data_venda) = ano AND MONTH(n.data_venda) = mes;
        
	DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET fimCursor = 1;
    
    OPEN valores;
		WHILE fimCursor = 0 DO
			FETCH valores INTO quantidade, preco;
			
			IF fimCursor = 0 THEN
				SET total = ROUND(total + (quantidade * preco), 2);
			END IF;
		END WHILE;
    CLOSE valores;
	
    SELECT CONCAT(mes, '/', ano) AS `Período`,
		total AS `Faturamento`;
END $$
DELIMITER ;

CALL calculaFaturamento(2016, 12);