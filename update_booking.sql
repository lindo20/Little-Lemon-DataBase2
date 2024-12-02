-- Exercise: Create SQL queries to add and update bookings
-- Task 2

DROP PROCEDURE IF EXISTS UpdateBooking;

DELIMITER \\

CREATE PROCEDURE UpdateBooking(
    IN bookID INT,
    IN newBookingDate DATE
)
BEGIN
    UPDATE bookings
    SET Date = newBookingDate
    WHERE BookingID = bookID;

    SELECT CONCAT('Booking ', bookID, ' updated.') AS Confirmation;
END;
\\

DELIMITER ;

CALL UpdateBooking(8,"2022-12-17");
