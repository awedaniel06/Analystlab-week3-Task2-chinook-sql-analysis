-- ============================================================
-- 05_customer_analysis.sql
-- Description : Customer KPIs — count, revenue, segmentation,
--               top spenders, and non-purchasers
-- Database    : Chinook (MySQL)
-- ============================================================


-- ── 1. Total Number of Customers ─────────────────────────────
-- Counts all registered customers

SELECT COUNT(CustomerId) AS Total_Customer
FROM customer;


-- ── 2. Average Revenue per Customer ──────────────────────────
-- LEFT JOIN ensures all customers are included (even with no invoices)

SELECT ROUND(
    SUM(invoice.Total) / COUNT(customer.CustomerId), 2
) AS Average_Revenue_Per_Customer
FROM customer
LEFT JOIN invoice ON customer.CustomerId = invoice.CustomerId;


-- ── 3. Revenue by Top Customers ──────────────────────────────
-- Ranks customers by total spend, highest first

SELECT
    customer.CustomerId,
    SUM(invoice.Total) AS Total
FROM customer
LEFT JOIN invoice ON customer.CustomerId = invoice.CustomerId
GROUP BY CustomerId
ORDER BY Total DESC;


-- ── 4. Customer Segmentation (New vs. Returning) ─────────────
-- Classifies each customer based on number of purchases

SELECT
    CustomerId,
    CASE
        WHEN COUNT(InvoiceId) > 1 THEN 'Returning'
        ELSE 'New'
    END AS Segment
FROM invoice
GROUP BY CustomerId;


-- ── 5. Customers Who Have Never Made a Purchase ───────────────
-- LEFT JOIN + NULL filter finds customers with zero invoices

SELECT c.CustomerId
FROM customer c
LEFT JOIN invoice i ON c.CustomerId = i.CustomerId
WHERE i.CustomerId IS NULL;
