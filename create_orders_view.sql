-- Exercise: Create a virtual table to summarize data 
-- Task 1

DROP VIEW IF EXISTS OrdersView;

CREATE VIEW OrdersView AS 
SELECT OrderID, Quantity, Cost 
FROM Orders
WHERE Quantity > 2;

SELECT * FROM OrdersView;