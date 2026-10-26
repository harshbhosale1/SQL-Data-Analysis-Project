# SQL Data Analysis Project

## Project Overview
This project demonstrates SQL skills by querying sales and product data to explore revenue, profit, quantity sold, customer information, monthly sales trends, and product performance.

The SQL script defines two tables (`sales` and `products`) and includes example queries for data retrieval, filtering, aggregation, joins, date-based analysis, and conditional logic.

## Database
- **SQL dialect:** PostgreSQL
- **Tables:** `sales`, `products`

### `sales` table
| Column | Data type | Description |
|---|---|---|
| `order_id` | INTEGER | Order identifier |
| `customer_name` | VARCHAR(100) | Customer name |
| `order_date` | DATE | Date of order |
| `category` | VARCHAR(100) | Product category |
| `subcategory` | VARCHAR(100) | Product subcategory |
| `product` | VARCHAR(200) | Product name |
| `quantity` | INTEGER | Quantity sold |
| `sales` | NUMERIC(12,2) | Sales amount |
| `profit` | NUMERIC(12,2) | Profit amount |
| `region` | VARCHAR(100) | Sales region |

### `products` table
| Column | Data type | Description |
|---|---|---|
| `order_id` | INTEGER | Order identifier used in the example join |
| `category` | VARCHAR(100) | Product category |
| `subcategory` | VARCHAR(100) | Product subcategory |
| `product_name` | VARCHAR(200) | Product name |
| `unit_price` | NUMERIC(12,2) | Unit price |

## SQL Concepts Demonstrated
- Creating tables with `CREATE TABLE`
- Retrieving records with `SELECT`
- Selecting specific columns and using aliases
- Removing duplicate rows with `DISTINCT`
- Filtering with `WHERE`, `LIKE`, and `BETWEEN`
- Sorting and limiting results with `ORDER BY` and `LIMIT`
- Aggregations using `SUM`, `AVG`, and `COUNT`
- Grouping with `GROUP BY` and filtering groups with `HAVING`
- Joining tables with `LEFT JOIN` and `JOIN`
- Monthly sales analysis using `DATE_TRUNC`
- Conditional categorization using `CASE`
- Revenue, profit, quantity, customer, and product-performance analysis

## Queries Included
1. Display all sales records.
2. Select customer, product, and profit columns.
3. Find customers whose names start with `A`.
4. Filter Furniture sales between 500 and 2,000.
5. Retrieve the five highest-sales records.
6. Calculate total quantity by category.
7. Calculate sales by category and subcategory.
8. Calculate total sales, profit, and quantity.
9. Calculate average sales and average profit.
10. Count total records and unique customers.
11. Find products with total sales greater than 2,000.
12. Calculate monthly sales.
13. Display product records.
14. Combine sales and product details using a left join.
15. Categorize regions using `CASE`.
16. Generate a product performance report using `CASE`.

## How to Run
1. Create a PostgreSQL database, for example `sql_data_analysis`.
2. Open the SQL file in pgAdmin, DBeaver, VS Code with a PostgreSQL extension, or another PostgreSQL client.
3. Run the `CREATE TABLE` statements.
4. Import or insert data into both tables.
5. Execute the analysis queries individually or in sections.

**Important:** The script creates table structures but does not include source data or `INSERT` statements. Queries will return no data until records are loaded.

## Notes
- The script uses PostgreSQL's `DATE_TRUNC()` function.
- The `sales` and `products` examples join on `order_id`. If an order can contain multiple products, joining only on `order_id` may produce multiple matches; use the appropriate product/order-line key if your actual dataset has one.
- `unit_price` is stored in the `products` table, while sales and profit values are stored in `sales`.

## Repository Structure
```text
sql-data-analysis/
├── README.md
└── sql_queries.sql
```

## Skills Demonstrated
SQL querying, data aggregation, data filtering, joins, date-based analysis, conditional logic, and business-oriented sales analysis.
