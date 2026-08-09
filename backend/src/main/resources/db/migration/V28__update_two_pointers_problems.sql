-- V28: Update Two Pointers subtopics and seed problems idempotently

-- 1. Ensure new patterns (0604, 0605, 0606) exist
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000000604', 'b0a00000-0000-0000-0000-000000000006', 'In-Place Array Modification', 'Modifying array elements directly without using auxiliary space.', 'In-place array changes requested', 'Read/write pointers pointing to input and write states.', 'Adjust write pointer on conditions.', 'O(N)', 'O(1)', 'Off-by-one writes.', 'NOT_STARTED', 4),
('a0a00000-0000-0000-0000-000000000605', 'b0a00000-0000-0000-0000-000000000006', 'Palindrome Two Pointers', 'Verifying symmetric properties of a sequence using pointers starting at boundaries.', 'Palindrome patterns', 'Compare elements from both sides towards center.', 'Move pointers on matches, allow tolerance.', 'O(N)', 'O(1)', 'Ignoring non-alphanumeric chars.', 'NOT_STARTED', 5),
('a0a00000-0000-0000-0000-000000000606', 'b0a00000-0000-0000-0000-000000000006', 'Two Pointers + String Processing', 'Processing string elements dynamically using multiple indexes.', 'Dynamic string manipulation', 'Apply two pointer scans to manipulate strings.', 'Build simulated results or scan backwards.', 'O(N)', 'O(1)', 'Incorrect string index bounds.', 'NOT_STARTED', 6)
ON CONFLICT (id) DO NOTHING;

-- 2. Update Two Pointers subtopics names and sequence orders
UPDATE patterns SET name = 'Opposite-End Pointers', sequence_order = 1 WHERE id = 'a0a00000-0000-0000-0000-000000000601';
UPDATE patterns SET name = 'Fast & Slow Pointers', sequence_order = 2 WHERE id = 'a0a00000-0000-0000-0000-000000000602';
UPDATE patterns SET name = 'Two Pointers + Sorting', sequence_order = 3 WHERE id = 'a0a00000-0000-0000-0000-000000000603';
UPDATE patterns SET sequence_order = 4 WHERE id = 'a0a00000-0000-0000-0000-000000000604';
UPDATE patterns SET sequence_order = 5 WHERE id = 'a0a00000-0000-0000-0000-000000000605';
UPDATE patterns SET sequence_order = 6 WHERE id = 'a0a00000-0000-0000-0000-000000000606';

-- 3. Seed Opposite-End Pointers problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000650', 'a0a00000-0000-0000-0000-000000000601', 167, 'Two Sum II - Input Array Is Sorted', 'https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Fundamental two-pointer pattern'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000601' AND leetcode_number = 167);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000651', 'a0a00000-0000-0000-0000-000000000601', 125, 'Valid Palindrome', 'https://leetcode.com/problems/valid-palindrome/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Opposite pointers on strings'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000601' AND leetcode_number = 125);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000652', 'a0a00000-0000-0000-0000-000000000601', 344, 'Reverse String', 'https://leetcode.com/problems/reverse-string/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Swap from both ends'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000601' AND leetcode_number = 344);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000653', 'a0a00000-0000-0000-0000-000000000601', 345, 'Reverse Vowels of a String', 'https://leetcode.com/problems/reverse-vowels-of-a-string/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Two pointers + conditions'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000601' AND leetcode_number = 345);


-- 4. Seed Fast & Slow Pointers problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000654', 'a0a00000-0000-0000-0000-000000000602', 26, 'Remove Duplicates from Sorted Array', 'https://leetcode.com/problems/remove-duplicates-from-sorted-array/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Slow/fast pointer'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000602' AND leetcode_number = 26);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000655', 'a0a00000-0000-0000-0000-000000000602', 27, 'Remove Element', 'https://leetcode.com/problems/remove-element/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'In-place modification'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000602' AND leetcode_number = 27);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000656', 'a0a00000-0000-0000-0000-000000000602', 283, 'Move Zeroes', 'https://leetcode.com/problems/move-zeroes/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Slow/fast pointer'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000602' AND leetcode_number = 283);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000657', 'a0a00000-0000-0000-0000-000000000602', 80, 'Remove Duplicates from Sorted Array II', 'https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Advanced in-place pointer movement'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000602' AND leetcode_number = 80);


-- 5. Seed Two Pointers + Sorting problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000658', 'a0a00000-0000-0000-0000-000000000603', 167, 'Two Sum II - Input Array Is Sorted', 'https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Pair + sorted array'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000603' AND leetcode_number = 167);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000659', 'a0a00000-0000-0000-0000-000000000603', 15, '3Sum', 'https://leetcode.com/problems/3sum/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Sorting + two pointers'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000603' AND leetcode_number = 15);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000660', 'a0a00000-0000-0000-0000-000000000603', 16, '3Sum Closest', 'https://leetcode.com/problems/3sum-closest/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Sorting + two pointers'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000603' AND leetcode_number = 16);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000661', 'a0a00000-0000-0000-0000-000000000603', 18, '4Sum', 'https://leetcode.com/problems/4sum/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Extended pair/two-pointer reasoning'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000603' AND leetcode_number = 18);


-- 6. Seed In-Place Array Modification problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000662', 'a0a00000-0000-0000-0000-000000000604', 27, 'Remove Element', 'https://leetcode.com/problems/remove-element/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Basic in-place modification'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000604' AND leetcode_number = 27);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000663', 'a0a00000-0000-0000-0000-000000000604', 283, 'Move Zeroes', 'https://leetcode.com/problems/move-zeroes/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Read/write pointers'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000604' AND leetcode_number = 283);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000664', 'a0a00000-0000-0000-0000-000000000604', 26, 'Remove Duplicates from Sorted Array', 'https://leetcode.com/problems/remove-duplicates-from-sorted-array/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'In-place compression'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000604' AND leetcode_number = 26);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000665', 'a0a00000-0000-0000-0000-000000000604', 75, 'Sort Colors', 'https://leetcode.com/problems/sort-colors/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Multiple pointers'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000604' AND leetcode_number = 75);


-- 7. Seed Palindrome Two Pointers problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000666', 'a0a00000-0000-0000-0000-000000000605', 125, 'Valid Palindrome', 'https://leetcode.com/problems/valid-palindrome/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Basic palindrome'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000605' AND leetcode_number = 125);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000667', 'a0a00000-0000-0000-0000-000000000605', 680, 'Valid Palindrome II', 'https://leetcode.com/problems/valid-palindrome-ii/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'One mismatch allowed'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000605' AND leetcode_number = 680);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000668', 'a0a00000-0000-0000-0000-000000000605', 234, 'Palindrome Linked List', 'https://leetcode.com/problems/palindrome-linked-list/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Two-pointer preview for Linked Lists'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000605' AND leetcode_number = 234);


-- 8. Seed Two Pointers + String Processing problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000669', 'a0a00000-0000-0000-0000-000000000606', 344, 'Reverse String', 'https://leetcode.com/problems/reverse-string/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Character swapping'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000606' AND leetcode_number = 344);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000670', 'a0a00000-0000-0000-0000-000000000606', 345, 'Reverse Vowels of a String', 'https://leetcode.com/problems/reverse-vowels-of-a-string/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Conditional pointer movement'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000606' AND leetcode_number = 345);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000671', 'a0a00000-0000-0000-0000-000000000606', 844, 'Backspace String Compare', 'https://leetcode.com/problems/backspace-string-compare/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Two pointers + string processing'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000606' AND leetcode_number = 844);


-- 9. Seed details for all seeded problems
INSERT INTO problem_details (problem_id, intuition, approach, code_snippet, complexity_analysis, what_i_learned)
SELECT id, 'Study two pointers technique.', 'Use indices dynamically.', '// Code snippet', 'N/A', 'Practice makes perfect'
FROM problems 
WHERE id IN (
    'c0000000-0000-0000-0000-000000000650', 'c0000000-0000-0000-0000-000000000651',
    'c0000000-0000-0000-0000-000000000652', 'c0000000-0000-0000-0000-000000000653',
    'c0000000-0000-0000-0000-000000000654', 'c0000000-0000-0000-0000-000000000655',
    'c0000000-0000-0000-0000-000000000656', 'c0000000-0000-0000-0000-000000000657',
    'c0000000-0000-0000-0000-000000000658', 'c0000000-0000-0000-0000-000000000659',
    'c0000000-0000-0000-0000-000000000660', 'c0000000-0000-0000-0000-000000000661',
    'c0000000-0000-0000-0000-000000000662', 'c0000000-0000-0000-0000-000000000663',
    'c0000000-0000-0000-0000-000000000664', 'c0000000-0000-0000-0000-000000000665',
    'c0000000-0000-0000-0000-000000000666', 'c0000000-0000-0000-0000-000000000667',
    'c0000000-0000-0000-0000-000000000668', 'c0000000-0000-0000-0000-000000000669',
    'c0000000-0000-0000-0000-000000000670', 'c0000000-0000-0000-0000-000000000671'
)
ON CONFLICT (problem_id) DO NOTHING;
