-- 1. Get all users
SELECT * FROM users;

-- 2. Get all products with price > 10000
SELECT * FROM products WHERE price > 10000;

-- 3. Join users and orders
SELECT u.name, o.order_id, o.order_date
FROM users u
JOIN orders o ON u.user_id = o.user_id;

-- 4. Get order details with product name
SELECT o.order_id, p.product_name, oi.quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id;

-- 5. Total amount per order
SELECT o.order_id, SUM(p.price * oi.quantity) AS total_amount
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
GROUP BY o.order_id;
