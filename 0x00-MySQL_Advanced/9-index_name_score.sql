-- Create an index 'idx_name_first_score' on the table names and 
-- The first letter of name and the score.
CREATE INDEX dx_name_first_score ON names(name(1), score);
