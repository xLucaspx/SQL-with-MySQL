DROP FUNCTION IF EXISTS funcTipoSabor;

DELIMITER $$
CREATE FUNCTION funcTipoSabor (sabor VARCHAR(20))
RETURNS VARCHAR(20)
BEGIN
	DECLARE tipoSabor VARCHAR(20) DEFAULT 'Não encontrado';
    
    IF (sabor LIKE '%limão%') OR (sabor LIKE '%laranja%') OR (sabor LIKE '%tangerina%') THEN
		SET tipoSabor = 'Cítrico';
	ELSEIF (sabor LIKE '%uva%') OR (sabor LIKE '%açaí%') OR (sabor LIKE '%cereja%') OR (sabor LIKE '%melancia%') THEN
		SET tipoSabor = 'Doce';
	ELSEIF (sabor LIKE '%manga%') OR (sabor LIKE '%melão%') OR (sabor LIKE '%maracujá%') OR (sabor LIKE '%maçã%')  OR (sabor LIKE '%morango%') THEN
		SET tipoSabor = 'Neutro';
	END IF;
    
    RETURN tipoSabor;
END$$
DELIMITER ;

SELECT funcTipoSabor('maracuja') AS tipoSabor;

SELECT 
    nome_do_produto, sabor, FUNCTIPOSABOR(sabor) AS tipoSabor
FROM
    tabela_de_produtos;
    
DROP FUNCTION IF EXISTS calculaQuantidadeNotas;

DELIMITER $$
CREATE FUNCTION calculaQuantidadeNotas (ano INT)
RETURNS INT
BEGIN
	DECLARE notas INT;
    
    SELECT COUNT(*) INTO notas FROM notas_fiscais WHERE YEAR(data_venda) = ano;
    
    RETURN notas;
END $$
DELIMITER ;

SELECT ano, calculaQuantidadeNotas(ano) AS notas
FROM (SELECT DISTINCT YEAR(data_venda) AS ano FROM notas_fiscais) notas;