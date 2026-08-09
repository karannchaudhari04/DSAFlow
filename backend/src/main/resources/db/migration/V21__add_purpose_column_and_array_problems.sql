-- V21: Add purpose column and seed array problems with purpose values

-- 1. Add purpose column to problems table
ALTER TABLE problems ADD COLUMN purpose VARCHAR(500);

-- 2. Update purposes of existing array problems
UPDATE problems SET purpose = 'Digit counting + traversal' WHERE leetcode_number = 1295;
UPDATE problems SET purpose = 'Counting combinations' WHERE leetcode_number = 1512;
UPDATE problems SET purpose = 'Fundamental running-sum pattern' WHERE leetcode_number = 1480;
UPDATE problems SET purpose = 'Running sum inside nested traversal' WHERE leetcode_number = 1672;
UPDATE problems SET purpose = 'Running maximum' WHERE leetcode_number = 485;
UPDATE problems SET purpose = 'Running minimum + maximum' WHERE leetcode_number = 121;
UPDATE problems SET purpose = 'Left/right sum' WHERE leetcode_number = 724;
UPDATE problems SET purpose = 'Prefix-sum reasoning' WHERE leetcode_number = 1991;
UPDATE problems SET purpose = 'Actual prefix-sum application' WHERE leetcode_number = 303;
UPDATE problems SET purpose = 'Advanced prefix-sum + HashMap' WHERE leetcode_number = 560;
UPDATE problems SET purpose = 'In-place overwrite' WHERE leetcode_number = 27;
UPDATE problems SET purpose = 'In-place rearrangement' WHERE leetcode_number = 283;
UPDATE problems SET purpose = 'In-place modification' WHERE leetcode_number = 26;
UPDATE problems SET purpose = 'Array manipulation' WHERE leetcode_number = 189;
UPDATE problems SET purpose = 'Matrix indexing' WHERE leetcode_number = 1572;
UPDATE problems SET purpose = 'Row/column manipulation' WHERE leetcode_number = 867;
UPDATE problems SET purpose = 'Boundary traversal' WHERE leetcode_number = 54;
UPDATE problems SET purpose = 'Frequency/majority concept' WHERE leetcode_number = 169;
UPDATE problems SET purpose = 'Prefix/suffix technique' WHERE leetcode_number = 238;

-- 3. Insert new array problems that do not already exist
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
-- Array Traversal
('c0000000-0000-0000-0000-000000000281', 'a0a00000-0000-0000-0000-000000000201', 2798, 'Number of Employees Who Met the Target', 'https://leetcode.com/problems/number-of-employees-who-met-the-target/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Conditional counting'),
('c0000000-0000-0000-0000-000000000282', 'a0a00000-0000-0000-0000-000000000201', 2956, 'Find Common Elements Between Two Arrays', 'https://leetcode.com/problems/find-common-elements-between-two-arrays/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Basic traversal practice'),

-- Counting
('c0000000-0000-0000-0000-000000000283', 'a0a00000-0000-0000-0000-000000000202', 1773, 'Count Items Matching a Rule', 'https://leetcode.com/problems/count-items-matching-a-rule/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Conditional counting'),
('c0000000-0000-0000-0000-000000000284', 'a0a00000-0000-0000-0000-000000000202', 448, 'Find All Numbers Disappeared in an Array', 'https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Array-based counting'),

-- Running Sum
('c0000000-0000-0000-0000-000000000285', 'a0a00000-0000-0000-0000-000000000203', 1732, 'Find the Highest Altitude', 'https://leetcode.com/problems/find-the-highest-altitude/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Running sum + maximum'),

-- Running Min/Max
('c0000000-0000-0000-0000-000000000286', 'a0a00000-0000-0000-0000-000000000204', 2215, 'Find the Difference of Two Arrays', 'https://leetcode.com/problems/find-the-difference-of-two-arrays/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Basic comparison'),

-- In-place Modification
('c0000000-0000-0000-0000-000000000287', 'a0a00000-0000-0000-0000-000000000206', 75, 'Sort Colors', 'https://leetcode.com/problems/sort-colors/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'In-place rearrangement'),

-- Matrix / 2D Array
('c0000000-0000-0000-0000-000000000288', 'a0a00000-0000-0000-0000-000000000207', 566, 'Reshape the Matrix', 'https://leetcode.com/problems/reshape-the-matrix/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, '2D -> 2D indexing'),

-- Basic Array Techniques
('c0000000-0000-0000-0000-000000000289', 'a0a00000-0000-0000-0000-000000000208', 217, 'Contains Duplicate', 'https://leetcode.com/problems/contains-duplicate/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Duplicate detection'),
('c0000000-0000-0000-0000-000000000290', 'a0a00000-0000-0000-0000-000000000208', 136, 'Single Number', 'https://leetcode.com/problems/single-number/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'XOR/basic array technique'),
('c0000000-0000-0000-0000-000000000291', 'a0a00000-0000-0000-0000-000000000208', 53, 'Maximum Subarray', 'https://leetcode.com/problems/maximum-subarray/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Kadane''s Algorithm')
ON CONFLICT (leetcode_number) DO NOTHING;

-- 4. Seed placeholder details for these newly created problems
INSERT INTO problem_details (problem_id, intuition, approach, code_snippet, complexity_analysis, what_i_learned)
SELECT id, 'Study the array problem.', 'Implement the solution.', '// Code snippet', 'N/A', 'Practice makes perfect'
FROM problems 
WHERE id IN (
    'c0000000-0000-0000-0000-000000000281',
    'c0000000-0000-0000-0000-000000000282',
    'c0000000-0000-0000-0000-000000000283',
    'c0000000-0000-0000-0000-000000000284',
    'c0000000-0000-0000-0000-000000000285',
    'c0000000-0000-0000-0000-000000000286',
    'c0000000-0000-0000-0000-000000000287',
    'c0000000-0000-0000-0000-000000000288',
    'c0000000-0000-0000-0000-000000000289',
    'c0000000-0000-0000-0000-000000000290',
    'c0000000-0000-0000-0000-000000000291'
)
ON CONFLICT (problem_id) DO NOTHING;
