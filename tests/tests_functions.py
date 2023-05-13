import pandas as pd
from pandas.testing import assert_frame_equal
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

func1_expected_output = pd.read_csv("tests/query_results/function1_output.csv")
func2_expected_output = pd.read_csv("tests/query_results/function2_output.csv")

def function_1(expected_output):
    cur = conn.cursor() # creating a cursor object
    cur.execute(
        """
        SELECT * FROM get_top_spending_customers(5);
        """
    )
    out = cur.fetchall()
    cur.close()
    out_df = pd.DataFrame(out, columns=['customer_id','first_name', 'total_amount'])
    return  (expected_output.equals(out_df))

try:
    assert function_1(expected_output=func1_expected_output) == True
    print("function-1 passed")
except AssertionError:
    raise AssertionError("function-1 failed")



def function_2(expected_output):
    cur = conn.cursor() # creating a cursor object
    cur.execute(
        """
        SELECT * FROM get_top_salesmen(5);
        """
    )
    out = cur.fetchall()
    cur.close()
    out_df = pd.DataFrame(out, columns=['salesman_id','first_name', 'last_name', 'revenue_amount'])


    return  (expected_output.equals(out_df))

try:
    assert function_2(expected_output=func2_expected_output) == True
    print("function-2 passed ")
except AssertionError:
    raise AssertionError("function-2 failed")