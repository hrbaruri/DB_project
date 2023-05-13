-- Function-1: A function get_top_spending_customers(IN top_n INTEGER) that
--             returns a table with the top n customers' names and the amount they spent
CREATE OR REPLACE FUNCTION get_top_spending_customers(IN top_n INTEGER)
    RETURNS TABLE (customer_id INTEGER, first_name VARCHAR, total_amount BIGINT) AS $$
BEGIN
    RETURN QUERY
    SELECT c.customer_id, c.first_name, SUM(b.amount_paid) AS total_amount
    FROM customers c
    INNER JOIN bill b ON c.customer_id = b.customer_id
    GROUP BY c.customer_id, c.first_name
    ORDER BY total_amount DESC
    LIMIT top_n;

    RETURN;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_top_spending_customers(5);

-- Function-2: A function get_top_salesmen(IN top_n INTEGER) that returns a table 
--             with the top n salesmen's names and the revenue they generated
CREATE OR REPLACE FUNCTION get_top_salesmen(IN top_n INTEGER)
  RETURNS TABLE (salesman_id INTEGER, first_name VARCHAR, last_name VARCHAR, revenue_amount BIGINT) AS $$
BEGIN
  RETURN QUERY
  SELECT s.salesman_id, s.first_name, s.last_name, SUM(b.amount_paid) AS revenue_amount
  FROM salesmen s
  INNER JOIN bill b ON s.salesman_id = b.salesman_id
  GROUP BY s.salesman_id
  ORDER BY revenue_amount DESC
  LIMIT top_n;

  RETURN;
END;
$$ LANGUAGE plpgsql;
SELECT * FROM get_top_salesmen(5);

