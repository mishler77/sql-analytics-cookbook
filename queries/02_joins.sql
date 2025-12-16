-- Order totals by order_id
SELECT
  o.order_id,
  o.order_date,
  c.name AS customer_name,
  ROUND(SUM(oi.quantity * p.price), 2) AS order_total
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id
GROUP BY o.order_id, o.order_date, c.name
ORDER BY o.order_id;

-- Total spending by customer
