START TRANSACTION;

UPDATE vendedores SET
	comissao = ROUND(comissao * 1.15, 2);

/*Desfaz as alterações:*/    
ROLLBACK;
/*Confirma as alterações:*/
COMMIT;