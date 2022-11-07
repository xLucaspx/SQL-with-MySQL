DROP PROCEDURE IF EXISTS atualizaTabFaturamento;

DELIMITER $$
CREATE PROCEDURE atualizaTabFaturamento()
BEGIN
	DELETE FROM faturamento;
    INSERT INTO
		faturamento (data_venda, valor_total)
	(SELECT 
		n.data_venda, SUM(i.quantidade * i.preco) AS valor_total
	FROM
		notas_fiscais n
			INNER JOIN
		itens_notas_fiscais i ON n.numero = i.numero
	GROUP BY n.data_venda);
END $$
DELIMITER ;