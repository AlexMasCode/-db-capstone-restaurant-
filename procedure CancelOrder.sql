DELIMITER //

CREATE PROCEDURE CancelOrder(IN o_id INT)
BEGIN
    DELETE FROM orders WHERE OrderID = o_id;

    SELECT CONCAT('Order ', o_id, ' is cancelled') AS Confirmation;
END //

DELIMITER ;
