-- Revenue by customer
SELECT
  c.name AS customer_name,
  ROUND(SUM(oi.quantity * p.price), 2) AS revenue
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id
GROUP BY c.name
ORDER BY revenue DESC;
-- Revenue by product category