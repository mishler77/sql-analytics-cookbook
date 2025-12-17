-- Order line items (one row per item)
SELECT
  o.order_id,
  o.order_date,
  c.name AS customer_name,
  p.product_name,
  p.category,
  oi.quantity,
  p.price,
  ROUND(oi.quantity * p.price, 2) AS line_total
FROM orders o
JOIN customers c  ON c.customer_id = o.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id
ORDER BY o.order_id, p.product_name;
