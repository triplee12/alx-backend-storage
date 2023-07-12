-- Average weighted score for all!
DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    DECLARE user_id INT;
    DECLARE avg_weighted_score FLOAT;
    
    -- Declare a cursor to iterate over all user IDs
    DECLARE user_cursor CURSOR FOR SELECT id FROM users;
    
    -- Open the cursor
    OPEN user_cursor;
    
    -- Fetch the first user ID
    FETCH user_cursor INTO user_id;
    
    -- Loop through all user IDs
    WHILE user_id IS NOT NULL DO
        -- Compute the average weighted score for the user
        SELECT AVG(score * weight) INTO avg_weighted_score
        FROM corrections
        WHERE user_id = user_id;
        
        -- Store the average weighted score in the users table
        UPDATE users SET average_weighted_score = avg_weighted_score WHERE id = user_id;
        
        -- Fetch the next user ID
        FETCH user_cursor INTO user_id;
    END WHILE;
    
    -- Close the cursor
    CLOSE user_cursor;
    
END //

DELIMITER ;
