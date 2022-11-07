/* RAND() retorna um número aleatório entre 0 e 1.
Para utilizarmos este número de maneira prática, podemos fazer:
ROUND((RAND() * (nMax - nMin + 1)) + nMin), ou seja, o número aleatório
multiplicado pelo valor máximo que podemos obter menos o valor mínimo mais 1, e
o resultado disso mais o valor mínimo e arredondado com FLOOR():*/
SELECT FLOOR(RAND() * (15 - 1 + 1) + 1) AS numero; -- vMin = 1, vMax = 15

DROP FUNCTION IF EXISTS retornaNumeroAleatorio;

DELIMITER $$
CREATE FUNCTION retornaNumeroAleatorio (vMin INT, vMax INT)
RETURNS INT
BEGIN
	RETURN (SELECT FLOOR(RAND() * (vMax - vMin + 1) + vMin));
END $$
DELIMITER ;

SELECT retornaNumeroAleatorio(1, 15) AS numero;