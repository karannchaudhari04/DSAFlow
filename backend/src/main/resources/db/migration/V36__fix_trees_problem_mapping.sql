-- V36: Correctly map and seed all Trees phase problems to their specialized patterns

-- 1. Relocate existing problems to their correct specialized subtopics under Trees matching strictly on leetcode_number
UPDATE problems SET pattern_id = 'a0a00000-0000-0000-0000-000000001201' WHERE leetcode_number = 144 AND name = 'Binary Tree Preorder Traversal';
UPDATE problems SET pattern_id = 'a0a00000-0000-0000-0000-000000001201' WHERE leetcode_number = 94;
UPDATE problems SET pattern_id = 'a0a00000-0000-0000-0000-000000001201' WHERE leetcode_number = 145;

UPDATE problems SET pattern_id = 'a0a00000-0000-0000-0000-000000001203' WHERE leetcode_number = 102;
UPDATE problems SET pattern_id = 'a0a00000-0000-0000-0000-000000001203' WHERE leetcode_number = 107;

UPDATE problems SET pattern_id = 'a0a00000-0000-0000-0000-000000001204' WHERE leetcode_number = 104;
UPDATE problems SET pattern_id = 'a0a00000-0000-0000-0000-000000001204' WHERE leetcode_number = 110;

UPDATE problems SET pattern_id = 'a0a00000-0000-0000-0000-000000001205' WHERE leetcode_number = 100;

UPDATE problems SET pattern_id = 'a0a00000-0000-0000-0000-000000001207' WHERE leetcode_number = 112;

UPDATE problems SET pattern_id = 'a0a00000-0000-0000-0000-000000001208' WHERE leetcode_number = 543;

-- 2. Update names and purposes to match the Trees phase specifications
UPDATE problems SET name = 'Binary Tree Preorder Traversal', purpose = 'DFS foundation' WHERE leetcode_number = 144 AND name = 'Binary Tree Preorder Traversal';
UPDATE problems SET name = 'Binary Tree Inorder Traversal', purpose = 'DFS foundation' WHERE leetcode_number = 94;
UPDATE problems SET name = 'Binary Tree Postorder Traversal', purpose = 'DFS foundation' WHERE leetcode_number = 145;

UPDATE problems SET name = 'Binary Tree Level Order Traversal', purpose = '⭐ Core' WHERE leetcode_number = 102;
UPDATE problems SET name = 'Binary Tree Level Order Traversal II', purpose = 'Reverse levels' WHERE leetcode_number = 107;

UPDATE problems SET name = 'Maximum Depth of Binary Tree', purpose = '⭐ Must solve' WHERE leetcode_number = 104;
UPDATE problems SET name = 'Balanced Binary Tree', purpose = 'Height + condition' WHERE leetcode_number = 110;

UPDATE problems SET name = 'Same Tree', purpose = '⭐ Basic recursion' WHERE leetcode_number = 100;

UPDATE problems SET name = 'Path Sum', purpose = '⭐ Core' WHERE leetcode_number = 112;

UPDATE problems SET name = 'Diameter of Binary Tree', purpose = '⭐ Must solve' WHERE leetcode_number = 543;

-- 3. Ensure LeetCode 226 and 236 exist under their correct patterns
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001240', 'a0a00000-0000-0000-0000-000000001206', 226, 'Invert Binary Tree', 'https://leetcode.com/problems/invert-binary-tree/', 'EASY', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, '⭐ Core transformation'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE leetcode_number = 226);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001241', 'a0a00000-0000-0000-0000-000000001209', 236, 'Lowest Common Ancestor of a Binary Tree', 'https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, '⭐ Core'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE leetcode_number = 236);
