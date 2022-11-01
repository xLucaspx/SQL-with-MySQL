SELECT estado,
	SUM(limite_de_credito) AS limite_total
FROM tabela_de_clientes
GROUP BY estado
HAVING limite_total > 900000;

SELECT embalagem,
	MAX(preco_de_lista) AS preco_max,
	MIN(preco_de_lista) AS preco_min
FROM tabela_de_produtos
GROUP BY embalagem
HAVING SUM(preco_de_lista) <= 80;

SELECT embalagem,
	AVG(preco_de_lista) AS preco_medio
FROM tabela_de_produtos
WHERE embalagem <> 'pet'
GROUP BY embalagem
HAVING MAX(preco_de_lista) < 40 AND preco_medio > 4;

SELECT cpf,
	COUNT(*) AS total_compras
FROM notas_fiscais
WHERE YEAR(data_venda) = 2016
GROUP BY cpf
having total_compras >= 2000;
