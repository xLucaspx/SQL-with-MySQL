CREATE TABLE padrao (
id INT PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR(20),
endereco VARCHAR(100),
cidade VARCHAR(50) DEFAULT 'Rio de Janeiro',
data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

INSERT INTO padrao (descricao, endereco, cidade)
VALUES ('Cliente X', 'Rua Direta', 'Olinda');

INSERT INTO padrao (descricao, endereco)
VALUES ('Cliente Y', 'R. Primeiro de Março');

SELECT * FROM padrao;