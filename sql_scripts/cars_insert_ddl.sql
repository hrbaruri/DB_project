-- Data for table <customers>
INSERT INTO customers (first_name, phone_number, email)
VALUES
   ('John', '1234567890', 'john@gmail.com'),
   ('Emily', '9876543210', 'emily@yahoo.com'),
   ('Michael', '5555555555', 'michael@yandex.com'),
   ('Sarah', '1112223333', 'sarah@hotmail.com'),
   ('David', '9998887777', 'david@icloud.com'),
   ('Jennifer', '4443332222', 'jennifer@gmail.com'),
   ('Robert', '7777777777', 'robert@yahoo.com'),
   ('Jessica', '8888888888', 'jessica@yandex.com'),
   ('Matthew', '2221110000', 'matthew@hotmail.com'),
   ('Amanda', '6666666666', 'amanda@icloud.com');


-- Data for table <manufacturers>
INSERT INTO manufacturers (name, phone_number, country, website)
VALUES
   ('Toyota', '1234567890', 'Japan', 'www.toyota.com'),
   ('BMW', '9876543210', 'Germany', 'www.bmw.com'),
   ('Ford', '5555555555', 'United States', 'www.ford.com'),
   ('Honda', '1112223333', 'Japan', 'www.honda.com'),
   ('Mercedes-Benz', '9998887777', 'Germany', 'www.mercedes-benz.com'),
   ('Volkswagen', '4443332222', 'Germany', 'www.vw.com'),
   ('Chevrolet', '7777777777', 'United States', 'www.chevrolet.com'),
   ('Nissan', '8888888888', 'Japan', 'www.nissan-global.com'),
   ('Audi', '2221110000', 'Germany', 'www.audi.com'),
   ('Hyundai', '6666666666', 'South Korea', 'www.hyundai.com');
	

--Data for table <cars>
INSERT INTO cars (manufacturer_id, make, model, year)
VALUES
   (1, 'Toyota', 'Camry', 2001),
   (1, 'Toyota', 'Corolla', 2005),
   (2, 'BMW', 'X5', 2003),
   (2, 'BMW', '3 Series', 2008),
   (3, 'Ford', 'Mustang', 2005),
   (3, 'Ford', 'F-150', 2010),
   (4, 'Honda', 'Civic', 2001),
   (4, 'Honda', 'Accord', 2006),
   (5, 'Mercedes-Benz', 'E-Class', 2002),
   (5, 'Mercedes-Benz', 'S-Class', 2007),
   (6, 'Volkswagen', 'Golf', 2004),
   (6, 'Volkswagen', 'Passat', 2012),
   (7, 'Chevrolet', 'Camaro', 2009),
   (7, 'Chevrolet', 'Silverado', 2015),
   (8, 'Nissan', 'Altima', 2006),
   (8, 'Nissan', 'Maxima', 2013),
   (9, 'Audi', 'A4', 2003),
   (9, 'Audi', 'Q5', 2010),
   (10, 'Hyundai', 'Elantra', 2008),
   (10, 'Hyundai', 'Tucson', 2016);

	
-- Data for table <salesmen>
INSERT INTO salesmen (first_name, last_name)
VALUES
   ('Adam', 'Smith'),
   ('Benjamin', 'Davis'),
   ('Christopher', 'Johnson'),
   ('Daniel', 'Wilson'),
   ('Edward', 'Thompson'),
   ('Frank', 'Anderson'),
   ('George', 'Martinez'),
   ('Henry', 'Lee'),
   ('Isaac', 'Garcia'),
   ('James', 'Rodriguez');


-- Data for table <bill>
INSERT INTO bill (purchase_date, customer_id, salesman_id, car_id, amount_paid)
VALUES
   ('2023-04-15', 1, 1, 1, 25000),
   ('2023-04-16', 2, 2, 3, 35000),
   ('2023-04-17', 3, 3, 5, 45000),
   ('2023-04-18', 4, 4, 7, 55000),
   ('2023-04-19', 5, 5, 9, 65000),
   ('2023-04-20', 6, 6, 11, 75000),
   ('2023-04-21', 7, 7, 13, 85000),
   ('2023-04-22', 8, 8, 15, 95000),
   ('2023-04-23', 9, 9, 17, 105000),
   ('2023-04-24', 10, 10, 19, 115000);


-- Data for table <services>
INSERT INTO services (service_date, bill_id)
VALUES
   ('2023-04-15', 1),
   ('2023-04-16', 2),
   ('2023-04-17', 3),
   ('2023-04-18', 4),
   ('2023-04-19', 5),
   ('2023-04-20', 6),
   ('2023-04-21', 7),
   ('2023-04-22', 8),
   ('2023-04-23', 9),
   ('2023-04-24', 10);

