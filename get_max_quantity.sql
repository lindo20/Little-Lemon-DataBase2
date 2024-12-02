-- Exercise: Create optimized queries to manage and analyze data 
-- Task 1

DROP PROCEDURE IF EXISTS GetMaxQuantity;

CREATE PROCEDURE GetMaxQuantity() 
SELECT MAX(Quantity) AS "Max Quantity in Order" FROM Orders;

CALL GetMaxQuantity();