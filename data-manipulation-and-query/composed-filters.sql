/*Quebrando o BETWEEN:*/
SELECT * FROM tbProduto WHERE preco_lista >= 16 AND PRECO_LISTA <= 17;

SELECT * FROM tbCliente WHERE idade >= 18 AND idade <= 22;
SELECT * FROM tbCliente WHERE idade >= 18 AND idade <= 22 AND sexo = 'F';

SELECT * FROM tbCliente WHERE estado = 'RJ' OR bairro = 'Jardins';

SELECT * FROM tbCliente WHERE (idade >= 18 AND idade <= 22 AND sexo = 'F')
OR (estado = 'RJ' OR bairro = 'Jardins');