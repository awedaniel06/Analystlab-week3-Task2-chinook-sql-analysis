-- ============================================================
-- 06_geographic_analysis.sql
-- Description : Revenue and transaction volume ranked by country
-- Database    : Chinook (MySQL)
-- ============================================================


-- ── 1. Revenue by Country ─────────────────────────────────────
-- ROW_NUMBER assigns a rank ordered by highest revenue

SELECT
    ROW_NUMBER() OVER (ORDER BY SUM(Total) DESC) AS "S/N",
    BillingCountry,
    SUM(Total) AS Revenue
FROM invoice
GROUP BY BillingCountry
ORDER BY Revenue DESC;


-- ── 2. Transactions by Country ───────────────────────────────
-- Counts total invoices per country, ranked highest first

SELECT
    ROW_NUMBER() OVER (ORDER BY COUNT(InvoiceId) DESC) AS "S/N",
    BillingCountry,
    COUNT(InvoiceId) AS Total_Transaction
FROM invoice
GROUP BY BillingCountry
ORDER BY Total_Transaction DESC;
