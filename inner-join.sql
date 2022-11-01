SELECT * FROM notas_fiscais notas
INNER JOIN tabela_de_vendedores vend
ON vend.matricula = notas.matricula
ORDER BY data_venda;

SELECT 
    vend.matricula, vend.nome, COUNT(*) AS vendas
FROM
    tabela_de_vendedores vend
        INNER JOIN
    notas_fiscais nota ON vend.matricula = nota.matricula
GROUP BY vend.matricula , vend.nome
ORDER BY vendas;
    
/*Forma mais antiga:*/
SELECT 
    vend.matricula, vend.nome, COUNT(*) AS vendas
FROM
    tabela_de_vendedores vend,
    notas_fiscais nota
WHERE
    vend.matricula = nota.matricula
GROUP BY vend.matricula , vend.nome
ORDER BY vendas;

SELECT 
    YEAR(data_venda) AS ano,
    SUM(quantidade * preco) AS faturamento
FROM
    notas_fiscais nf
        INNER JOIN
    itens_notas_fiscais itens ON nf.numero = itens.numero
GROUP BY ano
ORDER BY ano;