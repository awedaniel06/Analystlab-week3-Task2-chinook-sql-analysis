-- ============================================================
-- 02_revenue_metrics.sql
-- Description : Total revenue and average sales per transaction
-- Database    : Chinook (MySQL)
-- ============================================================


-- ── 1. Total Revenue ─────────────────────────────────────────
-- Sums all invoice totals across the entire business history

SELECT SUM(Total) AS Revenue
FROM invoice;


-- ── 2. Average Sales per Transaction ─────────────────────────
-- Divides total revenue by number of invoices

SELECT SUM(Total) / COUNT(*) AS Average_Sales_Value
FROM invoice;
