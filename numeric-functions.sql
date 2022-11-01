SELECT (23 + ((25 - 2) / 2) * 45) AS result;

/*Arredonda para o próximo inteiro maior:*/
SELECT CEILING(12.001) AS result; /*13*/

/*Arredonda para o menor inteiro mais próximo:*/
SELECT FLOOR(12.999) AS result; /*12*/

/*Arredonda com base nas casa decimais:*/
SELECT ROUND(12.333) AS result; /*12*/
SELECT ROUND(12.503) AS result; /*13*/

/*Retorna um número aleatório*/
SELECT RAND() AS random_number;

SELECT
	numero,
    quantidade,
    preco,
    ROUND(quantidade * preco, 2) AS valor /*Arredondando com duas casa decimais*/
FROM itens_notas_fiscais;

/*Imposto pago em 2016 arredondando para baixo:*/
SELECT 
	YEAR(n.data_venda) AS ano,
    FLOOR(SUM(n.imposto * (i.quantidade * i.preco))) AS imposto
FROM notas_fiscais n 
INNER JOIN itens_notas_fiscais i
ON n.numero = i.numero
WHERE YEAR(data_venda) = 2016
GROUP BY YEAR(data_venda);

/*Imposto pago por ano:*/
SELECT 
	YEAR(n.data_venda) AS ano,
    ROUND(SUM(n.imposto * (i.quantidade * i.preco))) AS imposto
FROM notas_fiscais n 
INNER JOIN itens_notas_fiscais i
ON n.numero = i.numero
GROUP BY YEAR(data_venda)
ORDER BY YEAR(data_venda);