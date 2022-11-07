DROP FUNCTION IF EXISTS retornaCodigoProdutoAleatorio;

DELIMITER $$
CREATE FUNCTION retornaCodigoProdutoAleatorio()
RETURNS VARCHAR(10)
BEGIN
	DECLARE maxProdutos, i INT;
    DECLARE codigo VARCHAR(11);
    
    SELECT COUNT(*) INTO maxProdutos FROM tabela_de_produtos; -- Pegando número de linhas da tabela
    SELECT retornaNumeroAleatorio(0, (maxProdutos - 1)) INTO i; -- -1 para evitar retornos NULL
	SELECT codigo_do_produto INTO codigo FROM tabela_de_produtos LIMIT i, 1; -- Pega o primeiro elemento depois de i
    
    RETURN codigo;
END $$
DELIMITER ;

SELECT retornaCodigoProdutoAleatorio() AS codigo;

DROP FUNCTION IF EXISTS retornaMatriculaVendedorAleatorio;

DELIMITER $$
CREATE FUNCTION retornaMatriculaVendedorAleatorio()
RETURNS VARCHAR(5)
BEGIN
	DECLARE maxVendedores, i INT;
    DECLARE matriculaVendedor VARCHAR(11);
    
    SELECT COUNT(*) INTO maxVendedores FROM tabela_de_vendedores; -- Pegando número de linhas da tabela
    SELECT retornaNumeroAleatorio(0, (maxVendedores - 1)) INTO i; -- -1 para evitar retornos NULL
	SELECT matricula INTO matriculaVendedor FROM tabela_de_vendedores LIMIT i, 1; -- Pega o primeiro elemento depois de i
    
    RETURN matriculaVendedor;
END $$
DELIMITER ;

SELECT retornaMatriculaVendedorAleatorio() AS codigo;