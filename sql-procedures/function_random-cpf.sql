DROP FUNCTION IF EXISTS retornaCpfClienteAleatorio;

DELIMITER $$
CREATE FUNCTION retornaCpfClienteAleatorio()
RETURNS VARCHAR(11)
BEGIN
	DECLARE maxClientes, i INT;
    DECLARE cpfCliente VARCHAR(11);
    
    SELECT COUNT(*) INTO maxClientes FROM tabela_de_clientes; -- Pegando número de linhas da tabela
    SELECT retornaNumeroAleatorio(0, (maxClientes - 1)) INTO i; -- -1 para evitar retornos NULL
	SELECT cpf INTO cpfCliente FROM tabela_de_clientes LIMIT i, 1; -- Pega o primeiro elemento depois de i
    
    RETURN cpfCliente;
END $$
DELIMITER ;

SELECT retornaCpfClienteAleatorio() AS cpf;