-- Exercise: Create a virtual table to summarize data 
-- Task 2

SELECT C.CustomerID, C.FullName, O.OrderID, O.Cost, M.Cuisine, M.Name
FROM Customers AS C
INNER JOIN Bookings AS B ON C.CustomerID = B.CustomerID
INNER JOIN Orders AS O ON B.BookingID = O.BookingID
INNER JOIN MenuItems AS M ON O.MenuID = M.MenuID
WHERE O.Cost > 150
ORDER BY O.Cost ASC