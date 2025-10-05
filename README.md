# 🧾 Sales Data Pipeline using Delta Live Tables on Databricks

This project demonstrates the implementation of an end-to-end **OLAP-style data pipeline** using the **Databricks Lakehouse Platform**. The pipeline is structured using the **medallion architecture** — moving data across **Bronze**, **Silver**, and **Gold** layers — to support clean, real-time, and queryable sales insights.

---

## 🗺️ Data Flow Architecture

![Sales Data Pipeline](https://github.com/BenDatta/sales-data-modelling-OLAP--Databricks/blob/main/Data%20Flow%20For%20Sales%20Data.png)

---

## 🥉 Bronze Layer – Raw Data Ingestion

This is the initial ingestion layer where raw data from the cloud landing zone is brought into the Lakehouse via streaming.

Key characteristics:
- **No transformations** are applied
- Tables are created using **Autoloader (`cloud_files`)**
- Handles CSV-formatted files from various sources

**Ingested tables**:
- `fact_sales`
- `dim_customers`
- `dim_products`
- `dim_regions`

Each table is treated as a streaming source, enabling continuous updates and scalability from file drops.

---

## 🥈 Silver Layer – Data Cleaning & Enrichment

The Silver layer handles structured cleaning and enrichment of the raw Bronze data.

Key actions:
- Casts and normalizes all data types (e.g. dates, strings, booleans)
- Applies field-level validation using DLT constraints (e.g. `NOT NULL`)
- Joins `fact_sales` with `customers`, `products`, and `regions`
- Creates a curated table called `cleaned_sales_data` as a materialized view

This central curated dataset forms the foundation for all downstream analytics.

---

## 🥇 Gold Layer – Aggregated KPIs & Analytics

The Gold layer focuses on **business logic** and **analytical reporting** through precomputed views.

**Materialized views** created:
1. **Category Sales Summary**  
   - Aggregates total revenue per product category by year.

2. **Customer Lifetime Value**  
   - Calculates total and average revenue per customer, and number of purchase days.

3. **Revenue by Customer and Region**  
   - Identifies the top 5 customers by revenue in each region using window functions.

These views power OLAP-style queries and dashboards for insights into performance, segmentation, and trends.

---

## 🛠 Tools & Skills Used

| Tool / Skill          | Description                                                 |
|------------------------|-------------------------------------------------------------|
| **Databricks**         | Unified platform for building and scaling data pipelines    |
| **Delta Live Tables**  | Automated ETL/ELT orchestration and streaming pipeline logic |
| **Delta Lake**         | ACID-compliant storage layer for streaming and batch data   |
| **SQL**                | Used throughout for transformations, joins, and aggregations |
| **Autoloader**         | For efficient streaming ingestion of raw cloud files         |
| **Medallion Architecture** | Bronze → Silver → Gold modeling for layered transformations |
| **DLT Expectations**   | Applied for data quality enforcement                         |
| **Window Functions**   | Used in ranking and aggregation logic (e.g. top customers)   |

---

## 💡 Summary

This project implements a scalable and modular **streaming data pipeline** using Databricks and Delta Live Tables. It cleanly separates raw ingestion, data curation, and business insights across dedicated layers, while ensuring **data quality, reusability, and performance**.

The result is a production-ready OLAP system for sales analysis that supports:
- Real-time updates
- Cleaned, enriched data views
- Powerful KPI aggregation

---
