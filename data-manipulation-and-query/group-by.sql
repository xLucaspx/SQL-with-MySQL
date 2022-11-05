SELECT estado, 
	SUM(limite_de_credito) AS `Limite Total`
FROM tabela_de_clientes 
GROUP BY estado; 

SELECT estado,
	AVG(idade) AS `Idade Média`
FROM tabela_de_clientes
GROUP BY estado;

SELECT sabor,
	MAX(preco_de_lista) AS `Maior Preço`
FROM tabela_de_produtos
GROUP BY sabor
ORDER BY sabor;

SELECT embalagem, tamanho,
	MAX(preco_de_lista) AS `Maior Preço`
FROM tabela_de_produtos
GROUP BY tamanho, embalagem
ORDER BY embalagem ASC, tamanho DESC;

SELECT embalagem,
	COUNT(*) as Quantidade
FROM tabela_de_produtos
GROUP BY embalagem;

SELECT bairro,
	SUM(limite_de_credito) as Limite
FROM tabela_de_clientes
WHERE cidade = 'Rio de Janeiro'
GROUP BY bairro
ORDER BY Limite;

SELECT estado, bairro,
	MIN(limite_de_credito) as `Limite Mínimo`
FROM tabela_de_clientes
GROUP BY estado, bairro
ORDER BY estado, `Limite Mínimo`;