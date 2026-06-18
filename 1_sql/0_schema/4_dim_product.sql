CREATE TABLE dim_product AS (
SELECT
    p.product_id,
	COALESCE(pcn.product_category_name_english, 'Unknown') AS product_category,
	p.product_name_lenght,
    p.product_description_lenght,
    p.product_photos_qty,
    p.product_weight_g,
    p.product_length_cm,
    p.product_height_cm,
    p.product_width_cm
FROM
	products_dataset AS p
LEFT JOIN
	product_category_name_translation AS pcn ON p.product_category_name = pcn.product_category_name
);

ALTER TABLE dim_product
ADD PRIMARY KEY (product_id);