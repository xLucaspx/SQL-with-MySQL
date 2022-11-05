UPDATE produtos SET preco = 5 WHERE codigo = '1000889';

UPDATE produtos SET
	descricao = 'Sabor da Montanha - 1 Litro - Uva',
    embalagem = 'PET',
    tamanho = '1 Litro'
WHERE codigo = 1000889;

UPDATE clientes SET
	cep = '01415000',
	endereco = 'R. Bela Cintra, 551',
    bairro = 'Consolação',
    cidade = 'São Paulo',
    estado = 'SP'
WHERE cpf = '19290992743';

/*Aumentando o preço dos produtos sabor maracujá em 10%:*/
UPDATE produtos SET
	preco = preco * 1.10
WHERE sabor = 'maracuja';