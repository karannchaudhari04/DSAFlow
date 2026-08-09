-- V34: Insert Bit Manipulation (Basics) as a new phase between Phase 4 and Phase 5

-- 1. Increment sequence_order and phase_number for all phases >= 5 (in reverse order to avoid UNIQUE constraint violation)
UPDATE phases SET phase_number = phase_number + 1, sequence_order = sequence_order + 1 WHERE phase_number = 18;
UPDATE phases SET phase_number = phase_number + 1, sequence_order = sequence_order + 1 WHERE phase_number = 17;
UPDATE phases SET phase_number = phase_number + 1, sequence_order = sequence_order + 1 WHERE phase_number = 16;
UPDATE phases SET phase_number = phase_number + 1, sequence_order = sequence_order + 1 WHERE phase_number = 15;
UPDATE phases SET phase_number = phase_number + 1, sequence_order = sequence_order + 1 WHERE phase_number = 14;
UPDATE phases SET phase_number = phase_number + 1, sequence_order = sequence_order + 1 WHERE phase_number = 13;
UPDATE phases SET phase_number = phase_number + 1, sequence_order = sequence_order + 1 WHERE phase_number = 12;
UPDATE phases SET phase_number = phase_number + 1, sequence_order = sequence_order + 1 WHERE phase_number = 11;
UPDATE phases SET phase_number = phase_number + 1, sequence_order = sequence_order + 1 WHERE phase_number = 10;
UPDATE phases SET phase_number = phase_number + 1, sequence_order = sequence_order + 1 WHERE phase_number = 9;
UPDATE phases SET phase_number = phase_number + 1, sequence_order = sequence_order + 1 WHERE phase_number = 8;
UPDATE phases SET phase_number = phase_number + 1, sequence_order = sequence_order + 1 WHERE phase_number = 7;
UPDATE phases SET phase_number = phase_number + 1, sequence_order = sequence_order + 1 WHERE phase_number = 6;
UPDATE phases SET phase_number = phase_number + 1, sequence_order = sequence_order + 1 WHERE phase_number = 5;

-- 2. Insert new Phase: Bit Manipulation (Basics)
INSERT INTO phases (id, phase_number, topic, priority, status, sequence_order)
VALUES ('b0a00000-0000-0000-0000-000000000050', 5, 'Bit Manipulation (Basics)', 'TIER_1_MASTER', 'NOT_STARTED', 5)
ON CONFLICT (id) DO NOTHING;

-- 3. Register Patterns (Subtopics) for Phase 5 (Bit Manipulation Basics)
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000005001', 'b0a00000-0000-0000-0000-000000000050', 'Binary Representation & Bit Operators', 'Understanding how integer values map to binary strings and the use of core bitwise AND, OR, XOR operators.', 'Representations, bases, and basic operators', 'Work on binary level representation directly.', 'Basic bit shifting and operator application.', 'O(1)', 'O(1)', 'Operator precedence rules.', 'NOT_STARTED', 1),
('a0a00000-0000-0000-0000-000000005002', 'b0a00000-0000-0000-0000-000000000050', 'Checking / Setting / Clearing a Bit', 'Manipulating individual bits at specific indices within integers.', 'Turn on, off, or verify a bit status', 'Use bitmasks generated via 1 << k.', 'Bitwise mask operations.', 'O(1)', 'O(1)', 'Off-by-one shifts.', 'NOT_STARTED', 2),
('a0a00000-0000-0000-0000-000000005003', 'b0a00000-0000-0000-0000-000000000050', 'XOR Pattern', 'Leveraging XOR cancellation properties where X ^ X = 0 and X ^ 0 = X.', 'Find unique or missing elements', 'XOR running accumulation removes duplicate values.', 'Linear XOR scans.', 'O(N)', 'O(1)', 'Mismatching data parity.', 'NOT_STARTED', 3),
('a0a00000-0000-0000-0000-000000005004', 'b0a00000-0000-0000-0000-000000000050', 'Counting Set Bits', 'Computing the number of active bits (set to 1) in integers.', 'Hamming weight or bits population count', 'Use Brian Kernighan''s algorithm or dynamic programming.', 'Set bits counter scans.', 'O(1)', 'O(1)', 'Infinite loops due to negative values.', 'NOT_STARTED', 4),
('a0a00000-0000-0000-0000-000000005005', 'b0a00000-0000-0000-0000-000000000050', 'Power of Two', 'Verifying if integers represent power of two values (exactly one bit set).', 'Numbers of form 2^k', 'Check if n & (n - 1) equals 0.', 'Low bound checks.', 'O(1)', 'O(1)', 'Handling zero or negative values incorrectly.', 'NOT_STARTED', 5),
('a0a00000-0000-0000-0000-000000005006', 'b0a00000-0000-0000-0000-000000000050', 'Bitwise XOR / Range Properties', 'Analyzing ranges of indices and values using cumulative XOR properties.', 'XOR sum in range', 'Calculate pattern blocks of consecutive XOR values.', 'Dynamic range evaluation.', 'O(1)', 'O(1)', 'Indexing errors.', 'NOT_STARTED', 6),
('a0a00000-0000-0000-0000-000000005007', 'b0a00000-0000-0000-0000-000000000050', 'Reverse / Manipulate Bits', 'Reversing or translating patterns of bits inside binary words.', 'Reversal or code translations', 'Build integers by shifting and extracting lowest bits.', 'Loop bit accumulator.', 'O(1)', 'O(1)', 'Failing to process all bits.', 'NOT_STARTED', 7),
('a0a00000-0000-0000-0000-000000005008', 'b0a00000-0000-0000-0000-000000000050', 'XOR + Array Patterns', 'Combining array properties with XOR logic partition techniques.', 'Find two unique values among pairs', 'Find XOR difference, partition via lowest set bit.', 'Partition scan algorithm.', 'O(N)', 'O(1)', 'Wrong mask partitioning.', 'NOT_STARTED', 8)
ON CONFLICT (id) DO NOTHING;

-- 4. Seed Binary Representation & Bit Operators problems
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000005010', 'a0a00000-0000-0000-0000-000000005001', 693, 'Binary Number with Alternating Bits', 'https://leetcode.com/problems/binary-number-with-alternating-bits/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Binary representation check'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000005001' AND leetcode_number = 693);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000005011', 'a0a00000-0000-0000-0000-000000005001', 504, 'Base 7', 'https://leetcode.com/problems/base-7/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Base representation conversion'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000005001' AND leetcode_number = 504);


-- 5. Seed Checking / Setting / Clearing a Bit problems
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000005012', 'a0a00000-0000-0000-0000-000000005002', 90501, 'Set Kth bit', 'https://www.geeksforgeeks.org/problems/set-kth-bit3724/1', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Set bit operation'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000005002' AND leetcode_number = 90501);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000005013', 'a0a00000-0000-0000-0000-000000005002', 90502, 'Check whether K-th bit is set or not', 'https://www.geeksforgeeks.org/problems/check-whether-k-th-bit-is-set-or-not-1587115620/1', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Check bit operation'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000005002' AND leetcode_number = 90502);


-- 6. Seed XOR Pattern problems
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000005014', 'a0a00000-0000-0000-0000-000000005003', 136, 'Single Number', 'https://leetcode.com/problems/single-number/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, '⭐ XOR fundamentals'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000005003' AND leetcode_number = 136);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000005015', 'a0a00000-0000-0000-0000-000000005003', 268, 'Missing Number', 'https://leetcode.com/problems/missing-number/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'XOR + indices'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000005003' AND leetcode_number = 268);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000005016', 'a0a00000-0000-0000-0000-000000005003', 389, 'Find the Difference', 'https://leetcode.com/problems/find-the-difference/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'XOR cancellation'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000005003' AND leetcode_number = 389);


-- 7. Seed Counting Set Bits problems
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000005017', 'a0a00000-0000-0000-0000-000000005004', 191, 'Number of 1 Bits', 'https://leetcode.com/problems/number-of-1-bits/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, '⭐ Core'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000005004' AND leetcode_number = 191);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000005018', 'a0a00000-0000-0000-0000-000000005004', 338, 'Counting Bits', 'https://leetcode.com/problems/counting-bits/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'DP + bit manipulation'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000005004' AND leetcode_number = 338);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000005019', 'a0a00000-0000-0000-0000-000000005004', 693, 'Binary Number with Alternating Bits', 'https://leetcode.com/problems/binary-number-with-alternating-bits/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Bit pattern'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000005004' AND leetcode_number = 693);


-- 8. Seed Power of Two problems
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000005020', 'a0a00000-0000-0000-0000-000000005005', 231, 'Power of Two', 'https://leetcode.com/problems/power-of-two/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, '⭐ Core pattern'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000005005' AND leetcode_number = 231);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000005021', 'a0a00000-0000-0000-0000-000000005005', 342, 'Power of Four', 'https://leetcode.com/problems/power-of-four/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Bit + mathematical constraint'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000005005' AND leetcode_number = 342);


-- 9. Seed Bitwise XOR / Range Properties problems
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000005022', 'a0a00000-0000-0000-0000-000000005006', 268, 'Missing Number', 'https://leetcode.com/problems/missing-number/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'XOR + index cancellation'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000005006' AND leetcode_number = 268);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000005023', 'a0a00000-0000-0000-0000-000000005006', 137, 'Single Number II', 'https://leetcode.com/problems/single-number-ii/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Bit counting'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000005006' AND leetcode_number = 137);


-- 10. Seed Reverse / Manipulate Bits problems
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000005024', 'a0a00000-0000-0000-0000-000000005007', 190, 'Reverse Bits', 'https://leetcode.com/problems/reverse-bits/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Bit extraction + shifting'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000005007' AND leetcode_number = 190);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000005025', 'a0a00000-0000-0000-0000-000000005007', 405, 'Convert a Number to Hexadecimal', 'https://leetcode.com/problems/convert-a-number-to-hexadecimal/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Bit extraction'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000005007' AND leetcode_number = 405);


-- 11. Seed XOR + Array Patterns problems
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000005026', 'a0a00000-0000-0000-0000-000000005008', 136, 'Single Number', 'https://leetcode.com/problems/single-number/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Array + XOR'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000005008' AND leetcode_number = 136);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000005027', 'a0a00000-0000-0000-0000-000000005008', 268, 'Missing Number', 'https://leetcode.com/problems/missing-number/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Array + XOR'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000005008' AND leetcode_number = 268);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000005028', 'a0a00000-0000-0000-0000-000000005008', 260, 'Single Number III', 'https://leetcode.com/problems/single-number-iii/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'XOR + bit partition'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000005008' AND leetcode_number = 260);


-- 12. Seed details for all seeded problems
INSERT INTO problem_details (problem_id, intuition, approach, code_snippet, complexity_analysis, what_i_learned)
SELECT id, 'Study bitwise pattern interactions.', 'Compute masks and shift appropriately.', '// Code snippet', 'N/A', 'Practice makes perfect'
FROM problems 
WHERE id IN (
    'c0000000-0000-0000-0000-000000005010', 'c0000000-0000-0000-0000-000000005011',
    'c0000000-0000-0000-0000-000000005012', 'c0000000-0000-0000-0000-000000005013',
    'c0000000-0000-0000-0000-000000005014', 'c0000000-0000-0000-0000-000000005015',
    'c0000000-0000-0000-0000-000000005016', 'c0000000-0000-0000-0000-000000005017',
    'c0000000-0000-0000-0000-000000005018', 'c0000000-0000-0000-0000-000000005019',
    'c0000000-0000-0000-0000-000000005020', 'c0000000-0000-0000-0000-000000005021',
    'c0000000-0000-0000-0000-000000005022', 'c0000000-0000-0000-0000-000000005023',
    'c0000000-0000-0000-0000-000000005024', 'c0000000-0000-0000-0000-000000005025',
    'c0000000-0000-0000-0000-000000005026', 'c0000000-0000-0000-0000-000000005027',
    'c0000000-0000-0000-0000-000000005028'
)
ON CONFLICT (problem_id) DO NOTHING;
