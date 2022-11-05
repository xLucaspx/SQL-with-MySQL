SELECT * FROM tbCliente WHERE data_nascimento = '1995-01-13';
SELECT * FROM tbCliente WHERE data_nascimento > '1995-01-13';
SELECT * FROM tbCliente WHERE data_nascimento <= '1995-01-13';

/*Funções YEAR, MONTH e DAY retornam um inteiro, 
por isso os valores comparados não estão dentro de aspas:*/
SELECT * FROM tbCliente WHERE YEAR(data_nascimento) > 1990;
SELECT * FROM tbCliente WHERE MONTH(data_nascimento) = 3;
SELECT * FROM tbCliente WHERE DAY(data_nascimento) <= 15;