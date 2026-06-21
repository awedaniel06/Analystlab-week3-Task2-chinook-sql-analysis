# Sales & Customer SQL Analysis

A SQL-driven analysis of sales performance, customer behavior, and market trends — built to turn raw transactional data into clear, decision-ready insight.

## Overview

This project answers a simple question: **where is the business winning, and where is it leaving value on the table?** Using only SQL against the source database, the analysis covers overall sales performance, how revenue moves over time, which customers matter most, and how performance differs by market — without any spreadsheet or BI-tool pre-processing in between.

## About the Dataset

The analysis draws on two related tables from the sales database:

**`customer`** — 59 unique customer records, each identified by `CustomerId` with supporting name and billing fields.

**`invoice`** — 412 transaction records spanning five years (2021–2025), each linked to a customer via `CustomerId` and timestamped with `InvoiceDate`. This is the core table behind every revenue and trend figure in the analysis.

The two tables connect through the shared `CustomerId`, which makes it possible to move between customer-level and transaction-level views of the same data.

## What This Analysis Covers

- **Overall performance** — total revenue, total transactions, and average order value across the full period on record
- **Trends over time** — how revenue and transaction volume move year over year, and how they break down by quarter and month within each year
- **Customer behavior** — who the highest-value customers are, how purchase frequency varies across the base, and which customers are on file but have never purchased
- **Market performance** — which countries generate the most revenue and the most transactions, and how closely those two rankings track each other

## Skills Demonstrated

- Writing aggregate and grouped queries to summarize transactional data
- Using window functions to roll detailed (monthly) data up into broader (quarterly, yearly) totals without losing row-level detail
- Joining tables to uncover customers with no transaction history
- Segmenting customers with conditional logic based on purchase frequency
- Ranking and comparing performance across categories (customers, countries) using window-based ranking functions

## Key Insights

- **$2,328.60 in total revenue** across 412 transactions over five years, with an average order value of **$5.65**
- Revenue stayed essentially flat year over year — ranging narrowly from $449.46 to $481.45 — with no clear growth or decline trend across the period
- Transaction volume is remarkably even across years (83, 83, 83, 83, then 80), showing no strong seasonal or annual swing at the yearly level
- With 412 invoices across 59 customers — roughly **7 invoices per customer** on average — purchase frequency is high, suggesting most of the base are repeat buyers rather than one-time purchasers
- The top 5 customers contributed **$235.10 combined, about 10.1% of total revenue** — a moderate concentration given the customer base is only 59 people
- **Every customer has purchased at least once** — there are zero dormant, never-purchased accounts on file
- The United States leads all markets ($523.06 in revenue, 91 transactions), and the top 5 countries (US, Canada, Brazil, Germany, UK) account for **58.8% of revenue and 59.5% of transactions** — revenue share and transaction share track closely, with no major average-order-value gap between markets

## Repository Contents

| File | Description |
|---|---|
| `queries.sql` | All SQL queries used in the analysis |
| `SQL_Query_Insights_Report.docx` | Query-by-query explanations and findings |
| `Insights_and_Recommendations.docx` 
| `README.md` | This file |

