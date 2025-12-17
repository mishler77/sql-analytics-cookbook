-- Product revenue ranking
SELECT
  p.product_id,
  p.product_name,
  p.category,
  ROUND(SUM(oi.quantity * p.price), 2) AS revenue
FROM products p
JOIN order_items oi ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name, p.category
ORDER BY revenue DESC, p.product_name;