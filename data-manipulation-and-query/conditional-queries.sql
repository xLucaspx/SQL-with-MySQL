SELECT * FROM tabela_de_clientes WHERE
	cidade IN ('Rio de Janeiro' , 'São Paulo')
	AND idade >= 20;
    
SELECT * FROM tabela_de_clientes WHERE
	estado IN ('RJ' , 'SP')
    AND (idade < 20);

SELECT * FROM tabela_de_produtos WHERE
    sabor = 'manga'
    OR tamanho = '470 ml';
    
SELECT * FROM tabela_de_produtos WHERE
    sabor = 'manga'
    AND tamanho = '470 ml';
    
SELECT * FROM tabela_de_produtos WHERE
    NOT (sabor = 'manga')
	AND tamanho = '470 ml';

SELECT  * FROM tabela_de_produtos WHERE
	sabor IN ('Maçã' , 'Melancia');
