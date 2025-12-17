-- Top product by revenue within each customer state (uses window functions)
WITH state_product AS (
  SELECT
    c.state,
    p.product_name,
    ROUND(SUM(oi.quantity * p.price), 2) AS revenue
  FROM customers c
  JOIN orders o ON o.customer_id = c.customer_id
  JOIN order_items oi ON oi.order_id = o.order_id
  JOIN products p ON p.product_id = oi.product_id
  GROUP BY c.state, p.product_name
),
ranked AS (
  SELECT
    state,
    product_name,
    revenue,
    ROW_NUMBER() OVER (PARTITION BY state ORDER BY revenue DESC, product_name) AS rn
  FROM state_product
)
SELECT state, product_name, revenue
FROM ranked
WHERE rn = 1
ORDER BY state;