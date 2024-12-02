-- Exercise: Create SQL queries to check available bookings based on user input
-- Task 3

DROP PROCEDURE IF EXISTS AddValidBooking;

DELIMITER \\

CREATE PROCEDURE AddValidBooking(
    IN bookingDate DATE,
    IN tableNumber INT,
    IN customerID INT,
    IN employeeID INT,
    IN bookingSlot TIME
)
BEGIN
    DECLARE bookingCount INT;

    START TRANSACTION;

    SELECT COUNT(*) INTO bookingCount FROM bookings
    WHERE Date = bookingDate AND TableNo = tableNumber;

    IF bookingCount > 0 THEN
        ROLLBACK;
        SELECT CONCAT('Table ', tableNumber, ' is already booked on ', bookingDate) AS "Booking Status";
    ELSE
        INSERT INTO bookings (Date, TableNo, CustomerID, EmployeeID, BookingSlot)
        VALUES (bookingDate, tableNumber, customerID, employeeID, bookingSlot);
        COMMIT;
        SELECT CONCAT('Booking successful for Table ', tableNumber, ' on ', bookingDate) AS "Booking Status";
    END IF;
END;
\\

DELIMITER ;

CALL AddValidBooking("2022-12-17",6,2,4,"18:30:00");