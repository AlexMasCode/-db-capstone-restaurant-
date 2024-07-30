DELIMITER //

CREATE PROCEDURE AddBooking(
    IN booking_id INT,
    IN customer_id INT,
    IN table_number INT,
    IN booking_date DATE
)
BEGIN
    INSERT INTO Bookings (BookingID, CustomerID, NumTable, BookingDate)
    VALUES (booking_id, customer_id, table_number, booking_date);

    SELECT 'New booking added' AS Confirmation;
END //

DELIMITER ;
