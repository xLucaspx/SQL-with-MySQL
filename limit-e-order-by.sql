SELECT * FROM tabela_de_produtos LIMIT 10;

/*Pega 10 registros a partir da linha 5:*/
SELECT * FROM tabela_de_produtos LIMIT 5, 10;

/*Ordena em ordem descendente: */
SELECT * FROM tabela_de_produtos ORDER BY preco_de_lista DESC;

/*Ordenando com critérios compostos: */
SELECT * FROM tabela_de_produtos ORDER BY embalagem, sabor;
SELECT * FROM tabela_de_produtos ORDER BY
	embalagem, sabor, preco_de_lista;

SELECT * FROM tabela_de_produtos ORDER BY
	embalagem DESC,
    tamanho ASC;