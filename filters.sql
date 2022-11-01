SELECT * FROM tbCliente WHERE idade > 22;
SELECT * FROM tbCliente WHERE idade <= 22;

SELECT * FROM tbCliente WHERE cidade <> 'Rio de Janeiro';

/*Ordem alfabética:*/
SELECT * FROM tbCliente WHERE nome >= 'Marcelo';

SELECT * FROM tbCliente WHERE nome <> 'Petra Oliveira';

/*Não funciona pois float não consegue ser exato:*/
SELECT * FROM tbProduto WHERE preco_lista = 38.012;

/*Opções - utilizar Decimal ou filtrar com between:*/
SELECT * FROM tbProduto WHERE preco_lista BETWEEN 38.011 AND 38.013;

SELECT * FROM tbVendedores WHERE percentual_comissao > 0.09;
