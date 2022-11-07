DROP PROCEDURE IF EXISTS atualiza_idade;

DELIMITER $$
CREATE PROCEDURE atualiza_idade ()
BEGIN
	UPDATE tabela_de_clientes
    SET idade = TIMESTAMPDIFF(YEAR, data_de_nascimento, NOW());
END $$
DELIMITER ;

CALL atualiza_idade();
SELECT nome, data_de_nascimento, idade FROM tabela_de_clientes;