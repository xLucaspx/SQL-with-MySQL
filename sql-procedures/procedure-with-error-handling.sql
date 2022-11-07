DROP PROCEDURE IF EXISTS insert_produto;
DELIMITER $$
CREATE PROCEDURE insert_produto (
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
END $$
DELIMITER ;

CALL insert_produto (
	'838822',
    'Sabor da Serra - 1 Litro - Uva',
    'PET',
    '1 Litro',
    'Uva',
    6.95
);

SELECT * FROM tabela_de_produtos;