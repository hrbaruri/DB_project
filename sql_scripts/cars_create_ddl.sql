CREATE TABLE customers (
   customer_id SERIAL PRIMARY KEY,
   first_name VARCHAR NOT NULL,
   phone_number INTEGER NOT NULL,
   email VARCHAR NOT NULL
);

CREATE TABLE manufacturers (
   manufacturer_id SERIAL PRIMARY KEY,
   name VARCHAR NOT NULL,
   phone_number VARCHAR NOT NULL,
   country VARCHAR NOT NULL,
   website VARCHAR NOT NULL
);


CREATE TABLE cars (
   car_id SERIAL PRIMARY KEY,
   manufacturer_id INTEGER REFERENCES manufacturers(manufacturer_id),
   make VARCHAR NOT NULL,
   model VARCHAR NOT NULL,
   year INTEGER NOT NULL
);


CREATE TABLE salesmen(
    salesman_id SERIAL PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL
);

CREATE TABLE bill (
   bill_id SERIAL PRIMARY KEY,
   purchase_date VARCHAR NOT NULL,
   customer_id INTEGER REFERENCES customers(customer_id),
   salesman_id INTEGER REFERENCES salesmen(salesman_id),
   car_id INTEGER REFERENCES cars(car_id),
   amount_paid INTEGER NOT NULL
);
CREATE TABLE services(
    service_id SERIAL PRIMARY KEY,
    service_date DATE NOT NULL,
    bill_id INTEGER REFERENCES bill(bill_id)
);

