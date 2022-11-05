SELECT COUNT(*) FROM tabela_de_clientes;
SELECT cpf, COUNT(*) as compras FROM notas_fiscais GROUP BY cpf;

/*Mostra como NULL o cpf de quem não tem compras:*/
SELECT DISTINCT
    cli.nome, nota.cpf
FROM
    tabela_de_clientes cli
        LEFT JOIN
    notas_fiscais nota ON cli.cpf = nota.cpf;
    
/*Mesma coisa, mas com RIGHT JOIN:*/
SELECT DISTINCT
    cli.nome, nota.cpf
FROM
    notas_fiscais nota
        RIGHT JOIN
    tabela_de_clientes cli ON cli.cpf = nota.cpf;

/*Mostra a quantidade de compras de cada cliente*/  
SELECT 
    cli.nome, cli.cpf, COUNT(nota.cpf) AS compras
FROM
    tabela_de_clientes cli
        LEFT JOIN
    notas_fiscais nota ON cli.cpf = nota.cpf
GROUP BY nota.cpf
ORDER BY compras DESC;

/*Para filtrar clientes que nunca compraram podemos utilizar:*/
SELECT DISTINCT
    cli.nome, nota.cpf
FROM
    tabela_de_clientes cli
        LEFT JOIN
    notas_fiscais nota ON cli.cpf = nota.cpf
WHERE
    nota.cpf IS NULL;
    
/*Ou:*/
SELECT 
    cli.nome, cli.cpf, COUNT(nota.cpf) AS compras
FROM
    tabela_de_clientes cli
        LEFT JOIN
    notas_fiscais nota ON cli.cpf = nota.cpf
GROUP BY nota.cpf
HAVING compras <= 0
ORDER BY compras DESC;

SELECT 
    cli.nome, cli.cpf, COUNT(nota.cpf) AS compras
FROM
    tabela_de_clientes cli
        LEFT JOIN
    notas_fiscais nota ON cli.cpf = nota.cpf
WHERE
    YEAR(nota.data_venda) = 2016
GROUP BY nota.cpf
HAVING compras < 2000
ORDER BY compras DESC;