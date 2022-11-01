SELECT sabor, tamanho,
	CASE 
		WHEN preco_de_lista <= 7 THEN 'Barato'
        WHEN preco_de_lista > 7 AND preco_de_lista <= 15 THEN 'Médio'
        WHEN preco_de_lista > 15 THEN 'Caro'
	END AS categoria_preco
FROM tabela_de_produtos
ORDER BY PRECO_DE_LISTA;
        
SELECT nome_do_produto, preco_de_lista,
	CASE 
		WHEN preco_de_lista >= 12 THEN 'Caro'
        WHEN preco_de_lista >= 7 AND preco_de_lista < 12 THEN 'Médio'
        ELSE 'Barato'
	END AS categoria_preco
FROM tabela_de_produtos
ORDER BY sabor;

SELECT nome_do_produto, embalagem,
	CASE 
		WHEN AVG(preco_de_lista) >= 15 THEN 'Caro'
        WHEN AVG(preco_de_lista) >= 8 AND AVG(preco_de_lista) < 15 THEN 'Médio'
        ELSE 'Barato'
	END AS categoria_preco,
    AVG(preco_de_lista) AS preco_medio
FROM tabela_de_produtos
GROUP BY nome_do_produto
ORDER BY sabor;

SELECT embalagem,
	CASE 
		WHEN preco_de_lista >= 15 THEN 'Caro'
        WHEN preco_de_lista >= 8 AND preco_de_lista < 15 THEN 'Médio'
        ELSE 'Barato'
	END AS categoria_preco,
    AVG(preco_de_lista) AS preco_medio
FROM tabela_de_produtos
WHERE sabor = 'melancia'
GROUP BY embalagem, 
	CASE 
		WHEN preco_de_lista >= 15 THEN 'Caro'
        WHEN preco_de_lista >= 8 AND preco_de_lista < 15 THEN 'Médio'
        ELSE 'Barato'
	END
ORDER BY embalagem, preco_medio;

SELECT sabor, embalagem,
	CASE 
		WHEN preco_de_lista >= 15 THEN 'Caro'
        WHEN preco_de_lista >= 8 AND preco_de_lista < 15 THEN 'Médio'
        ELSE 'Barato'
	END AS categoria_preco,
    AVG(preco_de_lista) AS preco_medio
FROM tabela_de_produtos
GROUP BY sabor, embalagem,
	CASE 
		WHEN preco_de_lista >= 15 THEN 'Caro'
        WHEN preco_de_lista >= 8 AND preco_de_lista < 15 THEN 'Médio'
        ELSE 'Barato'
	END
ORDER BY sabor, preco_medio;

SELECT nome,
	YEAR(data_de_nascimento) as ano_nascimento,
    CASE
		WHEN YEAR(data_de_nascimento) < 1990 THEN 'Velho'
        WHEN YEAR(data_de_nascimento) >= 1990 AND YEAR(data_de_nascimento) < 2000  THEN 'Adulto'
		WHEN YEAR(data_de_nascimento) >= 2000  THEN 'Jovem'
	END AS classificacao_etaria
FROM tabela_de_clientes
ORDER BY nome;