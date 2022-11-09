ALTER TABLE notas_fiscais ADD INDEX (data_venda);
ALTER TABLE notas_fiscais DROP INDEX data_venda;

/* Query cost:
- sem index: 8849.05
- com index: 60.28 */

SELECT * FROM notas_fiscais WHERE data_venda = '2017-01-01';

