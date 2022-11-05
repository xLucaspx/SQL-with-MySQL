SELECT * FROM
	vendedores A
        INNER JOIN
    sucos_vendas.tabela_de_vendedores B ON A.matricula = SUBSTR(B.matricula, 3, 3);

/*Sincronizando o campo "ferias" de duas tabelas de bancos diferentes:*/
UPDATE vendedores A
        INNER JOIN
    sucos_vendas.tabela_de_vendedores B ON A.matricula = SUBSTR(B.matricula, 3, 3) 
SET 
    A.ferias = B.de_ferias;
    
/*Aumentando o volume de compra dos clientes que possuem vendedores em seus bairros em 30%:*/
UPDATE clientes C
		INNER JOIN
	vendedores V ON C.bairro = V.bairro
SET 
	C.volume_compra = volume_compra * 1.30;
    
SELECT C.nome, V.bairro, C.volume_compra FROM 
clientes C INNER JOIN
vendedores V ON C.bairro = V.bairro;