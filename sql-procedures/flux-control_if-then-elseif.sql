DROP PROCEDURE IF EXISTS retornaStatusPreco;

DELIMITER $$
CREATE PROCEDURE retornaStatusPreco (codigoProduto VARCHAR(10))
BEGIN
	DECLARE nome VARCHAR(50);
	DECLARE preco FLOAT;
    DECLARE resultado VARCHAR(15);
    
    SELECT nome_do_produto INTO nome FROM tabela_de_produtos WHERE codigo_do_produto = codigoProduto;
    SELECT preco_de_lista INTO preco FROM tabela_de_produtos WHERE codigo_do_produto = codigoProduto;
    
    IF preco < 7 THEN
		SET resultado = 'Barato';
	ELSEIF preco < 12 THEN
		SET resultado = 'Médio';
	ELSEIF preco IS NULL THEN
		SET resultado = 'Não cadastrado';
	ELSE
		SET resultado = 'Caro';
	END IF;
    
    SELECT codigoProduto,
    nome,
    CONCAT('R$ ', ROUND(preco, 2)) AS preco,
    resultado AS `status`;
END $$
DELIMITER ;

CALL retornaStatusPreco('1000889');

DROP PROCEDURE IF EXISTS comparaVendas;

DELIMITER $$
CREATE PROCEDURE comparaVendas(dataVenda1 DATE, dataVenda2 DATE)
BEGIN
	DECLARE valor1 FLOAT;
    DECLARE valor2 FLOAT;
    DECLARE diferenca FLOAT;
    DECLARE resultado VARCHAR(10);
    
    SELECT SUM(I.quantidade * I.preco) INTO valor1 FROM 
    notas_fiscais N INNER JOIN itens_notas_fiscais I
    ON N.numero = I.numero WHERE N.data_venda = dataVenda1;
    
    SELECT SUM(I.quantidade * I.preco) INTO valor2 FROM
    notas_fiscais N INNER JOIN itens_notas_fiscais I
    ON N.numero = I.numero WHERE N.data_venda = dataVenda2;
    
    -- Calculando variação percentual das vendas:
    SET diferenca = ((valor1 / valor2) - 1) * 100;
    
    IF diferenca >= 10 THEN
		SET resultado = 'Verde';
	ELSEIF diferenca <= -10 THEN
		SET resultado = 'Vermelho';
	ELSE
		SET resultado = 'Amarelo';
    END IF;
    
    SELECT valor1 AS `Valor 1`,
    valor2 AS `Valor 2`,
    ROUND(diferenca, 2) AS `Diferença(%)`,
    resultado AS `Status`;
END $$
DELIMITER ;

CALL comparaVendas('2016-12-01', '2017-12-01');