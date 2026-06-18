CREATE TABLE fact_sales AS (
WITH reviews AS (
    SELECT
        order_id,
        review_score,
        ROW_NUMBER() OVER (
            PARTITION BY order_id
            ORDER BY review_answer_timestamp DESC
        ) AS rn
    FROM order_reviews_dataset
)
SELECT
    o.order_id,
    oi.order_item_id,
    o.customer_id,
    c.customer_unique_id,
    oi.product_id,
    oi.seller_id,
    CAST(o.order_purchase_timestamp AS DATE) AS order_date,
    o.order_status,
    o.order_purchase_timestamp,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,
    oi.price,
    oi.freight_value,
    r.review_score
FROM
	orders_dataset AS o
INNER JOIN
	order_items_dataset AS oi ON o.order_id = oi.order_id
INNER JOIN
	customers_dataset AS c ON o.customer_id = c.customer_id
LEFT JOIN
	reviews AS r ON o.order_id = r.order_id AND r.rn = 1
);