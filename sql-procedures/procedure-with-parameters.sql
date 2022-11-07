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
END $$
DELIMITER ;

CALL insert_produto (
	'30001037',
    'Sabor da Serra - 700 ml - Manga',
    'Garrafa',
    '700 ml',
    'Manga',
    6.00
);

SELECT * FROM tabela_de_produtos;

DROP PROCEDURE IF EXISTS atualiza_comissao;

DELIMITER $$
CREATE PROCEDURE atualiza_comissao (percentual FLOAT)
BEGIN
	UPDATE tabela_de_vendedores SET percentual_comissao = ROUND(percentual_comissao * (1 + percentual), 2);
END $$
DELIMITER ;

CALL atualiza_comissao(0.075);

SELECT * FROM tabela_de_vendedores;
