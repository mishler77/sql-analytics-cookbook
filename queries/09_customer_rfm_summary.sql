-- RFM-style summary per customer (Recency/Frequency/Monetary - lite)
-- Recency is measured in days since the customer's most recent order (relative to the max order date in the dataset)

WITH order_totals AS (
  SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    SUM(oi.quantity * p.price) AS order_total
  FROM orders o
  JOIN order_items oi ON oi.order_id = o.order_id
  JOIN products p ON p.product_id = oi.product_id
  GROUP BY o.order_id, o.customer_id, o.order_date
),
max_date AS (
  SELECT MAX(order_date) AS max_order_date
  FROM orders
)
SELECT
  c.customer_id,
  c.name AS customer_name,
  c.state,
  COUNT(DISTINCT ot.order_id) AS frequency_orders,
  ROUND(SUM(ot.order_total), 2) AS monetary_lifetime_revenue,
  MAX(ot.order_date) AS last_order_date,
  CAST(
    (julianday((SELECT max_order_date FROM max_date)) - julianday(MAX(ot.order_date)))
    AS INTEGER
  ) AS recency_days
FROM customers c
LEFT JOIN order_totals ot ON ot.customer_id = c.customer_id
GROUP BY c.customer_id, c.name, c.state
ORDER BY monetary_lifetime_revenue DESC, frequency_orders DESC, recency_days ASC;