-- V25: Refactor search/sort subtopics and seed new GFG/LeetCode problems

-- 1. Rename original patterns back to Heap Sort and Counting Sort first (to release the unique 'Sorting-Based Problem Solving' name)
UPDATE patterns SET name = 'Heap Sort — basic', sequence_order = 11 WHERE id = 'a0a00000-0000-0000-0000-000000000412';
UPDATE patterns SET name = 'Counting Sort — basic', sequence_order = 12 WHERE id = 'a0a00000-0000-0000-0000-000000000413';

-- 2. Restore/re-create the new pattern for Sorting-Based Problem Solving
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000000414', 'b0a00000-0000-0000-0000-000000000004', 'Sorting-Based Problem Solving', 'Solving generic interview problems by sorting the inputs first.', 'Rearranging items to simplify comparisons', 'Sort array, then execute standard scans or two-pointer logic.', 'Call sorting library, then traverse.', 'O(N log N)', 'O(1) or O(N)', 'Forgetting that sorting alters original indices.', 'NOT_STARTED', 13)
ON CONFLICT (id) DO NOTHING;

-- 3. Delete the duplicate Upper Bound subtopic (since it is merged into Lower Bound / Upper Bound)
DELETE FROM problem_details WHERE problem_id IN (SELECT id FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000405');
DELETE FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000405';
DELETE FROM patterns WHERE id = 'a0a00000-0000-0000-0000-000000000405';

-- 4. Move Sorting-Based Problem Solving problems from 0412 to 0414
UPDATE problems SET pattern_id = 'a0a00000-0000-0000-0000-000000000414' WHERE id IN (
    'c0000000-0000-0000-0000-000000000473',
    'c0000000-0000-0000-0000-000000000474',
    'c0000000-0000-0000-0000-000000000475',
    'c0000000-0000-0000-0000-000000000476',
    'c0000000-0000-0000-0000-000000000477'
);

-- 5. Delete Bubble, Selection, and Insertion Sort problem placeholders from V24 (we will re-seed them with GFG links and new IDs)
DELETE FROM problem_details WHERE problem_id IN ('c0000000-0000-0000-0000-000000000516', 'c0000000-0000-0000-0000-000000000517', 'c0000000-0000-0000-0000-000000000518');
DELETE FROM problems WHERE id IN ('c0000000-0000-0000-0000-000000000516', 'c0000000-0000-0000-0000-000000000518', 'c0000000-0000-0000-0000-000000000517');

-- 6. Insert new problems (Linear Search GFG problem, Bubble/Selection/Insertion GFG problems, Heap/Counting LeetCode problems)
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
-- Linear Search (0401)
('c0000000-0000-0000-0000-000000000481', 'a0a00000-0000-0000-0000-000000000401', 90301, 'Search an Element in an Array', 'https://www.geeksforgeeks.org/problems/search-an-element-in-an-array-1587115621/history/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Basic linear scan practice'),

-- Bubble Sort (0407)
('c0000000-0000-0000-0000-000000000482', 'a0a00000-0000-0000-0000-000000000407', 90201, 'Bubble Sort', 'https://www.geeksforgeeks.org/problems/bubble-sort/1', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'implement from memory'),

-- Selection Sort (0408)
('c0000000-0000-0000-0000-000000000483', 'a0a00000-0000-0000-0000-000000000408', 90202, 'Selection Sort', 'https://www.geeksforgeeks.org/problems/selection-sort/1', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'implement from memory'),

-- Insertion Sort (0409)
('c0000000-0000-0000-0000-000000000484', 'a0a00000-0000-0000-0000-000000000409', 90203, 'Insertion Sort', 'https://www.geeksforgeeks.org/problems/insertion-sort/1', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'implement from memory'),

-- Heap Sort (0412) - Kth Largest Element in an Array (LeetCode 215)
('c0000000-0000-0000-0000-000000000485', 'a0a00000-0000-0000-0000-000000000412', 215, 'Kth Largest Element in an Array', 'https://leetcode.com/problems/kth-largest-element-in-an-array/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Min/Max Heap Sort application'),

-- Counting Sort (0413) - Relative Sort Array (LeetCode 1122)
('c0000000-0000-0000-0000-000000000486', 'a0a00000-0000-0000-0000-000000000413', 1122, 'Relative Sort Array', 'https://leetcode.com/problems/relative-sort-array/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Frequency-based bucket ordering')
ON CONFLICT (id) DO NOTHING;

-- 7. Seed placeholder details for these newly created problems
INSERT INTO problem_details (problem_id, intuition, approach, code_snippet, complexity_analysis, what_i_learned)
SELECT id, 'Study search/sort algorithm.', 'Implement correctly.', '// Code snippet', 'N/A', 'Practice makes perfect'
FROM problems 
WHERE id IN (
    'c0000000-0000-0000-0000-000000000481',
    'c0000000-0000-0000-0000-000000000482',
    'c0000000-0000-0000-0000-000000000483',
    'c0000000-0000-0000-0000-000000000484',
    'c0000000-0000-0000-0000-000000000485',
    'c0000000-0000-0000-0000-000000000486'
)
ON CONFLICT (problem_id) DO NOTHING;
