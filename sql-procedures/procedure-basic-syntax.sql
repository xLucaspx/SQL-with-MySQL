USE sucos_vendas;
DROP PROCEDURE IF EXISTS hello_world;

DELIMITER $$
USE sucos_vendas $$
CREATE PROCEDURE hello_world()
BEGIN
	SELECT 'Hello, world!' AS result;
END $$
DELIMITER ;

CALL hello_world;