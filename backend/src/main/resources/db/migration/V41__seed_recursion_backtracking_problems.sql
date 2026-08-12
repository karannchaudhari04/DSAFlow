-- V41: Restructure and seed Recursion + Backtracking phase (Phase 16)

-- 1. Rename the Phase 16 topic in phases table
UPDATE phases SET topic = 'Recursion + Backtracking' WHERE id = 'b0a00000-0000-0000-0000-000000000015';

-- 2. Register the 12 Backtracking subtopic patterns
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000001501', 'b0a00000-0000-0000-0000-000000000015', 'RECURSION FUNDAMENTALS', 'Mastering basic recursive divisions and mathematical functions.', 'Basic recursive division or math functions.', 'Define base cases first, then trace recursive steps.', 'Implement recursion functions with robust base parameters.', 'O(2^N)', 'O(N)', 'Failing to define a terminating base case.', 'NOT_STARTED', 1),
('a0a00000-0000-0000-0000-000000001502', 'b0a00000-0000-0000-0000-000000000015', 'RECURSION ON ARRAYS / STRINGS', 'Performing recursion traversals over linear collections.', 'Iterating or reversing array/string elements recursively.', 'Use index tracking arguments to propagate state.', 'Pass tracking indices through helper recursive calls.', 'O(N)', 'O(N)', 'Inefficient string copy concatenations.', 'NOT_STARTED', 2),
('a0a00000-0000-0000-0000-000000001503', 'b0a00000-0000-0000-0000-000000000015', 'SUBSEQUENCES / SUBSETS', 'Generating subset combinations using choice trees.', 'Generate all possible combinations of elements (subsets).', 'Take or not-take (include/exclude) choice tree.', 'Implement standard choose-unchoose recursion loops.', 'O(2^N)', 'O(N)', 'Overlooking duplicate subsets when duplicate inputs are present.', 'NOT_STARTED', 3),
('a0a00000-0000-0000-0000-000000001504', 'b0a00000-0000-0000-0000-000000000015', 'COMBINATION SUM PATTERN', 'Finding subset groups satisfying target sum constraints.', 'Find subset combinations that sum up to a target value.', 'Subtract value from target, backtrack if target < 0.', 'Recursively subtract elements and backtrack on bounds.', 'O(2^N)', 'O(N)', 'Infinitely recurring on positive cycles.', 'NOT_STARTED', 4),
('a0a00000-0000-0000-0000-000000001505', 'b0a00000-0000-0000-0000-000000000015', 'PERMUTATIONS', 'Generating all arrangements of elements.', 'Generate all arrangements/orderings of elements.', 'Swap elements or track visited elements to build permutations.', 'Recursively swap active index elements or use visited array flags.', 'O(N!)', 'O(N)', 'Generating duplicate permutations on non-distinct input.', 'NOT_STARTED', 5),
('a0a00000-0000-0000-0000-000000001506', 'b0a00000-0000-0000-0000-000000000015', 'STRING BACKTRACKING', 'Generating permutations or combinations over string characters.', 'Form combinations or choices using string characters.', 'Append char, recurse, then backtrack (delete/truncate length).', 'Modify StringBuilder buffer in-place during recursive steps.', 'O(M^N)', 'O(N)', 'Creating immutable String instances at each recursive depth.', 'NOT_STARTED', 6),
('a0a00000-0000-0000-0000-000000001507', 'b0a00000-0000-0000-0000-000000000015', 'GENERATE VALID COMBINATIONS', 'Constructing valid element sets matching grammatical criteria.', 'Build structured combinations matching grammatical constraints.', 'Track open/close counts or state constraints during tree traversal.', 'Use counting checks to avoid building invalid state paths.', 'O(2^N)', 'O(N)', 'Failing to track structural counts.', 'NOT_STARTED', 7),
('a0a00000-0000-0000-0000-000000001508', 'b0a00000-0000-0000-0000-000000000015', 'PALINDROME PARTITIONING', 'Decomposing string ranges into palindromes recursively.', 'Split string into substrings that are palindromes.', 'Partition range recursively, backtrack if split is invalid.', 'Traverse substrings, validate palindromes, and recurse.', 'O(N * 2^N)', 'O(N)', 'Re-computing palindrome checks repeatedly instead of caching.', 'NOT_STARTED', 8),
('a0a00000-0000-0000-0000-000000001509', 'b0a00000-0000-0000-0000-000000000015', 'GRID / MATRIX BACKTRACKING', 'DFS backtracking over 2D grids and matrix directions.', 'DFS exploration in 2D grid/matrix spaces.', 'Temporarily mark cell visited (e.g. ''#''), recurse in 4 directions, then restore.', 'Use in-place cell grid replacement or visited boolean matrix.', 'O(4^(R*C))', 'O(R*C)', 'Infinitely looping on cycles or missing restoration steps.', 'NOT_STARTED', 9),
('a0a00000-0000-0000-0000-000000001510', 'b0a00000-0000-0000-0000-000000000015', 'N-QUEENS', 'Mastering constraint checks across diagonals and columns.', 'Place elements avoiding threats in multiple dimensions.', 'Track row, column, and diagonal state constraints.', 'Utilize boolean checks or bit arrays to check threats.', 'O(N!)', 'O(N)', 'Inefficient O(N) threat checks at each board row placement.', 'NOT_STARTED', 10),
('a0a00000-0000-0000-0000-000000001511', 'b0a00000-0000-0000-0000-000000000015', 'SUDOKU / CONSTRAINT SATISFACTION', 'Resolving complex local constraints recursively.', 'Fill grid values checking local block/column constraints.', 'Try all values (1-9) for empty cells and backtrack on collisions.', 'Test digits recursively and backtrack if sudoku fails rules.', 'O(9^(R*C))', 'O(R*C)', 'Attempting to fill already solved cells.', 'NOT_STARTED', 11),
('a0a00000-0000-0000-0000-000000001512', 'b0a00000-0000-0000-0000-000000000015', 'BACKTRACKING + PRUNING', 'Optimizing recursive solvers by exiting invalid search paths early.', 'Optimize backtracking execution using domain constraints.', 'Sort elements to exit early when sums exceed bounds (invalid path pruning).', 'Incorporate strict boundary conditions to prune branches early.', 'O(2^N)', 'O(N)', 'Pruning valid solutions due to overly strict bounds.', 'NOT_STARTED', 12)
ON CONFLICT (id) DO UPDATE SET 
    name = EXCLUDED.name, 
    description = EXCLUDED.description, 
    recognition_clues = EXCLUDED.recognition_clues, 
    intuition = EXCLUDED.intuition, 
    sequence_order = EXCLUDED.sequence_order;

-- 3. Move existing Backtracking problems strictly by ID
UPDATE problems SET pattern_id = 'a0a00000-0000-0000-0000-000000001506', name = 'Letter Combinations of a Phone Number', purpose = 'Multiple choices per position mapped from digit keys' WHERE id = 'c0000000-0000-0000-0000-000000001501';
UPDATE problems SET pattern_id = 'a0a00000-0000-0000-0000-000000001503', name = 'Subsets', purpose = 'Learn take/not-take choice traversal' WHERE id = 'c0000000-0000-0000-0000-000000001502';
UPDATE problems SET pattern_id = 'a0a00000-0000-0000-0000-000000001505', name = 'Permutations', purpose = 'Core permutation pattern using swaps or boolean visited arrays' WHERE id = 'c0000000-0000-0000-0000-000000001503';
UPDATE problems SET pattern_id = 'a0a00000-0000-0000-0000-000000001504', name = 'Combination Sum', purpose = 'Core backtracking using element reuse' WHERE id = 'c0000000-0000-0000-0000-000000001504';
UPDATE problems SET pattern_id = 'a0a00000-0000-0000-0000-000000001510', name = 'N-Queens', purpose = 'Master constraint-based backtracking using diagonal checks' WHERE id = 'c0000000-0000-0000-0000-000000001505';

-- 4. Seed all curated Backtracking practice problems
-- Pattern 1: RECURSION FUNDAMENTALS
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001521', 'a0a00000-0000-0000-0000-000000001501', 509, 'Fibonacci Number', 'https://leetcode.com/problems/fibonacci-number/', 'EASY', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Understand basic recursion and recurrence relations'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001501' AND leetcode_number = 509);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001522', 'a0a00000-0000-0000-0000-000000001501', 231, 'Power of Two', 'https://leetcode.com/problems/power-of-two/', 'EASY', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Recursion + base condition check'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001501' AND leetcode_number = 231);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001523', 'a0a00000-0000-0000-0000-000000001501', 50, 'Pow(x, n)', 'https://leetcode.com/problems/powx-n/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Recursive divide-and-conquer exponentiation'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001501' AND leetcode_number = 50);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001524', 'a0a00000-0000-0000-0000-000000001501', 344, 'Reverse String', 'https://leetcode.com/problems/reverse-string/', 'EASY', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Recursion on array/string swapping indices'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001501' AND leetcode_number = 344);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001525', 'a0a00000-0000-0000-0000-000000001501', 234, 'Palindrome Linked List', 'https://leetcode.com/problems/palindrome-linked-list/', 'EASY', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Recursion + two-end pointer comparisons'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001501' AND leetcode_number = 234);

-- Pattern 2: RECURSION ON ARRAYS / STRINGS
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001526', 'a0a00000-0000-0000-0000-000000001502', 344, 'Reverse String', 'https://leetcode.com/problems/reverse-string/', 'EASY', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Recursive index movement from outer to inner'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001502' AND leetcode_number = 344);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001527', 'a0a00000-0000-0000-0000-000000001502', 206, 'Reverse Linked List', 'https://leetcode.com/problems/reverse-linked-list/', 'EASY', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Recursive structural node pointer updates'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001502' AND leetcode_number = 206);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001528', 'a0a00000-0000-0000-0000-000000001502', 509, 'Fibonacci Number', 'https://leetcode.com/problems/fibonacci-number/', 'EASY', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Recursive state propagation'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001502' AND leetcode_number = 509);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001529', 'a0a00000-0000-0000-0000-000000001502', 50, 'Pow(x, n)', 'https://leetcode.com/problems/powx-n/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Recursive input range halving'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001502' AND leetcode_number = 50);

-- Pattern 3: SUBSEQUENCES / SUBSETS
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001502', 'a0a00000-0000-0000-0000-000000001503', 78, 'Subsets', 'https://leetcode.com/problems/subsets/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Learn take/not-take choice traversal'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001503' AND leetcode_number = 78);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001530', 'a0a00000-0000-0000-0000-000000001503', 90, 'Subsets II', 'https://leetcode.com/problems/subsets-ii/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Handle duplicate choices by sorting and skipping duplicates'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001503' AND leetcode_number = 90);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001531', 'a0a00000-0000-0000-0000-000000001503', 1986, 'Minimum Work Sessions to Finish Tasks', 'https://leetcode.com/problems/minimum-number-of-work-sessions-to-finish-the-tasks/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Pattern practice for partitioned subset options'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001503' AND leetcode_number = 1986);

-- Pattern 4: COMBINATION SUM PATTERN
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001504', 'a0a00000-0000-0000-0000-000000001504', 39, 'Combination Sum', 'https://leetcode.com/problems/combination-sum/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Core backtracking using element reuse'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001504' AND leetcode_number = 39);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001532', 'a0a00000-0000-0000-0000-000000001504', 40, 'Combination Sum II', 'https://leetcode.com/problems/combination-sum-ii/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Handle duplicates in backtracking by skipping identical adjacent elements'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001504' AND leetcode_number = 40);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001533', 'a0a00000-0000-0000-0000-000000001504', 216, 'Combination Sum III', 'https://leetcode.com/problems/combination-sum-iii/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Constrained combinations using set size and target sum limits'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001504' AND leetcode_number = 216);

-- Pattern 5: PERMUTATIONS
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001503', 'a0a00000-0000-0000-0000-000000001505', 46, 'Permutations', 'https://leetcode.com/problems/permutations/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Core permutation pattern using swaps or boolean visited arrays'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001505' AND leetcode_number = 46);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001534', 'a0a00000-0000-0000-0000-000000001505', 47, 'Permutations II', 'https://leetcode.com/problems/permutations-ii/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Duplicate handling in permutations by sorting and visited state checks'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001505' AND leetcode_number = 47);

-- Pattern 6: STRING BACKTRACKING
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001535', 'a0a00000-0000-0000-0000-000000001506', 784, 'Letter Case Permutation', 'https://leetcode.com/problems/letter-case-permutation/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Binary choice per character (uppercase vs lowercase)'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001506' AND leetcode_number = 784);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001536', 'a0a00000-0000-0000-0000-000000001506', 22, 'Generate Parentheses', 'https://leetcode.com/problems/generate-parentheses/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Constrained recursion balancing open and close brackets'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001506' AND leetcode_number = 22);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001501', 'a0a00000-0000-0000-0000-000000001506', 17, 'Letter Combinations of a Phone Number', 'https://leetcode.com/problems/letter-combinations-of-a-phone-number/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Multiple choices per position mapped from digit keys'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001506' AND leetcode_number = 17);

-- Pattern 7: GENERATE VALID COMBINATIONS
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001537', 'a0a00000-0000-0000-0000-000000001507', 22, 'Generate Parentheses', 'https://leetcode.com/problems/generate-parentheses/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Constraint validation + tree pruning'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001507' AND leetcode_number = 22);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001538', 'a0a00000-0000-0000-0000-000000001507', 17, 'Letter Combinations of a Phone Number', 'https://leetcode.com/problems/letter-combinations-of-a-phone-number/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Choice tree traversal for phone keypad combinations'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001507' AND leetcode_number = 17);

-- Pattern 8: PALINDROME PARTITIONING
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001539', 'a0a00000-0000-0000-0000-000000001508', 131, 'Palindrome Partitioning', 'https://leetcode.com/problems/palindrome-partitioning/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Partition range + backtracking validation'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001508' AND leetcode_number = 131);

-- Pattern 9: GRID / MATRIX BACKTRACKING
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001540', 'a0a00000-0000-0000-0000-000000001509', 79, 'Word Search', 'https://leetcode.com/problems/word-search/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'DFS + backtracking grid search'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001509' AND leetcode_number = 79);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001541', 'a0a00000-0000-0000-0000-000000001509', 1219, 'Path with Maximum Gold', 'https://leetcode.com/problems/path-with-maximum-gold/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Grid exploration maximizing collected values with restoration'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001509' AND leetcode_number = 1219);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001542', 'a0a00000-0000-0000-0000-000000001509', 980, 'Unique Paths III', 'https://leetcode.com/problems/unique-paths-iii/', 'HARD', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Advanced grid backtracking traversing all non-obstacle cells'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001509' AND leetcode_number = 980);

-- Pattern 10: N-QUEENS
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001505', 'a0a00000-0000-0000-0000-000000001510', 51, 'N-Queens', 'https://leetcode.com/problems/n-queens/', 'HARD', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Master constraint-based backtracking using diagonal checks'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001510' AND leetcode_number = 51);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001543', 'a0a00000-0000-0000-0000-000000001510', 52, 'N-Queens II', 'https://leetcode.com/problems/n-queens-ii/', 'HARD', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Count valid configurations on chess boards'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001510' AND leetcode_number = 52);

-- Pattern 11: SUDOKU / CONSTRAINT SATISFACTION
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001544', 'a0a00000-0000-0000-0000-000000001511', 37, 'Sudoku Solver', 'https://leetcode.com/problems/sudoku-solver/', 'HARD', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Advanced constraint propagation and backtracking solver'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001511' AND leetcode_number = 37);

-- Pattern 12: BACKTRACKING + PRUNING
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001545', 'a0a00000-0000-0000-0000-000000001512', 39, 'Combination Sum', 'https://leetcode.com/problems/combination-sum/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Constraint pruning by sorting elements and stopping when target is exceeded'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001512' AND leetcode_number = 39);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001546', 'a0a00000-0000-0000-0000-000000001512', 22, 'Generate Parentheses', 'https://leetcode.com/problems/generate-parentheses/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'State pruning by keeping open count >= close count'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001512' AND leetcode_number = 22);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001547', 'a0a00000-0000-0000-0000-000000001512', 79, 'Word Search', 'https://leetcode.com/problems/word-search/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Invalid-path pruning by checking boundaries and character match early'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001512' AND leetcode_number = 79);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001548', 'a0a00000-0000-0000-0000-000000001512', 51, 'N-Queens', 'https://leetcode.com/problems/n-queens/', 'HARD', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Position pruning by tracking threatened lines'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001512' AND leetcode_number = 51);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001549', 'a0a00000-0000-0000-0000-000000001512', 37, 'Sudoku Solver', 'https://leetcode.com/problems/sudoku-solver/', 'HARD', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Constraint propagation by validating column/row/subgrid dynamically'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001512' AND leetcode_number = 37);
