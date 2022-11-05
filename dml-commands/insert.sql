INSERT INTO produtos (
	codigo, descricao, sabor, tamanho, embalagem, preco)
VALUES (
	'104107', 'Light - 350 ml - Melancia', 'Melancia', '350 ml', 'Lata', 4.56);
    
INSERT INTO produtos (
	codigo, descricao, sabor, tamanho, embalagem, preco)
VALUES (
	'104108', 'Light - 350 ml - Graviola', 'Graviola', '350 ml', 'Lata', 4.00);
    
/*Quando sabemos a ordem correta dos campos não precisamos
informar o nome dos campos no insert, porém é sempre bom colocar*/
INSERT INTO produtos VALUES (
	'104109', 'Light - 350 ml - Açaí', 'Açaí', '350 ml', 'Lata', 5.60);

INSERT INTO produtos VALUES (
	'104110', 'Light - 350 ml - Jaca', 'Jaca', '350 ml', 'Lata', 6.00),
    ('104111', 'Light - 350 ml - Manga', 'Manga', '350 ml', 'Lata', 3.50);

INSERT INTO
	clientes (cpf, nome, data_nascimento, idade, sexo, cep, endereco, bairro, cidade, estado, limite_credito, volume_compra, primeira_compra)
 VALUES ('1471156710', 'Érica Carvalho', '1990-09-01', 27, 'F', '80012212', 'R. Iriquitia', 'Jardins', 'São Paulo', 'SP', 170000, 24500, 0),
 ('19290992743', 'Fernando Cavalcante', '2000-02-12', 18, 'M', '22000000', 'Rua Dois de Fevereiro',  'Água Santa', 'Rio de Janeiro', 'RJ', 100000, 20000, 1),
 ('2600586709', 'César Teixeira', '2000-03-12', 18, 'M', '22020001', 'Rua Conde de Bonfim', 'Tijuca', 'Rio de Janeiro', 'RJ', 120000, 22000, 0);
 
SELECT * FROM produtos;
SELECT * FROM clientes;