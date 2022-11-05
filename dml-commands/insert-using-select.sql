USE vendas_sucos;
SELECT 
    CODIGO_DO_PRODUTO AS codigo,
    NOME_DO_PRODUTO AS descricao,
    EMBALAGEM AS embalagem,
    TAMANHO AS tamanho,
    SABOR AS sabor,
    PRECO_DE_LISTA AS preco
FROM
    sucos_vendas.tabela_de_produtos
WHERE
CODIGO_DO_PRODUTO NOT IN (SELECT codigo FROM produtos);

/*Os alias e a ordem dos campos tem que ser as mesmas na
consulta e na tabela em que os dados serão inseridos*/
INSERT INTO produtos
	SELECT 
		CODIGO_DO_PRODUTO AS codigo,
		NOME_DO_PRODUTO AS descricao,
		SABOR AS sabor,
		TAMANHO AS tamanho,
		EMBALAGEM AS embalagem,
		PRECO_DE_LISTA AS preco
FROM
    sucos_vendas.tabela_de_produtos
WHERE
    CODIGO_DO_PRODUTO NOT IN (
    SELECT codigo FROM produtos);

INSERT INTO clientes 
	(cpf, nome, data_nascimento, sexo, cep, endereco, bairro, cidade, estado, limite_credito, volume_compra, primeira_compra)
SELECT cpf, nome,
data_de_nascimento AS data_nascimento,
sexo, cep, 
endereco_1 AS endereco,
bairro, cidade, estado,
limite_de_credito AS limite_credito,
volume_de_compra AS volume_compra,
primeira_compra
FROM sucos_vendas.tabela_de_clientes
WHERE CPF NOT IN (SELECT cpf FROM clientes);