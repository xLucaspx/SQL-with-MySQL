DROP PROCEDURE IF EXISTS retornaSabor;

DELIMITER $$
CREATE PROCEDURE retornaSabor(codigo VARCHAR(10))
BEGIN
	DECLARE vSabor VARCHAR(20);
    
    SELECT sabor INTO vSabor FROM tabela_de_produtos WHERE codigo_do_produto = codigo;
    
    SELECT vSabor AS sabor;
END $$
DELIMITER ;

CALL retornaSabor('1013793');

select * from tabela_de_produtos;

DROP PROCEDURE IF EXISTS retorna_quantidade_notas;

DELIMITER $$
CREATE PROCEDURE retorna_quantidade_notas (data_nota DATE)
BEGIN
	DECLARE quantidadeNotas INT;
    
    SELECT COUNT(*) INTO quantidadeNotas FROM notas_fiscais WHERE YEAR(data_venda) = YEAR(data_nota);
    
    SELECT quantidadeNotas `quantidade notas`;
END $$
DELIMITER ;

CALL retorna_quantidade_notas('2017-01-01');