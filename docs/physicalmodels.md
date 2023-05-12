# Physical model

---
## Table models

- Table `customers`:

| Title          | Description        | Datatype  | Constraint    |
|----------------|--------------------|-----------|---------------|
| `customer_id`  | ID                 | `Integer` | `PRIMARY KEY` |
| `first_name`   | customer's name    | `VARCHAR` | `NOT NULL`    |
| `phone_number` | phone number       | `INTEGER` | `NOT NULL`    |
| `email`        | customer's email   | `VARCHAR` | `NOT NULL`    |




- Table `bill`:

| Title           | Description          | Datatype  | Constraint    |
|-----------------|----------------------|-----------|---------------|
| `bill_id`       | identifier           | `INTEGER` | `PRIMARY KEY` |
| `purchase_date` | date of the purchase | `VARCHAR` | `NOT NULL`    |
| `customer_id`   | customer's id        | `INTEGER` | `FOREIGN KEY` |
| `salesman_id`   | salesman's id        | `INTEGER` | `FOREIGN KEY` |
| `car_id`        | id of the car        | `INTEGER` | `FOREIGN KEY` |
| `amount_paid`   | amount on the bill   | `INTEGER` | `NOT NULL`    |


- Table `cars`:

| Title            | Description              | Datatype  | Constraint    |
|------------------|--------------------------|-----------|---------------|
| `car_id`         | identifier               | `INTEGER` | `PRIMARY KEY` |
| `manufactuer_id` | manufactuer's id         | `INTEGER` | `FOREIGN KEY` |
| `make`           | brand of the car         | `VARCHAR` | `NOT NULL`    |
| `model`          | model of the car         | `VARCHAR` | `NOT NULL`    |
| `year`           | year the car was created | `INTEGER` | `NOT NULL`    |


- Table `manufacturers`:

| Title             | Description                 | Datatype  | Constraint    |
|-------------------|-----------------------------|-----------|---------------|
| `manufacturer_id` | identifier                  | `INTEGER` | `PRIMARY KEY` |
| `name`            | name of the manufactuer     | `VARCHAR` | `NOT NULL`    |
| `phone_number`    | manufacturer's phone number | `VARCHAR` | `NOT NULL`    |
| `country`         | country of origin           | `VARCHAR` | `NOT NULL`    |
| `website`         | manufacturer's website      | `VARCHAR` | `NOT NULL`    |




- Table `salesmen`:

| Title         | Description     | Datatype  | Constraint    |
|---------------|-----------------|-----------|---------------|
| `salesman_id` | Identifier      | `INTEGER` | `PRIMARY KEY` |
| `first_name`  | salesman's name | `VARCHAR` | `NOT NULL`    |
| `last_name`   | salesman's name | `VARCHAR` | `NOT NULL`    |


- Table `services`:

| Title          | Description                      | Datatype  | Constraint    |
|----------------|----------------------------------|-----------|---------------|
| `service_id`   | identifier                       | `INTEGER` | `PRIMARY KEY` |
| `service_date` | date of the service              | `DATE`    | `NOT NULL`    |
| `bill_id`      | bill associated with the service | `INTEGER` | `FOREIGN KEY` |


---
## SQL CREATE commands
- Table `customers`: 
```
CREATE TABLE customers (
   customer_id INTEGER PRIMARY KEY,
   first_name VARCHAR NOT NULL,
   phone_number INTEGER NOT NULL,
   email VARCHAR NOT NULL,
);
```

- Table `bill`:
```
CREATE TABLE bill (
   bill_id INTEGER PRIMARY KEY,
   purchase_date VARCHAR NOT NULL,
   customer_id INTEGER REFERENCES customers(customer_id),
   salesman_id INTEGER REFERENCES salesmen(salesman_id),
   car_id INTEGER REFERENCES cars(car_id),
   amount_paid INTEGER NOT NULL
);
```


- Table `cars`:
```
CREATE TABLE cars (
   car_id INTEGER PRIMARY KEY,
   manufacturer_id INTEGER REFERENCES manufacturers(manufacturer_id),
   make VARCHAR NOT NULL,
   model VARCHAR NOT NULL,
   year INTEGER NOT NULL,
);
```

- Table `manufacturers`:
```
CREATE TABLE manufacturers (
   manufacturer_id INTEGER PRIMARY KEY,
   name VARCHAR NOT NULL,
   phone_number VARCHAR NOT NULL,
   country VARCHAR NOT NULL,
   website VARCHAR NOT NULL
);
```

- Table `salesmen`: 
```
CREATE TABLE SALESMEN(
    salesman_id INTEGER PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL
);
```

- Table `services`:
```
CREATE TABLE services(
    service_id INTEGER PRIMARY KEY;
    service_date DATE NOT NULL,
    bill_id INTEGER REFERENCES bill(bill_id)
);
```
