-- Optimize search and score
CREATE INDEX idx_name_first_score ON names (SUBSTRING(name, 1, 1), score);
