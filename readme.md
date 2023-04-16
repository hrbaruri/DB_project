
--- 
# Car dealership DataBase
***
This is a database about a car dealership that sells and services cars. It stores information about customers, bills, cars, manufacturers and salesmen who work in the dealership.
***
## Table `customers`:
stores info on customers. Each customer has an ID, first and last names, phone number and email.

***
## Table `bill`:
Stores information on bills paid by customer. It contains the bill id, the customer id of the related customer, the salesman id of the salesman in charge of the transcation, the amount paid, the car sold and the date of the transaction.

***
## Table `cars`:
Each car in this table has a car ID, a make, a model, manufacturer, and year in which it was made.

***
## Table `manufacturer`:
Each manufacturer has an ID, a name, phone number , country of origin and a website.
***

## Table `salesmen`:
This table only stores the salesman ID, and their first and last names.
***
## Table `service`:
The service Table stores information about the service ID, the bill_id of the bill that the customer paid for the service, and the date.