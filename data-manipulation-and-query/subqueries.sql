SELECT DISTINCT bairro FROM tabela_de_vendedores;

/*Menos abrangente e precisa ser atualizada manualmente*/
SELECT * FROM tabela_de_clientes
WHERE bairro IN ('tijuca' , 'jardins', 'copacabana');

/*Abrange todo o conteúdo referenciado,
mesmo que a tabela seja atualizada:*/
SELECT * FROM tabela_de_clientes
WHERE bairro IN (
	SELECT DISTINCT bairro
	FROM tabela_de_vendedores
);

/*Consultando uma consulta (subconsulta):*/
SELECT 
    X.embalagem, X.preco_maximo
FROM
    (SELECT 
        embalagem, MAX(preco_de_lista) AS preco_maximo
    FROM
        tabela_de_produtos
    GROUP BY embalagem) X
WHERE
    X.preco_maximo > 10;