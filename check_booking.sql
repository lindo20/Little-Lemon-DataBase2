-- Exercise: Create SQL queries to check available bookings based on user input
-- Task 1

DELIMITER \\

DROP PROCEDURE IF EXISTS CheckBooking;

CREATE PROCEDURE CheckBooking(
    IN bookingDate DATE,
    IN tableNumber INT
)
BEGIN
    DECLARE bookingStatus VARCHAR(255);

    IF EXISTS (
        SELECT 1 
        FROM Bookings 
        WHERE Date = bookingDate AND TableNo = tableNumber
    ) THEN
        SET bookingStatus = CONCAT('Table ', tableNumber, ' is already booked.');
    ELSE
        SET bookingStatus = CONCAT('No reservation found.');
    END IF;

    SELECT bookingStatus AS "Booking Status";
END\\

DELIMITER ;

CALL CheckBooking("2022-11-12",3)