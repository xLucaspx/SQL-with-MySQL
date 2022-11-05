CREATE TABLE faturamento (
    data_venda DATE,
    total_venda FLOAT
);

/*Consulta para calcular o faturamento:*/
SELECT 
    N.data_venda, SUM(i.quantidade * i.preco) AS total_venda
FROM
    notas_fiscais N
        INNER JOIN
    itens_notas i ON N.numero = I.numero
GROUP BY data_venda;

/*Inserindo faturamento na tabela de faturamento:*/
DELETE FROM faturamento; -- Para eliminar valores repetidos
INSERT INTO faturamento
SELECT 
    N.data_venda, SUM(i.quantidade * i.preco) AS total_venda
FROM
    notas_fiscais N
        INNER JOIN
    itens_notas i ON N.numero = I.numero
GROUP BY data_venda;

/*Criando trigger*/
DELIMITER //
CREATE TRIGGER TG_calcula_faturamento_insert AFTER INSERT ON itens_notas
FOR EACH ROW BEGIN
	DELETE FROM faturamento;
	INSERT INTO faturamento
	SELECT 
		N.data_venda, SUM(i.quantidade * i.preco) AS total_venda
	FROM
		notas_fiscais N
			INNER JOIN
		itens_notas i ON N.numero = I.numero
	GROUP BY YEAR(data_venda);
END //

/*Temos que criar para update e delete também*/
DELIMITER //
CREATE TRIGGER TG_calcula_faturamento_update AFTER UPDATE ON itens_notas
FOR EACH ROW BEGIN
	DELETE FROM faturamento;
	INSERT INTO faturamento
	SELECT 
		N.data_venda, SUM(i.quantidade * i.preco) AS total_venda
	FROM
		notas_fiscais N
			INNER JOIN
		itens_notas i ON N.numero = I.numero
	GROUP BY YEAR(data_venda);
END //

DELIMITER //
CREATE TRIGGER TG_calcula_faturamento_delete AFTER DELETE ON itens_notas
FOR EACH ROW BEGIN
	DELETE FROM faturamento;
	INSERT INTO faturamento
	SELECT 
		N.data_venda, SUM(i.quantidade * i.preco) AS total_venda
	FROM
		notas_fiscais N
			INNER JOIN
		itens_notas i ON N.numero = I.numero
	GROUP BY YEAR(data_venda);
END //

/*não podemos utilizar um comando UPDATE para um trigger, onde a tabela a ser atualizada 
é a mesma que sofrerá a ação para acionar a trigger; utilizamos o comando SET atualizando 
apenas os novos registros a serem inseridos na tabela.
O operador NEW representa o novo registro que será incluído:*/
DELIMITER //
CREATE TRIGGER TG_calcula_idade BEFORE INSERT ON clientes
FOR EACH ROW BEGIN
	SET NEW.idade = TIMESTAMPDIFF(YEAR, NEW.data_nascimento, NOW());
END //

	