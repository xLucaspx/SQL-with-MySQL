ALTER TABLE tbCliente ADD COLUMN (data_nascimento DATE);

ALTER TABLE tbVendedores ADD COLUMN (data_admissao DATE);
ALTER TABLE tbVendedores ADD COLUMN (de_ferias BIT(1));