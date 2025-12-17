-- Monthly revenue trend (SQLite date functions)
SELECT
  strftime('%Y-%m', o.order_date) AS month,
  ROUND(SUM(oi.quantity * p.price), 2) AS revenue
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id
GROUP BY month
ORDER BY month;