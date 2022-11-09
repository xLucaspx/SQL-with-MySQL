/*Na linha de comando:
- Tabela com as informações da consulta:
EXPLAIN <query>
- Lista com as informações da consulta:
EXPLAIN <query> \G
- Informações da consulta, mais completas que as acima, em formato JSON:
EXPLAIN FORMAT=JSON <query> \G
*/

-- Query cost: 4.85
SELECT nome_do_produto FROM tabela_de_produtos;

-- Query cost: 96052.85
SELECT 
    p.nome_do_produto, SUM(i.quantidade) AS quantidade 
FROM 
    tabela_de_produtos p 
        INNER JOIN 
    itens_notas_fiscais i ON p.codigo_do_produto = i.codigo_do_produto 
GROUP BY p.codigo_do_produto;

-- Query cost: 146785.69
SELECT 
    p.nome_do_produto,
    SUM(i.quantidade) AS quantidade,
    YEAR(n.data_venda) AS `ano venda`
FROM
    tabela_de_produtos p
        INNER JOIN
    itens_notas_fiscais i ON p.codigo_do_produto = i.codigo_do_produto
        INNER JOIN
    notas_fiscais n ON n.numero = i.numero
GROUP BY YEAR(n.data_venda) , p.codigo_do_produto
ORDER BY p.nome_do_produto , YEAR(n.data_venda);
