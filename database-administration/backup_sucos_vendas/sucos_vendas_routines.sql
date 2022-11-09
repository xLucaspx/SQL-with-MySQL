-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: sucos_vendas
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `vw_maior_preco_embalagens`
--

DROP TABLE IF EXISTS `vw_maior_preco_embalagens`;
/*!50001 DROP VIEW IF EXISTS `vw_maior_preco_embalagens`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_maior_preco_embalagens` AS SELECT 
 1 AS `embalagem`,
 1 AS `preco_maximo`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_maior_preco_embalagens`
--

/*!50001 DROP VIEW IF EXISTS `vw_maior_preco_embalagens`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_maior_preco_embalagens` AS select `tabela_de_produtos`.`EMBALAGEM` AS `embalagem`,max(`tabela_de_produtos`.`PRECO_DE_LISTA`) AS `preco_maximo` from `tabela_de_produtos` group by `tabela_de_produtos`.`EMBALAGEM` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'sucos_vendas'
--

--
-- Dumping routines for database 'sucos_vendas'
--
/*!50003 DROP FUNCTION IF EXISTS `calculaQuantidadeNotas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calculaQuantidadeNotas`(ano INT) RETURNS int
BEGIN
	DECLARE notas INT;
    
    SELECT COUNT(*) INTO notas FROM notas_fiscais WHERE YEAR(data_venda) = ano;
    
    RETURN notas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `funcTipoSabor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `funcTipoSabor`(sabor VARCHAR(20)) RETURNS varchar(20) CHARSET utf8mb4
BEGIN
	DECLARE tipoSabor VARCHAR(20) DEFAULT 'Não encontrado';
    
    IF (sabor LIKE '%limão%') OR (sabor LIKE '%laranja%') OR (sabor LIKE '%tangerina%') THEN
		SET tipoSabor = 'Cítrico';
	ELSEIF (sabor LIKE '%uva%') OR (sabor LIKE '%açaí%') OR (sabor LIKE '%cereja%') OR (sabor LIKE '%melancia%') THEN
		SET tipoSabor = 'Doce';
	ELSEIF (sabor LIKE '%manga%') OR (sabor LIKE '%melão%') OR (sabor LIKE '%maracujá%') OR (sabor LIKE '%maçã%')  OR (sabor LIKE '%morango%') THEN
		SET tipoSabor = 'Neutro';
	END IF;
    
    RETURN tipoSabor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `retornaCodigoProdutoAleatorio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `retornaCodigoProdutoAleatorio`() RETURNS varchar(10) CHARSET utf8mb4
BEGIN
	DECLARE maxProdutos, i INT;
    DECLARE codigo VARCHAR(11);
    
    SELECT COUNT(*) INTO maxProdutos FROM tabela_de_produtos; -- Pegando número de linhas da tabela
    SELECT retornaNumeroAleatorio(0, (maxProdutos - 1)) INTO i; -- -1 para evitar retornos NULL
	SELECT codigo_do_produto INTO codigo FROM tabela_de_produtos LIMIT i, 1; -- Pega o primeiro elemento depois de i
    
    RETURN codigo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `retornaCpfClienteAleatorio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `retornaCpfClienteAleatorio`() RETURNS varchar(11) CHARSET utf8mb4
BEGIN
	DECLARE maxClientes, i INT;
    DECLARE cpfCliente VARCHAR(11);
    
    SELECT COUNT(*) INTO maxClientes FROM tabela_de_clientes; -- Pegando número de linhas da tabela
    SELECT retornaNumeroAleatorio(0, (maxClientes - 1)) INTO i; -- -1 para evitar retornos NULL
	SELECT cpf INTO cpfCliente FROM tabela_de_clientes LIMIT i, 1; -- Pega o primeiro elemento depois de i
    
    RETURN cpfCliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `retornaMatriculaVendedorAleatorio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `retornaMatriculaVendedorAleatorio`() RETURNS varchar(5) CHARSET utf8mb4
BEGIN
	DECLARE maxVendedores, i INT;
    DECLARE matriculaVendedor VARCHAR(11);
    
    SELECT COUNT(*) INTO maxVendedores FROM tabela_de_vendedores; -- Pegando número de linhas da tabela
    SELECT retornaNumeroAleatorio(0, (maxVendedores - 1)) INTO i; -- -1 para evitar retornos NULL
	SELECT matricula INTO matriculaVendedor FROM tabela_de_vendedores LIMIT i, 1; -- Pega o primeiro elemento depois de i
    
    RETURN matriculaVendedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `retornaNumeroAleatorio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `retornaNumeroAleatorio`(vMin INT, vMax INT) RETURNS int
BEGIN
	RETURN (SELECT FLOOR(RAND() * (vMax - vMin + 1) + vMin));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `atribui_valor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `atribui_valor`()
BEGIN
DECLARE nome, sobrenome VARCHAR (20);

SET nome = 'Pafúncio';
SET sobrenome = 'Linoleros';

SELECT nome, sobrenome;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `atualizaTabFaturamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizaTabFaturamento`()
BEGIN
	DELETE FROM faturamento;
    INSERT INTO
		faturamento (data_venda, valor_total)
	(SELECT 
		n.data_venda, SUM(i.quantidade * i.preco) AS valor_total
	FROM
		notas_fiscais n
			INNER JOIN
		itens_notas_fiscais i ON n.numero = i.numero
	GROUP BY n.data_venda);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `atualiza_comissao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `atualiza_comissao`(percentual FLOAT)
BEGIN
	UPDATE tabela_de_vendedores SET percentual_comissao = ROUND(percentual_comissao * (1 + percentual), 2);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `atualiza_idade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `atualiza_idade`()
BEGIN
	UPDATE tabela_de_clientes
    SET idade = TIMESTAMPDIFF(YEAR, data_de_nascimento, NOW());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calculaFaturamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calculaFaturamento`(ano INT, mes INT)
BEGIN
	DECLARE fimCursor, quantidade INT DEFAULT 0;
    DECLARE preco, total FLOAT DEFAULT 0.0;
    DECLARE valores CURSOR FOR 
		SELECT i.quantidade, i.preco FROM itens_notas_fiscais i
			INNER JOIN
		notas_fiscais n ON i.numero = n.numero
        WHERE YEAR(n.data_venda) = ano AND MONTH(n.data_venda) = mes;
        
	DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET fimCursor = 1;
    
    OPEN valores;
		WHILE fimCursor = 0 DO
			FETCH valores INTO quantidade, preco;
			
			IF fimCursor = 0 THEN
				SET total = ROUND(total + (quantidade * preco), 2);
			END IF;
		END WHILE;
    CLOSE valores;
	
    SELECT CONCAT(mes, '/', ano) AS `Período`,
		total AS `Faturamento`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calculaNumeroDeNotas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calculaNumeroDeNotas`(dataNotas DATE)
BEGIN
	DECLARE numeroNotas INT;
    DECLARE resultado VARCHAR(15);
    
    SELECT COUNT(*) INTO numeroNotas FROM notas_fiscais WHERE data_venda = dataNotas;
    
    IF numeroNotas > 70 THEN
		SET resultado = 'Muitas notas';
	ELSE
		SET resultado = 'Poucas notas';
	END IF;
    
    SELECT numeroNotas, resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `caseComparaVendas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `caseComparaVendas`(dataVenda1 DATE, dataVenda2 DATE)
BEGIN
	DECLARE valor1 FLOAT;
    DECLARE valor2 FLOAT;
    DECLARE diferenca FLOAT;
    DECLARE resultado VARCHAR(10);
    
    SELECT SUM(I.quantidade * I.preco) INTO valor1 FROM 
    notas_fiscais N INNER JOIN itens_notas_fiscais I
    ON N.numero = I.numero WHERE N.data_venda = dataVenda1;
    
    SELECT SUM(I.quantidade * I.preco) INTO valor2 FROM
    notas_fiscais N INNER JOIN itens_notas_fiscais I
    ON N.numero = I.numero WHERE N.data_venda = dataVenda2;
    
    -- Calculando variação percentual das vendas:
    SET diferenca = ((valor1 / valor2) - 1) * 100;
    
    CASE
    WHEN diferenca >= 10 THEN
		SET resultado = 'Verde';
	WHEN diferenca <= -10 THEN
		SET resultado = 'Vermelho';
	WHEN diferenca IS NULL THEN
		SET resultado = 'Sem vendas';
	ELSE
		SET resultado = 'Amarelo';
    END CASE;
    
    SELECT valor1 AS `Valor 1`,
    valor2 AS `Valor 2`,
    ROUND(diferenca, 2) AS `Diferença(%)`,
    resultado AS `Status`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `caseSemElse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `caseSemElse`(codigoProduto VARCHAR(10))
BEGIN
	DECLARE saborProduto VARCHAR(20);
    DECLARE nomeProduto VARCHAR(50);
    DECLARE tipoSabor VARCHAR(15);
    
    DECLARE CONTINUE HANDLER FOR 1339 -- Case not found (case sem else)
		SET tipoSabor = 'Não encontrado';
    
    SELECT sabor INTO saborProduto FROM tabela_de_produtos WHERE codigo_do_produto = codigoProduto;
    SELECT nome_do_produto INTO nomeProduto FROM tabela_de_produtos WHERE codigo_do_produto = codigoProduto;
    
    CASE saborProduto
    WHEN ('Lima/Limão') THEN
		SET tipoSabor = 'Cítrico';
    WHEN ('Melancia') THEN
		SET tipoSabor = 'Doce';
	END CASE;
    
    SELECT codigoProduto AS `Código`,
		nomeProduto AS `Nome - Tamanho - Sabor`,
        tipoSabor AS `Tipo`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `caseStatusPreco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `caseStatusPreco`(codigoProduto VARCHAR(10))
BEGIN
	DECLARE nome VARCHAR(50);
	DECLARE preco FLOAT;
    DECLARE resultado VARCHAR(15);
    
    SELECT nome_do_produto INTO nome FROM tabela_de_produtos WHERE codigo_do_produto = codigoProduto;
    SELECT preco_de_lista INTO preco FROM tabela_de_produtos WHERE codigo_do_produto = codigoProduto;
    
    CASE
    WHEN preco < 7 THEN
		SET resultado = 'Barato';
	WHEN preco >= 7 AND preco < 12 THEN
		SET resultado = 'Médio';
	WHEN preco >= 12 THEN
		SET resultado = 'Caro';
	ELSE
		SET resultado = 'Não cadastrado';
	END CASE;
    
    SELECT codigoProduto,
    nome,
    CONCAT('R$ ', ROUND(preco, 2)) AS preco,
    resultado AS `status`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `comparaVendas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `comparaVendas`(dataVenda1 DATE, dataVenda2 DATE)
BEGIN
	DECLARE valor1 FLOAT;
    DECLARE valor2 FLOAT;
    DECLARE diferenca FLOAT;
    DECLARE resultado VARCHAR(10);
    
    SELECT SUM(I.quantidade * I.preco) INTO valor1 FROM 
    notas_fiscais N INNER JOIN itens_notas_fiscais I
    ON N.numero = I.numero WHERE N.data_venda = dataVenda1;
    
    SELECT SUM(I.quantidade * I.preco) INTO valor2 FROM
    notas_fiscais N INNER JOIN itens_notas_fiscais I
    ON N.numero = I.numero WHERE N.data_venda = dataVenda2;
    
    -- Calculando variação percentual das vendas:
    SET diferenca = ((valor1 / valor2) - 1) * 100;
    
    IF diferenca >= 10 THEN
		SET resultado = 'Verde';
	ELSEIF diferenca <= -10 THEN
		SET resultado = 'Vermelho';
	ELSE
		SET resultado = 'Amarelo';
    END IF;
    
    SELECT valor1 AS `Valor 1`,
    valor2 AS `Valor 2`,
    ROUND(diferenca, 2) AS `Diferença(%)`,
    resultado AS `Status`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `data_types` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `data_types`()
BEGIN
DECLARE texto VARCHAR(15) DEFAULT 'string';
DECLARE inteiro INTEGER DEFAULT 123;
DECLARE quebrado DECIMAL(6, 2) DEFAULT 13.52;
DECLARE data_nasc DATE DEFAULT '2000-02-29';
DECLARE agora TIMESTAMP DEFAULT NOW();

SELECT
	texto, inteiro, quebrado, DATE_FORMAT(data_nasc, '%d/%m/%Y') AS `data`, agora;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ex_01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ex_01`()
BEGIN
DECLARE cliente VARCHAR(10);
DECLARE data_nasc DATE;
DECLARE idade INTEGER;
DECLARE saldo FLOAT;

SET cliente = 'Rodorfo';
SET data_nasc = '1987-03-31';
SET idade = TIMESTAMPDIFF(YEAR, data_nasc, NOW());
SET saldo = 6742.59;

SELECT 
	cliente,
    DATE_FORMAT(data_nasc, '%d/%m/%Y') AS `data nascimento`,
    idade,
    saldo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `geraVendaAleatoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `geraVendaAleatoria`(dataVenda DATE, maxItens INT, maxQuantidade INT)
BEGIN
	DECLARE cpfCliente VARCHAR(11);
    DECLARE	matriculaVendedor VARCHAR(5);
    DECLARE codigoProduto VARCHAR(10);
    DECLARE preco FLOAT;
    DECLARE totalItens, quantidade, numeroNota, itemAdicionado INT;
    DECLARE i INT DEFAULT 0;
    
    SELECT (MAX(numero) + 1) INTO numeroNota FROM notas_fiscais; -- Pegando número da nota
    SET cpfCliente = retornaCpfClienteAleatorio(); -- Pegando CPF do cliente
    SET matriculaVendedor = retornaMatriculaVendedorAleatorio(); -- Pegando matricula vendedor
    
    INSERT INTO notas_fiscais -- Criando nota fiscal
		(cpf, matricula, data_venda, numero, imposto) 
	VALUES
		(cpfCliente, matriculaVendedor, dataVenda, numeroNota, 0.12);
        
	SET totalItens = retornaNumeroAleatorio(1, maxItens); -- Pegando número de itens na nota
    
    WHILE i < totalItens DO
		SET codigoProduto = retornaCodigoProdutoAleatorio(); -- Pegando código do produto
        
        SELECT COUNT(*) INTO itemAdicionado -- Verificando se o item já foi adicionado na nota
        FROM itens_notas_fiscais WHERE numero = numeroNota AND codigo_do_produto = codigoProduto;
        
        IF itemAdicionado = 0 THEN -- Se o item ainda não foi adicionado na nota
			SET quantidade = retornaNumeroAleatorio(1, maxQuantidade); -- Pegando quantidade do produto
			SELECT preco_de_lista INTO preco -- Pegando preco do produto
			FROM tabela_de_produtos WHERE codigo_do_produto = codigoProduto; 
			
			INSERT INTO itens_notas_fiscais -- Inserindo item da nota
				(numero, codigo_do_produto, quantidade, preco)
			VALUES
				(numeroNota, codigoProduto, quantidade, preco);
		END IF;
        
        SET i = i + 1;
	END WHILE;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `hello_world` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `hello_world`()
BEGIN
	SELECT 'Hello, world!' AS result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_produto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_produto`(
	codigo VARCHAR(10),
    nome VARCHAR(50),
    embalagem VARCHAR(20),
    tamanho VARCHAR(10),
    sabor VARCHAR(20),
    preco FLOAT )
BEGIN
	DECLARE mensagem VARCHAR(85);
    
    DECLARE EXIT HANDLER FOR 1062 -- duplicate entry - primary key
    BEGIN
		SET mensagem = CONCAT('Atenção: o código ', codigo, ' já está cadastrado na tabela de produtos!');
		SELECT mensagem;
	END;
    
    SET mensagem = CONCAT('Produto ', codigo, ' incluído com sucesso!');
    
	INSERT INTO tabela_de_produtos (
		codigo_do_produto,
        nome_do_produto,
        embalagem,
        tamanho,
        sabor,
        preco_de_lista
    ) VALUES (
		codigo,
        nome,
        embalagem,
        tamanho,
        sabor,
        preco
    );
    
    SELECT mensagem;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `loop_while` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `loop_while`(numInicial INT, numFinal INT)
BEGIN
	DECLARE i INT;
    SET i = numInicial;
    
    DELETE FROM tab_loop;
    
    WHILE i <= numFinal DO
		INSERT INTO tab_loop (id) VALUES (i);
		SET i = i + 1;
	END WHILE;
    
    SELECT * FROM tab_loop;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mesmo_tipo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mesmo_tipo`()
BEGIN
DECLARE nome, sobrenome VARCHAR(15) DEFAULT 'Hello world!';
SELECT nome, sobrenome;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `retornaEndereco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `retornaEndereco`()
BEGIN
	DECLARE fimCursor INT DEFAULT 0;
	DECLARE cNome VARCHAR (100);
    DECLARE cCep VARCHAR(8);
    DECLARE cEndereco VARCHAR(150);
    DECLARE cBairro, cCidade VARCHAR(50);
    DECLARE cEstado VARCHAR(2);
    DECLARE cValores CURSOR FOR SELECT nome, cep, endereco_1, bairro, cidade, estado FROM tabela_de_clientes;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET fimCursor = 1;
	
    OPEN cValores;
		WHILE fimCursor = 0 DO
			FETCH cValores INTO cNome, cCep, cEndereco, cBairro, cCidade, cEstado;
            IF fimCursor = 0 THEN
				SELECT cNome AS `Nome`,
					cCep AS `CEP`,
					CONCAT(cEndereco, ', ', cBairro, ', ', cCidade, ' - ', cEstado) AS `Endereço`;
            END IF;
        END WHILE;
	CLOSE cValores;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `retornaJovemOuVelho` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `retornaJovemOuVelho`(cpfCliente VARCHAR(11))
BEGIN
	DECLARE nomeCliente VARCHAR(100);
    DECLARE dataNascimento DATE;
	DECLARE resultado VARCHAR(5);
    
    SELECT nome INTO nomeCliente FROM tabela_de_clientes WHERE cpf = cpfCliente;
    SELECT data_de_nascimento INTO dataNascimento FROM tabela_de_clientes WHERE cpf = cpfCliente;
    
    IF YEAR(dataNascimento) < 2000 THEN
		SET resultado = 'Velho';
	ELSE
		SET resultado = 'Jovem';
	END IF;
    
    SELECT nomeCliente, resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `retornaSabor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `retornaSabor`(codigo VARCHAR(10))
BEGIN
	DECLARE vSabor VARCHAR(20);
    
    SELECT sabor INTO vSabor FROM tabela_de_produtos WHERE codigo_do_produto = codigo;
    
    SELECT vSabor AS sabor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `retornaStatusPreco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `retornaStatusPreco`(codigoProduto VARCHAR(10))
BEGIN
	DECLARE nome VARCHAR(50);
	DECLARE preco FLOAT;
    DECLARE resultado VARCHAR(15);
    
    SELECT nome_do_produto INTO nome FROM tabela_de_produtos WHERE codigo_do_produto = codigoProduto;
    SELECT preco_de_lista INTO preco FROM tabela_de_produtos WHERE codigo_do_produto = codigoProduto;
    
    IF preco < 7 THEN
		SET resultado = 'Barato';
	ELSEIF preco < 12 THEN
		SET resultado = 'Médio';
	ELSEIF preco IS NULL THEN
		SET resultado = 'Não cadastrado';
	ELSE
		SET resultado = 'Caro';
	END IF;
    
    SELECT codigoProduto,
    nome,
    CONCAT('R$ ', ROUND(preco, 2)) AS preco,
    resultado AS `status`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `retornaTipoSabor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `retornaTipoSabor`(codigoProduto VARCHAR(10))
BEGIN
	DECLARE saborProduto VARCHAR(20);
    DECLARE nomeProduto VARCHAR(50);
    DECLARE tipoSabor VARCHAR(10);
    
    SELECT sabor INTO saborProduto FROM tabela_de_produtos WHERE codigo_do_produto = codigoProduto;
    SELECT nome_do_produto INTO nomeProduto FROM tabela_de_produtos WHERE codigo_do_produto = codigoProduto;
    
    CASE saborProduto
    WHEN ('Lima/Limão') THEN
		SET tipoSabor = 'Cítrico';
    WHEN ('Laranja') THEN
		SET tipoSabor = 'Cítrico';
    WHEN ('Morango/Limão') THEN
		SET tipoSabor = 'Cítrico';
    WHEN ('Tangerina') THEN
		SET tipoSabor = 'Cítrico';
    WHEN ('Uva') THEN
		SET tipoSabor = 'Doce';
    WHEN ('Cereja/Maçã') THEN
		SET tipoSabor = 'Doce';
    WHEN ('Melancia') THEN
		SET tipoSabor = 'Doce';
    WHEN ('Açaí') THEN
		SET tipoSabor = 'Doce';
	ELSE 
		SET tipoSabor = 'Neutro';
	END CASE;
    
    SELECT codigoProduto AS `Código`,
		nomeProduto AS `Nome - Tamanho - Sabor`,
        tipoSabor AS `Tipo`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `retorna_quantidade_notas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `retorna_quantidade_notas`(data_nota DATE)
BEGIN
	DECLARE quantidadeNotas INT;
    
    SELECT COUNT(*) INTO quantidadeNotas FROM notas_fiscais WHERE YEAR(data_venda) = YEAR(data_nota);
    
    SELECT quantidadeNotas `quantidade notas`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `somaDiasVendas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `somaDiasVendas`(dataInicio DATE, dataFinal DATE)
BEGIN
	DECLARE dataInicial DATE;
    DECLARE contador, notas INTEGER;
    SET dataInicial = dataInicio;
    SET notas = 0;
    
    WHILE dataInicial <= dataFinal DO
		SELECT COUNT(*) INTO contador FROM notas_fiscais WHERE data_venda = dataInicial;
        IF contador > 0 THEN
			SET notas = notas + contador;
		END IF;
        SELECT ADDDATE(dataInicial, INTERVAL 1 DAY) INTO dataInicial;
	END WHILE;
    
    SELECT notas AS vendas,
		 DATE_FORMAT(dataInicio, '%d/%m/%Y') AS `data inicial`,
		 DATE_FORMAT(dataFinal, '%d/%m/%Y') AS `data final`,
         CONCAT(DATEDIFF(dataFinal, dataInicio), ' dias') AS periodo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `somaLimiteCredito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `somaLimiteCredito`()
BEGIN
	DECLARE limiteCliente, limiteTotal FLOAT DEFAULT 0;
    DECLARE fimCursor INT DEFAULT 0;
    DECLARE cValores CURSOR FOR SELECT limite_de_credito FROM tabela_de_clientes;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET fimCursor = 1;
        
	OPEN cValores;
		WHILE fimCursor = 0 DO
			FETCH cValores INTO limiteCliente;
            IF fimCursor = 0 THEN
				SET limiteTotal = limiteTotal + limiteCliente;
            END IF;
        END WHILE;
    CLOSE cValores;
    
    SELECT limiteTotal;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `testeCursor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `testeCursor`()
BEGIN
	DECLARE nomeCliente VARCHAR(50);
    DECLARE i INT DEFAULT 0;
    DECLARE cursorClientes CURSOR FOR SELECT nome FROM tabela_de_clientes LIMIT 5;
    
    OPEN cursorClientes;
		WHILE i < 5 DO
			FETCH cursorClientes INTO nomeCliente;
            SELECT nomeCliente;
            SET i = i + 1;
		END WHILE;
	CLOSE cursorClientes;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `testeCursor2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `testeCursor2`()
BEGIN
	DECLARE nomeCliente VARCHAR(50);
    DECLARE fimCursor INT DEFAULT 0;
    DECLARE cursorClientes CURSOR FOR SELECT nome FROM tabela_de_clientes LIMIT 5;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET fimCursor = 1;
    
    OPEN cursorClientes;
		WHILE fimCursor = 0 DO
			FETCH cursorClientes INTO nomeCliente;
			IF fimCursor = 0 THEN -- Para não repetir a última linha
				SELECT nomeCliente;
			END IF;
		END WHILE;
	CLOSE cursorClientes;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-08 21:46:29
