-- Exercise: Create SQL queries to add and update bookings
-- Task 1

DROP PROCEDURE IF EXISTS AddBooking;

DELIMITER \\

CREATE PROCEDURE AddBooking(
    IN customerID INT,
    IN bookingDate DATE,
    IN tableNumber INT,
    IN employeeID INT,
    IN bookingSlot TIME
)
BEGIN
    INSERT INTO bookings (Date, TableNo, CustomerID, EmployeeID, BookingSlot)
    VALUES (bookingDate, tableNumber, customerID, employeeID, bookingSlot);

    SELECT CONCAT('New booking successfully added.') AS Confirmation;
END;
\\

DELIMITER ;

CALL AddBooking(6,"2022-12-30",3,4,"18:45:00");