/*Data atual:*/
SELECT CURDATE() AS data_atual; /*CURRENT_DATE*/

/*Hora atual:*/
SELECT CURRENT_TIME() AS hora_atual; /*CURTIME*/

/*Data e hora atuais:*/
SELECT CURRENT_TIMESTAMP() AS data_e_hora; 

SELECT CONCAT(
	DAY(CURRENT_TIMESTAMP()), '/',
    MONTH(CURRENT_TIMESTAMP()), '/',
    YEAR(CURRENT_TIMESTAMP())
    ) AS data_atual;
    
SELECT MONTHNAME(CURRENT_TIMESTAMP()) AS mes_atual;

/*Diferença entre datas,
primero a data final:*/
SELECT DATEDIFF(CURRENT_DATE(), '2002-06-07') AS dias_vividos;

SELECT DATEDIFF('2023-01-01', CURRENT_TIMESTAMP()) AS final_do_ano;

/*Subtraindo 5 dias da data de hoje:*/
SELECT CURRENT_TIMESTAMP() AS agora,
	DATE_SUB(CURRENT_TIMESTAMP(), INTERVAL 5 DAY) AS resultado;
    
SELECT DISTINCT 
	CONCAT(
		DAY(data_venda), '/',
		MONTH(data_venda), '/',
		YEAR(data_venda)) AS data_venda
FROM notas_fiscais;

SELECT nome,
	TIMESTAMPDIFF(YEAR, data_de_nascimento, CURRENT_DATE()) AS idade
FROM tabela_de_clientes;