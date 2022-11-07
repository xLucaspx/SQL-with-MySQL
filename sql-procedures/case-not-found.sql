DROP PROCEDURE IF EXISTS caseSemElse;

DELIMITER $$
CREATE PROCEDURE caseSemElse(codigoProduto VARCHAR(10))
BEGIN
	DECLARE saborProduto VARCHAR(20);
    DECLARE nomeProduto VARCHAR(50);
    DECLARE tipoSabor VARCHAR(15);
    
    DECLARE CONTINUE HANDLER FOR 1339 -- Case not found (case sem else)
		SET tipoSabor = 'Não encontrado';
    
    SELECT sabor INTO saborProduto FROM tabela_de_produtos WHERE codigo_do_produto = codigoProduto;
    SELECT nome_do_produto INTO nomeProduto FROM tabela_de_produtos WHERE codigo_do_produto = codigoProduto;
    
    CASE saborProduto
    WHEN ('Lima/Limão') THEN
		SET tipoSabor = 'Cítrico';
    WHEN ('Melancia') THEN
		SET tipoSabor = 'Doce';
	END CASE;
    
    SELECT codigoProduto AS `Código`,
		nomeProduto AS `Nome - Tamanho - Sabor`,
        tipoSabor AS `Tipo`;
END $$
DELIMITER ;

SELECT DISTINCT CODIGO_DO_PRODUTO FROM tabela_de_produtos;

CALL caseSemElse('1101035');