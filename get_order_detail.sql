-- Exercise: Create optimized queries to manage and analyze data 
-- Task 2

PREPARE GetOrderDetail FROM 
"SELECT OrderID, Quantity, Cost 
FROM Orders AS O INNER JOIN Bookings AS B 
ON O.BookingID = B.BookingID
WHERE B.CustomerID = ?";

SET @id = 1;
EXECUTE GetOrderDetail USING @id;
  