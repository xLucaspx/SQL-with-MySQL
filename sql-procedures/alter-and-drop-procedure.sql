/*Criando procedure:*/
USE `sucos_vendas`;
DROP procedure IF EXISTS `test`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `test` ()
BEGIN
	SELECT CONCAT('5 + 3', ' = ', 5 + 3) AS operation;
END$$

DELIMITER ;

/*Chamando procedure:*/
CALL test;

/*"Alterando" a procedure. Não há um comando para alterar a Stored Procedure;
se quisermos fazer isso, temos que apagá-la com o comando DROP e criá-la novamente:*/
USE `sucos_vendas`;
DROP procedure IF EXISTS `test`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `test`()
BEGIN
	SELECT CONCAT('5 * 3', ' + 9', ' = ', 5 * 3 + 9) AS operation;
END$$

DELIMITER ;

/*Chamando novamente:*/
CALL test();

/*Excluindo procedure:*/
USE `sucos_vendas`;
DROP PROCEDURE IF EXISTS `test`;