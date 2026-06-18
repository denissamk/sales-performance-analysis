CREATE TABLE fact_payments AS (
SELECT
    o.order_id,
    CAST(o.order_purchase_timestamp AS DATE) AS order_date,
    op.payment_type,
    op.payment_installments,
    op.payment_value
FROM
	orders_dataset AS o
JOIN
	order_payments_dataset AS op ON o.order_id = op.order_id
);