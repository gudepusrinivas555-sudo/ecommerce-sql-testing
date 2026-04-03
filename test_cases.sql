-- Test Case 1: Check if user exists
SELECT * FROM users WHERE email = 'srinu@gmail.com';

-- Test Case 2: Validate product stock not negative
SELECT * FROM products WHERE stock < 0;

-- Test Case 3: Validate orders linked to valid users
SELECT * FROM orders
WHERE user_id NOT IN (SELECT user_id FROM users);

-- Test Case 4: Validate total order amount
SELECT o.order_id, SUM(p.price * oi.quantity) AS total
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY o.order_id;

-- Test Case 5: Check duplicate emails
SELECT email, COUNT(*) 
FROM users
GROUP BY email
HAVING COUNT(*) > 1;
