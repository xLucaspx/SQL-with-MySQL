UPDATE tbproduto 
SET 
    embalagem = 'Lata',
    preco_lista = 2.46
WHERE
    produto = '544931';

UPDATE tbProduto SET embalagem = 'Garrafa' WHERE produto = '1078680';

UPDATE tbProduto SET sabor = 'Cítrico' WHERE sabor = 'Limão';

SELECT * FROM tbProduto;