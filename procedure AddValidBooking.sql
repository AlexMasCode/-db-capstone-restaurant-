DELIMITER //

CREATE PROCEDURE AddValidBooking(IN booking_date DATE, IN table_number INT)
BEGIN
    DECLARE table_count INT;

    START TRANSACTION;

    SELECT COUNT(*) INTO table_count
    FROM Bookings
    WHERE BookingDate = booking_date AND NumTable = table_number;

    IF table_count > 0 THEN
        ROLLBACK;
        SELECT 'Table ' AS 'Booking status', table_number AS 'Table Number', 'is already booked - booking cancelled' AS 'Message';
    ELSE
        INSERT INTO Bookings (BookingDate, NumTable)
        VALUES (booking_date, table_number);
        COMMIT;
        SELECT 'Booking added successfully' AS 'Booking status';
    END IF;
END //

DELIMITER ;
