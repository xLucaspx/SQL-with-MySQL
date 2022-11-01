CREATE OR REPLACE VIEW `vw_maior_preco_embalagens` AS
    SELECT 
        embalagem, MAX(preco_de_lista) AS preco_maximo
    FROM
        tabela_de_produtos
    GROUP BY embalagem;
    
SELECT 
	x.embalagem, x.preco_maximo
FROM vw_maior_preco_embalagens x
WHERE x.preco_maximo > 10;

SELECT 
	p.nome_do_produto, p.sabor, p.preco_de_lista, v.embalagem, v.preco_maximo
FROM tabela_de_produtos p INNER JOIN vw_maior_preco_embalagens v
ON p.embalagem = v.embalagem
ORDER BY sabor, tamanho;

/*Quantos % o produto é mais barato que o preço máximo por embalagem:*/
SELECT 
    p.nome_do_produto,
    p.tamanho,
    v.embalagem,
    p.preco_de_lista,
    v.preco_maximo,
    ((preco_de_lista / preco_maximo) -1) * 100 AS percentual
FROM
    tabela_de_produtos p
        INNER JOIN
    vw_maior_preco_embalagens v ON p.embalagem = v.embalagem
ORDER BY sabor , tamanho;