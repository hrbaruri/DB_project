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

# Query to calculate revenue for each salesman
query = """
    SELECT s.first_name || ' ' || s.last_name AS salesman_name, SUM(b.amount_paid) AS revenue
    FROM salesmen s
    INNER JOIN bill b ON s.salesman_id = b.salesman_id
    GROUP BY s.salesman_id
    ORDER BY revenue DESC
"""
# Execute the query and get the results as a Pandas DataFrame
df = pd.read_sql_query(query, conn)

# Close the database connection
conn.close()

# Create the pie chart using Matplotlib
plt.pie(df['revenue'], labels=None, autopct='%1.1f%%')
plt.title('Salesman Contribution to Total Revenue')
plt.axis('equal')

# Create a legend
plt.legend(df['salesman_name'], loc='right')

plt.show()