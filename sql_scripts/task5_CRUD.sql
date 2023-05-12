-- 1. Find all customers who bought a bmw, and also the name of the car
SELECT c.customer_id, first_name, email, phone_number, cars.make, cars.model 
FROM customers c
	INNER JOIN bill b ON c.customer_id = b.customer_id
	INNER JOIN cars ON b.car_id = cars.car_id
WHERE cars.make = 'BMW';


-- 2. Add a new column 'last_name' to table 'customer' in schema 
ALTER TABLE customer
    ADD last_name VARCHAR NOT NULL;


-- 3. Find all car makes and models that cost more than 60000 
SELECT cars.car_id, cars.make, cars.model, b.amount_paid 
FROM cars
	INNER JOIN bill b ON b.car_id = cars.car_id
WHERE b.amount_paid > 60000
ORDER BY b.amount_paid DESC; 

-- 4. Find all customers who spent more than 50000 
SELECT c.customer_id, c.first_name
FROM customers c
INNER JOIN bill b ON c.customer_id = b.customer_id
WHERE b.amount_paid > 50000;


-- 5. Due to a salesmans error, the incorrect price was entered into the bill. Increase the amount
--    paid in the bill by 2000 where the sale was done by salesman 6
UPDATE bill
SET amount_paid = amount_paid + 2000 
WHERE salesman_id = 6;

-- 6. Update all salesman_id of isaac in bill to the salesman_id of adam

UPDATE bill
SET salesman_id = (SELECT salesman_id FROM salesmen WHERE first_name = 'Adam')
WHERE salesman_id = (SELECT salesman_id FROM salesmen WHERE first_name = 'Isaac');

-- 7. The manager doesn't like Isaac. Fire him.
DELETE FROM salesmen
WHERE first_name = 'Isaac';

-- 8. Insert a new mannufacturer tesla
INSERT INTO manufacturers (name, phone_number, country, website)
VALUES 
    ('Tesla', '9688723949', 'United States', 'www.tesla.com');

-- 9. Add a tesla model into cars

INSERT INTO cars (manufacturer_id, make, model, year)
VALUES
    (11, 'Tesla', 'Model S', 2012);

-- 10.
UPDATE customers 
SET phone_number = '9034724376' 
WHERE customer_id = 10;