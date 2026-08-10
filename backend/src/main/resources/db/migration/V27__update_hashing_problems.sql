-- V27: Update Hashing subtopics names and seed missing problems idempotently

-- 1. Ensure Hashing subtopics exist and have correct titles/orders
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000000501', 'b0a00000-0000-0000-0000-000000000005', 'HashMap', 'Tracking item frequencies or associations using hash maps.', 'Map lookup', 'HashMap mapping keys to values.', 'Key-value maps.', 'O(1)', 'O(N)', 'None', 'NOT_STARTED', 1),
('a0a00000-0000-0000-0000-000000000502', 'b0a00000-0000-0000-0000-000000000005', 'HashSet', 'Tracking unique items using hash sets.', 'Uniqueness checking', 'HashSet lookup.', 'Unique values set.', 'O(1)', 'O(N)', 'None', 'NOT_STARTED', 2),
('a0a00000-0000-0000-0000-000000000503', 'b0a00000-0000-0000-0000-000000000005', 'Frequency Counting', 'Counting frequency of occurrences.', 'Frequencies count', 'Frequency map arrays.', 'Counter arrays.', 'O(N)', 'O(K)', 'None', 'NOT_STARTED', 3),
('a0a00000-0000-0000-0000-000000000504', 'b0a00000-0000-0000-0000-000000000005', 'Duplicate Detection', 'Finding duplicate values in collections.', 'Contains duplicate elements', 'Set detection.', 'Duplicate element detection.', 'O(N)', 'O(N)', 'None', 'NOT_STARTED', 4),
('a0a00000-0000-0000-0000-000000000505', 'b0a00000-0000-0000-0000-000000000005', 'Lookup Pattern', 'Using maps for fast O(1) searches.', 'Two Sum or search pairs', 'Value mapping lookup.', 'Target key lookups.', 'O(1)', 'O(N)', 'None', 'NOT_STARTED', 5)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, sequence_order = EXCLUDED.sequence_order;

-- 2. Seed HashMap problems (idempotently: only insert if pattern_id + leetcode_number combo does not already exist)
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000550', 'a0a00000-0000-0000-0000-000000000501', 1, 'Two Sum', 'https://leetcode.com/problems/two-sum/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Fundamental HashMap lookup'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000501' AND leetcode_number = 1);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000551', 'a0a00000-0000-0000-0000-000000000501', 219, 'Contains Duplicate II', 'https://leetcode.com/problems/contains-duplicate-ii/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'HashMap + index tracking'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000501' AND leetcode_number = 219);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000552', 'a0a00000-0000-0000-0000-000000000501', 205, 'Isomorphic Strings', 'https://leetcode.com/problems/isomorphic-strings/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Mapping between characters'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000501' AND leetcode_number = 205);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000553', 'a0a00000-0000-0000-0000-000000000501', 290, 'Word Pattern', 'https://leetcode.com/problems/word-pattern/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Bidirectional mapping'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000501' AND leetcode_number = 290);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000554', 'a0a00000-0000-0000-0000-000000000501', 169, 'Majority Element', 'https://leetcode.com/problems/majority-element/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Frequency with HashMap'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000501' AND leetcode_number = 169);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000555', 'a0a00000-0000-0000-0000-000000000501', 49, 'Group Anagrams', 'https://leetcode.com/problems/group-anagrams/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'HashMap + frequency/signature'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000501' AND leetcode_number = 49);


-- 3. Seed HashSet problems
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000556', 'a0a00000-0000-0000-0000-000000000502', 217, 'Contains Duplicate', 'https://leetcode.com/problems/contains-duplicate/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Fundamental HashSet'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000502' AND leetcode_number = 217);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000557', 'a0a00000-0000-0000-0000-000000000502', 202, 'Happy Number', 'https://leetcode.com/problems/happy-number/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Seen-state detection'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000502' AND leetcode_number = 202);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000558', 'a0a00000-0000-0000-0000-000000000502', 349, 'Intersection of Two Arrays', 'https://leetcode.com/problems/intersection-of-two-arrays/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Set membership'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000502' AND leetcode_number = 349);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000559', 'a0a00000-0000-0000-0000-000000000502', 771, 'Jewels and Stones', 'https://leetcode.com/problems/jewels-and-stones/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Fast membership lookup'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000502' AND leetcode_number = 771);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000560', 'a0a00000-0000-0000-0000-000000000502', 128, 'Longest Consecutive Sequence', 'https://leetcode.com/problems/longest-consecutive-sequence/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'HashSet + sequence detection'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000502' AND leetcode_number = 128);


-- 4. Seed Frequency Counting problems
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000561', 'a0a00000-0000-0000-0000-000000000503', 242, 'Valid Anagram', 'https://leetcode.com/problems/valid-anagram/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Character frequency'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000503' AND leetcode_number = 242);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000562', 'a0a00000-0000-0000-0000-000000000503', 387, 'First Unique Character in a String', 'https://leetcode.com/problems/first-unique-character-in-a-string/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Frequency + traversal'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000503' AND leetcode_number = 387);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000563', 'a0a00000-0000-0000-0000-000000000503', 169, 'Majority Element', 'https://leetcode.com/problems/majority-element/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Frequency counting'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000503' AND leetcode_number = 169);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000564', 'a0a00000-0000-0000-0000-000000000503', 383, 'Ransom Note', 'https://leetcode.com/problems/ransom-note/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Character frequency'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000503' AND leetcode_number = 383);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000565', 'a0a00000-0000-0000-0000-000000000503', 347, 'Top K Frequent Elements', 'https://leetcode.com/problems/top-k-frequent-elements/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Frequency + HashMap'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000503' AND leetcode_number = 347);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000566', 'a0a00000-0000-0000-0000-000000000503', 451, 'Sort Characters By Frequency', 'https://leetcode.com/problems/sort-characters-by-frequency/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Frequency + ordering'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000503' AND leetcode_number = 451);


-- 5. Seed Duplicate Detection problems
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000567', 'a0a00000-0000-0000-0000-000000000504', 217, 'Contains Duplicate', 'https://leetcode.com/problems/contains-duplicate/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Basic duplicate detection'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000504' AND leetcode_number = 217);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000568', 'a0a00000-0000-0000-0000-000000000504', 219, 'Contains Duplicate II', 'https://leetcode.com/problems/contains-duplicate-ii/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Duplicate + index distance'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000504' AND leetcode_number = 219);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000569', 'a0a00000-0000-0000-0000-000000000504', 220, 'Contains Duplicate III', 'https://leetcode.com/problems/contains-duplicate-iii/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Advanced duplicate constraints'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000504' AND leetcode_number = 220);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000570', 'a0a00000-0000-0000-0000-000000000504', 442, 'Find All Duplicates in an Array', 'https://leetcode.com/problems/find-all-duplicates-in-an-array/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Duplicate detection'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000504' AND leetcode_number = 442);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000571', 'a0a00000-0000-0000-0000-000000000504', 349, 'Intersection of Two Arrays', 'https://leetcode.com/problems/intersection-of-two-arrays/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Duplicate/membership reasoning'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000504' AND leetcode_number = 349);


-- 6. Seed Lookup Pattern problems
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000572', 'a0a00000-0000-0000-0000-000000000505', 1, 'Two Sum', 'https://leetcode.com/problems/two-sum/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Classic lookup'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000505' AND leetcode_number = 1);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000573', 'a0a00000-0000-0000-0000-000000000505', 350, 'Intersection of Two Arrays II', 'https://leetcode.com/problems/intersection-of-two-arrays-ii/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Frequency lookup'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000505' AND leetcode_number = 350);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000574', 'a0a00000-0000-0000-0000-000000000505', 454, '4Sum II', 'https://leetcode.com/problems/4sum-ii/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'HashMap lookup optimization'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000505' AND leetcode_number = 454);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000575', 'a0a00000-0000-0000-0000-000000000505', 560, 'Subarray Sum Equals K', 'https://leetcode.com/problems/subarray-sum-equals-k/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Prefix Sum + HashMap'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000505' AND leetcode_number = 560);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000576', 'a0a00000-0000-0000-0000-000000000505', 3, 'Longest Substring Without Repeating Characters', 'https://leetcode.com/problems/longest-substring-without-repeating-characters/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'HashMap + sliding window'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000505' AND leetcode_number = 3);


-- 7. Seed details for all seeded problems
INSERT INTO problem_details (problem_id, intuition, approach, code_snippet, complexity_analysis, what_i_learned)
SELECT id, 'Study hashing algorithm.', 'Implement correctly.', '// Code snippet', 'N/A', 'Practice makes perfect'
FROM problems 
WHERE id IN (
    'c0000000-0000-0000-0000-000000000550', 'c0000000-0000-0000-0000-000000000551',
    'c0000000-0000-0000-0000-000000000552', 'c0000000-0000-0000-0000-000000000553',
    'c0000000-0000-0000-0000-000000000554', 'c0000000-0000-0000-0000-000000000555',
    'c0000000-0000-0000-0000-000000000556', 'c0000000-0000-0000-0000-000000000557',
    'c0000000-0000-0000-0000-000000000558', 'c0000000-0000-0000-0000-000000000559',
    'c0000000-0000-0000-0000-000000000560', 'c0000000-0000-0000-0000-000000000561',
    'c0000000-0000-0000-0000-000000000562', 'c0000000-0000-0000-0000-000000000563',
    'c0000000-0000-0000-0000-000000000564', 'c0000000-0000-0000-0000-000000000565',
    'c0000000-0000-0000-0000-000000000566', 'c0000000-0000-0000-0000-000000000567',
    'c0000000-0000-0000-0000-000000000568', 'c0000000-0000-0000-0000-000000000569',
    'c0000000-0000-0000-0000-000000000570', 'c0000000-0000-0000-0000-000000000571',
    'c0000000-0000-0000-0000-000000000572', 'c0000000-0000-0000-0000-000000000573',
    'c0000000-0000-0000-0000-000000000574', 'c0000000-0000-0000-0000-000000000575',
    'c0000000-0000-0000-0000-000000000576'
)
ON CONFLICT (problem_id) DO NOTHING;
