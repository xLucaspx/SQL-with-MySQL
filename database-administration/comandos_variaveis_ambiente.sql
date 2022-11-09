LOCK INSTANCE FOR BACKUP; -- Tranca o banco para fazer backup
UNLOCK INSTANCE; -- Destranca o banco

SHOW STATUS;

SHOW GLOBAL STATUS LIKE 'created_tmp_disk_tables'; -- Variáveis temporárias criadas em disco
SHOW GLOBAL STATUS LIKE 'created_tmp_tables'; -- Variáveis temporárias criadas em memória

SHOW GLOBAL VARIABLES LIKE 'tmp_table_size'; -- Tamenho disponível para tabelas temporárias na memória

SHOW VARIABLES WHERE variable_name LIKE '%dir';

SHOW ENGINES;
