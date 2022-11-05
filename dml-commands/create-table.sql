CREATE DATABASE IF NOT EXISTS vendas_sucos;
USE vendas_sucos;

CREATE TABLE produtos (
    codigo VARCHAR(10) PRIMARY KEY,
    descritor VARCHAR(100),
    sabor VARCHAR(50),
    tamanho VARCHAR(50),
    embalagem VARCHAR(50),
    preco FLOAT
);

CREATE TABLE vendedores (
    matricula VARCHAR(5) PRIMARY KEY,
    nome VARCHAR(100),
    bairro VARCHAR(50),
    comissao FLOAT,
    data_admissao DATE,
    ferias BIT(1)
);

CREATE TABLE notas_fiscais (
    numero VARCHAR(5) PRIMARY KEY,
    data_venda DATE NOT NULL,
    cpf_cliente VARCHAR(11) NOT NULL,
    matricula_vendedor VARCHAR(5) NOT NULL,
    imposto FLOAT,
    KEY cpf_cliente (cpf_cliente),
    KEY matricula_vendedor (matricula_vendedor),
    CONSTRAINT FK_cliente FOREIGN KEY (cpf_cliente)
        REFERENCES clientes (cpf),
    CONSTRAINT FK_vendedor FOREIGN KEY (matricula_vendedor)
        REFERENCES vendedores (matricula)
);

CREATE TABLE itens_notas (
    numero VARCHAR(5) NOT NULL,
    codigo_produto VARCHAR(10) NOT NULL,
    quantidade INT,
    preco FLOAT,
    PRIMARY KEY (numero , codigo_produto),
    KEY codigo_produto (codigo_produto),
    CONSTRAINT FK_numero_nota FOREIGN KEY (numero)
        REFERENCES notas_fiscais (numero),
    CONSTRAINT FK_codigo_produto FOREIGN KEY (codigo_produto)
        REFERENCES produtos (codigo)
);