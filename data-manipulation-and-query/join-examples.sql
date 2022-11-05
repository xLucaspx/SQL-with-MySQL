SELECT * FROM tabela_de_vendedores;
SELECT * FROM tabela_de_clientes;

/*Vendedores e clientes em um mesmo bairro:*/
SELECT * FROM tabela_de_vendedores
INNER JOIN tabela_de_clientes
ON tabela_de_vendedores.bairro = tabela_de_clientes.bairro;

/*Vendedores e clientes em um mesmo bairro:*/
SELECT tabela_de_vendedores.nome AS nome_vendedor,
	de_ferias,
	tabela_de_vendedores.bairro,
    estado,
    tabela_de_clientes.nome AS nome_cliente
FROM tabela_de_vendedores INNER JOIN tabela_de_clientes
ON tabela_de_vendedores.bairro = tabela_de_clientes.bairro;

/*Mostra clientes que não tem um vendedor no bairro:*/
SELECT tabela_de_vendedores.nome AS nome_vendedor,
	de_ferias,
	tabela_de_clientes.bairro,
    tabela_de_clientes.nome AS nome_cliente
FROM tabela_de_vendedores RIGHT JOIN tabela_de_clientes
ON tabela_de_vendedores.bairro = tabela_de_clientes.bairro;

/*Mostra vendedores que não tem clientes no bairro:*/
SELECT tabela_de_vendedores.nome AS nome_vendedor,
	de_ferias,
	tabela_de_vendedores.bairro,
    tabela_de_clientes.nome AS nome_cliente
FROM tabela_de_vendedores LEFT JOIN tabela_de_clientes
ON tabela_de_vendedores.bairro = tabela_de_clientes.bairro;

/*CROSS JOIN:*/
SELECT tabela_de_vendedores.nome AS nome_vendedor,
	de_ferias,
	tabela_de_clientes.bairro,
    tabela_de_clientes.nome AS nome_cliente
FROM tabela_de_vendedores, tabela_de_clientes;