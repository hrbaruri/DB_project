-- For table <customers>:
-- In column <email>, If there are frequent searches or joins based on the email field, an index on email can improve query performance.
CREATE INDEX idx_customers_email ON customers (email);

-- For table <manufacturers>:
-- In column <country>:  If there are frequent searches or joins based on the country field, an index on country can improve query performance.
CREATE INDEX idx_manufacturers_country ON manufacturers (country);

-- For table <cars>:
-- In column <manufacturer_id>: because manufacturer_id is a foreign key referencing the <manufacturers> table.
CREATE INDEX idx_cars_manufacturer_id ON cars (manufacturer_id);

-- For table <bill>
-- In column <customer_id>: because customer_id is a foreign key referencing the <customers> table.
-- In column <salesman_id>: because salesman_id is a foreign key referencing the <salesmen> table.
-- In column <car_id>: because car_id is a foreign key referencing the <cars> table.
CREATE INDEX idx_bill_customer_id ON bill (customer_id);
CREATE INDEX idx_bill_salesman_id ON bill (salesman_id);
CREATE INDEX idx_bill_car_id ON bill (car_id);

-- For table <services>:
-- In column <bill_id>: becuase it is a foreign referencing the <bill> table.
CREATE INDEX idx_services_bill_id ON services (bill_id);

