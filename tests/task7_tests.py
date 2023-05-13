import pandas as pd
from pandas.testing import assert_frame_equal
import psycopg2


print('hello world')
DB_name = "DB_project_cars"
DB_user = "hritendubaruri"
DB_pwd = "1928"
DB_port = "5432"
DB_host = "localhost"
# connect to the db


try:
    conn = psycopg2.connect(dbname=DB_name,
                            user=DB_user,
                            password=DB_pwd,
                            host=DB_host,
                            port=DB_port)
    print("Database connected successfully")

except:
    print("Database failed to connect")

# expected outputs:
expected_output_6a = pd.read_csv('tests/query_results/task6a_output.csv')
expected_output_6b = pd.read_csv('tests/query_results/task6b_output.csv')
expected_output_6c1 = pd.read_csv('tests/query_results/task6c1_output.csv')
expected_output_6c2 = pd.read_csv('tests/query_results/task6c2_output.csv')
expected_output_6c3 = pd.read_csv('tests/query_results/task6c3_output.csv')
expected_output_6d = pd.read_csv('tests/query_results/task6d_output.csv')

# Task 6a. GROUP BY + HAVING: finding all customers who spent more than 70000 at the dealership.
def task_6a(expected_output):
    cur = conn.cursor() # creating a cursor object
    cur.execute(
        """
        SELECT c.customer_id, c.first_name, SUM(b.amount_paid) AS total_amount_paid
        FROM customers c
        INNER JOIN bill b ON b.customer_id = c.customer_id
        GROUP BY c.customer_id, c.first_name
        HAVING SUM(b.amount_paid) > 70000;
        """
    )
    out = cur.fetchall()
    cur.close()

    out_df = pd.DataFrame(out, columns=['customer_id', 'first_name', 'total_amount_paid'])
    return  (expected_output.equals(out_df))

try:
    assert task_6a(expected_output=expected_output_6a) == True
    print("query 6a passed")
except AssertionError:
    raise AssertionError("query 6a failed")

# Task 6b. ORDER BY: arrange the customers in descing order of how much they spent at the dealership
def task_6b(expected_output):
    cur = conn.cursor()
    cur.execute(
        """
        SELECT c.customer_id, c.first_name, SUM(b.amount_paid) AS total_amount_paid
        FROM customers c
        INNER JOIN bill b ON b.customer_id = c.customer_id
        GROUP BY c.customer_id, c.first_name
        ORDER BY total_amount_paid DESC;
        """
    )
    out = cur.fetchall()
    cur.close()

    out_df = pd.DataFrame(out, columns=['customer_id', 'first_name', 'total_amount_paid'])
    return  (expected_output.equals(out_df))

try:
    assert task_6b(expected_output=expected_output_6b) == True
    print("query 6b passed")
except AssertionError:
    raise AssertionError("query 6b failed")

# Task 6c1. PARTITION BY: Find average price of each make
def task_6c1(expected_output):
    cur = conn.cursor()
    cur.execute(
        """
        SELECT model, 
        AVG(b.amount_paid) OVER(PARTITION BY make) AS average_make
        FROM cars
        INNER JOIN bill b ON b.car_id = cars.car_id;
        """
    )
    out = cur.fetchall()
    cur.close()
    out_df = pd.DataFrame(out, columns=['model', 'average_make'])
    # Convert average_make column to float type
    out_df['average_make'] = out_df['average_make'].astype(float)

    # Convert average_make column to float type
    expected_output['average_make'] = expected_output['average_make'].astype(float)
    
    return (expected_output.equals(out_df))


try:
    assert task_6c1(expected_output=expected_output_6c1) == True
    print("query 6c1 passed")
except AssertionError:
    raise AssertionError("query 6c1 failed")



# Task 6c2. ORDER BY: Rank the cars based on their prices.
def task_6c2(expected_output):
    cur = conn.cursor()
    cur.execute(
        """
        SELECT c.car_id, c.make, c.model, b.amount_paid,
            RANK() OVER (ORDER BY b.amount_paid DESC) AS car_rank
        FROM cars c
        INNER JOIN bill b ON b.car_id = c.car_id;
        """
    )
    out = cur.fetchall()
    cur.close()
    out_df = pd.DataFrame(out, columns=['car_id', 'make','model','amount_paid','car_rank'])

    return (expected_output.equals(out_df))

try:
    assert task_6c2(expected_output=expected_output_6c2) == True
    print("query 6c2 passed")
except AssertionError:
    raise AssertionError("query 6c2 failed")


# Task 6c3. PARTITION BY + ORDER BY: Find the most expensive car of each make
def task_6c3(expected_output):
    cur = conn.cursor()
    cur.execute(
        """
        SELECT make, model, car_price
            FROM (
            SELECT c.make, c.model, b.amount_paid AS car_price,
                ROW_NUMBER() OVER (PARTITION BY c.make ORDER BY b.amount_paid DESC) AS row_num
            FROM cars c
            INNER JOIN bill b ON b.car_id = c.car_id
        ) subquery
        WHERE row_num = 1
        order by car_price desc;
        """
    )
    out = cur.fetchall()
    cur.close()
    out_df = pd.DataFrame(out, columns=['make', 'model','car_price'])

    return (expected_output.equals(out_df))

try:
    assert task_6c3(expected_output=expected_output_6c3) == True
    print("query 6c3 passed")
except AssertionError:
    raise AssertionError("query 6c3 failed")


# Task 6d. <func> - all 3 types of functions - aggregating, ranking, offsets:
# Rank the top 3 car makes according to their average prices
def task_6d(expected_output):
    cur = conn.cursor()
    cur.execute(
        """
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
        LIMIT 3
    """)
    out = cur.fetchall()
    cur.close()
    out_df = pd.DataFrame(out, columns=['make', 'rank', 'average_make'])

    # Convert average_make column to float
    out_df['average_make'] = out_df['average_make'].astype(float)
    expected_output['average_make'] = expected_output['average_make'].astype(float)

    return (expected_output.equals(out_df))

try:
    assert task_6d(expected_output=expected_output_6d) == True
    print("query 6d passed")
except AssertionError:
    raise AssertionError("query 6d failed")