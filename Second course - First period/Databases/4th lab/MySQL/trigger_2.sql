DELIMITER //
DROP TRIGGER IF EXISTS check_employees;

CREATE TRIGGER check_employees
BEFORE INSERT ON employees
FOR EACH ROW
  BEGIN
    IF RIGHT(NEW.uuid, 2) = '00' THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'WRONG uuid VALUE';
    END IF;
  END //
DELIMITER ;