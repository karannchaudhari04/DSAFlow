-- V22: Seed String problems with correct purpose values and avoid duplicates

-- Ensure String patterns exist and have correct titles/orders
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000000301', 'b0a00000-0000-0000-0000-000000000003', 'String Traversal', 'Reading strings character by character.', 'Scanning inputs', 'Convert to charArray or use charAt(i).', 'Simple loop accessing character sequence.', 'O(N)', 'O(1)', 'Using slow concatenation operations', 'NOT_STARTED', 1),
('a0a00000-0000-0000-0000-000000000302', 'b0a00000-0000-0000-0000-000000000003', 'Character Frequency', 'Tracking character occurrences and frequencies.', 'Char occurrences count', 'Maintain counter maps/arrays.', 'Loop string, increment frequency counts.', 'O(N)', 'O(1)', 'None', 'NOT_STARTED', 2),
('a0a00000-0000-0000-0000-000000000303', 'b0a00000-0000-0000-0000-000000000003', 'Palindrome', 'Checking or constructing symmetric string properties.', 'Symmetric substrings', 'Expand around center or use two pointers.', 'Check elements symmetrically.', 'O(N)', 'O(1)', 'None', 'NOT_STARTED', 3),
('a0a00000-0000-0000-0000-000000000304', 'b0a00000-0000-0000-0000-000000000003', 'StringBuilder', 'Stitching or building strings dynamically.', 'Dynamic string building', 'Use StringBuilder class for concatenation.', 'Loop and append to StringBuilder.', 'O(N)', 'O(N)', 'None', 'NOT_STARTED', 4),
('a0a00000-0000-0000-0000-000000000305', 'b0a00000-0000-0000-0000-000000000003', 'Anagrams', 'Detecting and grouping anagram permutations.', 'Anagram groups', 'Sort word keys or map frequencies.', 'HashMap grouping of signatures.', 'O(N * L log L)', 'O(N * L)', 'None', 'NOT_STARTED', 5),
('a0a00000-0000-0000-0000-000000000306', 'b0a00000-0000-0000-0000-000000000003', 'Basic String Manipulation', 'General string parsing and modifications.', 'General string manipulation', 'Use basic string methods and structures.', 'Character-by-character translation loops.', 'O(N)', 'O(1)', 'None', 'NOT_STARTED', 6)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, sequence_order = EXCLUDED.sequence_order;

-- 1. Update purposes of existing String problems in the database
UPDATE problems SET purpose = 'Frequency counting' WHERE leetcode_number = 383;
UPDATE problems SET purpose = 'String comparison' WHERE leetcode_number = 14;

-- 2. Insert new String problems
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
-- String Traversal (a0a00000-0000-0000-0000-000000000301)
('c0000000-0000-0000-0000-000000000381', 'a0a00000-0000-0000-0000-000000000301', 58, 'Length of Last Word', 'https://leetcode.com/problems/length-of-last-word/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'String traversal'),
('c0000000-0000-0000-0000-000000000382', 'a0a00000-0000-0000-0000-000000000301', 344, 'Reverse String', 'https://leetcode.com/problems/reverse-string/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Character/index manipulation'),
('c0000000-0000-0000-0000-000000000383', 'a0a00000-0000-0000-0000-000000000301', 345, 'Reverse Vowels of a String', 'https://leetcode.com/problems/reverse-vowels-of-a-string/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Traversal + character conditions'),
('c0000000-0000-0000-0000-000000000384', 'a0a00000-0000-0000-0000-000000000301', 125, 'Valid Palindrome', 'https://leetcode.com/problems/valid-palindrome/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Character traversal + conditions'),

-- Character Frequency (a0a00000-0000-0000-0000-000000000302)
('c0000000-0000-0000-0000-000000000385', 'a0a00000-0000-0000-0000-000000000302', 389, 'Find the Difference', 'https://leetcode.com/problems/find-the-difference/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Character counting'),
('c0000000-0000-0000-0000-000000000386', 'a0a00000-0000-0000-0000-000000000302', 242, 'Valid Anagram', 'https://leetcode.com/problems/valid-anagram/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Character frequency'),
('c0000000-0000-0000-0000-000000000387', 'a0a00000-0000-0000-0000-000000000302', 387, 'First Unique Character in a String', 'https://leetcode.com/problems/first-unique-character-in-a-string/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Frequency + traversal'),
('c0000000-0000-0000-0000-000000000388', 'a0a00000-0000-0000-0000-000000000302', 409, 'Longest Palindrome', 'https://leetcode.com/problems/longest-palindrome/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Frequency reasoning'),
('c0000000-0000-0000-0000-000000000389', 'a0a00000-0000-0000-0000-000000000302', 451, 'Sort Characters By Frequency', 'https://leetcode.com/problems/sort-characters-by-frequency/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Frequency + ordering'),

-- Palindrome (a0a00000-0000-0000-0000-000000000303)
('c0000000-0000-0000-0000-000000000390', 'a0a00000-0000-0000-0000-000000000303', 9, 'Palindrome Number', 'https://leetcode.com/problems/palindrome-number/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Basic palindrome reasoning'),
('c0000000-0000-0000-0000-000000000391', 'a0a00000-0000-0000-0000-000000000303', 680, 'Valid Palindrome II', 'https://leetcode.com/problems/valid-palindrome-ii/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Palindrome + one modification'),
('c0000000-0000-0000-0000-000000000392', 'a0a00000-0000-0000-0000-000000000303', 5, 'Longest Palindromic Substring', 'https://leetcode.com/problems/longest-palindromic-substring/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Advanced palindrome pattern'),

-- StringBuilder (a0a00000-0000-0000-0000-000000000304)
('c0000000-0000-0000-0000-000000000393', 'a0a00000-0000-0000-0000-000000000304', 415, 'Add Strings', 'https://leetcode.com/problems/add-strings/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Build result without numeric conversion'),
('c0000000-0000-0000-0000-000000000394', 'a0a00000-0000-0000-0000-000000000304', 1768, 'Merge Strings Alternately', 'https://leetcode.com/problems/merge-strings-alternately/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'StringBuilder + traversal'),
('c0000000-0000-0000-0000-000000000395', 'a0a00000-0000-0000-0000-000000000304', 557, 'Reverse Words in a String III', 'https://leetcode.com/problems/reverse-words-in-a-string-iii/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'StringBuilder + word manipulation'),

-- Anagrams (a0a00000-0000-0000-0000-000000000305)
('c0000000-0000-0000-0000-000000000396', 'a0a00000-0000-0000-0000-000000000305', 49, 'Group Anagrams', 'https://leetcode.com/problems/group-anagrams/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Hashing + frequency/signature'),
('c0000000-0000-0000-0000-000000000397', 'a0a00000-0000-0000-0000-000000000305', 438, 'Find All Anagrams in a String', 'https://leetcode.com/problems/find-all-anagrams-in-a-string/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Anagram + sliding window'),

-- Basic String Manipulation (a0a00000-0000-0000-0000-000000000306)
('c0000000-0000-0000-0000-000000000398', 'a0a00000-0000-0000-0000-000000000306', 1108, 'Defanging an IP Address', 'https://leetcode.com/problems/defanging-an-ip-address/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Basic replacement'),
('c0000000-0000-0000-0000-000000000399', 'a0a00000-0000-0000-0000-000000000306', 1678, 'Goal Parser Interpretation', 'https://leetcode.com/problems/goal-parser-interpretation/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'String parsing'),
('c0000000-0000-0000-0000-000000000400', 'a0a00000-0000-0000-0000-000000000306', 8, 'String to Integer (atoi)', 'https://leetcode.com/problems/string-to-integer-atoi/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Parsing + edge cases'),
('c0000000-0000-0000-0000-000000000401', 'a0a00000-0000-0000-0000-000000000306', 6, 'Zigzag Conversion', 'https://leetcode.com/problems/zigzag-conversion/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Advanced string construction')
ON CONFLICT (leetcode_number) DO NOTHING;

-- 3. Seed placeholder details for these newly created problems
INSERT INTO problem_details (problem_id, intuition, approach, code_snippet, complexity_analysis, what_i_learned)
SELECT id, 'Study the string problem.', 'Implement the solution.', '// Code snippet', 'N/A', 'Practice makes perfect'
FROM problems 
WHERE id IN (
    'c0000000-0000-0000-0000-000000000381',
    'c0000000-0000-0000-0000-000000000382',
    'c0000000-0000-0000-0000-000000000383',
    'c0000000-0000-0000-0000-000000000384',
    'c0000000-0000-0000-0000-000000000385',
    'c0000000-0000-0000-0000-000000000386',
    'c0000000-0000-0000-0000-000000000387',
    'c0000000-0000-0000-0000-000000000388',
    'c0000000-0000-0000-0000-000000000389',
    'c0000000-0000-0000-0000-000000000390',
    'c0000000-0000-0000-0000-000000000391',
    'c0000000-0000-0000-0000-000000000392',
    'c0000000-0000-0000-0000-000000000393',
    'c0000000-0000-0000-0000-000000000394',
    'c0000000-0000-0000-0000-000000000395',
    'c0000000-0000-0000-0000-000000000396',
    'c0000000-0000-0000-0000-000000000397',
    'c0000000-0000-0000-0000-000000000398',
    'c0000000-0000-0000-0000-000000000399',
    'c0000000-0000-0000-0000-000000000400',
    'c0000000-0000-0000-0000-000000000401'
)
ON CONFLICT (problem_id) DO NOTHING;
