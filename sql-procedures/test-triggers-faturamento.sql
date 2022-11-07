CALL geraVendaAleatoria('2020-11-10', 12, 45);

SELECT 
	YEAR(data_venda) AS `Ano`,
	ROUND(SUM(valor_total), 2) AS `Total`
FROM faturamento
GROUP BY YEAR(data_venda);
