-- V30: Update Stack subtopics and seed problems idempotently

-- 1. Update existing Stack subtopics names and sequence orders first (to release unique names)
UPDATE patterns SET name = 'Basic Stack Operations', sequence_order = 1 WHERE id = 'a0a00000-0000-0000-0000-000000000801';
UPDATE patterns SET name = 'Parentheses / Matching', sequence_order = 2 WHERE id = 'a0a00000-0000-0000-0000-000000000802';
UPDATE patterns SET name = 'Stack + String', sequence_order = 3 WHERE id = 'a0a00000-0000-0000-0000-000000000803';
UPDATE patterns SET name = 'Expression / Calculation', sequence_order = 4 WHERE id = 'a0a00000-0000-0000-0000-000000000804';

-- 2. Ensure new patterns (0805, 0806, 0807, 0808) exist
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000000805', 'b0a00000-0000-0000-0000-000000000008', 'Monotonic Stack', 'Maintaining elements in sorted order dynamically within stack structures.', 'Next greater or monotonic conditions', 'Keep elements in increasing/decreasing order on stack.', 'Stack with loop eviction checks.', 'O(N)', 'O(N)', 'Popping correct elements.', 'NOT_STARTED', 5),
('a0a00000-0000-0000-0000-000000000806', 'b0a00000-0000-0000-0000-000000000008', 'Next Greater / Next Smaller', 'Resolving indices of next larger or smaller items in arrays.', 'Distance to next larger/smaller item', 'Push array indices onto monotonic stack.', 'Index-based monotonic stack.', 'O(N)', 'O(N)', 'Not storing indices.', 'NOT_STARTED', 6),
('a0a00000-0000-0000-0000-000000000807', 'b0a00000-0000-0000-0000-000000000008', 'Histogram / Range Problems', 'Computing optimal ranges or rectangles over linear heights.', 'Largest rectangle bounds in graph', 'Calculate left/right boundaries using monotonic stack.', 'Boundary scans with stack.', 'O(N)', 'O(N)', 'Wrong boundary initialization.', 'NOT_STARTED', 7),
('a0a00000-0000-0000-0000-000000000808', 'b0a00000-0000-0000-0000-000000000008', 'Stack Simulation', 'Simulating physical interactions or actions using stack history.', 'Physics collision or backtracking simulation', 'Simulate process step-by-step using push/pop.', 'Linear stack simulation.', 'O(N)', 'O(N)', 'Missing boundary interactions.', 'NOT_STARTED', 8)
ON CONFLICT (id) DO NOTHING;

-- 3. Set correct sequence orders for the new patterns
UPDATE patterns SET sequence_order = 5 WHERE id = 'a0a00000-0000-0000-0000-000000000805';
UPDATE patterns SET sequence_order = 6 WHERE id = 'a0a00000-0000-0000-0000-000000000806';
UPDATE patterns SET sequence_order = 7 WHERE id = 'a0a00000-0000-0000-0000-000000000807';
UPDATE patterns SET sequence_order = 8 WHERE id = 'a0a00000-0000-0000-0000-000000000808';

-- 4. Seed Basic Stack Operations problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000850', 'a0a00000-0000-0000-0000-000000000801', 225, 'Implement Stack using Queues', 'https://leetcode.com/problems/implement-stack-using-queues/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Understand Stack behavior'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000801' AND leetcode_number = 225);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000851', 'a0a00000-0000-0000-0000-000000000801', 155, 'Min Stack', 'https://leetcode.com/problems/min-stack/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Stack + maintaining minimum'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000801' AND leetcode_number = 155);


-- 5. Seed Parentheses / Matching problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000852', 'a0a00000-0000-0000-0000-000000000802', 20, 'Valid Parentheses', 'https://leetcode.com/problems/valid-parentheses/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Fundamental Stack problem'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000802' AND leetcode_number = 20);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000853', 'a0a00000-0000-0000-0000-000000000802', 1021, 'Remove Outermost Parentheses', 'https://leetcode.com/problems/remove-outermost-parentheses/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Parentheses depth'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000802' AND leetcode_number = 1021);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000854', 'a0a00000-0000-0000-0000-000000000802', 921, 'Minimum Add to Make Parentheses Valid', 'https://leetcode.com/problems/minimum-add-to-make-parentheses-valid/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Balance reasoning'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000802' AND leetcode_number = 921);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000855', 'a0a00000-0000-0000-0000-000000000802', 1249, 'Minimum Remove to Make Valid Parentheses', 'https://leetcode.com/problems/minimum-remove-to-make-valid-parentheses/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Stack + invalid characters'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000802' AND leetcode_number = 1249);


-- 6. Seed Stack + String problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000856', 'a0a00000-0000-0000-0000-000000000803', 844, 'Backspace String Compare', 'https://leetcode.com/problems/backspace-string-compare/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Stack + string processing'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000803' AND leetcode_number = 844);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000857', 'a0a00000-0000-0000-0000-000000000803', 1047, 'Remove All Adjacent Duplicates In String', 'https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Push/pop cancellation'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000803' AND leetcode_number = 1047);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000858', 'a0a00000-0000-0000-0000-000000000803', 1544, 'Make The String Great', 'https://leetcode.com/problems/make-the-string-great/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Adjacent cancellation'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000803' AND leetcode_number = 1544);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000859', 'a0a00000-0000-0000-0000-000000000803', 316, 'Remove Duplicate Letters', 'https://leetcode.com/problems/remove-duplicate-letters/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Stack + frequency'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000803' AND leetcode_number = 316);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000860', 'a0a00000-0000-0000-0000-000000000803', 394, 'Decode String', 'https://leetcode.com/problems/decode-string/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Nested processing'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000803' AND leetcode_number = 394);


-- 7. Seed Expression / Calculation problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000861', 'a0a00000-0000-0000-0000-000000000804', 150, 'Evaluate Reverse Polish Notation', 'https://leetcode.com/problems/evaluate-reverse-polish-notation/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Classic expression Stack'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000804' AND leetcode_number = 150);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000862', 'a0a00000-0000-0000-0000-000000000804', 227, 'Basic Calculator II', 'https://leetcode.com/problems/basic-calculator-ii/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Stack + operators'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000804' AND leetcode_number = 227);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000863', 'a0a00000-0000-0000-0000-000000000804', 224, 'Basic Calculator', 'https://leetcode.com/problems/basic-calculator/', 'HARD', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Advanced expression processing'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000804' AND leetcode_number = 224);


-- 8. Seed Monotonic Stack problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000864', 'a0a00000-0000-0000-0000-000000000805', 402, 'Remove K Digits', 'https://leetcode.com/problems/remove-k-digits/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Monotonic stack character removal'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000805' AND leetcode_number = 402);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000865', 'a0a00000-0000-0000-0000-000000000805', 456, '132 Pattern', 'https://leetcode.com/problems/132-pattern/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Monotonic subsequence matching'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000805' AND leetcode_number = 456);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000866', 'a0a00000-0000-0000-0000-000000000805', 496, 'Next Greater Element I', 'https://leetcode.com/problems/next-greater-element-i/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Fundamental monotonic stack'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000805' AND leetcode_number = 496);


-- 9. Seed Next Greater / Next Smaller problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000867', 'a0a00000-0000-0000-0000-000000000806', 496, 'Next Greater Element I', 'https://leetcode.com/problems/next-greater-element-i/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Fundamental monotonic Stack'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000806' AND leetcode_number = 496);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000868', 'a0a00000-0000-0000-0000-000000000806', 503, 'Next Greater Element II', 'https://leetcode.com/problems/next-greater-element-ii/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Circular array + Stack'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000806' AND leetcode_number = 503);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000869', 'a0a00000-0000-0000-0000-000000000806', 739, 'Daily Temperatures', 'https://leetcode.com/problems/daily-temperatures/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Classic monotonic Stack'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000806' AND leetcode_number = 739);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000870', 'a0a00000-0000-0000-0000-000000000806', 901, 'Online Stock Span', 'https://leetcode.com/problems/online-stock-span/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Monotonic Stack'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000806' AND leetcode_number = 901);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000871', 'a0a00000-0000-0000-0000-000000000806', 1475, 'Final Prices With a Special Discount in a Shop', 'https://leetcode.com/problems/final-prices-with-a-special-discount-in-a-shop/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Next smaller element'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000806' AND leetcode_number = 1475);


-- 10. Seed Histogram / Range Problems problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000872', 'a0a00000-0000-0000-0000-000000000807', 84, 'Largest Rectangle in Histogram', 'https://leetcode.com/problems/largest-rectangle-in-histogram/', 'HARD', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Core advanced monotonic Stack'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000807' AND leetcode_number = 84);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000873', 'a0a00000-0000-0000-0000-000000000807', 85, 'Maximal Rectangle', 'https://leetcode.com/problems/maximal-rectangle/', 'HARD', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Histogram + Matrix + Stack'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000807' AND leetcode_number = 85);


-- 11. Seed Stack Simulation problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000874', 'a0a00000-0000-0000-0000-000000000808', 682, 'Baseball Game', 'https://leetcode.com/problems/baseball-game/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Baseball game simulation'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000808' AND leetcode_number = 682);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000875', 'a0a00000-0000-0000-0000-000000000808', 735, 'Asteroid Collision', 'https://leetcode.com/problems/asteroid-collision/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Stack + collision simulation'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000808' AND leetcode_number = 735);


-- 12. Seed details for all seeded problems
INSERT INTO problem_details (problem_id, intuition, approach, code_snippet, complexity_analysis, what_i_learned)
SELECT id, 'Study stack manipulation properties.', 'Push or pop conditionally.', '// Code snippet', 'N/A', 'Practice makes perfect'
FROM problems 
WHERE id IN (
    'c0000000-0000-0000-0000-000000000850', 'c0000000-0000-0000-0000-000000000851',
    'c0000000-0000-0000-0000-000000000852', 'c0000000-0000-0000-0000-000000000853',
    'c0000000-0000-0000-0000-000000000854', 'c0000000-0000-0000-0000-000000000855',
    'c0000000-0000-0000-0000-000000000856', 'c0000000-0000-0000-0000-000000000857',
    'c0000000-0000-0000-0000-000000000858', 'c0000000-0000-0000-0000-000000000859',
    'c0000000-0000-0000-0000-000000000860', 'c0000000-0000-0000-0000-000000000861',
    'c0000000-0000-0000-0000-000000000862', 'c0000000-0000-0000-0000-000000000863',
    'c0000000-0000-0000-0000-000000000864', 'c0000000-0000-0000-0000-000000000865',
    'c0000000-0000-0000-0000-000000000866', 'c0000000-0000-0000-0000-000000000867',
    'c0000000-0000-0000-0000-000000000868', 'c0000000-0000-0000-0000-000000000869',
    'c0000000-0000-0000-0000-000000000870', 'c0000000-0000-0000-0000-000000000871',
    'c0000000-0000-0000-0000-000000000872', 'c0000000-0000-0000-0000-000000000873',
    'c0000000-0000-0000-0000-000000000874', 'c0000000-0000-0000-0000-000000000875'
)
ON CONFLICT (problem_id) DO NOTHING;
