INSERT INTO produtos (codigo, descricao, sabor, tamanho, embalagem, preco)
     VALUES ('1001001','Sabor dos Alpes 700 ml - Manga','Manga','700 ml','Garrafa',7.50),
         ('1001000','Sabor dos Alpes 700 ml - Melão','Melão','700 ml','Garrafa',7.50),
         ('1001002','Sabor dos Alpes 700 ml - Graviola','Graviola','700 ml','Garrafa',7.50),
         ('1001003','Sabor dos Alpes 700 ml - Tangerina','Tangerina','700 ml','Garrafa',7.50),
         ('1001004','Sabor dos Alpes 700 ml - Abacate','Abacate','700 ml','Garrafa',7.50),
         ('1001005','Sabor dos Alpes 700 ml - Açai','Açai','700 ml','Garrafa',7.50),
         ('1001006','Sabor dos Alpes 1 Litro - Manga','Manga','1 Litro','Garrafa',7.50),
         ('1001007','Sabor dos Alpes 1 Litro - Melão','Melão','1 Litro','Garrafa',7.50),
         ('1001008','Sabor dos Alpes 1 Litro - Graviola','Graviola','1 Litro','Garrafa',7.50),
         ('1001009','Sabor dos Alpes 1 Litro - Tangerina','Tangerina','1 Litro','Garrafa',7.50),
         ('1001010','Sabor dos Alpes 1 Litro - Abacate','Abacate','1 Litro','Garrafa',7.50),
         ('1001011','Sabor dos Alpes 1 Litro - Açai','Açai','1 Litro','Garrafa',7.50);
         
SELECT * FROM produtos WHERE descricao LIKE 'sabor dos alpes%';

DELETE FROM produtos WHERE tamanho = '1 Litro' AND descricao LIKE 'sabor dos alpes%';

DELETE FROM produtos
WHERE codigo NOT IN (
	SELECT codigo_do_produto
    FROM sucos_vendas.tabela_de_produtos
);

/*Deletando as notas fiscais de clientes com menos de 18 anos: */
DELETE N FROM notas_fiscais N
        INNER JOIN
    clientes C ON C.data_nascimento < DATE_SUB(NOW(), INTERVAL 18 YEAR);