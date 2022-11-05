SELECT DISTINCT bairro FROM tabela_de_clientes;
SELECT DISTINCT bairro FROM tabela_de_vendedores;

/*Aplica DISTINCT no resultado:*/
SELECT bairro FROM tabela_de_clientes
UNION
SELECT bairro FROM tabela_de_vendedores;

/*Não aplica DISTINCT no resultado:*/ 
SELECT bairro FROM tabela_de_clientes
UNION ALL
SELECT bairro FROM tabela_de_vendedores;

/*Union deve ter a mesma quantidade de colunas do mesmo tipo nas duas consultas:*/
SELECT 
    nome, bairro, 'Cliente' AS tipo
FROM
    tabela_de_clientes 
UNION SELECT 
    nome, bairro, 'Vendedor' AS tipo
FROM
    tabela_de_vendedores
ORDER BY nome;

/*O ALIAS pode ser diferente, contanto que seja do mesmo tipo de dados:*/
SELECT 
    nome, bairro, 'Cliente' AS tipo, cpf AS id
FROM
    tabela_de_clientes 
UNION SELECT 
    nome, bairro, 'Vendedor' AS tipo, matricula AS id
FROM
    tabela_de_vendedores
ORDER BY nome;

/*FULL JOIN juntando LEFT e RIGHT JOIN com UNION:*/
SELECT 
    tabela_de_vendedores.nome AS nome_vendedor,
    de_ferias,
    tabela_de_vendedores.bairro,
    tabela_de_clientes.nome AS nome_cliente
FROM
    tabela_de_vendedores
        LEFT JOIN
    tabela_de_clientes ON tabela_de_vendedores.bairro = tabela_de_clientes.bairro 
UNION SELECT 
    tabela_de_vendedores.nome AS nome_vendedor,
    de_ferias,
    tabela_de_clientes.bairro,
    tabela_de_clientes.nome AS nome_cliente
FROM
    tabela_de_vendedores
        RIGHT JOIN
    tabela_de_clientes ON tabela_de_vendedores.bairro = tabela_de_clientes.bairro
ORDER BY bairro;