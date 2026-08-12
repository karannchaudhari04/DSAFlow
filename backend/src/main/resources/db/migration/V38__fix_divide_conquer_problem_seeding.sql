-- V38: Fix Divide & Conquer problem seeding by inserting missing core problems

-- 1. Ensure Majority Element (169) exists under Understand the Core D&C Pattern
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001101', 'a0a00000-0000-0000-0000-000000001101', 169, 'Majority Element', 'https://leetcode.com/problems/majority-element/', 'EASY', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Find majority element by dividing and merging'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001101' AND leetcode_number = 169);

-- 2. Ensure Binary Search (704) exists under Recursion + Divide & Conquer Basics
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001102', 'a0a00000-0000-0000-0000-000000001103', 704, 'Binary Search', 'https://leetcode.com/problems/binary-search/', 'EASY', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Reduce search space by half recursively'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001103' AND leetcode_number = 704);

-- 3. Ensure Sort an Array (912, Merge Sort) exists under Merge Sort (D&C)
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001103', 'a0a00000-0000-0000-0000-000000001104', 912, 'Sort an Array', 'https://leetcode.com/problems/sort-an-array/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, '⭐ Merge Sort implementation'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001104' AND leetcode_number = 912);

-- 4. Ensure Sort an Array (912, Quick Sort) exists under Quick Sort / Partition
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001104', 'a0a00000-0000-0000-0000-000000001105', 912, 'Sort an Array', 'https://leetcode.com/problems/sort-an-array/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Quick Sort partition implementation alternative'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001105' AND leetcode_number = 912);
