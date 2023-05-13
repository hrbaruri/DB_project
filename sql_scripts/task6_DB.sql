-- 6a. GROUP BY + HAVING: finding all customers who spent more than 70000 at the dealership.
SELECT c.customer_id, c.first_name, SUM(b.amount_paid) AS total_amount_paid
FROM customers c
INNER JOIN bill b ON b.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name
HAVING SUM(b.amount_paid) > 70000;

-- 6b. ORDER BY: 
-- arrange the customers in descing order of how much they spent at the dealership
SELECT c.customer_id, c.first_name, SUM(b.amount_paid) AS total_amount_paid
FROM customers c
INNER JOIN bill b ON b.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name
ORDER BY total_amount_paid DESC;

-- 6c-(1). PARTITION BY
-- Find average price of each make
SELECT make, model, b.amount_paid AS car_price, 
AVG(b.amount_paid) OVER(PARTITION BY make) AS average_make
FROM cars
INNER JOIN bill b ON b.car_id = cars.car_id;

-- 6c-(2). ORDER BY
-- Rank the cars based on their prices.
SELECT c.car_id, c.make, c.model, b.amount_paid,
       RANK() OVER (ORDER BY b.amount_paid DESC) AS car_rank
FROM cars c
INNER JOIN bill b ON b.car_id = c.car_id;

-- 6c-(3). PARTITION BY + ORDER BY
--  find the most expensive car of each make
SELECT make, model, car_price
FROM (
    SELECT c.make, c.model, b.amount_paid AS car_price,
           ROW_NUMBER() OVER (PARTITION BY c.make ORDER BY b.amount_paid DESC) AS row_num
    FROM cars c
    INNER JOIN bill b ON b.car_id = c.car_id
) subquery
WHERE row_num = 1
order by car_price desc;


-- 6d. d. <func> - all 3 types of functions - aggregating, ranking, offsets
-- Rank the top 3 car makes according to their average prices
SELECT make, 
	RANK() OVER (ORDER BY average_make DESC) AS rank,
 	average_make

FROM (
	SELECT make, 
	AVG(b.amount_paid) OVER(PARTITION BY make) AS average_make
	FROM cars
	INNER JOIN bill b ON b.car_id = cars.car_id
	ORDER BY average_make DESC
) car_2

ORDER BY average_make DESC
LIMIT 3 ;

