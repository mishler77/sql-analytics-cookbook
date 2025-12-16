INSERT INTO customers (customer_id, name, state) VALUES
    (1, 'Ava', 'VA'),
    (2, 'Ben', 'NC'),
    (3, 'Chris', 'VA'),
    (4, 'Dina', 'MD');

INSERT INTO products (product_id, product_name, category, price) VALUES
    (1, 'Coffee Beans', 'Grocery', 14.99),
    (2, 'Tea Sampler', 'Grocery', 11.50),
    (3, 'Notebook', 'Office', 6.25),
    (4, 'Pen Pack', 'Office', 4.75),
    (5, 'Water Bottle', 'Fitness', 18.00);

INSERT INTO orders (order_id, customer_id, order_date) VALUES
    (100, 1, '2025-10-01'),
    (101, 1, '2025-10-10'),
    (102, 2, '2025-10-11'),
    (103, 3, '2025-11-02'),
    (104, 4, '2025-11-03');

INSERT INTO order_items (order_id, product_id, quantity) VALUES
    (100, 1, 1),
    (100, 3, 2),
    (101, 2, 1),
    (101, 4, 3),
    (102, 5, 1),
    (103, 1, 2),
    (103, 4, 1),
    (104, 3, 5);