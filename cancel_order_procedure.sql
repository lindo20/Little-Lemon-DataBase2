-- Exercise: Create optimized queries to manage and analyze data 
-- Task 3

DROP PROCEDURE IF EXISTS CancelOrder;

DELIMITER \\

CREATE PROCEDURE CancelOrder(IN Id INT)
BEGIN
    IF EXISTS (SELECT 1 FROM Orders WHERE OrderID = Id) THEN
        DELETE FROM Orders WHERE OrderID = Id;
        SELECT CONCAT('Order ', Id, ' is cancelled.') AS Result;
    ELSE
        SELECT CONCAT('Order ', Id, ' does not exist.') AS Result;
    END IF;
END\\

DELIMITER ;

CALL CancelOrder(11);