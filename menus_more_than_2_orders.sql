-- Exercise: Create a virtual table to summarize data 
-- Task 3

SELECT DISTINCT Cuisine AS MenuName
FROM MenuItems
WHERE MenuID = ANY (
    SELECT MenuID
    FROM Orders
    WHERE Quantity > 2
);