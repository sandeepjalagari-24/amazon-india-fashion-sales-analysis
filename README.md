# Amazon India Fashion Sales Analysis

A SQL-driven analysis of Amazon India fashion sales data, focused on order cancellations, revenue loss, and fulfilment performance.

## Problem Statement
Cancelled orders cause direct revenue loss. This project investigates **which states, categories, fulfilment types, and order segments have the highest cancellation rates**, and estimates recoverable revenue from fixing fulfilment inefficiencies.

## Tools Used
- MySQL Workbench (business analysis queries)
- Power BI (dashboard)

## Key Metrics
- Total Orders: 128,940
- Cancelled Orders: 18,329 (14.2% cancellation rate)
- Total Revenue: ₹7.86 Cr
- Revenue Lost to Cancellations: ₹69.18 L

## Key Insights
- **Maharashtra** leads in revenue (₹1.35 Cr) — highest revenue state
- **Merchant-fulfilled** orders cancel 37% more often than Amazon-fulfilled — estimated ₹11.4L recoverable by shifting more fulfilment to Amazon
- **XS/S sizes** cancel at 3x the rate of 6XL sizes — sizing/fit issue worth investigating
- ₹75.3L in revenue is stuck in unshipped/unassigned courier orders — an operational bottleneck
- Standard shipping cancels more than Expedited — possible link between delivery speed and order commitment

## Analysis Covered
- Revenue and order volume by state, category, and city
- Cancellation rate by fulfilment type, size, order value segment, and payment method
- Metro vs Tier 2/3 state comparison
- B2B vs B2C performance
- Monthly order trend
- Courier status breakdown (Unshipped/Not Assigned orders)
- Estimated recoverable revenue from fulfilment improvements

## Files
- `amazon_sales_analysis.sql` — Full set of analysis queries
- Power BI dashboard file and screenshot

## Author
Sandeep — Data Analyst (aspiring), MBA in Marketing
