SELECT COUNT(*) FROM amazon_sales;
SELECT * FROM amazon_sales LIMIT 5;

SELECT COUNT(*) AS total_orders
FROM amazon_sales;

SELECT ROUND(SUM(Amount), 0) AS total_revenue
FROM amazon_sales;

SELECT COUNT(*) AS cancelled_orders
FROM amazon_sales
WHERE Status = 'Cancelled';

SELECT Ship_State, 
       ROUND(SUM(Amount), 0) AS revenue
FROM amazon_sales
GROUP BY Ship_State
ORDER BY revenue DESC
LIMIT 5;

SELECT Category,
       COUNT(*) AS total_orders
FROM amazon_sales
GROUP BY Category
ORDER BY total_orders DESC
LIMIT 5;

SELECT Category,
       COUNT(*) AS total_orders,
       SUM(CASE WHEN Status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled,
       ROUND(SUM(CASE WHEN Status = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS cancel_rate
FROM amazon_sales
GROUP BY Category
ORDER BY cancel_rate DESC;

SELECT Fulfilment,
       COUNT(*) AS total_orders,
       ROUND(SUM(Amount), 0) AS total_revenue
FROM amazon_sales
GROUP BY Fulfilment
ORDER BY total_orders DESC;

SELECT 
    MONTH(Date) AS month_number,
    MONTHNAME(Date) AS month_name,
    COUNT(*) AS total_orders,
    ROUND(SUM(Amount), 0) AS revenue
FROM amazon_sales
GROUP BY month_number, month_name
ORDER BY month_number;

SELECT Ship_City,
       COUNT(*) AS total_orders
FROM amazon_sales
GROUP BY Ship_City
ORDER BY total_orders DESC
LIMIT 5;

SELECT Size,
       COUNT(*) AS total_orders
FROM amazon_sales
GROUP BY Size
ORDER BY total_orders DESC
LIMIT 8;

select *from amazon_sales;

SELECT Fulfilment,
       COUNT(*) AS total_orders,
       SUM(CASE WHEN Status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled,
       ROUND(SUM(CASE WHEN Status = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS cancel_rate
FROM amazon_sales
GROUP BY Fulfilment
ORDER BY cancel_rate DESC;

SELECT Ship_State,
       COUNT(*) AS total_orders,
       SUM(CASE WHEN Status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled,
       ROUND(SUM(CASE WHEN Status = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS cancel_rate
FROM amazon_sales
GROUP BY Ship_State
ORDER BY cancel_rate DESC
LIMIT 10;

SELECT Ship_State,
       Courier_Status,
       COUNT(*) AS total_orders
FROM amazon_sales
WHERE Ship_State IN ('Tripura', 'Arunachal Pradesh', 'Madhya Pradesh')
AND Status = 'Cancelled'
GROUP BY Ship_State, Courier_Status
ORDER BY Ship_State;

SELECT 
    CASE 
        WHEN Ship_State IN ('Maharashtra', 'Karnataka', 'Tamil Nadu', 'Delhi', 'Telangana') 
        THEN 'Metro States'
        ELSE 'Tier 2/3 States'
    END AS state_type,
    COUNT(*) AS total_orders,
    ROUND(SUM(CASE WHEN Status = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS cancel_rate
FROM amazon_sales
GROUP BY state_type;

SELECT B2B,
       COUNT(*) AS total_orders,
       ROUND(SUM(Amount), 0) AS total_revenue,
       ROUND(SUM(CASE WHEN Status = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS cancel_rate
FROM amazon_sales
GROUP BY B2B;

SELECT Ship_State,
       Category,
       COUNT(*) AS total_orders
FROM amazon_sales
GROUP BY Ship_State, Category
ORDER BY Ship_State, total_orders DESC;

SELECT Ship_State,
       COUNT(*) AS total_orders
FROM amazon_sales
GROUP BY Ship_State
ORDER BY total_orders DESC
LIMIT 10;

SELECT 
    COUNT(*) AS cancelled_orders,
    ROUND(SUM(Amount), 0) AS revenue_lost
FROM amazon_sales
WHERE Status = 'Cancelled';

SELECT Fulfilment,
       ROUND(SUM(Amount), 0) AS revenue_lost
FROM amazon_sales
WHERE Status = 'Cancelled'
GROUP BY Fulfilment;

SELECT Ship_State,
       ROUND(SUM(Amount), 0) AS revenue_lost
FROM amazon_sales
WHERE Status = 'Cancelled'
GROUP BY Ship_State
ORDER BY revenue_lost DESC
LIMIT 5;

SELECT Ship_State,
       COUNT(*) AS total_orders,
       ROUND(SUM(CASE WHEN Status = 'Cancelled' THEN Amount ELSE 0 END) / COUNT(*) * 100, 0) AS revenue_lost_per_100_orders
FROM amazon_sales
GROUP BY Ship_State
ORDER BY revenue_lost_per_100_orders DESC
LIMIT 10;

SELECT Size,
       COUNT(*) AS total_orders,
       ROUND(SUM(CASE WHEN Status = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS cancel_rate
FROM amazon_sales
GROUP BY Size
ORDER BY cancel_rate DESC;

SELECT Ship_Service_Level,
       COUNT(*) AS total_orders,
       ROUND(SUM(CASE WHEN Status = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS cancel_rate
FROM amazon_sales
GROUP BY Ship_Service_Level
ORDER BY cancel_rate;

SELECT 
    MONTHNAME(Date) AS month_name,
    COUNT(*) AS total_orders,
    ROUND(SUM(CASE WHEN Status = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS cancel_rate
FROM amazon_sales
GROUP BY MONTH(Date), month_name
ORDER BY MONTH(Date);

SELECT 
    CASE
        WHEN Amount >= 1000 THEN 'High Value (1000+)'
        WHEN Amount >= 500 THEN 'Medium Value (500-999)'
        ELSE 'Low Value (below 500)'
    END AS order_segment,
    COUNT(*) AS total_orders,
    ROUND(SUM(CASE WHEN Status = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS cancel_rate
FROM amazon_sales
GROUP BY order_segment
ORDER BY cancel_rate DESC;

SELECT Category,
       ROUND(AVG(Amount), 0) AS avg_order_value,
       ROUND(SUM(CASE WHEN Status = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS cancel_rate
FROM amazon_sales
GROUP BY Category
ORDER BY avg_order_value DESC;

SELECT Courier_Status,
       COUNT(*) AS total_orders,
       ROUND(SUM(Amount), 0) AS total_amount
FROM amazon_sales
GROUP BY Courier_Status
ORDER BY total_amount DESC;

SELECT Category,
       Courier_Status,
       COUNT(*) AS total_orders
FROM amazon_sales
WHERE Courier_Status IN ('Unshipped', 'Not Assigned')
GROUP BY Category, Courier_Status
ORDER BY total_orders DESC
LIMIT 10;

SELECT Category,
       COUNT(*) AS total_orders
FROM amazon_sales
WHERE B2B = 'TRUE'
GROUP BY Category
ORDER BY total_orders DESC;

SELECT Ship_State,
       COUNT(*) AS not_assigned_orders
FROM amazon_sales
WHERE Courier_Status = 'Not Assigned'
GROUP BY Ship_State
ORDER BY not_assigned_orders DESC
LIMIT 10;

SELECT 
    ROUND(COUNT(*) * (17.5 - 12.8) / 100 * AVG(Amount), 0) AS recoverable_revenue
FROM amazon_sales
WHERE Fulfilment = 'Merchant';

SELECT Payment_Method,
       COUNT(*) AS total_orders,
       ROUND(SUM(CASE WHEN Status = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS cancel_rate
FROM amazon_sales
GROUP BY Payment_Method
ORDER BY cancel_rate DESC;

DESCRIBE amazon_sales;

