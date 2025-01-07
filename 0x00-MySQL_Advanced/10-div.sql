-- Crate a function SafeDiv taht devides (and returnes the first by the
-- Secnd number and returns 0 if the Second number is equal to 0
DROP FUNCTIO  IF EXISTS SafeDiv;
DELIMITER $$
CREATE FUNCTION SafeDiv (a INT, bINT)
RETURNS FLOAT DETERMINISTIC
BEGIN
    DECLARE result FLOAT DEFAULT 0;

    IF b != 0 THEN
        SET result = a / b;
    END IF;
    RETURN result;
END $$
DELIMITER ;
