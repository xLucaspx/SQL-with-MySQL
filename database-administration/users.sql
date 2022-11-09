-- Sintaxe para criar um usuário:
CREATE USER 'username'@'server' IDENTIFIED BY 'password';
-- O valor '%' para a propriedade 'server' significa que o usuário pode acessar a base de qualquer lugar

-- Comando para criar um usuário administrador:
CREATE USER 'admin02'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON *.* TO 'admin02'@'localhost' WITH GRANT OPTION;

-- Comandos para criar usuários comuns:
CREATE USER 'user01'@'localhost' IDENTIFIED BY 'user';
GRANT SELECT, INSERT, UPDATE, DELETE,
	CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE
ON *.* TO 'user'@'localhost';

-- Comandos para criar usuários para somente leitura:
CREATE USER 'readOnly'@'localhost' IDENTIFIED BY 'user';
GRANT SELECT, EXECUTE ON *.* TO 'readOnly'@'localhost';

-- Comando para criar um usuário com acesso limitado a um schema: 
CREATE USER 'user02'@'%' IDENTIFIED BY 'user';
GRANT SELECT, INSERT, UPDATE, DELETE,
	CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE
ON sucos_vendas.* TO 'user02'@'localhost';

-- Comando para criar um usuário com acesso limitado a tabelas:
CREATE USER 'user03'@'%' IDENTIFIED BY 'user';
GRANT SELECT, INSERT, UPDATE, DELETE
ON sucos_vendas.tabela_de_clientes TO 'user03'@'localhost';
GRANT SELECT ON sucos_vendas.tabela_de_produtos TO 'user03'@'localhost';

-- Comandos para criar um usuário que faz backup dos bancos:
CREATE USER 'backup'@'localhost' IDENTIFIED BY 'user';
GRANT SELECT, RELOAD, LOCK TABLES, REPLICATION CLIENT ON *.* TO 'backup'@'localhost';

-- Mostra tabela de usuários:
SELECT * FROM mysql.user;

-- Mostra privilégios do usuário:
SHOW GRANTS FOR 'user01'@'localhost';

-- Revoga todos os privilégios de um usuário:
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user01';

/* Para alterar os privilégios de um usuário, devemos revogar todos
com o comando acima e depois conceder apenas os desejados */

-- Comando para apagar um usuário (neste caso o usuário root):
DROP USER 'root'@'localhost';