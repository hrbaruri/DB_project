-- Trigger 1: The trigger ensures that the amount_paid cannot exceed a certain threshold for each purchase:

CREATE OR REPLACE FUNCTION check_amount_paid()
    RETURNS TRIGGER AS $$
    BEGIN
        IF NEW.amount_paid > 1000000 THEN -- Example threshold: 1,000,000
            RAISE EXCEPTION 'Amount paid exceeds the maximum threshold.';
        END IF;
        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER enforce_amount_paid_threshold
    BEFORE INSERT OR UPDATE ON bill
    FOR EACH ROW
    EXECUTE FUNCTION check_amount_paid();

-- Trigger 2: The trigger ensures that only non-negative numbers can be entered in the amount_paid field of the table <bill> 
CREATE OR REPLACE FUNCTION check_positive_amount_paid()
  RETURNS TRIGGER AS $$
  BEGIN
    IF NEW.amount_paid < 0 THEN
      RAISE EXCEPTION 'Amount paid cannot be a negative number.';
    END IF;
    RETURN NEW;
  END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER enforce_positive_amount_paid
  BEFORE INSERT OR UPDATE ON bill
  FOR EACH ROW
  EXECUTE FUNCTION check_positive_amount_paid();

