-- 1. Truncate existing relational tables to clear old schemas
TRUNCATE TABLE revisions CASCADE;
TRUNCATE TABLE mistakes CASCADE;
TRUNCATE TABLE problem_details CASCADE;
TRUNCATE TABLE problems CASCADE;
TRUNCATE TABLE patterns CASCADE;
TRUNCATE TABLE phases CASCADE;

-- 2. Seed all 19 Phases (Phase 0 to Phase 18)
INSERT INTO phases (id, phase_number, topic, priority, status, sequence_order) VALUES
('b0a00000-0000-0000-0000-000000000000', 0, 'Java Foundations', 'TIER_1_MASTER', 'COMPLETED', 0),
('b0a00000-0000-0000-0000-000000000001', 1, 'DSA Foundations', 'TIER_1_MASTER', 'COMPLETED', 1),
('b0a00000-0000-0000-0000-000000000002', 2, 'Arrays', 'TIER_1_MASTER', 'IN_PROGRESS', 2),
('b0a00000-0000-0000-0000-000000000003', 3, 'Strings', 'TIER_1_MASTER', 'NOT_STARTED', 3),
('b0a00000-0000-0000-0000-000000000004', 4, 'Searching & Sorting', 'TIER_1_MASTER', 'NOT_STARTED', 4),
('b0a00000-0000-0000-0000-000000000005', 5, 'Hashing', 'TIER_1_MASTER', 'NOT_STARTED', 5),
('b0a00000-0000-0000-0000-000000000006', 6, 'Two Pointers', 'TIER_1_MASTER', 'NOT_STARTED', 6),
('b0a00000-0000-0000-0000-000000000007', 7, 'Sliding Window', 'TIER_1_MASTER', 'NOT_STARTED', 7),
('b0a00000-0000-0000-0000-000000000008', 8, 'Stack', 'TIER_1_MASTER', 'NOT_STARTED', 8),
('b0a00000-0000-0000-0000-000000000009', 9, 'Queue', 'TIER_1_MASTER', 'NOT_STARTED', 9),
('b0a00000-0000-0000-0000-000000000010', 10, 'Linked List', 'TIER_1_MASTER', 'NOT_STARTED', 10),
('b0a00000-0000-0000-0000-000000000011', 11, 'Divide & Conquer', 'TIER_2_STRONG', 'NOT_STARTED', 11),
('b0a00000-0000-0000-0000-000000000012', 12, 'Trees', 'TIER_2_STRONG', 'NOT_STARTED', 12),
('b0a00000-0000-0000-0000-000000000013', 13, 'BST', 'TIER_2_STRONG', 'NOT_STARTED', 13),
('b0a00000-0000-0000-0000-000000000014', 14, 'Heap / Priority Queue', 'TIER_2_STRONG', 'NOT_STARTED', 14),
('b0a00000-0000-0000-0000-000000000015', 15, 'Backtracking', 'TIER_2_STRONG', 'NOT_STARTED', 15),
('b0a00000-0000-0000-0000-000000000016', 16, 'Graphs', 'TIER_3_FUNDAMENTALS', 'NOT_STARTED', 16),
('b0a00000-0000-0000-0000-000000000017', 17, 'Dynamic Programming', 'TIER_3_FUNDAMENTALS', 'NOT_STARTED', 17),
('b0a00000-0000-0000-0000-000000000018', 18, 'Advanced DSA', 'TIER_4_ADVANCED', 'NOT_STARTED', 18);

-- 3. Seed all subtopics (Patterns) mapping to the PDF tree nodes
INSERT INTO patterns (id, phase_id, name, sequence_order, description, time_complexity, space_complexity, intuition, generic_approach, recognition_clues, common_mistakes, mastery_status) VALUES
-- Default Imported Pattern
('a0a00000-0000-0000-0000-000000000000', 'b0a00000-0000-0000-0000-000000000001', 'Imported from LeetCode', 0, 'General solved problems imported directly from your LeetCode profile.', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'LEARNING'),
-- Phase 0 — Java Foundations Problems & Drills
('c0000000-0000-0000-0000-000000000001', 'a0a00000-0000-0000-0000-000000000001', 7, 'Reverse Integer', 'https://leetcode.com/problems/reverse-integer/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000002', 'a0a00000-0000-0000-0000-000000000001', 9, 'Palindrome Number', 'https://leetcode.com/problems/palindrome-number/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000003', 'a0a00000-0000-0000-0000-000000000001', 136, 'Single Number', 'https://leetcode.com/problems/single-number/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000004', 'a0a00000-0000-0000-0000-000000000002', 10001, 'Bank Account System (Encapsulation Drill)', 'https://github.com/topics/java-oop', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000005', 'a0a00000-0000-0000-0000-000000000002', 10002, 'Shape Area Calculator (Polymorphism & Interface Drill)', 'https://github.com/topics/java-oop', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000006', 'a0a00000-0000-0000-0000-000000000003', 10003, 'Static Counter & Memory Allocation Drill', 'https://github.com/topics/java-memory-model', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000007', 'a0a00000-0000-0000-0000-000000000004', 387, 'First Unique Character in a String', 'https://leetcode.com/problems/first-unique-character-in-a-string/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000008', 'a0a00000-0000-0000-0000-000000000004', 242, 'Valid Anagram', 'https://leetcode.com/problems/valid-anagram/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000009', 'a0a00000-0000-0000-0000-000000000005', 10004, 'Build Custom DynamicArray Class from Scratch', 'https://github.com/topics/java-arrays', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000010', 'a0a00000-0000-0000-0000-000000000006', 1389, 'Create Target Array in the Given Order', 'https://leetcode.com/problems/create-target-array-in-the-given-order/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000011', 'a0a00000-0000-0000-0000-000000000007', 1, 'Two Sum', 'https://leetcode.com/problems/two-sum/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000012', 'a0a00000-0000-0000-0000-000000000007', 217, 'Contains Duplicate', 'https://leetcode.com/problems/contains-duplicate/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000013', 'a0a00000-0000-0000-0000-000000000008', 1046, 'Last Stone Weight', 'https://leetcode.com/problems/last-stone-weight/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000014', 'a0a00000-0000-0000-0000-000000000008', 10005, 'Student Object Comparator Ranking Drill', 'https://github.com/topics/java-sorting', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000015', 'a0a00000-0000-0000-0000-000000000009', 10006, 'Custom Exception & Generic Box Wrapper Drill', 'https://github.com/topics/java-generics', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
-- Phase 1 — Time Complexity
('c0000000-0000-0000-0000-000000000101', 'a0a00000-0000-0000-0000-000000000101', 704, 'Binary Search', 'https://leetcode.com/problems/binary-search/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
-- Phase 1 — Space Complexity
('c0000000-0000-0000-0000-000000000102', 'a0a00000-0000-0000-0000-000000000102', 278, 'First Bad Version', 'https://leetcode.com/problems/first-bad-version/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
-- Phase 1 — Recursion Basics
('c0000000-0000-0000-0000-000000000103', 'a0a00000-0000-0000-0000-000000000103', 509, 'Fibonacci Number', 'https://leetcode.com/problems/fibonacci-number/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),

-- Phase 2 — Arrays (Traversal) -> 5 problems
('c0000000-0000-0000-0000-000000000201', 'a0a00000-0000-0000-0000-000000000201', 485, 'Max Consecutive Ones', 'https://leetcode.com/problems/max-consecutive-ones/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000202', 'a0a00000-0000-0000-0000-000000000201', 1295, 'Find Numbers with Even Number of Digits', 'https://leetcode.com/problems/find-numbers-with-even-number-of-digits/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000203', 'a0a00000-0000-0000-0000-000000000201', 1299, 'Replace Elements with Greatest Element on Right Side', 'https://leetcode.com/problems/replace-elements-with-greatest-element-on-right-side/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000204', 'a0a00000-0000-0000-0000-000000000201', 1470, 'Shuffle the Array', 'https://leetcode.com/problems/shuffle-the-array/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000205', 'a0a00000-0000-0000-0000-000000000201', 1313, 'Decompress Run-Length Encoded List', 'https://leetcode.com/problems/decompress-run-length-encoded-list/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),

-- Phase 2 — Arrays (Counting) -> 5 problems
('c0000000-0000-0000-0000-000000000211', 'a0a00000-0000-0000-0000-000000000202', 1365, 'How Many Numbers Are Smaller Than the Current Number', 'https://leetcode.com/problems/how-many-numbers-are-smaller-than-the-current-number/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000212', 'a0a00000-0000-0000-0000-000000000202', 1512, 'Number of Good Pairs', 'https://leetcode.com/problems/number-of-good-pairs/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000213', 'a0a00000-0000-0000-0000-000000000202', 1221, 'Split a String in Balanced Strings', 'https://leetcode.com/problems/split-a-string-in-balanced-strings/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000214', 'a0a00000-0000-0000-0000-000000000202', 1672, 'Richest Customer Wealth', 'https://leetcode.com/problems/richest-customer-wealth/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000215', 'a0a00000-0000-0000-0000-000000000202', 1431, 'Kids With the Greatest Number of Candies', 'https://leetcode.com/problems/kids-with-the-greatest-number-of-candies/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),

-- Phase 2 — Arrays (Running Sum) -> 5 problems
('c0000000-0000-0000-0000-000000000221', 'a0a00000-0000-0000-0000-000000000203', 1480, 'Running Sum of 1d Array', 'https://leetcode.com/problems/running-sum-of-1d-array/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000222', 'a0a00000-0000-0000-0000-000000000203', 724, 'Find Pivot Index', 'https://leetcode.com/problems/find-pivot-index/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000223', 'a0a00000-0000-0000-0000-000000000203', 1991, 'Find the Middle Index in Array', 'https://leetcode.com/problems/find-the-middle-index-in-array/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000224', 'a0a00000-0000-0000-0000-000000000203', 1588, 'Sum of All Odd Length Subarrays', 'https://leetcode.com/problems/sum-of-all-odd-length-subarrays/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000225', 'a0a00000-0000-0000-0000-000000000203', 2574, 'Left and Right Sum Differences', 'https://leetcode.com/problems/left-and-right-sum-differences/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),

-- Phase 2 — Arrays (Running Min/Max) -> 5 problems
('c0000000-0000-0000-0000-000000000231', 'a0a00000-0000-0000-0000-000000000204', 121, 'Best Time to Buy and Sell Stock', 'https://leetcode.com/problems/best-time-to-buy-and-sell-stock/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000232', 'a0a00000-0000-0000-0000-000000000204', 2011, 'Final Value of Variable After Performing Operations', 'https://leetcode.com/problems/final-value-of-variable-after-performing-operations/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000233', 'a0a00000-0000-0000-0000-000000000204', 1464, 'Maximum Product of Two Elements in an Array', 'https://leetcode.com/problems/maximum-product-of-two-elements-in-an-array/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000234', 'a0a00000-0000-0000-0000-000000000204', 1002, 'Find Common Characters', 'https://leetcode.com/problems/find-common-characters/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000235', 'a0a00000-0000-0000-0000-000000000204', 228, 'Summary Ranges', 'https://leetcode.com/problems/summary-ranges/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),

-- Phase 2 — Arrays (Prefix Sum) -> 5 problems
('c0000000-0000-0000-0000-000000000241', 'a0a00000-0000-0000-0000-000000000205', 303, 'Range Sum Query - Immutable', 'https://leetcode.com/problems/range-sum-query-immutable/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000242', 'a0a00000-0000-0000-0000-000000000205', 560, 'Subarray Sum Equals K', 'https://leetcode.com/problems/subarray-sum-equals-k/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000243', 'a0a00000-0000-0000-0000-000000000205', 238, 'Product of Array Except Self', 'https://leetcode.com/problems/product-of-array-except-self/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000244', 'a0a00000-0000-0000-0000-000000000205', 974, 'Subarray Sums Divisible by K', 'https://leetcode.com/problems/subarray-sums-divisible-by-k/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000245', 'a0a00000-0000-0000-0000-000000000205', 525, 'Contiguous Array', 'https://leetcode.com/problems/contiguous-array/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),

-- Phase 2 — Arrays (In-place Modification) -> 5 problems
('c0000000-0000-0000-0000-000000000251', 'a0a00000-0000-0000-0000-000000000206', 27, 'Remove Element', 'https://leetcode.com/problems/remove-element/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000252', 'a0a00000-0000-0000-0000-000000000206', 26, 'Remove Duplicates from Sorted Array', 'https://leetcode.com/problems/remove-duplicates-from-sorted-array/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000253', 'a0a00000-0000-0000-0000-000000000206', 80, 'Remove Duplicates from Sorted Array II', 'https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000254', 'a0a00000-0000-0000-0000-000000000206', 283, 'Move Zeroes', 'https://leetcode.com/problems/move-zeroes/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000255', 'a0a00000-0000-0000-0000-000000000206', 905, 'Sort Array By Parity', 'https://leetcode.com/problems/sort-array-by-parity/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),

-- Phase 2 — Arrays (Matrix) -> 5 problems
('c0000000-0000-0000-0000-000000000261', 'a0a00000-0000-0000-0000-000000000207', 1572, 'Matrix Diagonal Sum', 'https://leetcode.com/problems/matrix-diagonal-sum/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000262', 'a0a00000-0000-0000-0000-000000000207', 867, 'Transpose Matrix', 'https://leetcode.com/problems/transpose-matrix/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000263', 'a0a00000-0000-0000-0000-000000000207', 54, 'Spiral Matrix', 'https://leetcode.com/problems/spiral-matrix/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000264', 'a0a00000-0000-0000-0000-000000000207', 48, 'Rotate Image', 'https://leetcode.com/problems/rotate-image/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000265', 'a0a00000-0000-0000-0000-000000000207', 59, 'Spiral Matrix II', 'https://leetcode.com/problems/spiral-matrix-ii/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),

-- Phase 2 — Arrays (Basic Array Techniques) -> 5 problems
('c0000000-0000-0000-0000-000000000271', 'a0a00000-0000-0000-0000-000000000208', 189, 'Rotate Array', 'https://leetcode.com/problems/rotate-array/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000272', 'a0a00000-0000-0000-0000-000000000208', 977, 'Squares of a Sorted Array', 'https://leetcode.com/problems/squares-of-a-sorted-array/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000273', 'a0a00000-0000-0000-0000-000000000208', 169, 'Majority Element', 'https://leetcode.com/problems/majority-element/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000274', 'a0a00000-0000-0000-0000-000000000208', 217, 'Contains Duplicate', 'https://leetcode.com/problems/contains-duplicate/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000275', 'a0a00000-0000-0000-0000-000000000208', 219, 'Contains Duplicate II', 'https://leetcode.com/problems/contains-duplicate-ii/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),

-- Phase 3 — Strings
('c0000000-0000-0000-0000-000000000301', 'a0a00000-0000-0000-0000-000000000301', 387, 'First Unique Character in a String', 'https://leetcode.com/problems/first-unique-character-in-a-string/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000302', 'a0a00000-0000-0000-0000-000000000302', 383, 'Ransom Note', 'https://leetcode.com/problems/ransom-note/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000303', 'a0a00000-0000-0000-0000-000000000303', 125, 'Valid Palindrome', 'https://leetcode.com/problems/valid-palindrome/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000304', 'a0a00000-0000-0000-0000-000000000304', 1662, 'Check If Two String Arrays are Equivalent', 'https://leetcode.com/problems/check-if-two-string-arrays-are-equivalent/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000305', 'a0a00000-0000-0000-0000-000000000305', 242, 'Valid Anagram', 'https://leetcode.com/problems/valid-anagram/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000306', 'a0a00000-0000-0000-0000-000000000306', 14, 'Longest Common Prefix', 'https://leetcode.com/problems/longest-common-prefix/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),

-- Phase 4 — Searching & Sorting
('c0000000-0000-0000-0000-000000000401', 'a0a00000-0000-0000-0000-000000000401', 704, 'Binary Search', 'https://leetcode.com/problems/binary-search/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000402', 'a0a00000-0000-0000-0000-000000000402', 35, 'Search Insert Position', 'https://leetcode.com/problems/search-insert-position/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000403', 'a0a00000-0000-0000-0000-000000000403', 34, 'Find First and Last Position of Element in Sorted Array', 'https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000404', 'a0a00000-0000-0000-0000-000000000404', 35, 'Search Insert Position (Lower Bound)', 'https://leetcode.com/problems/search-insert-position/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000405', 'a0a00000-0000-0000-0000-000000000405', 35, 'Search Insert Position (Upper Bound)', 'https://leetcode.com/problems/search-insert-position/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000406', 'a0a00000-0000-0000-0000-000000000406', 278, 'First Bad Version', 'https://leetcode.com/problems/first-bad-version/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000407', 'a0a00000-0000-0000-0000-000000000407', 912, 'Bubble Sort Array', 'https://leetcode.com/problems/sort-an-array/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000408', 'a0a00000-0000-0000-0000-000000000408', 912, 'Selection Sort Array', 'https://leetcode.com/problems/sort-an-array/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000409', 'a0a00000-0000-0000-0000-000000000409', 912, 'Insertion Sort Array', 'https://leetcode.com/problems/sort-an-array/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000410', 'a0a00000-0000-0000-0000-000000000410', 912, 'Merge Sort Array', 'https://leetcode.com/problems/sort-an-array/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000411', 'a0a00000-0000-0000-0000-000000000411', 912, 'Quick Sort Array', 'https://leetcode.com/problems/sort-an-array/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000412', 'a0a00000-0000-0000-0000-000000000412', 215, 'Heap Sort Array (Kth Largest)', 'https://leetcode.com/problems/kth-largest-element-in-an-array/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000413', 'a0a00000-0000-0000-0000-000000000413', 1122, 'Relative Sort Array', 'https://leetcode.com/problems/relative-sort-array/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),

-- Phase 5 — Hashing
('c0000000-0000-0000-0000-000000000501', 'a0a00000-0000-0000-0000-000000000501', 1, 'Two Sum (HashMap)', 'https://leetcode.com/problems/two-sum/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000502', 'a0a00000-0000-0000-0000-000000000502', 217, 'Contains Duplicate (HashSet)', 'https://leetcode.com/problems/contains-duplicate/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000503', 'a0a00000-0000-0000-0000-000000000503', 387, 'First Unique Character in a String (Frequency)', 'https://leetcode.com/problems/first-unique-character-in-a-string/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000504', 'a0a00000-0000-0000-0000-000000000504', 219, 'Contains Duplicate II (Duplicates)', 'https://leetcode.com/problems/contains-duplicate-ii/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000505', 'a0a00000-0000-0000-0000-000000000505', 128, 'Longest Consecutive Sequence', 'https://leetcode.com/problems/longest-consecutive-sequence/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),

-- Phase 6 — Two Pointers
('c0000000-0000-0000-0000-000000000601', 'a0a00000-0000-0000-0000-000000000601', 167, 'Two Sum II - Input Array Is Sorted', 'https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000602', 'a0a00000-0000-0000-0000-000000000602', 26, 'Remove Duplicates from Sorted Array (Same Direction)', 'https://leetcode.com/problems/remove-duplicates-from-sorted-array/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000603', 'a0a00000-0000-0000-0000-000000000603', 141, 'Linked List Cycle', 'https://leetcode.com/problems/linked-list-cycle/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),

-- Phase 7 — Sliding Window
('c0000000-0000-0000-0000-000000000701', 'a0a00000-0000-0000-0000-000000000701', 643, 'Maximum Average Subarray I', 'https://leetcode.com/problems/maximum-average-subarray-i/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000702', 'a0a00000-0000-0000-0000-000000000702', 3, 'Longest Substring Without Repeating Characters', 'https://leetcode.com/problems/longest-substring-without-repeating-characters/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),

-- Phase 8 — Stack
('c0000000-0000-0000-0000-000000000801', 'a0a00000-0000-0000-0000-000000000801', 155, 'Min Stack', 'https://leetcode.com/problems/min-stack/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000802', 'a0a00000-0000-0000-0000-000000000802', 20, 'Valid Parentheses', 'https://leetcode.com/problems/valid-parentheses/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000803', 'a0a00000-0000-0000-0000-000000000803', 739, 'Daily Temperatures', 'https://leetcode.com/problems/daily-temperatures/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000804', 'a0a00000-0000-0000-0000-000000000804', 496, 'Next Greater Element I', 'https://leetcode.com/problems/next-greater-element-i/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),

-- Phase 9 — Queue
('c0000000-0000-0000-0000-000000000901', 'a0a00000-0000-0000-0000-000000000901', 232, 'Implement Queue using Stacks', 'https://leetcode.com/problems/implement-queue-using-stacks/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000902', 'a0a00000-0000-0000-0000-000000000902', 641, 'Design Circular Deque', 'https://leetcode.com/problems/design-circular-deque/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000903', 'a0a00000-0000-0000-0000-000000000903', 622, 'Design Circular Queue', 'https://leetcode.com/problems/design-circular-queue/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000000904', 'a0a00000-0000-0000-0000-000000000904', 102, 'Binary Tree Level Order Traversal (BFS)', 'https://leetcode.com/problems/binary-tree-level-order-traversal/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),

-- Phase 10 — Linked List
('c0000000-0000-0000-0000-000000001001', 'a0a00000-0000-0000-0000-000000001001', 876, 'Middle of the Linked List', 'https://leetcode.com/problems/middle-of-the-linked-list/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001002', 'a0a00000-0000-0000-0000-000000001002', 237, 'Delete Node in a Linked List', 'https://leetcode.com/problems/delete-node-in-a-linked-list/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001003', 'a0a00000-0000-0000-0000-000000001003', 206, 'Reverse Linked List', 'https://leetcode.com/problems/reverse-linked-list/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001004', 'a0a00000-0000-0000-0000-000000001004', 19, 'Remove Nth Node From End of List', 'https://leetcode.com/problems/remove-nth-node-from-end-of-list/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001005', 'a0a00000-0000-0000-0000-000000001005', 141, 'Linked List Cycle Detection', 'https://leetcode.com/problems/linked-list-cycle/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001006', 'a0a00000-0000-0000-0000-000000001006', 21, 'Merge Two Sorted Lists', 'https://leetcode.com/problems/merge-two-sorted-lists/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001007', 'a0a00000-0000-0000-0000-000000001007', 160, 'Intersection of Two Linked Lists', 'https://leetcode.com/problems/intersection-of-two-linked-lists/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),

-- Phase 11 — Divide & Conquer
('c0000000-0000-0000-0000-000000001101', 'a0a00000-0000-0000-0000-000000001101', 169, 'Majority Element (D&C)', 'https://leetcode.com/problems/majority-element/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001102', 'a0a00000-0000-0000-0000-000000001102', 704, 'Binary Search (D&C)', 'https://leetcode.com/problems/binary-search/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001103', 'a0a00000-0000-0000-0000-000000001103', 912, 'Merge Sort Array (D&C)', 'https://leetcode.com/problems/sort-an-array/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001104', 'a0a00000-0000-0000-0000-000000001104', 912, 'Quick Sort Array (D&C)', 'https://leetcode.com/problems/sort-an-array/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),

-- Phase 12 — Trees
('c0000000-0000-0000-0000-000000001201', 'a0a00000-0000-0000-0000-000000001201', 100, 'Same Tree', 'https://leetcode.com/problems/same-tree/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001202', 'a0a00000-0000-0000-0000-000000001202', 104, 'Maximum Depth of Binary Tree (DFS)', 'https://leetcode.com/problems/maximum-depth-of-binary-tree/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001203', 'a0a00000-0000-0000-0000-000000001203', 102, 'Binary Tree Level Order Traversal (BFS Tree)', 'https://leetcode.com/problems/binary-tree-level-order-traversal/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001204', 'a0a00000-0000-0000-0000-000000001204', 144, 'Binary Tree Preorder Traversal', 'https://leetcode.com/problems/binary-tree-preorder-traversal/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001205', 'a0a00000-0000-0000-0000-000000001205', 94, 'Binary Tree Inorder Traversal', 'https://leetcode.com/problems/binary-tree-inorder-traversal/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001206', 'a0a00000-0000-0000-0000-000000001206', 145, 'Binary Tree Postorder Traversal', 'https://leetcode.com/problems/binary-tree-postorder-traversal/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001207', 'a0a00000-0000-0000-0000-000000001207', 107, 'Binary Tree Level Order Traversal II', 'https://leetcode.com/problems/binary-tree-level-order-traversal-ii/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001208', 'a0a00000-0000-0000-0000-000000001208', 110, 'Balanced Binary Tree', 'https://leetcode.com/problems/balanced-binary-tree/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001209', 'a0a00000-0000-0000-0000-000000001209', 543, 'Diameter of Binary Tree', 'https://leetcode.com/problems/diameter-of-binary-tree/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001210', 'a0a00000-0000-0000-0000-000000001210', 112, 'Path Sum (Paths)', 'https://leetcode.com/problems/path-sum/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),

-- Phase 13 — BST
('c0000000-0000-0000-0000-000000001301', 'a0a00000-0000-0000-0000-000000001301', 700, 'Search in a Binary Search Tree', 'https://leetcode.com/problems/search-in-a-binary-search-tree/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001302', 'a0a00000-0000-0000-0000-000000001302', 701, 'Insert into a Binary Search Tree', 'https://leetcode.com/problems/insert-into-a-binary-search-tree/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001303', 'a0a00000-0000-0000-0000-000000001303', 450, 'Delete Node in a BST', 'https://leetcode.com/problems/delete-node-in-a-bst/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001304', 'a0a00000-0000-0000-0000-000000001304', 98, 'Validate Binary Search Tree (BST)', 'https://leetcode.com/problems/validate-binary-search-tree/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001305', 'a0a00000-0000-0000-0000-000000001305', 230, 'Kth Smallest Element in a BST', 'https://leetcode.com/problems/kth-smallest-element-in-a-bst/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001306', 'a0a00000-0000-0000-0000-000000001306', 235, 'Lowest Common Ancestor of a Binary Search Tree', 'https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),

-- Phase 14 — Heaps
('c0000000-0000-0000-0000-000000001401', 'a0a00000-0000-0000-0000-000000001401', 703, 'Kth Largest Element in a Stream', 'https://leetcode.com/problems/kth-largest-element-in-a-stream/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001402', 'a0a00000-0000-0000-0000-000000001402', 1046, 'Last Stone Weight (Max Heap)', 'https://leetcode.com/problems/last-stone-weight/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001403', 'a0a00000-0000-0000-0000-000000001403', 215, 'Kth Largest Element in an Array (Heap)', 'https://leetcode.com/problems/kth-largest-element-in-an-array/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001404', 'a0a00000-0000-0000-0000-000000001404', 347, 'Top K Frequent Elements', 'https://leetcode.com/problems/top-k-frequent-elements/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001405', 'a0a00000-0000-0000-0000-000000001405', 23, 'Merge k Sorted Lists', 'https://leetcode.com/problems/merge-k-sorted-lists/', 'HARD', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),

-- Phase 15 — Backtracking
('c0000000-0000-0000-0000-000000001501', 'a0a00000-0000-0000-0000-000000001501', 17, 'Letter Combinations of a Phone Number', 'https://leetcode.com/problems/letter-combinations-of-a-phone-number/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001502', 'a0a00000-0000-0000-0000-000000001502', 78, 'Subsets', 'https://leetcode.com/problems/subsets/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001503', 'a0a00000-0000-0000-0000-000000001503', 46, 'Permutations', 'https://leetcode.com/problems/permutations/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001504', 'a0a00000-0000-0000-0000-000000001504', 39, 'Combination Sum', 'https://leetcode.com/problems/combination-sum/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001505', 'a0a00000-0000-0000-0000-000000001505', 51, 'N-Queens', 'https://leetcode.com/problems/n-queens/', 'HARD', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),

-- Phase 16 — Graphs
('c0000000-0000-0000-0000-000000001601', 'a0a00000-0000-0000-0000-000000001601', 997, 'Find the Town Judge', 'https://leetcode.com/problems/find-the-town-judge/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001602', 'a0a00000-0000-0000-0000-000000001602', 102, 'Binary Tree Level Order Traversal (BFS Graph)', 'https://leetcode.com/problems/binary-tree-level-order-traversal/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001603', 'a0a00000-0000-0000-0000-000000001603', 200, 'Number of Islands (DFS)', 'https://leetcode.com/problems/number-of-islands/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001604', 'a0a00000-0000-0000-0000-000000001604', 323, 'Number of Connected Components in an Undirected Graph', 'https://leetcode.com/problems/number-of-connected-components-in-an-undirected-graph/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001605', 'a0a00000-0000-0000-0000-000000001605', 207, 'Course Schedule', 'https://leetcode.com/problems/course-schedule/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001606', 'a0a00000-0000-0000-0000-000000001606', 210, 'Course Schedule II', 'https://leetcode.com/problems/course-schedule-ii/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001607', 'a0a00000-0000-0000-0000-000000001607', 743, 'Network Delay Time', 'https://leetcode.com/problems/network-delay-time/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),

-- Phase 17 — DP
('c0000000-0000-0000-0000-000000001701', 'a0a00000-0000-0000-0000-000000001701', 509, 'Fibonacci Number (Memoization)', 'https://leetcode.com/problems/fibonacci-number/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001702', 'a0a00000-0000-0000-0000-000000001702', 70, 'Climbing Stairs', 'https://leetcode.com/problems/climbing-stairs/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001703', 'a0a00000-0000-0000-0000-000000001703', 198, 'House Robber', 'https://leetcode.com/problems/house-robber/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001704', 'a0a00000-0000-0000-0000-000000001704', 62, 'Unique Paths', 'https://leetcode.com/problems/unique-paths/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001705', 'a0a00000-0000-0000-0000-000000001705', 416, 'Partition Equal Subset Sum', 'https://leetcode.com/problems/partition-equal-subset-sum/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001706', 'a0a00000-0000-0000-0000-000000001706', 300, 'Longest Increasing Subsequence', 'https://leetcode.com/problems/longest-increasing-subsequence/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001707', 'a0a00000-0000-0000-0000-000000001707', 1143, 'Longest Common Subsequence', 'https://leetcode.com/problems/longest-common-subsequence/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),

-- Phase 18 — Advanced DSA
('c0000000-0000-0000-0000-000000001801', 'a0a00000-0000-0000-0000-000000001801', 208, 'Implement Trie (Prefix Tree)', 'https://leetcode.com/problems/implement-trie-prefix-tree/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001802', 'a0a00000-0000-0000-0000-000000001802', 547, 'Number of Provinces', 'https://leetcode.com/problems/number-of-provinces/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001803', 'a0a00000-0000-0000-0000-000000001803', 191, 'Number of 1 Bits', 'https://leetcode.com/problems/number-of-1-bits/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001804', 'a0a00000-0000-0000-0000-000000001804', 307, 'Range Sum Query - Mutable', 'https://leetcode.com/problems/range-sum-query-mutable/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001805', 'a0a00000-0000-0000-0000-000000001805', 307, 'Range Sum Query - Mutable (Fenwick)', 'https://leetcode.com/problems/range-sum-query-mutable/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001806', 'a0a00000-0000-0000-0000-000000001806', 28, 'Find the Index of the First Occurrence in a String', 'https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE),
('c0000000-0000-0000-0000-000000001807', 'a0a00000-0000-0000-0000-000000001807', 124, 'Binary Tree Maximum Path Sum', 'https://leetcode.com/problems/binary-tree-maximum-path-sum/', 'HARD', 'NOT_STARTED', '2026-08-08', NULL, 0, TRUE)
ON CONFLICT (leetcode_number) DO NOTHING;

-- 5. Seed detailed descriptions templates en-masse using dynamic subqueries
INSERT INTO problem_details (problem_id, intuition, approach, code_snippet, complexity_analysis, what_i_learned)
SELECT id, 'Simple vertical traversal or logic implementation.', 'Follow constraints and test edge cases.', 'class Solution {\n    public int example() {\n        return 0;\n    }\n}', 'Time: O(N), Space: O(1)', 'Basic syntax' FROM problems ON CONFLICT (problem_id) DO NOTHING;
