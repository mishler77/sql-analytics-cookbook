# Query Index

This folder contains standalone SQL examples designed to be run against `cookbook.db`.
Each file highlights a common pattern used in entry-level data analysis.

## How to run

From the repo root:

```bash
sqlite3 cookbook.db < schema/01_create_tables.sql
sqlite3 cookbook.db < seed/02_insert_seed_data.sql
sqlite3 -header -column cookbook.db < queries/01_basic_select.sql
```

## Queries
- 01_basic_select.sql — Basic SELECT + ORDER BY (sanity check / table inspection)
- 02_joins.sql — Multi-table JOINs + computed measures (order totals)
- 03_group_by.sql — GROUP BY + HAVING-style aggregation (revenue by customer)
- 04_order_line_items.sql — “Detail-level” fact table output (one row per order item)
- 05_monthly_revenue.sql — Date grouping with strftime (monthly trend)
- 06_repeat_customers.sql — Repeat customers using COUNT(DISTINCT) + HAVING
- 07_product_revenue_ranking.sql — Ranking with ORDER BY on aggregated revenue
- 08_top_product_per_state.sql — Top-N per group using window functions (ROW_NUMBER())
- 09_customer_rfm_summary.sql — RFM-style customer summary (recency/frequency/monetary-lite)
- 10_category_share_of_revenue.sql — Category revenue and percent-of-total share