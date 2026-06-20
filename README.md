# 🎵 Chinook Music Store — SQL Analysis

![SQL](https://img.shields.io/badge/Language-SQL-blue?style=flat-square&logo=mysql)
![Database](https://img.shields.io/badge/Database-MySQL-orange?style=flat-square&logo=mysql)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen?style=flat-square)

A structured SQL analysis of the **Chinook Music Store** database, covering revenue metrics, sales trends, customer intelligence, and geographic performance.

---

## 📁 Repository Structure

```
chinook-sql-analysis/
│
├── queries/
│   ├── 01_data_overview.sql          # Customer & Invoice table exploration
│   ├── 02_revenue_metrics.sql        # Total revenue, average transaction value
│   ├── 03_transaction_analysis.sql   # Count, active years, per-year breakdown
│   ├── 04_sales_trends.sql           # Monthly, quarterly, yearly trends
│   ├── 05_customer_analysis.sql      # Segments, top customers, non-purchasers
│   └── 06_geographic_analysis.sql    # Revenue & transactions by country
│
├── reports/
│   └── SQL_Analysis_Report.docx      # Full formatted report with tables
│
├── assets/
│   └── schema.png                    # (Add your Chinook ERD here)
│
└── README.md
```

---

## 🗄️ Database

This project uses the [Chinook database](https://github.com/lerocha/chinook-database) — a sample database representing a digital music store with tables for customers, invoices, tracks, artists, and more.

**Key tables used:**
| Table | Description |
|-------|-------------|
| `customer` | Customer records including name, country, and contact info |
| `invoice` | Sales transactions with date, billing country, and total |

---

## 📊 Analysis Sections

### 1. Data Overview
- Full customer table scan
- Full invoice table scan

### 2. Revenue Metrics
- Total revenue (`SUM`)
- Average sales per transaction

### 3. Transaction Analysis
- Total transaction count
- Number of active business years
- Transactions broken down per year

### 4. Sales Trends
- Monthly revenue by month and year
- Yearly revenue trend
- Month/Quarter/Year revenue using **window functions** (`OVER`, `PARTITION BY`)
- Month/Quarter/Year transaction count using window functions

### 5. Customer Analysis
- Total customer count
- Average revenue per customer (JOIN)
- Top customers ranked by total spend
- Customer segmentation: **New** vs **Returning**
- Customers who have **never made a purchase** (LEFT JOIN + NULL check)

### 6. Geographic Analysis
- Revenue ranked by billing country (`ROW_NUMBER`)
- Transaction count ranked by billing country

---

## ▶️ How to Run

1. Import the Chinook database into your MySQL instance:
   ```sql
   SOURCE chinook.sql;
   ```

2. Select the database:
   ```sql
   USE chinook;
   ```

3. Run any query file:
   ```sql
   SOURCE queries/01_data_overview.sql;
   ```

---

## 🛠️ Tools Used

- **MySQL** — Query execution
- **MySQL Workbench** — Query editor and ERD viewer
- **Microsoft Word** — Report formatting

---

## 📄 License

This project is for educational and portfolio purposes. The Chinook database is open-source under the [MIT License](https://github.com/lerocha/chinook-database/blob/master/LICENSE.md).
