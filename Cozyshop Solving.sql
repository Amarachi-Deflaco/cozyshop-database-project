USE CozyShop;

SELECT * FROM cozyshop.customers;
SELECT * FROM cozyshop.employees;
SELECT * FROM cozyshop.products;
SELECT * FROM cozyshop.purchases;



-- Display the full list of purchases showing:
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    p.product_name,
    pu.date,
    pu.amount
FROM Purchases pu
JOIN Customers c ON pu.customer_id = c.customer_id
JOIN Products p ON pu.product_id = p.product_id;


-- List all customers who have not made any purchases.
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name
FROM Customers c
LEFT JOIN Purchases pu ON c.customer_id = pu.customer_id
WHERE pu.purchase_id IS NULL;


-- Show the total amount spent by each customer.
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    SUM(pu.amount) AS total_spent
FROM Purchases pu
JOIN Customers c ON pu.customer_id = c.customer_id
GROUP BY c.customer_id;


-- Identify the top two (2) most expensive products.
SELECT 
    product_name,
    price
FROM Products
ORDER BY price DESC
LIMIT 2;


-- List employees who started working before January 1st, 2024.
SELECT 
    first_name, 
    last_name, 
    start_date
FROM Employees
WHERE start_date < '2024-01-01';


-- What is the total revenue generated from all purchases?
SELECT 
    SUM(amount) AS total_revenue
FROM Purchases; 