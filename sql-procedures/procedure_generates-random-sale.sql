DROP PROCEDURE IF EXISTS geraVendaAleatoria;

DELIMITER $$
CREATE PROCEDURE geraVendaAleatoria(dataVenda DATE, maxItens INT, maxQuantidade INT)
BEGIN
	DECLARE cpfCliente VARCHAR(11);
    DECLARE	matriculaVendedor VARCHAR(5);
    DECLARE codigoProduto VARCHAR(10);
    DECLARE preco FLOAT;
    DECLARE totalItens, quantidade, numeroNota, itemAdicionado INT;
    DECLARE i INT DEFAULT 0;
    
    SELECT (MAX(numero) + 1) INTO numeroNota FROM notas_fiscais; -- Pegando número da nota
    SET cpfCliente = retornaCpfClienteAleatorio(); -- Pegando CPF do cliente
    SET matriculaVendedor = retornaMatriculaVendedorAleatorio(); -- Pegando matricula vendedor
    
    INSERT INTO notas_fiscais -- Criando nota fiscal
		(cpf, matricula, data_venda, numero, imposto) 
	VALUES
		(cpfCliente, matriculaVendedor, dataVenda, numeroNota, 0.12);
        
	SET totalItens = retornaNumeroAleatorio(1, maxItens); -- Pegando número de itens na nota
    
    WHILE i < totalItens DO
		SET codigoProduto = retornaCodigoProdutoAleatorio(); -- Pegando código do produto
        
        SELECT COUNT(*) INTO itemAdicionado -- Verificando se o item já foi adicionado na nota
        FROM itens_notas_fiscais WHERE numero = numeroNota AND codigo_do_produto = codigoProduto;
        
        IF itemAdicionado = 0 THEN -- Se o item ainda não foi adicionado na nota
			SET quantidade = retornaNumeroAleatorio(1, maxQuantidade); -- Pegando quantidade do produto
			SELECT preco_de_lista INTO preco -- Pegando preco do produto
			FROM tabela_de_produtos WHERE codigo_do_produto = codigoProduto; 
			
			INSERT INTO itens_notas_fiscais -- Inserindo item da nota
				(numero, codigo_do_produto, quantidade, preco)
			VALUES
				(numeroNota, codigoProduto, quantidade, preco);
		END IF;
        
        SET i = i + 1;
	END WHILE;   
END $$
DELIMITER ;

CALL geraVendaAleatoria('2020-11-08', 12, 15); 

SELECT * FROM notas_fiscais WHERE YEAR(data_venda) = 2020;
SELECT * FROM itens_notas_fiscais WHERE numero = 87978;

SELECT 
    n.numero AS `Número da nota`,
    COUNT(*) AS `Quantidade de itens`,
    ROUND(SUM(i.quantidade * i.preco), 2) AS `Valor da nota`
FROM
    notas_fiscais n
        INNER JOIN
    itens_notas_fiscais i ON n.numero = i.numero
WHERE
    YEAR(data_venda) = 2020
GROUP BY n.numero;