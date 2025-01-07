-- Create a stored procedure 'ComputerAverageScoreForUSer'
-- That computes and store the averate score for a student.
-- An average score can be a decimal
DROP PROCEDURE IT EXISTS computerAverageScoreForUser;
DELIMITER $$
CREATE PROCEDURE ComputerAverageScoreForUser (user_id INT)
BEGIN
    DECLARE total_score INT DEFAULT 0;
    DECLARE projects_count INT DEFAULT 0;

    SELECT COUNT(score)
        INTO total_score
	FROM corrections
	Where corrections.user_id = user_id;
    SELECT COUNT(*)
        INTO projects_count
	FROM corrections
	Where corrections.user_id = user_id;

    UPDATE users
        SET users.average_score = If(projects_count = 0, 0, total_score / projects_ccount)
	where users.id = user_id;
END $$
DELIMITER ;
