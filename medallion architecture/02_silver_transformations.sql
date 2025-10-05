-- Fact Sales Data Cleaning
CREATE STREAMING LIVE TABLE `02_silver`.fact_sales
COMMENT 'Fact sales data Cleaning'
AS 
SELECT
    CAST(sale_id AS INT) AS sale_id,
    to_date(order_date,'dd/mm/yyyy') AS order_date,
    CAST(customer_id AS INT) AS customer_id,
    CAST(product_id AS INT) AS product_id,
    CAST(quantity AS INT) AS quantity,
    CAST(discount AS INT)AS discount,
    CAST(region_id AS INT) AS region_id,
    CAST(channel AS STRING) AS channel,
    CAST(promo_code AS STRING) AS promo_code
FROM 
    STREAM(lakeflow_dlt_uc.01_bronze.fact_sales);

-- Customers Data Cleaning
CREATE STREAMING LIVE TABLE `02_silver`.customers
COMMENT 'Customers data Cleaning'
AS 
SELECT
    CAST(customer_id AS INT) AS customer_id,
    CAST(first_name AS STRING) AS first_name,
    CAST(last_name AS STRING) AS last_name,
    CAST(email AS STRING) AS email,
    to_date(join_date,'dd/mm/yyyy') AS join_date,
    CAST(vip AS boolean) AS vip
FROM
    STREAM(lakeflow_dlt_uc.01_bronze.customers);

-- products Data Cleaning
CREATE STREAMING LIVE TABLE `02_silver`.products
COMMENT 'products data Cleaning'
AS 
SELECT
    CAST(product_id AS INT) AS product_id,
    CAST(product_name AS STRING) AS product_name,
    CAST(category AS STRING) AS category,
    CAST(price AS INT) AS price,
    CAST(in_stock AS INT) AS in_stock
FROM 
    STREAM(lakeflow_dlt_uc.01_bronze.products);

-- Regions Data Cleaning
CREATE STREAMING LIVE TABLE `02_silver`.regions
COMMENT 'Regions data Cleaning'
AS 
SELECT
    CAST(region_id AS INT) AS region_id,
    CAST(region_name AS STRING) AS region_name,
    CAST(country AS STRING) AS country
FROM 
    STREAM(lakeflow_dlt_uc.01_bronze.regions);