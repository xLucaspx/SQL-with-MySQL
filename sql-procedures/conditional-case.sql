DROP PROCEDURE IF EXISTS caseStatusPreco;

DELIMITER $$
CREATE PROCEDURE caseStatusPreco (codigoProduto VARCHAR(10))
BEGIN
	DECLARE nome VARCHAR(50);
	DECLARE preco FLOAT;
    DECLARE resultado VARCHAR(15);
    
    SELECT nome_do_produto INTO nome FROM tabela_de_produtos WHERE codigo_do_produto = codigoProduto;
    SELECT preco_de_lista INTO preco FROM tabela_de_produtos WHERE codigo_do_produto = codigoProduto;
    
    CASE -- CAse condicional: sem parâmetro
    WHEN preco < 7 THEN
		SET resultado = 'Barato';
	WHEN preco >= 7 AND preco < 12 THEN
		SET resultado = 'Médio';
	WHEN preco >= 12 THEN
		SET resultado = 'Caro';
	ELSE
		SET resultado = 'Não cadastrado';
	END CASE;
    
    SELECT codigoProduto,
    nome,
    CONCAT('R$ ', ROUND(preco, 2)) AS preco,
    resultado AS `status`;
END $$
DELIMITER ;

CALL caseStatusPreco('773912');

DROP PROCEDURE IF EXISTS caseComparaVendas;

DELIMITER $$
CREATE PROCEDURE caseComparaVendas(dataVenda1 DATE, dataVenda2 DATE)
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
    
    CASE
    WHEN diferenca >= 10 THEN
		SET resultado = 'Verde';
	WHEN diferenca <= -10 THEN
		SET resultado = 'Vermelho';
	WHEN diferenca IS NULL THEN
		SET resultado = 'Sem vendas';
	ELSE
		SET resultado = 'Amarelo';
    END CASE;
    
    SELECT valor1 AS `Valor 1`,
    valor2 AS `Valor 2`,
    ROUND(diferenca, 2) AS `Diferença(%)`,
    resultado AS `Status`;
END $$
DELIMITER ;

CALL caseComparaVendas('2016-01-15', '2017-01-15');
