-- V39: Restructure and seed Binary Search Tree phase (Phase 14)

-- 1. Rename the Phase 14 topic in phases table
UPDATE phases SET topic = 'Binary Search Tree (BST)' WHERE id = 'b0a00000-0000-0000-0000-000000000013';

-- 2. Register the 12 BST subtopic patterns
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000001301', 'b0a00000-0000-0000-0000-000000000013', 'BST Basics & Search', 'Searching for a value or checking values in a Binary Search Tree.', 'Search for a value in a BST.', 'BST property → eliminate half of the tree', 'Recursive or iterative binary split comparison.', 'O(log N)', 'O(log N)', 'Failing to handle null nodes.', 'NOT_STARTED', 1),
('a0a00000-0000-0000-0000-000000001302', 'b0a00000-0000-0000-0000-000000000013', 'BST Insertion', 'Inserting a node into the BST while maintaining BST properties.', 'Insert a value while maintaining BST property.', 'BST Search + modification', 'Traverse to null spot and insert new leaf node.', 'O(log N)', 'O(log N)', 'Forgetting to link the new node to parent.', 'NOT_STARTED', 2),
('a0a00000-0000-0000-0000-000000001303', 'b0a00000-0000-0000-0000-000000000013', 'BST Validation', 'Validating whether a binary tree meets BST properties.', 'Is this a valid BST?', 'Range / Bounds', 'Track valid min/max ranges for subtrees.', 'O(N)', 'O(log N)', 'Failing to track upper and lower limits globally.', 'NOT_STARTED', 3),
('a0a00000-0000-0000-0000-000000001304', 'b0a00000-0000-0000-0000-000000000013', 'Inorder Traversal → Sorted Order', 'Using inorder traversal to process BST elements in sorted order.', 'Find kth smallest / predecessor / successor / check sorted order.', 'BST → Inorder traversal', 'Perform standard inorder traversal (L-Node-R).', 'O(N)', 'O(log N)', 'Storing entire traversal instead of using iteration.', 'NOT_STARTED', 4),
('a0a00000-0000-0000-0000-000000001305', 'b0a00000-0000-0000-0000-000000000013', 'BST Min / Max', 'Locating extreme left (min) or extreme right (max) values.', 'Find minimum/maximum in BST.', 'Extreme left / extreme right', 'Traverse left pointers for min, right for max.', 'O(log N)', 'O(1)', 'Failing to handle empty tree.', 'NOT_STARTED', 5),
('a0a00000-0000-0000-0000-000000001306', 'b0a00000-0000-0000-0000-000000000013', 'Lowest Common Ancestor in BST', 'Finding the Lowest Common Ancestor (LCA) using BST node ordering.', 'Find LCA in a BST.', 'BST ordering + LCA', 'Find split point where target nodes go left and right.', 'O(log N)', 'O(log N)', 'Treating it as a general binary tree without using BST properties.', 'NOT_STARTED', 6),
('a0a00000-0000-0000-0000-000000001307', 'b0a00000-0000-0000-0000-000000000013', 'Range / Pruning', 'Executing range queries and pruning invalid subtrees.', 'Only certain values/ranges matter.', 'BST property → prune unnecessary subtree', 'Prune subtrees where root value is outside bounds.', 'O(N)', 'O(log N)', 'Visiting all tree nodes instead of pruning.', 'NOT_STARTED', 7),
('a0a00000-0000-0000-0000-000000001308', 'b0a00000-0000-0000-0000-000000000013', 'BST Transformation', 'Modifying the BST structure or converting it to another representation.', 'Convert BST to another structure recursively.', 'BST -> recursive transformation -> maintain required ordering/property', 'Perform recursive in-place node modifications.', 'O(N)', 'O(log N)', 'Creating new nodes instead of updating references.', 'NOT_STARTED', 8),
('a0a00000-0000-0000-0000-000000001309', 'b0a00000-0000-0000-0000-000000000013', 'BST Construction', 'Constructing a BST from raw array inputs.', 'Construct a BST from sorted input or traversals.', 'Build BST recursively from sorted ranges or orders', 'Select midpoint as root and build subtrees recursively.', 'O(N)', 'O(log N)', 'Constructing an unbalanced BST.', 'NOT_STARTED', 9),
('a0a00000-0000-0000-0000-000000001310', 'b0a00000-0000-0000-0000-000000000013', 'BST Successor / Predecessor', 'Locating inorder successor or predecessor of a key.', 'Next larger / previous smaller value in BST.', 'BST ordering + inorder relationship', 'Compare keys and search left or right recursively.', 'O(log N)', 'O(log N)', 'Failing to handle node with two children.', 'NOT_STARTED', 10),
('a0a00000-0000-0000-0000-000000001311', 'b0a00000-0000-0000-0000-000000000013', 'BST Deletion', 'Removing a node from BST while maintaining BST properties.', 'Delete a node while preserving BST property.', 'BST search + structural modification + successor/predecessor', 'Swap node with successor/predecessor and delete leaf.', 'O(log N)', 'O(log N)', 'Failing to reconnect child pointers.', 'NOT_STARTED', 11),
('a0a00000-0000-0000-0000-000000001312', 'b0a00000-0000-0000-0000-000000000013', 'Advanced BST — Optional', 'Tackling complex, harder BST variants and structures.', 'Complex queries or balancing operations.', 'Perform structural balancing or multiple tree merge operations.', 'Build balanced representations or combine multiple BST elements.', 'O(N)', 'O(log N)', 'Neglecting edge case trees.', 'NOT_STARTED', 12)
ON CONFLICT (id) DO UPDATE SET 
    name = EXCLUDED.name, 
    description = EXCLUDED.description, 
    recognition_clues = EXCLUDED.recognition_clues, 
    intuition = EXCLUDED.intuition, 
    sequence_order = EXCLUDED.sequence_order;

-- 3. Move existing BST problems strictly by ID
UPDATE problems SET pattern_id = 'a0a00000-0000-0000-0000-000000001311', name = 'Delete Node in a BST', purpose = 'Delete node and adjust subtree structure using predecessor/successor' WHERE id = 'c0000000-0000-0000-0000-000000001303';
UPDATE problems SET pattern_id = 'a0a00000-0000-0000-0000-000000001303', name = 'Validate Binary Search Tree', purpose = 'Verify BST validity using recursive range bounds' WHERE id = 'c0000000-0000-0000-0000-000000001304';
UPDATE problems SET pattern_id = 'a0a00000-0000-0000-0000-000000001304', name = 'Kth Smallest Element in a BST', purpose = 'Retrieve kth smallest node using inorder traversal properties' WHERE id = 'c0000000-0000-0000-0000-000000001305';

-- 4. Seed all curated BST practice problems
-- Pattern 1: BST Basics & Search
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001301', 'a0a00000-0000-0000-0000-000000001301', 700, 'Search in a Binary Search Tree', 'https://leetcode.com/problems/search-in-a-binary-search-tree/', 'EASY', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Standard BST search to locate a node by key value'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001301' AND leetcode_number = 700);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001321', 'a0a00000-0000-0000-0000-000000001301', 938, 'Range Sum of BST', 'https://leetcode.com/problems/range-sum-of-bst/', 'EASY', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Sum values in range utilizing BST boundary pruning'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001301' AND leetcode_number = 938);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001322', 'a0a00000-0000-0000-0000-000000001301', 530, 'Minimum Absolute Difference in BST', 'https://leetcode.com/problems/minimum-absolute-difference-in-bst/', 'EASY', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Find minimum absolute difference between any two nodes'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001301' AND leetcode_number = 530);

-- Pattern 2: BST Insertion
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001302', 'a0a00000-0000-0000-0000-000000001302', 701, 'Insert into a Binary Search Tree', 'https://leetcode.com/problems/insert-into-a-binary-search-tree/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Find the insert location and attach the new node'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001302' AND leetcode_number = 701);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001323', 'a0a00000-0000-0000-0000-000000001302', 708, 'Insert into a Sorted Loop List', 'https://leetcode.com/problems/insert-into-a-sorted-circular-linked-list/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Insert element into correct relative sorted position in circular list'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001302' AND leetcode_number = 708);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001324', 'a0a00000-0000-0000-0000-000000001302', 1483, 'Kth Ancestor of a Tree Node', 'https://leetcode.com/problems/kth-ancestor-of-a-tree-node/', 'HARD', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Binary lifting structure insertion variant'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001302' AND leetcode_number = 1483);

-- Pattern 3: BST Validation
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001304', 'a0a00000-0000-0000-0000-000000001303', 98, 'Validate Binary Search Tree', 'https://leetcode.com/problems/validate-binary-search-tree/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Verify BST validity using recursive range bounds'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001303' AND leetcode_number = 98);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001325', 'a0a00000-0000-0000-0000-000000001303', 99, 'Recover Binary Search Tree', 'https://leetcode.com/problems/recover-binary-search-tree/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Correct two swapped nodes by tracking inorder violations'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001303' AND leetcode_number = 99);

-- Pattern 4: Inorder Traversal → Sorted Order
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001305', 'a0a00000-0000-0000-0000-000000001304', 230, 'Kth Smallest Element in a BST', 'https://leetcode.com/problems/kth-smallest-element-in-a-bst/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Retrieve kth smallest node using inorder traversal properties'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001304' AND leetcode_number = 230);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001326', 'a0a00000-0000-0000-0000-000000001304', 530, 'Minimum Absolute Difference in BST', 'https://leetcode.com/problems/minimum-absolute-difference-in-bst/', 'EASY', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Check adjacent elements in sorted order traversal'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001304' AND leetcode_number = 530);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001327', 'a0a00000-0000-0000-0000-000000001304', 108, 'Convert Sorted Array to Binary Search Tree', 'https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/', 'EASY', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Split array at middle element to build balanced BST'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001304' AND leetcode_number = 108);

-- Pattern 5: BST Min / Max
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001328', 'a0a00000-0000-0000-0000-000000001305', 700, 'Search in a Binary Search Tree', 'https://leetcode.com/problems/search-in-a-binary-search-tree/', 'EASY', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Retrieve minimum/maximum element via extreme paths'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001305' AND leetcode_number = 700);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001329', 'a0a00000-0000-0000-0000-000000001305', 230, 'Kth Smallest Element in a BST', 'https://leetcode.com/problems/kth-smallest-element-in-a-bst/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Minimum element tracking'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001305' AND leetcode_number = 230);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001330', 'a0a00000-0000-0000-0000-000000001305', 235, 'Lowest Common Ancestor of a Binary Search Tree', 'https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/', 'EASY', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'LCA using min/max values of nodes'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001305' AND leetcode_number = 235);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001331', 'a0a00000-0000-0000-0000-000000001305', 285, 'Inorder Successor in BST', 'https://leetcode.com/problems/inorder-successor-in-bst/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Successor check using min/max properties'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001305' AND leetcode_number = 285);

-- Pattern 6: Lowest Common Ancestor in BST
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001306', 'a0a00000-0000-0000-0000-000000001306', 235, 'Lowest Common Ancestor of a Binary Search Tree', 'https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/', 'EASY', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Locate LCA using node value comparisons and BST split points'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001306' AND leetcode_number = 235);

-- Pattern 7: Range / Pruning
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001332', 'a0a00000-0000-0000-0000-000000001307', 938, 'Range Sum of BST', 'https://leetcode.com/problems/range-sum-of-bst/', 'EASY', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Sum nodes within bounds while skipping out-of-range subtrees'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001307' AND leetcode_number = 938);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001333', 'a0a00000-0000-0000-0000-000000001307', 669, 'Trim a Binary Search Tree', 'https://leetcode.com/problems/trim-a-binary-search-tree/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Reconstruct BST keeping only nodes within range'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001307' AND leetcode_number = 669);

-- Pattern 8: BST Transformation
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001334', 'a0a00000-0000-0000-0000-000000001308', 108, 'Convert Sorted Array to Binary Search Tree', 'https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/', 'EASY', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Transform sorted array to BST structure recursively'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001308' AND leetcode_number = 108);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001335', 'a0a00000-0000-0000-0000-000000001308', 897, 'Increasing Order Search Tree', 'https://leetcode.com/problems/increasing-order-search-tree/', 'EASY', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Rearrange BST into a single-right-leaning chain'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001308' AND leetcode_number = 897);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001336', 'a0a00000-0000-0000-0000-000000001308', 669, 'Trim a Binary Search Tree', 'https://leetcode.com/problems/trim-a-binary-search-tree/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Prune BST while preserving BST structure'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001308' AND leetcode_number = 669);

-- Pattern 9: BST Construction
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001337', 'a0a00000-0000-0000-0000-000000001309', 108, 'Convert Sorted Array to Binary Search Tree', 'https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/', 'EASY', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Construct balanced BST from sorted array ranges'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001309' AND leetcode_number = 108);

-- Pattern 10: BST Successor / Predecessor
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001338', 'a0a00000-0000-0000-0000-000000001310', 285, 'Inorder Successor in BST', 'https://leetcode.com/problems/inorder-successor-in-bst/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Find successor by traversing down to left child of right subtree'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001310' AND leetcode_number = 285);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001339', 'a0a00000-0000-0000-0000-000000001310', 450, 'Delete Node in a BST', 'https://leetcode.com/problems/delete-node-in-a-bst/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Locate target and swap with successor/predecessor before deletion'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001310' AND leetcode_number = 450);

-- Pattern 11: BST Deletion
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001303', 'a0a00000-0000-0000-0000-000000001311', 450, 'Delete Node in a BST', 'https://leetcode.com/problems/delete-node-in-a-bst/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Delete node and adjust subtree structure using predecessor/successor'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001311' AND leetcode_number = 450);

-- Pattern 12: Advanced BST — Optional
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001340', 'a0a00000-0000-0000-0000-000000001312', 1382, 'Balance a Binary Search Tree', 'https://leetcode.com/problems/balance-a-binary-search-tree/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Convert arbitrary BST to a balanced BST via inorder list'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001312' AND leetcode_number = 1382);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001341', 'a0a00000-0000-0000-0000-000000001312', 1305, 'All Elements in Two Binary Search Trees', 'https://leetcode.com/problems/all-elements-in-two-binary-search-trees/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Retrieve all elements from two BSTs in sorted order'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001312' AND leetcode_number = 1305);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001342', 'a0a00000-0000-0000-0000-000000001312', 449, 'Serialize and Deserialize BST', 'https://leetcode.com/problems/serialize-and-deserialize-bst/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Compact BST serialization using preorder properties'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001312' AND leetcode_number = 449);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001343', 'a0a00000-0000-0000-0000-000000001312', 99, 'Recover Binary Search Tree', 'https://leetcode.com/problems/recover-binary-search-tree/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Locate and swap misplaced elements in-place'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001312' AND leetcode_number = 99);
