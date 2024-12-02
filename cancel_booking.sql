-- Exercise: Create SQL queries to add and update bookings
-- Task 3

DROP PROCEDURE CancelBooking;

DELIMITER \\

CREATE PROCEDURE CancelBooking(IN booking_id INT)
BEGIN
    IF EXISTS (SELECT 1 FROM bookings WHERE BookingID = booking_id) THEN
        DELETE FROM bookings WHERE BookingID = booking_id;
        SELECT CONCAT("Booking ",booking_id," cancelled.") AS Confirmation;
    ELSE
        SELECT "Booking ID does not exist" AS Confirmation;
    END IF;
    
END\\

DELIMITER ;

CALL CancelBooking(9);