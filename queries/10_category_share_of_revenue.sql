-- Revenue by category and share of total revenue
WITH category_revenue AS (
  SELECT
    p.category,
    SUM(oi.quantity * p.price) AS revenue
  FROM order_items oi
  JOIN products p ON p.product_id = oi.product_id
  GROUP BY p.category
),
total AS (
  SELECT SUM(revenue) AS total_revenue
  FROM category_revenue
)
SELECT
  cr.category,
  ROUND(cr.revenue, 2) AS revenue,
  ROUND((cr.revenue / t.total_revenue) * 100.0, 2) AS pct_of_total
FROM category_revenue cr
CROSS JOIN total t
ORDER BY revenue DESC, cr.category;