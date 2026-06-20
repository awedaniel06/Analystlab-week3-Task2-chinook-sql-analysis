-- ============================================================
-- 04_sales_trends.sql
-- Description : Monthly, quarterly, and yearly sales trends
--               using GROUP BY and window functions
-- Database    : Chinook (MySQL)
-- ============================================================


-- ── 1. Monthly Sales Revenue ─────────────────────────────────
-- Aggregates total sales grouped by month and year

SELECT
    MONTH(InvoiceDate) AS Month,
    YEAR(InvoiceDate)  AS Year,
    SUM(Total)         AS Month_Sales
FROM invoice
GROUP BY Month, Year
ORDER BY Year, Month;


-- ── 2. Yearly Sales Trend ────────────────────────────────────
-- Totals revenue for each calendar year

SELECT
    YEAR(InvoiceDate) AS Year,
    SUM(Total)        AS Year_Sales
FROM invoice
GROUP BY Year
ORDER BY Year;


-- ── 3. Month, Year & Quarter — Revenue Trend ─────────────────
-- Window functions compute rolling quarterly and yearly totals
-- alongside monthly sales

SELECT
    Month,
    Year,
    Quarter,
    Month_Sales,
    SUM(Month_Sales) OVER (PARTITION BY Year)          AS Year_Sales,
    SUM(Month_Sales) OVER (PARTITION BY Year, Quarter) AS Quarter_Sales
FROM (
    SELECT
        MONTH(InvoiceDate)   AS Month,
        YEAR(InvoiceDate)    AS Year,
        QUARTER(InvoiceDate) AS Quarter,
        SUM(Total)           AS Month_Sales
    FROM invoice
    GROUP BY Month, Year, Quarter
) subquery
GROUP BY Month, Year, Month_Sales, Quarter
ORDER BY Year, Quarter, Month;


-- ── 4. Month, Year & Quarter — Transaction Trend ─────────────
-- Same structure as above but counts transactions, not revenue

SELECT
    Month,
    Quarter,
    Year,
    Monthly_Transaction,
    SUM(Monthly_Transaction) OVER (PARTITION BY Year, Quarter) AS Quarterly_Transaction,
    SUM(Monthly_Transaction) OVER (PARTITION BY Year)          AS Yearly_Transaction
FROM (
    SELECT
        MONTH(InvoiceDate)   AS Month,
        YEAR(InvoiceDate)    AS Year,
        QUARTER(InvoiceDate) AS Quarter,
        COUNT(*)             AS Monthly_Transaction
    FROM invoice
    GROUP BY Month, Year, Quarter
) subquery
GROUP BY Month, Year, Monthly_Transaction, Quarter
ORDER BY Year, Quarter, Month;
