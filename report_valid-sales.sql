/*Pegando informações de notas fiscais:*/
SELECT * FROM itens_notas_fiscais;
SELECT * FROM notas_fiscais;

SELECT * FROM notas_fiscais nf
INNER JOIN itens_notas_fiscais i ON nf.numero = i.numero;

SELECT 
    nf.cpf, nf.data_venda, i.quantidade
FROM
    notas_fiscais nf
        INNER JOIN
    itens_notas_fiscais i ON nf.numero = i.numero;

SELECT 
    nf.cpf,
    DATE_FORMAT(nf.data_venda, '%m-%Y') AS data_venda,
    i.quantidade
FROM
    notas_fiscais nf
        INNER JOIN
    itens_notas_fiscais i ON nf.numero = i.numero;

/*Consultando compras mensais dos clientes:*/
SELECT 
    nf.cpf,
    DATE_FORMAT(nf.data_venda, '%m-%Y') AS data_venda,
    SUM(i.quantidade) AS total_vendas
FROM
    notas_fiscais nf
        INNER JOIN
    itens_notas_fiscais i ON nf.numero = i.numero
GROUP BY nf.cpf , DATE_FORMAT(nf.data_venda, '%Y-%m');

/*Pegando limite de compra por cliente*/
SELECT * FROM tabela_de_clientes c;

SELECT 
    c.cpf, c.nome, c.volume_de_compra AS limite_compra
FROM
    tabela_de_clientes c;

SELECT 
    nf.cpf,
    c.nome,
	DATE_FORMAT(nf.data_venda, '%m-%Y') AS data_venda,
    SUM(i.quantidade) AS total_vendas,
    MAX(c.volume_de_compra) AS limite_compra
FROM
    notas_fiscais nf
        INNER JOIN
    itens_notas_fiscais i ON nf.numero = i.numero
        INNER JOIN
    tabela_de_clientes c ON c. cpf = nf.cpf
GROUP BY nf.cpf, c.nome, DATE_FORMAT(nf.data_venda, '%Y-%m');

/*Mostrando compras acima do limite como inválidas*/
SELECT 
    t.cpf,
    t.nome,
    t.data_venda,
    t.total_vendas,
    t.limite_compra,
	CASE
        WHEN (t.limite_compra - t.total_vendas) < 0 THEN 'Inválida'
        ELSE 'Válida'
    END AS `status`
FROM
    (SELECT 
    nf.cpf,
    c.nome,
	DATE_FORMAT(nf.data_venda, '%m-%Y') AS data_venda,
    SUM(i.quantidade) AS total_vendas,
    MAX(c.volume_de_compra) AS limite_compra
FROM
    notas_fiscais nf
        INNER JOIN
    itens_notas_fiscais i ON nf.numero = i.numero
        INNER JOIN
    tabela_de_clientes c ON c. cpf = nf.cpf
GROUP BY nf.cpf, c.nome, DATE_FORMAT(nf.data_venda, '%Y-%m')) t;

/*Mostrando apenas compras inválidas com percentual de excesso:*/
SELECT 
    t.cpf,
    t.nome,
    t.data_venda,
    t.total_vendas,
    t.limite_compra,
    CASE
        WHEN (t.limite_compra - t.total_vendas) < 0 THEN 'Inválida'
        ELSE 'Válida'
    END AS status,
    ROUND((1 - (t.limite_compra / t.total_vendas)) * 100,
            2) AS percentual_acima
FROM
    (SELECT 
        nf.cpf,
            c.nome,
            DATE_FORMAT(nf.data_venda, '%m-%Y') AS data_venda,
            SUM(i.quantidade) AS total_vendas,
            MAX(c.volume_de_compra) AS limite_compra
    FROM
        notas_fiscais nf
    INNER JOIN itens_notas_fiscais i ON nf.numero = i.numero
    INNER JOIN tabela_de_clientes c ON c.cpf = nf.cpf
    GROUP BY nf.cpf, c.nome, DATE_FORMAT(nf.data_venda, '%Y-%m')) t
WHERE
    (t.limite_compra - t.total_vendas) <= 0
ORDER BY nome, data_venda