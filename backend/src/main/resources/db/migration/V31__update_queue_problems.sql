-- V31: Update Queue subtopics and seed problems idempotently

-- 1. Update existing Queue subtopics names and sequence orders first (to release unique names)
UPDATE patterns SET name = 'Basic Queue', sequence_order = 1 WHERE id = 'a0a00000-0000-0000-0000-000000000901';
UPDATE patterns SET name = 'Queue Simulation', sequence_order = 2 WHERE id = 'a0a00000-0000-0000-0000-000000000902';
UPDATE patterns SET name = 'Deque', sequence_order = 3 WHERE id = 'a0a00000-0000-0000-0000-000000000903';
UPDATE patterns SET name = 'Deque + Sliding Window', sequence_order = 4 WHERE id = 'a0a00000-0000-0000-0000-000000000904';

-- 2. Ensure new patterns (0905, 0906, 0907) exist
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000000905', 'b0a00000-0000-0000-0000-000000000009', 'Circular Queue', 'Designing fixed-size buffers utilizing modulo arithmetic indices.', 'Fixed buffer space bounds', 'Circular indexing via modulo calculations.', 'Circular array indexing design.', 'O(1)', 'O(N)', 'Index underflow/overflow bounds.', 'NOT_STARTED', 5),
('a0a00000-0000-0000-0000-000000000906', 'b0a00000-0000-0000-0000-000000000009', 'Queue + BFS Preparation', 'Leveraging queues to perform breadth-first searches or level-order tree scans.', 'Shortest paths or layer levels scans', 'Queue nodes layer by layer.', 'BFS tree scan algorithm.', 'O(N)', 'O(W)', 'Infinite loop cycles.', 'NOT_STARTED', 6),
('a0a00000-0000-0000-0000-000000000907', 'b0a00000-0000-0000-0000-000000000009', 'Priority Queue / Heap Problems', 'Manipulating minimums/maximums dynamically using priority queues.', 'Top K elements or dynamically sorted collection', 'Use min/max-heap properties to select elements.', 'Priority queue element insertions.', 'O(N log K)', 'O(K)', 'Custom sorting mistakes.', 'NOT_STARTED', 7)
ON CONFLICT (id) DO NOTHING;

-- 3. Set correct sequence orders for the new patterns
UPDATE patterns SET sequence_order = 5 WHERE id = 'a0a00000-0000-0000-0000-000000000905';
UPDATE patterns SET sequence_order = 6 WHERE id = 'a0a00000-0000-0000-0000-000000000906';
UPDATE patterns SET sequence_order = 7 WHERE id = 'a0a00000-0000-0000-0000-000000000907';

-- 4. Seed Basic Queue problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000950', 'a0a00000-0000-0000-0000-000000000901', 933, 'Number of Recent Calls', 'https://leetcode.com/problems/number-of-recent-calls/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Fundamental Queue'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000901' AND leetcode_number = 933);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000951', 'a0a00000-0000-0000-0000-000000000901', 232, 'Implement Queue using Stacks', 'https://leetcode.com/problems/implement-queue-using-stacks/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Understand FIFO internally'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000901' AND leetcode_number = 232);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000952', 'a0a00000-0000-0000-0000-000000000901', 2073, 'Time Needed to Buy Tickets', 'https://leetcode.com/problems/time-needed-to-buy-tickets/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Queue simulation'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000901' AND leetcode_number = 2073);


-- 5. Seed Queue Simulation problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000953', 'a0a00000-0000-0000-0000-000000000902', 2073, 'Time Needed to Buy Tickets', 'https://leetcode.com/problems/time-needed-to-buy-tickets/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Basic simulation'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000902' AND leetcode_number = 2073);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000954', 'a0a00000-0000-0000-0000-000000000902', 649, 'Dota2 Senate', 'https://leetcode.com/problems/dota2-senate/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Queue + simulation'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000902' AND leetcode_number = 649);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000955', 'a0a00000-0000-0000-0000-000000000902', 950, 'Reveal Cards In Increasing Order', 'https://leetcode.com/problems/reveal-cards-in-increasing-order/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Queue + index simulation'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000902' AND leetcode_number = 950);


-- 6. Seed Deque problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000956', 'a0a00000-0000-0000-0000-000000000903', 641, 'Design Circular Deque', 'https://leetcode.com/problems/design-circular-deque/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Design Deque from memory'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000903' AND leetcode_number = 641);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000957', 'a0a00000-0000-0000-0000-000000000903', 1670, 'Design Front Middle Back Queue', 'https://leetcode.com/problems/design-front-middle-back-queue/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Double-ended operations'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000903' AND leetcode_number = 1670);


-- 7. Seed Deque + Sliding Window problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000958', 'a0a00000-0000-0000-0000-000000000904', 239, 'Sliding Window Maximum', 'https://leetcode.com/problems/sliding-window-maximum/', 'HARD', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Monotonic Deque'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000904' AND leetcode_number = 239);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000959', 'a0a00000-0000-0000-0000-000000000904', 1438, 'Longest Continuous Subarray With Absolute Diff Less Than or Equal to Limit', 'https://leetcode.com/problems/longest-continuous-subarray-with-absolute-diff-less-than-or-equal-to-limit/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Two Deques + Sliding Window'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000904' AND leetcode_number = 1438);


-- 8. Seed Circular Queue problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000960', 'a0a00000-0000-0000-0000-000000000905', 622, 'Design Circular Queue', 'https://leetcode.com/problems/design-circular-queue/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Queue implementation'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000905' AND leetcode_number = 622);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000961', 'a0a00000-0000-0000-0000-000000000905', 641, 'Design Circular Deque', 'https://leetcode.com/problems/design-circular-deque/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Extended circular design'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000905' AND leetcode_number = 641);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000962', 'a0a00000-0000-0000-0000-000000000905', 90401, 'Implement Queue using Arrays', 'https://www.geeksforgeeks.org/problems/implement-queue-using-array/1', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Array-based circular implementation'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000905' AND leetcode_number = 90401);


-- 9. Seed Queue + BFS Preparation problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000963', 'a0a00000-0000-0000-0000-000000000906', 102, 'Binary Tree Level Order Traversal', 'https://leetcode.com/problems/binary-tree-level-order-traversal/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Queue + BFS'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000906' AND leetcode_number = 102);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000964', 'a0a00000-0000-0000-0000-000000000906', 637, 'Average of Levels in Binary Tree', 'https://leetcode.com/problems/average-of-levels-in-binary-tree/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Level-order Queue'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000906' AND leetcode_number = 637);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000965', 'a0a00000-0000-0000-0000-000000000906', 111, 'Minimum Depth of Binary Tree', 'https://leetcode.com/problems/minimum-depth-of-binary-tree/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'BFS + Queue'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000906' AND leetcode_number = 111);


-- 10. Seed Priority Queue / Heap Problems problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000966', 'a0a00000-0000-0000-0000-000000000907', 703, 'Kth Largest Element in a Stream', 'https://leetcode.com/problems/kth-largest-element-in-a-stream/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Basic PriorityQueue'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000907' AND leetcode_number = 703);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000967', 'a0a00000-0000-0000-0000-000000000907', 1046, 'Last Stone Weight', 'https://leetcode.com/problems/last-stone-weight/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Last Stone Weight'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000907' AND leetcode_number = 1046);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000968', 'a0a00000-0000-0000-0000-000000000907', 215, 'Kth Largest Element in an Array', 'https://leetcode.com/problems/kth-largest-element-in-an-array/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Heap + selection'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000907' AND leetcode_number = 215);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000969', 'a0a00000-0000-0000-0000-000000000907', 347, 'Top K Frequent Elements', 'https://leetcode.com/problems/top-k-frequent-elements/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'HashMap + Heap'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000907' AND leetcode_number = 347);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000000970', 'a0a00000-0000-0000-0000-000000000907', 973, 'K Closest Points to Origin', 'https://leetcode.com/problems/k-closest-points-to-origin/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Heap + custom comparator'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000000907' AND leetcode_number = 973);


-- 11. Seed details for all seeded problems
INSERT INTO problem_details (problem_id, intuition, approach, code_snippet, complexity_analysis, what_i_learned)
SELECT id, 'Study queue manipulation properties.', 'Process FIFO elements.', '// Code snippet', 'N/A', 'Practice makes perfect'
FROM problems 
WHERE id IN (
    'c0000000-0000-0000-0000-000000000950', 'c0000000-0000-0000-0000-000000000951',
    'c0000000-0000-0000-0000-000000000952', 'c0000000-0000-0000-0000-000000000953',
    'c0000000-0000-0000-0000-000000000954', 'c0000000-0000-0000-0000-000000000955',
    'c0000000-0000-0000-0000-000000000956', 'c0000000-0000-0000-0000-000000000957',
    'c0000000-0000-0000-0000-000000000958', 'c0000000-0000-0000-0000-000000000959',
    'c0000000-0000-0000-0000-000000000960', 'c0000000-0000-0000-0000-000000000961',
    'c0000000-0000-0000-0000-000000000962', 'c0000000-0000-0000-0000-000000000963',
    'c0000000-0000-0000-0000-000000000964', 'c0000000-0000-0000-0000-000000000965',
    'c0000000-0000-0000-0000-000000000966', 'c0000000-0000-0000-0000-000000000967',
    'c0000000-0000-0000-0000-000000000968', 'c0000000-0000-0000-0000-000000000969',
    'c0000000-0000-0000-0000-000000000970'
)
ON CONFLICT (problem_id) DO NOTHING;
