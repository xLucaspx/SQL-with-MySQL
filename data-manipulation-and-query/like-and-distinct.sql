SELECT * FROM tabela_de_clientes WHERE
	nome LIKE '%carvalho%';
    
SELECT * FROM tabela_de_produtos WHERE
	sabor LIKE '%Maçã'
    AND embalagem = 'lata';

SELECT DISTINCT sabor FROM tabela_de_produtos;

SELECT DISTINCT embalagem, tamanho FROM tabela_de_produtos;

SELECT DISTINCT
    embalagem, tamanho
FROM
    tabela_de_produtos
WHERE
    sabor = 'laranja';
    
SELECT DISTINCT
    embalagem, tamanho, sabor
FROM
    tabela_de_produtos;

SELECT DISTINCT bairro FROM tabela_de_clientes;

SELECT DISTINCT cidade FROM tabela_de_clientes
WHERE estado = 'RJ';