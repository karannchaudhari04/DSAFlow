-- V35: Update Trees patterns and seed practice problems idempotently

-- 1. Ensure all Trees subtopic patterns exist
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000001201', 'b0a00000-0000-0000-0000-000000000012', 'Tree Basics + Recursive DFS', 'Basic tree node definitions and standard recursive Preorder/Inorder/Postorder traversals.', 'Standard recursive tree traversal', 'Visit node, traverse left and right subtrees recursively.', 'Depth-first search using recursion stack.', 'O(N)', 'O(H)', 'Forgetting base case for null nodes.', 'NOT_STARTED', 1),
('a0a00000-0000-0000-0000-000000001202', 'b0a00000-0000-0000-0000-000000000012', 'Tree Traversal Pattern', 'Specialized orderings such as zigzag, vertical, or boundary scans.', 'Custom printing or traversal patterns', 'Track coordinates or use layered queues.', 'Coordinate-based mapping or multi-pass boundary scans.', 'O(N log N) or O(N)', 'O(N)', 'Incorrect boundary conditions.', 'NOT_STARTED', 2),
('a0a00000-0000-0000-0000-000000001203', 'b0a00000-0000-0000-0000-000000000012', 'Level Order / BFS', 'Level-by-level traversal using queues.', 'Level order output or average of levels', 'Process nodes layer by layer using a FIFO queue.', 'Queue-based loop tracking level sizes.', 'O(N)', 'O(W)', 'Not tracking queue size per level.', 'NOT_STARTED', 3),
('a0a00000-0000-0000-0000-000000001204', 'b0a00000-0000-0000-0000-000000000012', 'Height / Depth of Tree', 'Computing tree heights and balanced properties.', 'Maximum depth, minimum depth, or balance check', 'Compute left and right depths recursively.', 'Compare left/right sub-depths at each node.', 'O(N)', 'O(H)', 'Failing to return height immediately on unbalanced state.', 'NOT_STARTED', 4),
('a0a00000-0000-0000-0000-000000001205', 'b0a00000-0000-0000-0000-000000000012', 'Tree Comparison / Structural Properties', 'Comparing two trees for identical structures or mirror symmetries.', 'Same tree, symmetric tree, or subtree match', 'Compare left of one with right of another recursively.', 'Recursive structural identity checks.', 'O(N)', 'O(H)', 'Incorrect boolean logic combinations.', 'NOT_STARTED', 5),
('a0a00000-0000-0000-0000-000000001206', 'b0a00000-0000-0000-0000-000000000012', 'Invert / Transform Tree', 'Modifying or flattening tree structures in-place.', 'Invert tree, merge trees, or flatten tree', 'Swap left and right children recursively.', 'In-place node swap manipulations.', 'O(N)', 'O(H)', 'Losing children references during swaps.', 'NOT_STARTED', 6),
('a0a00000-0000-0000-0000-000000001207', 'b0a00000-0000-0000-0000-000000000012', 'Root-to-Leaf Path', 'Evaluating sum or digit values along root-to-leaf paths.', 'Path sum matching or numbers construction', 'Accumulate path sum recursively down to leaf nodes.', 'Backtracking helper functions.', 'O(N)', 'O(H)', 'Failing to check if a node is truly a leaf.', 'NOT_STARTED', 7),
('a0a00000-0000-0000-0000-000000001208', 'b0a00000-0000-0000-0000-000000000012', 'Tree Diameter / Global Answer', 'Finding max paths or distances across nodes.', 'Diameter or maximum path sum', 'Compute max left and right lengths, updating global max.', 'Global tracker recursion pattern.', 'O(N)', 'O(H)', 'Returning diameter instead of height in helper.', 'NOT_STARTED', 8),
('a0a00000-0000-0000-0000-000000001209', 'b0a00000-0000-0000-0000-000000000012', 'Lowest Common Ancestor', 'Finding closest mutual parent node of two targets.', 'LCA in binary tree or BST', 'Scan left and right subtrees, if targets found on both sides, current is LCA.', 'Search and return found node recursions.', 'O(N)', 'O(H)', 'Assuming targets always exist in tree.', 'NOT_STARTED', 9),
('a0a00000-0000-0000-0000-000000001210', 'b0a00000-0000-0000-0000-000000000012', 'Tree Construction', 'Rebuilding trees from preorder/inorder or inorder/postorder lists.', 'Reconstruct tree from traversals', 'Use preorder/postorder to locate root, inorder to slice boundaries.', 'Divide and conquer recursion with boundary pointers.', 'O(N)', 'O(N)', 'Incorrect boundary slices.', 'NOT_STARTED', 10),
('a0a00000-0000-0000-0000-000000001211', 'b0a00000-0000-0000-0000-000000000012', 'Serialization / Deserialization', 'Converting trees to/from strings.', 'Serialize and deserialize binary tree', 'Use preorder string representation with null placeholders.', 'String parser reconstruction.', 'O(N)', 'O(N)', 'Failing to handle empty/null tree roots.', 'NOT_STARTED', 11)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, sequence_order = EXCLUDED.sequence_order;

-- 2. Move existing problems from the general 1201/1202/1204-1210 patterns to their correct specialized subtopics
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

-- 3. Update details of relocated problems to match Trees phase specifications
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

-- 4. Seed Tree Basics + Recursive DFS problems
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001220', 'a0a00000-0000-0000-0000-000000001201', 144, 'Binary Tree Preorder Traversal — iterative', 'https://leetcode.com/problems/binary-tree-preorder-traversal/', 'EASY', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Stack-based traversal'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001201' AND name = 'Binary Tree Preorder Traversal — iterative');

-- 5. Seed Tree Traversal Pattern problems
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001221', 'a0a00000-0000-0000-0000-000000001202', 103, 'Binary Tree Zigzag Level Order Traversal', 'https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'BFS with direction flags'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001202' AND leetcode_number = 103);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001222', 'a0a00000-0000-0000-0000-000000001202', 987, 'Vertical Order Traversal of a Binary Tree', 'https://leetcode.com/problems/vertical-order-traversal-of-a-binary-tree/', 'HARD', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Coordinate-based traversal'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001202' AND leetcode_number = 987);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001223', 'a0a00000-0000-0000-0000-000000001202', 91201, 'Boundary Traversal of Binary Tree', 'https://www.geeksforgeeks.org/problems/boundary-traversal-of-binary-tree/1', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Left boundary + leaves + right boundary'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001202' AND leetcode_number = 91201);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001224', 'a0a00000-0000-0000-0000-000000001202', 91202, 'Diagonal Traversal of Binary Tree', 'https://www.geeksforgeeks.org/problems/diagonal-traversal-of-binary-tree/1', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Diagonal logic traversal'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001202' AND leetcode_number = 91202);

-- 6. Seed Level Order / BFS problems
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001225', 'a0a00000-0000-0000-0000-000000001203', 637, 'Average of Levels in Binary Tree', 'https://leetcode.com/problems/average-of-levels-in-binary-tree/', 'EASY', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'BFS + level processing'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001203' AND leetcode_number = 637);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001226', 'a0a00000-0000-0000-0000-000000001203', 111, 'Minimum Depth of Binary Tree', 'https://leetcode.com/problems/minimum-depth-of-binary-tree/', 'EASY', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'BFS/DFS'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001203' AND leetcode_number = 111);

-- 7. Seed Height / Depth of Tree problems
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001227', 'a0a00000-0000-0000-0000-000000001204', 111, 'Minimum Depth of Binary Tree', 'https://leetcode.com/problems/minimum-depth-of-binary-tree/', 'EASY', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Depth variation'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001204' AND leetcode_number = 111);

-- 8. Seed Tree Comparison / Structural Properties problems
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001228', 'a0a00000-0000-0000-0000-000000001205', 101, 'Symmetric Tree', 'https://leetcode.com/problems/symmetric-tree/', 'EASY', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Recursive comparison'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001205' AND leetcode_number = 101);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001229', 'a0a00000-0000-0000-0000-000000001205', 572, 'Subtree of Another Tree', 'https://leetcode.com/problems/subtree-of-another-tree/', 'EASY', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Tree comparison'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001205' AND leetcode_number = 572);

-- 9. Seed Invert / Transform Tree problems
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001240', 'a0a00000-0000-0000-0000-000000001206', 226, 'Invert Binary Tree', 'https://leetcode.com/problems/invert-binary-tree/', 'EASY', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, '⭐ Core transformation'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001206' AND leetcode_number = 226);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001230', 'a0a00000-0000-0000-0000-000000001206', 617, 'Merge Two Binary Trees', 'https://leetcode.com/problems/merge-two-binary-trees/', 'EASY', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Merge structures recursively'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001206' AND leetcode_number = 617);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001231', 'a0a00000-0000-0000-0000-000000001206', 114, 'Flatten Binary Tree to Linked List', 'https://leetcode.com/problems/flatten-binary-tree-to-linked-list/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'In-place pre-order flat mapping'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001206' AND leetcode_number = 114);

-- 10. Seed Root-to-Leaf Path problems
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001232', 'a0a00000-0000-0000-0000-000000001207', 113, 'Path Sum II', 'https://leetcode.com/problems/path-sum-ii/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Path tracking'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001207' AND leetcode_number = 113);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001233', 'a0a00000-0000-0000-0000-000000001207', 129, 'Sum Root to Leaf Numbers', 'https://leetcode.com/problems/sum-root-to-leaf-numbers/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Path state'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001207' AND leetcode_number = 129);

-- 11. Seed Tree Diameter / Global Answer problems
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001234', 'a0a00000-0000-0000-0000-000000001208', 124, 'Binary Tree Maximum Path Sum', 'https://leetcode.com/problems/binary-tree-maximum-path-sum/', 'HARD', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Advanced version'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001208' AND leetcode_number = 124);

-- 12. Seed Lowest Common Ancestor problems
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001241', 'a0a00000-0000-0000-0000-000000001209', 236, 'Lowest Common Ancestor of a Binary Tree', 'https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, '⭐ Core'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001209' AND leetcode_number = 236);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001235', 'a0a00000-0000-0000-0000-000000001209', 235, 'Lowest Common Ancestor of a Binary Search Tree', 'https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/', 'EASY', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'BST connection'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001209' AND leetcode_number = 235);

-- 13. Seed Tree Construction problems
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001236', 'a0a00000-0000-0000-0000-000000001210', 105, 'Construct Binary Tree from Preorder and Inorder Traversal', 'https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, '⭐ Important'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001210' AND leetcode_number = 105);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001237', 'a0a00000-0000-0000-0000-000000001210', 106, 'Construct Binary Tree from Inorder and Postorder Traversal', 'https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Variation'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001210' AND leetcode_number = 106);

-- 14. Seed Serialization / Deserialization problems
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001238', 'a0a00000-0000-0000-0000-000000001211', 297, 'Serialize and Deserialize Binary Tree', 'https://leetcode.com/problems/serialize-and-deserialize-binary-tree/', 'HARD', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Advanced'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001211' AND leetcode_number = 297);
