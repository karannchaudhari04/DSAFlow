-- Drop unique user leetcode composite constraint
ALTER TABLE problems DROP CONSTRAINT IF EXISTS unique_user_leetcode;

-- Drop foreign key user_id column
ALTER TABLE problems DROP COLUMN IF EXISTS user_id;

-- Restore simple unique constraint on leetcode_number
ALTER TABLE problems ADD CONSTRAINT unique_leetcode_number UNIQUE (leetcode_number);

-- Drop users table
DROP TABLE IF EXISTS users;
