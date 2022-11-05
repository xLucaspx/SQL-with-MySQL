UPDATE tbVendedores SET percentual_comissao = 0.11 WHERE matricula = '00236';

UPDATE tbVendedores SET nome = 'José Geraldo da Fonseca Júnior' WHERE matricula = '00233';

UPDATE tbVendedores SET data_admissao = '2014-08-15' WHERE matricula = '00233';
UPDATE tbVendedores SET data_admissao = '2013-09-17' WHERE matricula = '00235';
UPDATE tbVendedores SET data_admissao = '2017-03-18' WHERE matricula = '00236';

UPDATE tbVendedores SET de_ferias = 0 WHERE matricula = '00233';
UPDATE tbVendedores SET de_ferias = 1 WHERE matricula = '00235';
UPDATE tbVendedores SET de_ferias = 1 WHERE matricula = '00236';

SELECT * FROM tbVendedores;