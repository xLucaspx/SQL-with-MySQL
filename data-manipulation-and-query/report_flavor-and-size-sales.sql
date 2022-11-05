/*Pegando total de vendas por sabor:*/
SELECT 
    p.sabor,
    YEAR(nf.data_venda) AS ano,
    SUM(i.quantidade) AS total_vendas
FROM
    tabela_de_produtos p
        INNER JOIN
    itens_notas_fiscais i ON p.codigo_do_produto = i.codigo_do_produto
        INNER JOIN
    notas_fiscais nf ON nf.numero = i.numero
GROUP BY sabor , ano;
    
/*Pegando total de vendas por sabor em determinado ano:*/
SELECT 
    p.sabor,
    YEAR(nf.data_venda) AS ano,
    SUM(i.quantidade) AS total_vendas
FROM
    tabela_de_produtos p
        INNER JOIN
    itens_notas_fiscais i ON p.codigo_do_produto = i.codigo_do_produto
        INNER JOIN
    notas_fiscais nf ON nf.numero = i.numero
WHERE
    YEAR(nf.data_venda) = 2016
GROUP BY sabor , ano
ORDER BY total_vendas DESC;

/*Pegando total de vendas de um determinado ano*/
SELECT 
    YEAR(nf.data_venda) AS ano,
    SUM(i.quantidade) AS total_vendas
FROM
    itens_notas_fiscais i
        INNER JOIN
    notas_fiscais nf ON nf.numero = i.numero
WHERE
    YEAR(nf.data_venda) = 2016
GROUP BY ano;

/*Pegando porcentagem de vendas por sabor em um determinado ano*/
SELECT 
    venda_sabor.sabor,
    venda_total.ano,
    venda_sabor.total_sabor,
    ROUND((venda_sabor.total_sabor / venda_total.total_vendas) * 100,
            2) AS porcentagem
FROM
    (SELECT 
        p.sabor,
            YEAR(nf.data_venda) AS ano,
            SUM(i.quantidade) AS total_sabor
    FROM
        tabela_de_produtos p
    INNER JOIN itens_notas_fiscais i ON p.codigo_do_produto = i.codigo_do_produto
    INNER JOIN notas_fiscais nf ON nf.numero = i.numero
    WHERE
        YEAR(nf.data_venda) = 2016
    GROUP BY sabor , ano) AS venda_sabor
        INNER JOIN
    (SELECT 
        YEAR(nf.data_venda) AS ano,
            SUM(i.quantidade) AS total_vendas
    FROM
        itens_notas_fiscais i
    INNER JOIN notas_fiscais nf ON nf.numero = i.numero
    WHERE
        YEAR(nf.data_venda) = 2016
    GROUP BY ano) AS venda_total ON venda_sabor.ano = venda_total.ano
    ORDER BY porcentagem DESC;
    
/*Pegando porcentagem de vendas por tamanho*/
SELECT 
    venda_tamanho.tamanho,
    venda_total.ano,
    venda_tamanho.total_tamanho,
    ROUND((venda_tamanho.total_tamanho / venda_total.total_vendas) * 100,
            2) AS participacao
FROM
    (SELECT 
        p.tamanho,
            YEAR(nf.data_venda) AS ano,
            SUM(i.quantidade) AS total_tamanho
    FROM
        tabela_de_produtos p
    INNER JOIN itens_notas_fiscais i ON p.codigo_do_produto = i.codigo_do_produto
    INNER JOIN notas_fiscais nf ON nf.numero = i.numero
    GROUP BY tamanho, ano) AS venda_tamanho
        INNER JOIN
    (SELECT 
        YEAR(nf.data_venda) AS ano,
            SUM(i.quantidade) AS total_vendas
    FROM
        itens_notas_fiscais i
    INNER JOIN notas_fiscais nf ON nf.numero = i.numero
    GROUP BY ano) AS venda_total ON venda_tamanho.ano = venda_total.ano
    WHERE venda_tamanho.ano = 2016
    ORDER BY venda_tamanho.ano, participacao DESC;