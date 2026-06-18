CREATE TABLE dim_date AS (
SELECT
    d::DATE AS date_key,
    EXTRACT(YEAR FROM d) AS year,
    EXTRACT(QUARTER FROM d) AS quarter,
    EXTRACT(MONTH FROM d) AS month_number,
    TO_CHAR(d, 'Month') AS month_name,
    TO_CHAR(d, 'Mon') AS month_short,
    TO_CHAR(d, 'YYYY-MM') AS year_month,
    EXTRACT(WEEK FROM d) AS week_number,
    (EXTRACT(YEAR FROM d) * 100 + EXTRACT(MONTH FROM d)) AS year_month_sort
FROM
	generate_series(DATE '2016-01-01', DATE '2018-12-31', INTERVAL '1 day') AS d
);

ALTER TABLE dim_date
ADD PRIMARY KEY (date_key);