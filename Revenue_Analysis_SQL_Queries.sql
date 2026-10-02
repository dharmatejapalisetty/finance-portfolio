-- Project 3: Revenue & Profitability Analytics
-- illustrative portfolio dataset. Adapt table/column names to your SQL platform.

-- 1. Executive KPIs
SELECT
    SUM(net_revenue) AS total_revenue,
    SUM(cogs) AS total_cogs,
    SUM(gross_profit) AS total_gross_profit,
    SUM(gross_profit) / NULLIF(SUM(net_revenue),0) AS gross_margin,
    SUM(units) AS units_sold
FROM transactions;

-- 2. Monthly trend
SELECT
    EXTRACT(YEAR FROM transaction_date) AS year,
    EXTRACT(MONTH FROM transaction_date) AS month,
    SUM(net_revenue) AS revenue,
    SUM(gross_profit) AS gross_profit,
    SUM(gross_profit) / NULLIF(SUM(net_revenue),0) AS gross_margin
FROM transactions
GROUP BY 1,2
ORDER BY 1,2;

-- 3. Product profitability
SELECT
    product,
    SUM(net_revenue) AS revenue,
    SUM(cogs) AS cogs,
    SUM(gross_profit) AS gross_profit,
    SUM(gross_profit) / NULLIF(SUM(net_revenue),0) AS gross_margin,
    SUM(units) AS units
FROM transactions
GROUP BY product
ORDER BY revenue DESC;

-- 4. Regional performance
SELECT
    region,
    SUM(net_revenue) AS revenue,
    SUM(gross_profit) AS gross_profit,
    SUM(gross_profit) / NULLIF(SUM(net_revenue),0) AS gross_margin
FROM transactions
GROUP BY region
ORDER BY revenue DESC;

-- 5. Customer concentration
SELECT
    customer,
    segment,
    SUM(net_revenue) AS revenue,
    SUM(gross_profit) AS gross_profit,
    SUM(gross_profit) / NULLIF(SUM(net_revenue),0) AS gross_margin
FROM transactions
GROUP BY customer, segment
ORDER BY revenue DESC;

-- 6. Segment analysis
SELECT
    segment,
    COUNT(*) AS transaction_count,
    SUM(net_revenue) AS revenue,
    AVG(discount_pct) AS avg_discount,
    SUM(gross_profit) / NULLIF(SUM(net_revenue),0) AS gross_margin
FROM transactions
GROUP BY segment
ORDER BY revenue DESC;
