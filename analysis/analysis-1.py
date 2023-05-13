import psycopg2
import matplotlib.pyplot as plt
import pandas as pd

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

query = """
    SELECT car_id, amount_paid
    FROM bill
    ORDER BY amount_paid DESC
    LIMIT 10;
"""
df = pd.read_sql_query(query, conn)

conn.close

# Create the bar chart using Matplotlib
plt.bar(df['car_id'], df['amount_paid'])
plt.xlabel('Car ID')
plt.ylabel('Amount Spent')
plt.title('Top 10 Most Expensive Cars')
plt.xticks(df['car_id'])  # Set x-ticks to display whole integers
plt.show()
