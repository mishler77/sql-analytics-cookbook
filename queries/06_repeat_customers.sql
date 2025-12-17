-- Customers with 2+ orders (repeat buyers)
SELECT
  c.customer_id,
  c.name AS customer_name,
  COUNT(DISTINCT o.order_id) AS order_count,
  ROUND(SUM(oi.quantity * p.price), 2) AS lifetime_revenue
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id
GROUP BY c.customer_id, c.name
HAVING COUNT(DISTINCT o.order_id) >= 2
ORDER BY order_count DESC, lifetime_revenue DESC;
