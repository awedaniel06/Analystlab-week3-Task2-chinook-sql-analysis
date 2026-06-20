-- ============================================================
-- 03_transaction_analysis.sql
-- Description : Transaction counts — total, by year, active years
-- Database    : Chinook (MySQL)
-- ============================================================


-- ── 1. Total Number of Sales Transactions ────────────────────
-- Counts every invoice row

SELECT COUNT(*) AS Transaction_Count
FROM invoice;


-- ── 2. Total Number of Active Years ──────────────────────────
-- Counts distinct years present in invoice dates

SELECT COUNT(DISTINCT YEAR(InvoiceDate)) AS Total_Number_of_Years
FROM invoice;


-- ── 3. Transactions per Year ─────────────────────────────────
-- Breaks down how many transactions occurred each year

SELECT
    YEAR(InvoiceDate) AS Year,
    COUNT(YEAR(InvoiceDate)) AS Transaction_Count
FROM invoice
GROUP BY YEAR(InvoiceDate)
ORDER BY Year;
