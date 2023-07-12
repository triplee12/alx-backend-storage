-- Buy buy buy
DELIMITER //

CREATE TRIGGER decrease_quantity_trigger
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE items
    SET quantity = quantity - NEW.quantity
    WHERE id = NEW.item_id;
END //

DELIMITER ;
