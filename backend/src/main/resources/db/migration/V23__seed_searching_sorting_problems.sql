-- V23: Configure Searching & Sorting subtopics and seed problems

-- 1. Delete unused/merged subtopics from patterns (first delete any problems associated with them)
DELETE FROM problem_details WHERE problem_id IN (
    SELECT id FROM problems WHERE pattern_id IN (
        'a0a00000-0000-0000-0000-000000000401',
        'a0a00000-0000-0000-0000-000000000405',
        'a0a00000-0000-0000-0000-000000000408',
        'a0a00000-0000-0000-0000-000000000409',
        'a0a00000-0000-0000-0000-000000000413'
    )
);
DELETE FROM problems WHERE pattern_id IN (
    'a0a00000-0000-0000-0000-000000000401',
    'a0a00000-0000-0000-0000-000000000405',
    'a0a00000-0000-0000-0000-000000000408',
    'a0a00000-0000-0000-0000-000000000409',
    'a0a00000-0000-0000-0000-000000000413'
);
DELETE FROM patterns WHERE id IN (
    'a0a00000-0000-0000-0000-000000000401',
    'a0a00000-0000-0000-0000-000000000405',
    'a0a00000-0000-0000-0000-000000000408',
    'a0a00000-0000-0000-0000-000000000409',
    'a0a00000-0000-0000-0000-000000000413'
);

-- 2. Rename remaining subtopics and set correct sequence order
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000000402', 'b0a00000-0000-0000-0000-000000000004', 'Classic Binary Search', 'Binary search algorithm details.', '', '', '', 'O(log N)', 'O(1)', 'None', 'NOT_STARTED', 1),
('a0a00000-0000-0000-0000-000000000403', 'b0a00000-0000-0000-0000-000000000403', 'First / Last Occurrence', 'First and last index boundaries.', '', '', '', 'O(log N)', 'O(1)', 'None', 'NOT_STARTED', 2),
('a0a00000-0000-0000-0000-000000000404', 'b0a00000-0000-0000-0000-000000000004', 'Lower Bound / Upper Bound', 'Lower/upper bounds extraction.', '', '', '', 'O(log N)', 'O(1)', 'None', 'NOT_STARTED', 3),
('a0a00000-0000-0000-0000-000000000406', 'b0a00000-0000-0000-0000-000000000004', 'Binary Search on Answer', 'Binary search on response space.', '', '', '', 'O(log N)', 'O(1)', 'None', 'NOT_STARTED', 4),
('a0a00000-0000-0000-0000-000000000407', 'b0a00000-0000-0000-0000-000000000004', 'Basic Sorting Algorithms', 'Basic sorting methods.', '', '', '', 'O(N^2)', 'O(1)', 'None', 'NOT_STARTED', 5),
('a0a00000-0000-0000-0000-000000000410', 'b0a00000-0000-0000-0000-000000000004', 'Merge Sort', 'Merge sorting.', '', '', '', 'O(N log N)', 'O(N)', 'None', 'NOT_STARTED', 6),
('a0a00000-0000-0000-0000-000000000411', 'b0a00000-0000-0000-0000-000000000004', 'Quick Sort', 'Quick sorting.', '', '', '', 'O(N log N)', 'O(log N)', 'None', 'NOT_STARTED', 7),
('a0a00000-0000-0000-0000-000000000412', 'b0a00000-0000-0000-0000-000000000004', 'Sorting-Based Problem Solving', 'Solving sorting problems.', '', '', '', 'O(N log N)', 'O(1)', 'None', 'NOT_STARTED', 8)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, sequence_order = EXCLUDED.sequence_order;

-- 3. Map/move existing problems to their new patterns and update their purposes
UPDATE problems SET pattern_id = 'a0a00000-0000-0000-0000-000000000402', purpose = 'Binary search + insertion index' WHERE leetcode_number = 35;
UPDATE problems SET pattern_id = 'a0a00000-0000-0000-0000-000000000403', purpose = 'Core boundary search' WHERE leetcode_number = 34;
UPDATE problems SET pattern_id = 'a0a00000-0000-0000-0000-000000000410', purpose = 'Implement Merge/Quick Sort' WHERE leetcode_number = 912;
UPDATE problems SET pattern_id = 'a0a00000-0000-0000-0000-000000000411', purpose = 'Partition/selection concept' WHERE leetcode_number = 215;

UPDATE problems SET purpose = 'Lower-bound foundation' WHERE leetcode_number = 35 AND purpose IS NULL;
UPDATE problems SET purpose = 'Boundary search' WHERE leetcode_number = 34 AND purpose IS NULL;
UPDATE problems SET purpose = 'Sorting-based reasoning' WHERE leetcode_number = 169;
UPDATE problems SET purpose = 'Sorted array' WHERE leetcode_number = 977;
UPDATE problems SET purpose = 'Sorting/in-place' WHERE leetcode_number = 75;

-- 4. Insert new Searching & Sorting problems
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
-- Classic Binary Search
('c0000000-0000-0000-0000-000000000481', 'a0a00000-0000-0000-0000-000000000402', 704, 'Binary Search', 'https://leetcode.com/problems/binary-search/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Fundamental implementation'),
('c0000000-0000-0000-0000-000000000482', 'a0a00000-0000-0000-0000-000000000402', 69, 'Sqrt(x)', 'https://leetcode.com/problems/sqrtx/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Binary search on answer'),
('c0000000-0000-0000-0000-000000000483', 'a0a00000-0000-0000-0000-000000000402', 374, 'Guess Number Higher or Lower', 'https://leetcode.com/problems/guess-number-higher-or-lower/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Search-space reduction'),

-- First / Last Occurrence
('c0000000-0000-0000-0000-000000000484', 'a0a00000-0000-0000-0000-000000000403', 744, 'Find Smallest Letter Greater Than Target', 'https://leetcode.com/problems/find-smallest-letter-greater-than-target/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Boundary concept'),
('c0000000-0000-0000-0000-000000000485', 'a0a00000-0000-0000-0000-000000000403', 702, 'Search in a Sorted Array of Unknown Size', 'https://leetcode.com/problems/search-in-a-sorted-array-of-unknown-size/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Advanced boundary/search-space thinking'),

-- Lower Bound / Upper Bound
('c0000000-0000-0000-0000-000000000486', 'a0a00000-0000-0000-0000-000000000404', 1351, 'Count Negative Numbers in a Sorted Matrix', 'https://leetcode.com/problems/count-negative-numbers-in-a-sorted-matrix/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Boundary/search reasoning'),

-- Binary Search on Answer
('c0000000-0000-0000-0000-000000000487', 'a0a00000-0000-0000-0000-000000000406', 875, 'Koko Eating Bananas', 'https://leetcode.com/problems/koko-eating-bananas/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Classic binary search on answer'),
('c0000000-0000-0000-0000-000000000488', 'a0a00000-0000-0000-0000-000000000406', 1011, 'Capacity To Ship Packages Within D Days', 'https://leetcode.com/problems/capacity-to-ship-packages-within-d-days/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Search minimum feasible answer'),
('c0000000-0000-0000-0000-000000000489', 'a0a00000-0000-0000-0000-000000000406', 410, 'Split Array Largest Sum', 'https://leetcode.com/problems/split-array-largest-sum/', 'HARD', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Advanced optional'),

-- Merge Sort
('c0000000-0000-0000-0000-000000000490', 'a0a00000-0000-0000-0000-000000000410', 88, 'Merge Sorted Array', 'https://leetcode.com/problems/merge-sorted-array/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Merge technique'),

-- Sorting-Based Problem Solving
('c0000000-0000-0000-0000-000000000491', 'a0a00000-0000-0000-0000-000000000412', 252, 'Meeting Rooms', 'https://leetcode.com/problems/meeting-rooms/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Sorting intervals')
ON CONFLICT (leetcode_number) DO NOTHING;

-- 5. Seed placeholder details for new problems
INSERT INTO problem_details (problem_id, intuition, approach, code_snippet, complexity_analysis, what_i_learned)
SELECT id, 'Study search/sort algorithm.', 'Implement correctly.', '// Code snippet', 'N/A', 'Practice makes perfect'
FROM problems 
WHERE id IN (
    'c0000000-0000-0000-0000-000000000481',
    'c0000000-0000-0000-0000-000000000482',
    'c0000000-0000-0000-0000-000000000483',
    'c0000000-0000-0000-0000-000000000484',
    'c0000000-0000-0000-0000-000000000485',
    'c0000000-0000-0000-0000-000000000486',
    'c0000000-0000-0000-0000-000000000487',
    'c0000000-0000-0000-0000-000000000488',
    'c0000000-0000-0000-0000-000000000489',
    'c0000000-0000-0000-0000-000000000490',
    'c0000000-0000-0000-0000-000000000491'
)
ON CONFLICT (problem_id) DO NOTHING;
