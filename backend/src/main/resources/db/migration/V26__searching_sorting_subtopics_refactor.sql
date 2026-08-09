-- V26: Refactor Searching & Sorting subtopics layout and re-seed clean hierarchical problem associations

-- 1. Ensure Upper Bound (0405) exists as a separate pattern
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000000405', 'b0a00000-0000-0000-0000-000000000004', 'Upper Bound', 'Finding the first element strictly greater than target.', 'Finding strict greater item', 'Adjust pointers.', 'Simple binary search variation.', 'O(log N)', 'O(1)', 'Off-by-one errors.', 'NOT_STARTED', 5)
ON CONFLICT (id) DO NOTHING;

-- 2. Set correct names for all Searching & Sorting subtopics
UPDATE patterns SET name = 'Linear Search', sequence_order = 1 WHERE id = 'a0a00000-0000-0000-0000-000000000401';
UPDATE patterns SET name = 'Classic Binary Search', sequence_order = 2 WHERE id = 'a0a00000-0000-0000-0000-000000000402';
UPDATE patterns SET name = 'First/Last Occurrence', sequence_order = 3 WHERE id = 'a0a00000-0000-0000-0000-000000000403';
UPDATE patterns SET name = 'Lower Bound', sequence_order = 4 WHERE id = 'a0a00000-0000-0000-0000-000000000404';
UPDATE patterns SET name = 'Upper Bound', sequence_order = 5 WHERE id = 'a0a00000-0000-0000-0000-000000000405';
UPDATE patterns SET name = 'Binary Search on Answer', sequence_order = 6 WHERE id = 'a0a00000-0000-0000-0000-000000000406';
UPDATE patterns SET name = 'Bubble Sort', sequence_order = 7 WHERE id = 'a0a00000-0000-0000-0000-000000000407';
UPDATE patterns SET name = 'Selection Sort', sequence_order = 8 WHERE id = 'a0a00000-0000-0000-0000-000000000408';
UPDATE patterns SET name = 'Insertion Sort', sequence_order = 9 WHERE id = 'a0a00000-0000-0000-0000-000000000409';
UPDATE patterns SET name = 'Merge Sort', sequence_order = 10 WHERE id = 'a0a00000-0000-0000-0000-000000000410';
UPDATE patterns SET name = 'Quick Sort', sequence_order = 11 WHERE id = 'a0a00000-0000-0000-0000-000000000411';
UPDATE patterns SET name = 'Heap Sort — basic', sequence_order = 12 WHERE id = 'a0a00000-0000-0000-0000-000000000412';
UPDATE patterns SET name = 'Counting Sort — basic', sequence_order = 13 WHERE id = 'a0a00000-0000-0000-0000-000000000413';
UPDATE patterns SET name = 'Sorting-Based Problem Solving', sequence_order = 14 WHERE id = 'a0a00000-0000-0000-0000-000000000414';

-- 3. Delete only Phase 4 problems so we can insert them with correct lower/upper bound and tree associations
DELETE FROM problem_details WHERE problem_id IN (
    SELECT id FROM problems WHERE pattern_id IN (
        'a0a00000-0000-0000-0000-000000000401',
        'a0a00000-0000-0000-0000-000000000402',
        'a0a00000-0000-0000-0000-000000000403',
        'a0a00000-0000-0000-0000-000000000404',
        'a0a00000-0000-0000-0000-000000000405',
        'a0a00000-0000-0000-0000-000000000406',
        'a0a00000-0000-0000-0000-000000000407',
        'a0a00000-0000-0000-0000-000000000408',
        'a0a00000-0000-0000-0000-000000000409',
        'a0a00000-0000-0000-0000-000000000410',
        'a0a00000-0000-0000-0000-000000000411',
        'a0a00000-0000-0000-0000-000000000412',
        'a0a00000-0000-0000-0000-000000000413',
        'a0a00000-0000-0000-0000-000000000414'
    )
);
DELETE FROM problems WHERE pattern_id IN (
    'a0a00000-0000-0000-0000-000000000401',
    'a0a00000-0000-0000-0000-000000000402',
    'a0a00000-0000-0000-0000-000000000403',
    'a0a00000-0000-0000-0000-000000000404',
    'a0a00000-0000-0000-0000-000000000405',
    'a0a00000-0000-0000-0000-000000000406',
    'a0a00000-0000-0000-0000-000000000407',
    'a0a00000-0000-0000-0000-000000000408',
    'a0a00000-0000-0000-0000-000000000409',
    'a0a00000-0000-0000-0000-000000000410',
    'a0a00000-0000-0000-0000-000000000411',
    'a0a00000-0000-0000-0000-000000000412',
    'a0a00000-0000-0000-0000-000000000413',
    'a0a00000-0000-0000-0000-000000000414'
);

-- 4. Seed all Searching & Sorting problems (with Lower Bound and Upper Bound fully separated)
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
-- Linear Search (0401)
('c0000000-0000-0000-0000-000000000450', 'a0a00000-0000-0000-0000-000000000401', 90301, 'Search an Element in an Array', 'https://www.geeksforgeeks.org/problems/search-an-element-in-an-array-1587115621/history/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Basic linear scan practice'),

-- Classic Binary Search (0402)
('c0000000-0000-0000-0000-000000000451', 'a0a00000-0000-0000-0000-000000000402', 704, 'Binary Search', 'https://leetcode.com/problems/binary-search/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Fundamental implementation'),
('c0000000-0000-0000-0000-000000000452', 'a0a00000-0000-0000-0000-000000000402', 35, 'Search Insert Position', 'https://leetcode.com/problems/search-insert-position/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Binary search + insertion index'),
('c0000000-0000-0000-0000-000000000453', 'a0a00000-0000-0000-0000-000000000402', 69, 'Sqrt(x)', 'https://leetcode.com/problems/sqrtx/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Binary search on answer'),
('c0000000-0000-0000-0000-000000000454', 'a0a00000-0000-0000-0000-000000000402', 374, 'Guess Number Higher or Lower', 'https://leetcode.com/problems/guess-number-higher-or-lower/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Search-space reduction'),

-- First/Last Occurrence (0403)
('c0000000-0000-0000-0000-000000000455', 'a0a00000-0000-0000-0000-000000000403', 34, 'Find First and Last Position of Element in Sorted Array', 'https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Core boundary search'),
('c0000000-0000-0000-0000-000000000456', 'a0a00000-0000-0000-0000-000000000403', 744, 'Find Smallest Letter Greater Than Target', 'https://leetcode.com/problems/find-smallest-letter-greater-than-target/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Boundary concept'),
('c0000000-0000-0000-0000-000000000457', 'a0a00000-0000-0000-0000-000000000403', 702, 'Search in a Sorted Array of Unknown Size', 'https://leetcode.com/problems/search-in-a-sorted-array-of-unknown-size/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Advanced boundary/search-space thinking'),

-- Lower Bound (0404)
('c0000000-0000-0000-0000-000000000458', 'a0a00000-0000-0000-0000-000000000404', 35, 'Search Insert Position', 'https://leetcode.com/problems/search-insert-position/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Lower-bound foundation'),
('c0000000-0000-0000-0000-000000000459', 'a0a00000-0000-0000-0000-000000000404', 34, 'Find First and Last Position of Element in Sorted Array', 'https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Boundary search'),

-- Upper Bound (0405)
('c0000000-0000-0000-0000-000000000460', 'a0a00000-0000-0000-0000-000000000405', 744, 'Find Smallest Letter Greater Than Target', 'https://leetcode.com/problems/find-smallest-letter-greater-than-target/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Upper-bound style thinking'),
('c0000000-0000-0000-0000-000000000461', 'a0a00000-0000-0000-0000-000000000405', 1351, 'Count Negative Numbers in a Sorted Matrix', 'https://leetcode.com/problems/count-negative-numbers-in-a-sorted-matrix/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Boundary/search reasoning'),

-- Binary Search on Answer (0406)
('c0000000-0000-0000-0000-000000000462', 'a0a00000-0000-0000-0000-000000000406', 69, 'Sqrt(x)', 'https://leetcode.com/problems/sqrtx/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'First exposure'),
('c0000000-0000-0000-0000-000000000463', 'a0a00000-0000-0000-0000-000000000406', 875, 'Koko Eating Bananas', 'https://leetcode.com/problems/koko-eating-bananas/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Classic binary search on answer'),
('c0000000-0000-0000-0000-000000000464', 'a0a00000-0000-0000-0000-000000000406', 1011, 'Capacity To Ship Packages Within D Days', 'https://leetcode.com/problems/capacity-to-ship-packages-within-d-days/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Search minimum feasible answer'),
('c0000000-0000-0000-0000-000000000465', 'a0a00000-0000-0000-0000-000000000406', 410, 'Split Array Largest Sum', 'https://leetcode.com/problems/split-array-largest-sum/', 'HARD', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Advanced optional'),

-- Bubble Sort (0407)
('c0000000-0000-0000-0000-000000000466', 'a0a00000-0000-0000-0000-000000000407', 90201, 'Bubble Sort', 'https://www.geeksforgeeks.org/problems/bubble-sort/1', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'implement from memory'),

-- Selection Sort (0408)
('c0000000-0000-0000-0000-000000000467', 'a0a00000-0000-0000-0000-000000000408', 90202, 'Selection Sort', 'https://www.geeksforgeeks.org/problems/selection-sort/1', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'implement from memory'),

-- Insertion Sort (0409)
('c0000000-0000-0000-0000-000000000468', 'a0a00000-0000-0000-0000-000000000409', 90203, 'Insertion Sort', 'https://www.geeksforgeeks.org/problems/insertion-sort/1', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'implement from memory'),

-- Merge Sort (0410)
('c0000000-0000-0000-0000-000000000469', 'a0a00000-0000-0000-0000-000000000410', 912, 'Sort an Array', 'https://leetcode.com/problems/sort-an-array/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Implement Merge/Quick Sort'),
('c0000000-0000-0000-0000-000000000470', 'a0a00000-0000-0000-0000-000000000410', 88, 'Merge Sorted Array', 'https://leetcode.com/problems/merge-sorted-array/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Merge technique'),
('c0000000-0000-0000-0000-000000000471', 'a0a00000-0000-0000-0000-000000000410', 21, 'Merge Two Sorted Lists', 'https://leetcode.com/problems/merge-two-sorted-lists/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Merge concept'),

-- Quick Sort (0411)
('c0000000-0000-0000-0000-000000000472', 'a0a00000-0000-0000-0000-000000000411', 912, 'Sort an Array', 'https://leetcode.com/problems/sort-an-array/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Sorting implementation'),
('c0000000-0000-0000-0000-000000000473', 'a0a00000-0000-0000-0000-000000000411', 215, 'Kth Largest Element in an Array', 'https://leetcode.com/problems/kth-largest-element-in-an-array/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Partition/selection concept'),

-- Heap Sort — basic (0412)
('c0000000-0000-0000-0000-000000000474', 'a0a00000-0000-0000-0000-000000000412', 215, 'Kth Largest Element in an Array', 'https://leetcode.com/problems/kth-largest-element-in-an-array/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Min/Max Heap Sort application'),

-- Counting Sort — basic (0413)
('c0000000-0000-0000-0000-000000000475', 'a0a00000-0000-0000-0000-000000000413', 1122, 'Relative Sort Array', 'https://leetcode.com/problems/relative-sort-array/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Frequency-based bucket ordering'),

-- Sorting-Based Problem Solving (0414)
('c0000000-0000-0000-0000-000000000476', 'a0a00000-0000-0000-0000-000000000414', 88, 'Merge Sorted Array', 'https://leetcode.com/problems/merge-sorted-array/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Sorted-array manipulation'),
('c0000000-0000-0000-0000-000000000477', 'a0a00000-0000-0000-0000-000000000414', 169, 'Majority Element', 'https://leetcode.com/problems/majority-element/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Sorting-based reasoning'),
('c0000000-0000-0000-0000-000000000478', 'a0a00000-0000-0000-0000-000000000414', 977, 'Squares of a Sorted Array', 'https://leetcode.com/problems/squares-of-a-sorted-array/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Sorted array'),
('c0000000-0000-0000-0000-000000000479', 'a0a00000-0000-0000-0000-000000000414', 252, 'Meeting Rooms', 'https://leetcode.com/problems/meeting-rooms/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Sorting intervals'),
('c0000000-0000-0000-0000-000000000480', 'a0a00000-0000-0000-0000-000000000414', 75, 'Sort Colors', 'https://leetcode.com/problems/sort-colors/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Sorting/in-place')
ON CONFLICT (id) DO NOTHING;

-- 5. Seed details for all seeded problems
INSERT INTO problem_details (problem_id, intuition, approach, code_snippet, complexity_analysis, what_i_learned)
SELECT id, 'Study search/sort algorithm.', 'Implement correctly.', '// Code snippet', 'N/A', 'Practice makes perfect'
FROM problems 
WHERE id IN (
    'c0000000-0000-0000-0000-000000000450', 'c0000000-0000-0000-0000-000000000451',
    'c0000000-0000-0000-0000-000000000452', 'c0000000-0000-0000-0000-000000000453',
    'c0000000-0000-0000-0000-000000000454', 'c0000000-0000-0000-0000-000000000455',
    'c0000000-0000-0000-0000-000000000456', 'c0000000-0000-0000-0000-000000000457',
    'c0000000-0000-0000-0000-000000000458', 'c0000000-0000-0000-0000-000000000459',
    'c0000000-0000-0000-0000-000000000460', 'c0000000-0000-0000-0000-000000000461',
    'c0000000-0000-0000-0000-000000000462', 'c0000000-0000-0000-0000-000000000463',
    'c0000000-0000-0000-0000-000000000464', 'c0000000-0000-0000-0000-000000000465',
    'c0000000-0000-0000-0000-000000000466', 'c0000000-0000-0000-0000-000000000467',
    'c0000000-0000-0000-0000-000000000468', 'c0000000-0000-0000-0000-000000000469',
    'c0000000-0000-0000-0000-000000000470', 'c0000000-0000-0000-0000-000000000471',
    'c0000000-0000-0000-0000-000000000472', 'c0000000-0000-0000-0000-000000000473',
    'c0000000-0000-0000-0000-000000000474', 'c0000000-0000-0000-0000-000000000475',
    'c0000000-0000-0000-0000-000000000476', 'c0000000-0000-0000-0000-000000000477',
    'c0000000-0000-0000-0000-000000000478', 'c0000000-0000-0000-0000-000000000479',
    'c0000000-0000-0000-0000-000000000480'
)
ON CONFLICT (problem_id) DO NOTHING;
