DELIMITER $$
CREATE TRIGGER TG_calcula_faturamento_insert AFTER INSERT ON itens_notas_fiscais
FOR EACH ROW BEGIN
	CALL atualizaTabFaturamento();
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER TG_calcula_faturamento_update AFTER UPDATE ON itens_notas_fiscais
FOR EACH ROW BEGIN
	CALL atualizaTabFaturamento();
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER TG_calcula_faturamento_delete AFTER DELETE ON itens_notas_fiscais
FOR EACH ROW BEGIN
	CALL atualizaTabFaturamento();
END $$
DELIMITER ;