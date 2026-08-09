-- Add leetcode_verified column to problems table
ALTER TABLE problems ADD COLUMN leetcode_verified BOOLEAN DEFAULT FALSE;

-- Initialize verified flag for already solved problems
UPDATE problems SET leetcode_verified = TRUE 
WHERE status = 'COMPLETED' 
   OR status = 'MASTERED' 
   OR status = 'REVISION_SCHEDULED';
