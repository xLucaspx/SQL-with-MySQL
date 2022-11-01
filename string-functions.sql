SELECT LTRIM('    left trim     ') AS result;
SELECT RTRIM('    right trim    ') AS result;
SELECT TRIM('     full trim     ') AS result;

SELECT CONCAT('olá', ' ', 'tudo bem', ' ', '?') AS result;

SELECT UPPER('letras maúisculas') AS result; /*= UCASE*/
SELECT LCASE('LETRAS MINÚSCULAS') AS result; /*= LOWER*/

/*Pega a substring a partir do index informado:*/
SELECT SUBSTRING('Olá, tudo bem?', 6) AS result;

/*Pega a substring a partir do index informado, 
apenas a quantidade de caracteres informados:*/
SELECT SUBSTRING('Olá, tudo bem?', 11, 3) AS result;

SELECT CONCAT(nome, ' (', cpf, ')') AS result
FROM tabela_de_clientes
ORDER BY nome;

SELECT 
    nome,
    CONCAT(endereco_1, ', ',
            bairro, ', ',
            cidade, ' - ',
            estado) AS endereco
FROM
    tabela_de_clientes
ORDER BY nome;