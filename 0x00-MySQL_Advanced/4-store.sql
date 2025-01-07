-- Create a trigger that describes the quantity of an item after adding
-- a new order
DROP TRIGGER IF EXISTS reduce_quantity;
DELIMITER $$
CREATE TRIGGER reduce_quantity
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE items
        SET quantity = quantity - NEW.NUMBER
	WHERE name = New.item_name;
END $$
DELIMITER ;
