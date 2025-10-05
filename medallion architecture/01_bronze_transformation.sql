-- Read all fact_sales files into the bronze schema 
CREATE STREAMING LIVE TABLE `01_bronze`.fact_sales
COMMENT "Raw fact sales from volumne to bronze schema"
AS 
SELECT * FROM cloud_files(
  '/Volumes/lakeflow_dlt_uc/00_landing_zone/fact_and_dimensions_files/fact_sales/', 'csv',
  map('headers', 'true')
);

-- Read all product files into the bronze schema 
CREATE STREAMING LIVE TABLE `01_bronze`.products
COMMENT "Raw dim_product from volumne to bronze schema"
AS 
SELECT * FROM cloud_files(
  '/Volumes/lakeflow_dlt_uc/00_landing_zone/fact_and_dimensions_files/dim_products/', 'csv',
  map('headers', 'true')
);

-- Read all dim_regions files into the bronze schema 
CREATE STREAMING LIVE TABLE `01_bronze`.regions
COMMENT "Raw dim_regions from volumne to bronze schema"
AS 
SELECT * FROM cloud_files(
  '/Volumes/lakeflow_dlt_uc/00_landing_zone/fact_and_dimensions_files/dim_regions/', 'csv',
  map('headers', 'true')
);

-- Read all dim_customers files into the bronze schema 
CREATE STREAMING LIVE TABLE `01_bronze`.customers
COMMENT "Raw dim_customers from volumne to bronze schema"
AS 
SELECT * FROM cloud_files(
  '/Volumes/lakeflow_dlt_uc/00_landing_zone/fact_and_dimensions_files/dim_customers/', 'csv',
  map('headers', 'true')
);