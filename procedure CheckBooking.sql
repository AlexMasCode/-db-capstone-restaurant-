DELIMITER //

CREATE PROCEDURE CheckBooking(IN booking_date DATE, IN table_number INT)
BEGIN
    DECLARE table_count INT;

    SELECT COUNT(*) INTO table_count
    FROM Bookings
    WHERE BookingDate = booking_date AND NumTable = table_number;

    IF table_count > 0 THEN
        SELECT CONCAT('Table ', table_number, ' is already booked') AS 'Booking status';
    ELSE
        SELECT CONCAT('Table ', table_number, ' is available') AS 'Booking status';
    END IF;
END //

DELIMITER ;
