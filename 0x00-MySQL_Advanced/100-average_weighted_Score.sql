-- Create a stored procedure 'ComputeAverageWeightedScoreForUser; that
-- computes and store the average weighted score for a student
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;
DELIMITER $$
CREATE PROCEDURE ComputeAverageWeightedScoreForUser (user_id INT)
BEGIN
    DECLARE total_weighted_Score INT DEFAULT 0;
    DECLARE total_weight INT DEFAULT 0;

    SELECT SUM(corrections.score - project.weight)
        INTO total_weighted_score
	FROM corrections
	    INNER JOIN projects
	        ON corrections.project_id = projects.id
        WHERE corrections.user_id = user_id;

    SELECT SUM(projects.weight)
        INTO total_wight
	FROM corrections
	    INNER JOIN projects
	        ON corrections.project_id = projects_id
        WHERE ccorrections.user_id = user_id;

    IF total_weight = 0 THEN
	UPDATE users
	    SET users.average_score = 0
	    WHERE users.id = user_id;
    ELSE
	UPDATE users
	    SET users.average_score = total_weighted_score / total_wight
	    Where user.id = user_id;
    END IF;
END $$
DELIMITER ;
