DROP PROCEDURE IF EXISTS retornaTipoSabor;

DELIMITER $$
CREATE PROCEDURE retornaTipoSabor(codigoProduto VARCHAR(10))
BEGIN
	DECLARE saborProduto VARCHAR(20);
    DECLARE nomeProduto VARCHAR(50);
    DECLARE tipoSabor VARCHAR(10);
    
    SELECT sabor INTO saborProduto FROM tabela_de_produtos WHERE codigo_do_produto = codigoProduto;
    SELECT nome_do_produto INTO nomeProduto FROM tabela_de_produtos WHERE codigo_do_produto = codigoProduto;
    
    CASE saborProduto
    WHEN ('Lima/Limão') THEN
		SET tipoSabor = 'Cítrico';
    WHEN ('Laranja') THEN
		SET tipoSabor = 'Cítrico';
    WHEN ('Morango/Limão') THEN
		SET tipoSabor = 'Cítrico';
    WHEN ('Tangerina') THEN
		SET tipoSabor = 'Cítrico';
    WHEN ('Uva') THEN
		SET tipoSabor = 'Doce';
    WHEN ('Cereja/Maçã') THEN
		SET tipoSabor = 'Doce';
    WHEN ('Melancia') THEN
		SET tipoSabor = 'Doce';
    WHEN ('Açaí') THEN
		SET tipoSabor = 'Doce';
	ELSE 
		SET tipoSabor = 'Neutro';
	END CASE;
    
    SELECT codigoProduto AS `Código`,
		nomeProduto AS `Nome - Tamanho - Sabor`,
        tipoSabor AS `Tipo`;
END $$
DELIMITER ;

SELECT DISTINCT CODIGO_DO_PRODUTO FROM tabela_de_produtos;

CALL retornaTipoSabor('1101035');