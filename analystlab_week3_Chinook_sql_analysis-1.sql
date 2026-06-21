
-- show all customer column
SELECT *
from customer;

-- show all invoice column
SELECT *
from invoice;

 -- TOTAL REVENUE
 SELECT SUM(TOTAL) Revenue
 FROM invoice;
 
 -- NUMBER OF SALES TRANSACTIONS
 SELECT COUNT(*) Transaction_Count
 FROM invoice;

-- Total Number of years 
SELECT COUNT(DISTINCT year(INVOICEDATE)) Total_Number_of_years
FROM invoice;

-- Transaction per year
SELECT year(InvoiceDate), COUNT(year(INVOICEDATE))
FROM invoice
GROUP BY year(InvoiceDate);


-- AVERAGE SALES PER TRANSACTION
SELECT round(SUM(TOTAL)/COUNT(*),2) Average_sales_Value
FROM invoice;

-- MONTHLY SALES REVENUE
SELECT MONTH(INVOICEDATE) Month, YEAR(INVOICEDATE) Year, SUM(TOTAL) Month_sales
FROM invoice
GROUP BY Month, Year;

-- YEARLY SALES TREND
SELECT YEAR (INVOICEDATE) Year , SUM(TOTAL) Year_sales
FROM invoice
GROUP BY Year;

-- MONTH, YEAR  AND QUARTER TREND REVENUE
SELECT Month, Year, Quarter, Month_sales,  SUM(Month_sales) OVER(PARTITION BY year) Year_sales, 
SUM(Month_sales) OVER(PARTITION BY year, quarter) Quarter_sales
FROM (SELECT MONTH(INVOICEDATE) Month, YEAR(INVOICEDATE) Year,  quarter(INVOICEDATE) quarter, SUM(TOTAL) Month_sales
FROM invoice
GROUP BY Month, Year, quarter) dan
GROUP BY MONTH, YEAR, Month_sales , quarter;


-- MONTH, YEAR  AND QUARTER TREND TRANSACTION
SELECT Month, Quarter, Year, Monthly_Transaction,  
SUM(Monthly_Transaction) OVER(PARTITION BY year, quarter) Quarterly_Transaction,
SUM(Monthly_Transaction) OVER(PARTITION BY year) Yearly_Transaction
FROM (SELECT MONTH(INVOICEDATE) Month, YEAR(INVOICEDATE) Year,  
quarter(INVOICEDATE) quarter, COUNT(*) Monthly_Transaction
FROM invoice
GROUP BY Month, Year, quarter) dan
GROUP BY MONTH, YEAR, Monthly_Transaction , quarter;


-- TOTAL CUSTOMER
SELECT count( CustomerId) Total_Customer
FROM customer;

-- Average revenue per Customer
SELECT ROUND( SUM(invoice.Total)/COUNT(distinct customer.CustomerId), 2) Average_revenue_per_Customer
FROM customer
LEFT JOIN invoice
on customer.CustomerId=invoice.CustomerId;


-- REVEVENUE BY TOP CUSTOMERS
SELECT customer.CustomerId CustomerId, sum(invoice.Total) Total
FROM customer
LEFT JOIN invoice
on customer.CustomerId=invoice.CustomerId
GROUP BY CustomerId
ORDER BY Total desc ;

-- customer segment
SELECT customerId, CASE WHEN COUNT(InvoiceId)>1 then "Returning" ELSE "New" END "Segment"
FROM invoice
GROUP BY CustomerId;

-- customer that never purchase
SELECT c.customerid
FROM customer c
left JOIN
invoice i
on c.customerid = i.customerid
where i.CustomerId is null;

-- Revenue by county
SELECT ROW_NUMBER () OVER(ORDER BY SUM(Total) desc) "S/N", BillingCountry, SUM(Total) Revenue
FROM invoice
GROUP BY BillingCountry 
ORDER BY Revenue DESC;

-- Transaction by country
SELECT ROW_NUMBER () OVER(ORDER BY COUNT(invoiceid) desc) "S/N", BillingCountry, COUNT(InvoiceId) Total_Transaction
FROM invoice
GROUP BY BillingCountry 
ORDER BY Total_Transaction DESC;


















--