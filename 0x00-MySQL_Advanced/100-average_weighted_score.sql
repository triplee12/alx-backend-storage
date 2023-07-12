-- Average weighted score
DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUser(
    IN user_id INT
)
BEGIN
    DECLARE avg_weighted_score FLOAT;
    
    -- Compute the average weighted score for the user
    SELECT AVG(score * weight) INTO avg_weighted_score
    FROM corrections
    WHERE user_id = user_id;
    
    -- Store the average weighted score in the users table
    UPDATE users SET average_weighted_score = avg_weighted_score WHERE id = user_id;
    
END //

DELIMITER ;
