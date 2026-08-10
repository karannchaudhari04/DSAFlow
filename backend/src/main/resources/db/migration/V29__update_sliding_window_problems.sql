-- V29: Update Sliding Window subtopics and seed problems idempotently

-- 1. Ensure all Sliding Window patterns exist and have correct titles/orders
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000000701', 'b0a00000-0000-0000-0000-000000000007', 'Fixed-Size Sliding Window', 'Scanning continuous blocks of static lengths.', 'Subarrays of size K', 'Add new element, remove sliding tail element.', 'Iterate right pointer, update state, slide left pointer.', 'O(N)', 'O(1)', 'Incorrect bounds checking during initial window load', 'NOT_STARTED', 1),
('a0a00000-0000-0000-0000-000000000702', 'b0a00000-0000-0000-0000-000000000007', 'Variable-Size Sliding Window', 'Scanning collections with dynamically growing or shrinking window bounds.', 'Subarrays matching condition constraints', 'Grow right pointer until condition violated, shrink left until valid.', 'Double pointer dynamic scan loops.', 'O(N)', 'O(1)', 'Wrong bounds updating.', 'NOT_STARTED', 2),
('a0a00000-0000-0000-0000-000000000703', 'b0a00000-0000-0000-0000-000000000007', 'Sliding Window + HashSet', 'Tracking dynamic unique constraints using window + set structures.', 'Subarray without duplicate items', 'Use set to detect duplicates, shrink left until duplicate is removed.', 'Standard sliding window + HashSet.', 'O(N)', 'O(N)', 'Incorrect left boundary cleanup.', 'NOT_STARTED', 3),
('a0a00000-0000-0000-0000-000000000704', 'b0a00000-0000-0000-0000-000000000007', 'Sliding Window + HashMap / Frequency', 'Validating custom permutations and constraints using element frequencies.', 'Anagram or permutation match constraints', 'Maintain char frequencies within window, validate count match.', 'Window scan with frequency array.', 'O(N)', 'O(1)', 'Failing to balance frequency maps.', 'NOT_STARTED', 4),
('a0a00000-0000-0000-0000-000000000705', 'b0a00000-0000-0000-0000-000000000007', 'At Most K / Distinct Elements', 'Evaluating subarrays containing at most K distinct keys.', 'Exactly or at most K items', 'Maintain distinct keys count, reduce window size on overflow.', 'Map counter with size checks.', 'O(N)', 'O(K)', 'Over-adjusting pointers.', 'NOT_STARTED', 5),
('a0a00000-0000-0000-0000-000000000706', 'b0a00000-0000-0000-0000-000000000007', 'Sliding Window + Counting', 'Counting valid subarrays matching target parameters.', 'Number of subarrays satisfying threshold', 'Compute running sums and frequencies within window boundaries.', 'Prefix count variation.', 'O(N)', 'O(N)', 'Negative count tracking.', 'NOT_STARTED', 6)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, sequence_order = EXCLUDED.sequence_order;

-- 3. Seed Fixed-Size Sliding Window problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000750', 'a0a00000-0000-0000-0000-000000000701', 643, 'Maximum Average Subarray I', 'https://leetcode.com/problems/maximum-average-subarray-i/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Fundamental fixed window'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000701' AND leetcode_number = 643);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000751', 'a0a00000-0000-0000-0000-000000000701', 438, 'Find All Anagrams in a String', 'https://leetcode.com/problems/find-all-anagrams-in-a-string/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Fixed window + frequency'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000701' AND leetcode_number = 438);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000752', 'a0a00000-0000-0000-0000-000000000701', 567, 'Permutation in String', 'https://leetcode.com/problems/permutation-in-string/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Fixed window + frequency'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000701' AND leetcode_number = 567);


-- 4. Seed Variable-Size Sliding Window problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000753', 'a0a00000-0000-0000-0000-000000000702', 209, 'Minimum Size Subarray Sum', 'https://leetcode.com/problems/minimum-size-subarray-sum/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Classic variable window'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000702' AND leetcode_number = 209);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000754', 'a0a00000-0000-0000-0000-000000000702', 3, 'Longest Substring Without Repeating Characters', 'https://leetcode.com/problems/longest-substring-without-repeating-characters/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Variable window + Set/Map'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000702' AND leetcode_number = 3);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000755', 'a0a00000-0000-0000-0000-000000000702', 1004, 'Max Consecutive Ones III', 'https://leetcode.com/problems/max-consecutive-ones-iii/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Window with constraint'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000702' AND leetcode_number = 1004);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000756', 'a0a00000-0000-0000-0000-000000000702', 904, 'Fruit Into Baskets', 'https://leetcode.com/problems/fruit-into-baskets/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'At most K distinct elements'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000702' AND leetcode_number = 904);


-- 5. Seed Sliding Window + HashSet problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000757', 'a0a00000-0000-0000-0000-000000000703', 3, 'Longest Substring Without Repeating Characters', 'https://leetcode.com/problems/longest-substring-without-repeating-characters/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Core pattern'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000703' AND leetcode_number = 3);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000758', 'a0a00000-0000-0000-0000-000000000703', 1456, 'Maximum Number of Vowels in a Substring of Given Length', 'https://leetcode.com/problems/maximum-number-of-vowels-in-a-substring-of-given-length/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Fixed window'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000703' AND leetcode_number = 1456);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000759', 'a0a00000-0000-0000-0000-000000000703', 2401, 'Longest Nice Subarray', 'https://leetcode.com/problems/longest-nice-subarray/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Window + bitwise condition'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000703' AND leetcode_number = 2401);


-- 6. Seed Sliding Window + HashMap / Frequency problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000760', 'a0a00000-0000-0000-0000-000000000704', 567, 'Permutation in String', 'https://leetcode.com/problems/permutation-in-string/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Frequency + fixed window'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000704' AND leetcode_number = 567);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000761', 'a0a00000-0000-0000-0000-000000000704', 438, 'Find All Anagrams in a String', 'https://leetcode.com/problems/find-all-anagrams-in-a-string/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Frequency + fixed window'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000704' AND leetcode_number = 438);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000762', 'a0a00000-0000-0000-0000-000000000704', 424, 'Longest Repeating Character Replacement', 'https://leetcode.com/problems/longest-repeating-character-replacement/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Frequency + variable window'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000704' AND leetcode_number = 424);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000763', 'a0a00000-0000-0000-0000-000000000704', 76, 'Minimum Window Substring', 'https://leetcode.com/problems/minimum-window-substring/', 'HARD', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Advanced frequency window'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000704' AND leetcode_number = 76);


-- 7. Seed At Most K / Distinct Elements problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000764', 'a0a00000-0000-0000-0000-000000000705', 904, 'Fruit Into Baskets', 'https://leetcode.com/problems/fruit-into-baskets/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'At most 2 distinct'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000705' AND leetcode_number = 904);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000765', 'a0a00000-0000-0000-0000-000000000705', 340, 'Longest Substring with At Most K Distinct Characters', 'https://leetcode.com/problems/longest-substring-with-at-most-k-distinct-characters/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'General K-distinct pattern'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000705' AND leetcode_number = 340);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000766', 'a0a00000-0000-0000-0000-000000000705', 992, 'Subarrays with K Different Integers', 'https://leetcode.com/problems/subarrays-with-k-different-integers/', 'HARD', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Advanced version'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000705' AND leetcode_number = 992);


-- 8. Seed Sliding Window + Counting problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000767', 'a0a00000-0000-0000-0000-000000000706', 1343, 'Number of Sub-arrays of Size K and Average Greater than or Equal to Threshold', 'https://leetcode.com/problems/number-of-sub-arrays-of-size-k-and-average-greater-than-or-equal-to-threshold/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Fixed window + counting'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000706' AND leetcode_number = 1343);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000768', 'a0a00000-0000-0000-0000-000000000706', 930, 'Binary Subarrays With Sum', 'https://leetcode.com/problems/binary-subarrays-with-sum/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Window/counting'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000706' AND leetcode_number = 930);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000769', 'a0a00000-0000-0000-0000-000000000706', 1248, 'Count Number of Nice Subarrays', 'https://leetcode.com/problems/count-number-of-nice-subarrays/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Counting + window reasoning'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000706' AND leetcode_number = 1248);


-- 9. Seed details for all seeded problems
INSERT INTO problem_details (problem_id, intuition, approach, code_snippet, complexity_analysis, what_i_learned)
SELECT id, 'Study sliding window bounds.', 'Use double pointer indices.', '// Code snippet', 'N/A', 'Practice makes perfect'
FROM problems 
WHERE id IN (
    'c0000000-0000-0000-0000-000000000750', 'c0000000-0000-0000-0000-000000000751',
    'c0000000-0000-0000-0000-000000000752', 'c0000000-0000-0000-0000-000000000753',
    'c0000000-0000-0000-0000-000000000754', 'c0000000-0000-0000-0000-000000000755',
    'c0000000-0000-0000-0000-000000000756', 'c0000000-0000-0000-0000-000000000757',
    'c0000000-0000-0000-0000-000000000758', 'c0000000-0000-0000-0000-000000000759',
    'c0000000-0000-0000-0000-000000000760', 'c0000000-0000-0000-0000-000000000761',
    'c0000000-0000-0000-0000-000000000762', 'c0000000-0000-0000-0000-000000000763',
    'c0000000-0000-0000-0000-000000000764', 'c0000000-0000-0000-0000-000000000765',
    'c0000000-0000-0000-0000-000000000766', 'c0000000-0000-0000-0000-000000000767',
    'c0000000-0000-0000-0000-000000000768', 'c0000000-0000-0000-0000-000000000769'
)
ON CONFLICT (problem_id) DO NOTHING;
