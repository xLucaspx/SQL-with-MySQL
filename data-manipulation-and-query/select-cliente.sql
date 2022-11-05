SELECT * FROM tbCliente;

SELECT nome, idade, sexo FROM tbCliente LIMIT 10;

SELECT 
    nome AS `Nome cliente`,
    data_nascimento AS `Data de nascimento`,
    cidade AS `Cidade`,
    limite_credito AS `Limite de crédito`
FROM
    tbCliente;
    
SELECT * FROM tbCliente WHERE cidade = 'Rio de Janeiro';