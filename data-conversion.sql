SELECT CURRENT_TIMESTAMP() AS result;

/*Conversão implícita: o MySQL converte a data para string para concatenar:*/
SELECT CONCAT('Data e hora atuais: ', CURRENT_TIMESTAMP()) AS result;

/*Usando date-functions:*/
SELECT CONCAT('Ano atual: ', 
	DATE_FORMAT(CURRENT_TIMESTAMP(), '%Y') -- %Y = ano com 4 dígitos
) AS result;

/*%d = dd, %m = MM, %y = yy*/
SELECT DATE_FORMAT(CURRENT_TIMESTAMP(), '%d/%m/%y') AS data_atual;

/*%W = nome dia da semana*/
SELECT DATE_FORMAT(CURRENT_TIMESTAMP(), '%W, %d/%m/%y') AS data_atual;

/*%U = semana do ano*/
SELECT DATE_FORMAT(CURRENT_TIMESTAMP(), '%W, %d/%m/%y - Semana %U') AS data_atual;

/*Convertendo número para string e realizando funções de string:*/
SELECT SUBSTRING(CONVERT(27.5 , CHAR), 3, 2) AS result;

SELECT 
    CONCAT('O cliente ',
            c.nome,
            ' comprou R$ ',
            CAST(ROUND(SUM(i.quantidade * i.preco), 2) AS CHAR (20)),
            ' em ',
            CAST(YEAR(n.data_venda) AS CHAR (20))) AS report
FROM
    notas_fiscais n
        INNER JOIN
    itens_notas_fiscais i ON n.numero = i.numero
        INNER JOIN
    tabela_de_clientes c ON n.cpf = c.cpf
GROUP BY (c.nome) , YEAR(n.data_venda)
ORDER BY YEAR(n.data_venda) , (c.nome);