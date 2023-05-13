import pandas as pd
import psycopg2


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


expected_output_view1 = pd.read_csv('tests/query_results/view_1.csv')
expected_output_view2 = pd.read_csv('tests/query_results/view_2.csv')
expected_output_view3 = pd.read_csv('tests/query_results/view_3.csv')
expected_output_view4 = pd.read_csv('tests/query_results/view_4.csv')
expected_output_view5 = pd.read_csv('tests/query_results/view_5.csv')
expected_output_view6 = pd.read_csv('tests/query_results/view_6.csv')

# view-1
def view1(expected_output):
    cur = conn.cursor()
    cur.execute(
        """
        SELECT * FROM customer_hidden_numbers;
        """
    )
    out = cur.fetchall()
    cur.close()
    out_df = pd.DataFrame(out, columns=['customer_id','email','first_name','phone_number_masked'])
    return  (expected_output.equals(out_df))

try:
    assert view1(expected_output=expected_output_view1) == True
    print("view-1 passed")
except AssertionError:
    raise AssertionError("view-1 failed")

# view-2
def view2(expected_output):
    cur = conn.cursor()
    cur.execute(
        """
        SELECT * FROM customers_hidden_emails;
        """
    )
    out = cur.fetchall()
    cur.close()
    out_df = pd.DataFrame(out, columns=["customer_id","first_name","email_masked"])
    return  (expected_output.equals(out_df))

try:
    assert view2(expected_output=expected_output_view2) == True
    print("view-2 passed")
except AssertionError:
    raise AssertionError("view-2 failed")


# view-3
def view3(expected_output):
    cur = conn.cursor()
    cur.execute(
        """
        SELECT * from revenue_by_make;
        """
    )
    out = cur.fetchall()
    cur.close()
    out_df = pd.DataFrame(out, columns=["make","total_revenue"])
    return  (expected_output.equals(out_df))

try:
    assert view3(expected_output=expected_output_view3) == True
    print("view-3 passed")
except AssertionError:
    raise AssertionError("view-3 failed")


# view-4
def view4(expected_output):
    cur = conn.cursor()
    cur.execute(
        """
        SELECT * from revenue_by_salesman;
        """
    )
    out = cur.fetchall()
    cur.close()
    out_df = pd.DataFrame(out, columns=["salesman_id","salesman_name","total_revenue"])
    return  (expected_output.equals(out_df))

try:
    assert view4(expected_output=expected_output_view4) == True
    print("view-4 passed")
except AssertionError:
    raise AssertionError("view-4 failed")

# view-5
def view5(expected_output):
    cur = conn.cursor()
    cur.execute(
        """
        SELECT * FROM amount_spent_by_customers;
        """
    )
    out = cur.fetchall()
    cur.close()
    out_df = pd.DataFrame(out, columns=["customer_id","first_name","total_amount_spent"])
    return  (expected_output.equals(out_df))

try:
    assert view5(expected_output=expected_output_view5) == True
    print("view-5 passed")
except AssertionError:
    raise AssertionError("view-5 failed")



# view-6
def view6(expected_output):
    cur = conn.cursor()
    cur.execute(
        """
        SELECT * FROM top_selling_cars;
        """
    )
    out = cur.fetchall()
    cur.close()
    out_df = pd.DataFrame(out, columns=["model","total_quantity_sold"])
    return  (expected_output.equals(out_df))

try:
    assert view6(expected_output=expected_output_view6) == True
    print("view-6 passed")
except AssertionError:
    raise AssertionError("view-6 failed")

conn.close()

