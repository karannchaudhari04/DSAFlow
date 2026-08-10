-- V32: Update Linked List subtopics and seed problems idempotently

-- 1. Ensure all Linked List patterns exist and have correct titles/orders
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000001001', 'b0a00000-0000-0000-0000-000000000010', 'Traversal & Pointer Manipulation', 'Reversing pointer links in-place.', 'Inversing list sequence', 'Maintain pointers to prev, current, and next elements.', 'Adjust current.next = prev, step prev/current forward.', 'O(N)', 'O(1)', 'Losing list head pointer references mid-loop', 'NOT_STARTED', 1),
('a0a00000-0000-0000-0000-000000001002', 'b0a00000-0000-0000-0000-000000000010', 'Dummy / Sentinel Node', 'Using temporary dummy nodes to handle head modifications smoothly.', 'Head node deletion or list merging', 'Point dummy.next to head to simplify edge conditions.', 'Dummy node link pointer adjustments.', 'O(1)', 'O(1)', 'None', 'NOT_STARTED', 2),
('a0a00000-0000-0000-0000-000000001003', 'b0a00000-0000-0000-0000-000000000010', 'Reverse Linked List', 'Reversing linked list nodes in-place iteratively or recursively.', 'Reorder list backwards', 'Adjust next pointers in-place.', 'Iterative prev/curr/next step updates.', 'O(N)', 'O(1)', 'None', 'NOT_STARTED', 3),
('a0a00000-0000-0000-0000-000000001004', 'b0a00000-0000-0000-0000-000000000010', 'Fast & Slow Pointer', 'Using multiple runner pointers at different speeds to detect cycles or find midpoints.', 'List cycles detection or middle node extraction', 'Fast pointer runs at 2x slow speed.', 'Floyds cycle detection runner loops.', 'O(N)', 'O(1)', 'None', 'NOT_STARTED', 4),
('a0a00000-0000-0000-0000-000000001005', 'b0a00000-0000-0000-0000-000000000010', 'Two Pointers with a Gap', 'pointers traversing linked lists separated by a static index gap.', 'Find N-th node from list end', 'Advance lead pointer by K steps first.', 'Two pointers gap traversal scans.', 'O(N)', 'O(1)', 'None', 'NOT_STARTED', 5),
('a0a00000-0000-0000-0000-000000001006', 'b0a00000-0000-0000-0000-000000000010', 'Merge / Compare Linked Lists', 'Iterating and merging multiple linked list sequences.', 'Merge sorted collections', 'Iteratively compare and stitch nodes.', 'Stitched lists traversals.', 'O(N)', 'O(1)', 'None', 'NOT_STARTED', 6),
('a0a00000-0000-0000-0000-000000001007', 'b0a00000-0000-0000-0000-000000000010', 'Cycle & Intersection', 'Detecting cycles or node intersection points across lists.', 'Intersection of two lists', 'Find intersection node using length offsets or sets.', 'Cyclic nodes pointer matching.', 'O(N)', 'O(1)', 'None', 'NOT_STARTED', 7),
('a0a00000-0000-0000-0000-000000001008', 'b0a00000-0000-0000-0000-000000000010', 'Pattern Combination', 'Solving complex linked list problems using combinations of traversal, reversing, and fast/slow pointer strategies.', 'Multi-step linked list modification', 'Combine basic modular functions (like reverse and middle node) to solve advanced problems.', 'Multi-method composition.', 'O(N)', 'O(1) or O(N)', 'Pointer lifecycle errors.', 'NOT_STARTED', 8)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, sequence_order = EXCLUDED.sequence_order;

-- 4. Seed Traversal & Pointer Manipulation problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001050', 'a0a00000-0000-0000-0000-000000001001', 203, 'Remove Linked List Elements', 'https://leetcode.com/problems/remove-linked-list-elements/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Basic deletion'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001001' AND leetcode_number = 203);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001051', 'a0a00000-0000-0000-0000-000000001001', 237, 'Delete Node in a Linked List', 'https://leetcode.com/problems/delete-node-in-a-linked-list/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Pointer modification'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001001' AND leetcode_number = 237);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001052', 'a0a00000-0000-0000-0000-000000001001', 83, 'Remove Duplicates from Sorted List', 'https://leetcode.com/problems/remove-duplicates-from-sorted-list/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Traversal + pointer modification'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001001' AND leetcode_number = 83);


-- 5. Seed Dummy / Sentinel Node problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001053', 'a0a00000-0000-0000-0000-000000001002', 203, 'Remove Linked List Elements', 'https://leetcode.com/problems/remove-linked-list-elements/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Apply dummy node'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001002' AND leetcode_number = 203);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001054', 'a0a00000-0000-0000-0000-000000001002', 19, 'Remove Nth Node From End of List', 'https://leetcode.com/problems/remove-nth-node-from-end-of-list/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Dummy + two pointers'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001002' AND leetcode_number = 19);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001055', 'a0a00000-0000-0000-0000-000000001002', 21, 'Merge Two Sorted Lists', 'https://leetcode.com/problems/merge-two-sorted-lists/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Dummy + merge'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001002' AND leetcode_number = 21);


-- 6. Seed Reverse Linked List problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001056', 'a0a00000-0000-0000-0000-000000001003', 206, 'Reverse Linked List', 'https://leetcode.com/problems/reverse-linked-list/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Reverse traversal foundation'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001003' AND leetcode_number = 206);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001057', 'a0a00000-0000-0000-0000-000000001003', 92, 'Reverse Linked List II', 'https://leetcode.com/problems/reverse-linked-list-ii/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Reverse dynamic subsegment'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001003' AND leetcode_number = 92);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001058', 'a0a00000-0000-0000-0000-000000001003', 25, 'Reverse Nodes in k-Group', 'https://leetcode.com/problems/reverse-nodes-in-k-group/', 'HARD', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Advanced dynamic segment swaps'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001003' AND leetcode_number = 25);


-- 7. Seed Fast & Slow Pointer problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001059', 'a0a00000-0000-0000-0000-000000001004', 876, 'Middle of the Linked List', 'https://leetcode.com/problems/middle-of-the-linked-list/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Learn pattern'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001004' AND leetcode_number = 876);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001060', 'a0a00000-0000-0000-0000-000000001004', 141, 'Linked List Cycle', 'https://leetcode.com/problems/linked-list-cycle/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Floyd''s algorithm'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001004' AND leetcode_number = 141);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001061', 'a0a00000-0000-0000-0000-000000001004', 142, 'Linked List Cycle II', 'https://leetcode.com/problems/linked-list-cycle-ii/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Find cycle entrance'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001004' AND leetcode_number = 142);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001062', 'a0a00000-0000-0000-0000-000000001004', 234, 'Palindrome Linked List', 'https://leetcode.com/problems/palindrome-linked-list/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Fast/Slow + Reverse'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001004' AND leetcode_number = 234);


-- 8. Seed Two Pointers with a Gap problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001063', 'a0a00000-0000-0000-0000-000000001005', 19, 'Remove Nth Node From End of List', 'https://leetcode.com/problems/remove-nth-node-from-end-of-list/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, '⭐ Core'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001005' AND leetcode_number = 19);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001064', 'a0a00000-0000-0000-0000-000000001005', 1721, 'Swapping Nodes in a Linked List', 'https://leetcode.com/problems/swapping-nodes-in-a-linked-list/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Variation'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001005' AND leetcode_number = 1721);


-- 9. Seed Merge / Compare Linked Lists problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001065', 'a0a00000-0000-0000-0000-000000001006', 21, 'Merge Two Sorted Lists', 'https://leetcode.com/problems/merge-two-sorted-lists/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, '⭐ MUST'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001006' AND leetcode_number = 21);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001066', 'a0a00000-0000-0000-0000-000000001006', 2, 'Add Two Numbers', 'https://leetcode.com/problems/add-two-numbers/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Two-list traversal + carry'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001006' AND leetcode_number = 2);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001067', 'a0a00000-0000-0000-0000-000000001006', 23, 'Merge k Sorted Lists', 'https://leetcode.com/problems/merge-k-sorted-lists/', 'HARD', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Advanced'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001006' AND leetcode_number = 23);


-- 10. Seed Cycle & Intersection problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001068', 'a0a00000-0000-0000-0000-000000001007', 141, 'Linked List Cycle', 'https://leetcode.com/problems/linked-list-cycle/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Cycle detection'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001007' AND leetcode_number = 141);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001069', 'a0a00000-0000-0000-0000-000000001007', 142, 'Linked List Cycle II', 'https://leetcode.com/problems/linked-list-cycle-ii/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Cycle entrance'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001007' AND leetcode_number = 142);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001070', 'a0a00000-0000-0000-0000-000000001007', 160, 'Intersection of Two Linked Lists', 'https://leetcode.com/problems/intersection-of-two-linked-lists/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Pointer alignment'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001007' AND leetcode_number = 160);


-- 11. Seed Pattern Combination problems idempotently
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001071', 'a0a00000-0000-0000-0000-000000001008', 234, 'Palindrome Linked List', 'https://leetcode.com/problems/palindrome-linked-list/', 'EASY', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Fast/Slow + Reverse'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001008' AND leetcode_number = 234);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001072', 'a0a00000-0000-0000-0000-000000001008', 143, 'Reorder List', 'https://leetcode.com/problems/reorder-list/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Fast/Slow + Reverse + Merge'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001008' AND leetcode_number = 143);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001073', 'a0a00000-0000-0000-0000-000000001008', 138, 'Copy List with Random Pointer', 'https://leetcode.com/problems/copy-list-with-random-pointer/', 'MEDIUM', 'NOT_STARTED', '2026-08-09', NULL, 0, TRUE, 'Hashing + Pointer manipulation'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001008' AND leetcode_number = 138);


-- 12. Seed details for all seeded problems
INSERT INTO problem_details (problem_id, intuition, approach, code_snippet, complexity_analysis, what_i_learned)
SELECT id, 'Study linked list node structures.', 'Coordinate pointers carefully.', '// Code snippet', 'N/A', 'Practice makes perfect'
FROM problems 
WHERE id IN (
    'c0000000-0000-0000-0000-000000001050', 'c0000000-0000-0000-0000-000000001051',
    'c0000000-0000-0000-0000-000000001052', 'c0000000-0000-0000-0000-000000001053',
    'c0000000-0000-0000-0000-000000001054', 'c0000000-0000-0000-0000-000000001055',
    'c0000000-0000-0000-0000-000000001056', 'c0000000-0000-0000-0000-000000001057',
    'c0000000-0000-0000-0000-000000001058', 'c0000000-0000-0000-0000-000000001059',
    'c0000000-0000-0000-0000-000000001060', 'c0000000-0000-0000-0000-000000001061',
    'c0000000-0000-0000-0000-000000001062', 'c0000000-0000-0000-0000-000000001063',
    'c0000000-0000-0000-0000-000000001064', 'c0000000-0000-0000-0000-000000001065',
    'c0000000-0000-0000-0000-000000001066', 'c0000000-0000-0000-0000-000000001067',
    'c0000000-0000-0000-0000-000000001068', 'c0000000-0000-0000-0000-000000001069',
    'c0000000-0000-0000-0000-000000001070', 'c0000000-0000-0000-0000-000000001071',
    'c0000000-0000-0000-0000-000000001072', 'c0000000-0000-0000-0000-000000001073'
)
ON CONFLICT (problem_id) DO NOTHING;
