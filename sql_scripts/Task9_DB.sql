-- 1. A view that hides phone numbers of customers:
CREATE VIEW customer_hidden_numbers AS 
SELECT
	customer_id,
	email,
	first_name,
	concat('XXXXXX',substring(phone_number, 7)) AS phone_number_masked
FROM customers;

SELECT * FROM customer_hidden_numbers;

-- 2. A view that hides emails of customers:
CREATE VIEW customers_hidden_emails AS
SELECT customer_id, first_name, CONCAT('********', SUBSTRING(email, POSITION('@' IN email))) AS email_masked
FROM customers;

SELECT * FROM customers_hidden_emails;

-- 3. A view that shows total revenue for each make:
CREATE VIEW revenue_by_make AS
SELECT c.make, SUM(b.amount_paid) AS total_revenue
FROM cars c
INNER JOIN bill b ON b.car_id = c.car_id
GROUP BY c.make;

SELECT * from revenue_by_make;

-- 4. A view that shows total revenue for each salesman:
CREATE VIEW revenue_by_salesman AS
SELECT s.salesman_id, CONCAT(s.first_name, s.last_name) AS salesman_name, SUM(b.amount_paid) AS total_revenue
FROM salesmen s
INNER JOIN bill b ON b.salesman_id = s.salesman_id
GROUP BY s.salesman_id, salesman_name;

SELECT * from revenue_by_salesman;

-- 5. A view that shows total amount spent by each customer:
CREATE VIEW amount_spent_by_customers AS
SELECT c.customer_id, c.first_name, COALESCE(SUM(b.amount_paid), 0) AS total_amount_spent
FROM customers c
LEFT JOIN bill b ON b.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name;

SELECT * FROM amount_spent_by_customers;

-- 6. A view that shows the top-selling car models along with the total quantity sold:
CREATE VIEW top_selling_cars AS
SELECT c.model, COUNT(b.bill_id) AS total_quantity_sold
FROM cars c
INNER JOIN bill b ON b.car_id = c.car_id
GROUP BY c.model
ORDER BY total_quantity_sold DESC;

SELECT * FROM top_selling_cars;