CREATE TABLE dim_customer AS (
SELECT
    customer_id,
    customer_unique_id,
    customer_city,
    customer_state,
    CASE customer_state
	    WHEN 'AC' THEN 'Acre'
	    WHEN 'AL' THEN 'Alagoas'
	    WHEN 'AP' THEN 'Amapa'
	    WHEN 'AM' THEN 'Amazonas'
	    WHEN 'BA' THEN 'Bahia'
	    WHEN 'CE' THEN 'Ceara'
	    WHEN 'DF' THEN 'Distrito Federal'
	    WHEN 'ES' THEN 'Espirito Santo'
	    WHEN 'GO' THEN 'Goias'
	    WHEN 'MA' THEN 'Maranhao'
	    WHEN 'MT' THEN 'Mato Grosso'
	    WHEN 'MS' THEN 'Mato Grosso do Sul'
	    WHEN 'MG' THEN 'Minas Gerais'
	    WHEN 'PA' THEN 'Para'
	    WHEN 'PB' THEN 'Paraiba'
	    WHEN 'PR' THEN 'Parana'
	    WHEN 'PE' THEN 'Pernambuco'
	    WHEN 'PI' THEN 'Piaui'
	    WHEN 'RJ' THEN 'Rio de Janeiro'
	    WHEN 'RN' THEN 'Rio Grande do Norte'
	    WHEN 'RS' THEN 'Rio Grande do Sul'
	    WHEN 'RO' THEN 'Rondonia'
	    WHEN 'RR' THEN 'Roraima'
	    WHEN 'SC' THEN 'Santa Catarina'
	    WHEN 'SP' THEN 'Sao Paulo'
	    WHEN 'SE' THEN 'Sergipe'
	    WHEN 'TO' THEN 'Tocantins'
	    ELSE 'Unknown'
	END state_name,
    customer_zip_code_prefix
FROM
	customers_dataset
);

ALTER TABLE dim_customer
ADD PRIMARY KEY (customer_id);