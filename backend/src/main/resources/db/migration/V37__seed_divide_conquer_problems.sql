-- V37: Restructure and seed Divide & Conquer phase (Phase 12 in sequence)

-- 1. Ensure the 10 D&C subtopic patterns exist
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000001101', 'b0a00000-0000-0000-0000-000000000011', 'Understand the Core D&C Pattern', 'Verifying the applicability of dividing a problem, solving parts independently, and combining results.', 'Core divide and conquer applicability check', 'Confirm subproblems can be combined cleanly.', 'Identify division boundary and combine logic.', 'O(N)', 'O(log N)', 'Failing to define a clear combine step.', 'NOT_STARTED', 1),
('a0a00000-0000-0000-0000-000000001102', 'b0a00000-0000-0000-0000-000000000011', 'Recursive Array Division', 'Splitting an array into smaller sub-arrays and applying recursive algorithms on each subset.', 'Array split in half recursively', 'Divide array index range down to base cases.', 'Process ranges using recursive pointers.', 'O(N)', 'O(log N)', 'Off-by-one index calculation.', 'NOT_STARTED', 2),
('a0a00000-0000-0000-0000-000000001103', 'b0a00000-0000-0000-0000-000000000011', 'Recursion + Divide & Conquer Basics', 'Introductory D&C methods using basic recursion and mathematical range reductions.', 'Basic range binary splits', 'Halve search space or decrease operations exponentially.', 'Use recursive helper functions to divide inputs.', 'O(log N)', 'O(log N)', 'Missing recursive base cases.', 'NOT_STARTED', 3),
('a0a00000-0000-0000-0000-000000001104', 'b0a00000-0000-0000-0000-000000000011', 'Merge Sort (D&C)', 'Dividing the array into halves, sorting each half, and merging the sorted parts.', 'Stable array sorting by merging', 'Divide range in half, sort recursively, and merge two sorted halves.', 'Standard two-pointer merge operation.', 'O(N log N)', 'O(N)', 'Merging in-place inefficiently.', 'NOT_STARTED', 4),
('a0a00000-0000-0000-0000-000000001105', 'b0a00000-0000-0000-0000-000000000011', 'Quick Sort / Partition', 'Selecting a pivot element and partitioning the array around it recursively.', 'Unstable sorting via pivot splits', 'Partition elements relative to a chosen pivot, then sort subsets.', 'Lomuto or Hoare partitioning.', 'O(N log N) avg', 'O(log N)', 'Worst-case quadratic complexity from poor pivot choices.', 'NOT_STARTED', 5),
('a0a00000-0000-0000-0000-000000001106', 'b0a00000-0000-0000-0000-000000000011', 'Quickselect / Kth Element', 'Finding the kth element in an unsorted list using partition operations.', 'Find kth largest or smallest element', 'Avoid full sort by only recursing into the partition containing index k.', 'Partition and binary search ranges.', 'O(N) avg', 'O(1)', 'Worst-case O(N^2) complexity with bad pivot choices.', 'NOT_STARTED', 6),
('a0a00000-0000-0000-0000-000000001107', 'b0a00000-0000-0000-0000-000000000011', 'Maximum Subarray — Divide & Conquer', 'Computing the maximum subarray sum using divide and conquer.', 'Max sum subarray D&C version', 'Check left half, right half, and the crossing subarray.', 'Calculate crossing prefix/suffix sums and combine.', 'O(N log N)', 'O(log N)', 'Neglecting crossing array checks.', 'NOT_STARTED', 7),
('a0a00000-0000-0000-0000-000000001108', 'b0a00000-0000-0000-0000-000000000011', 'Divide & Conquer + Counting', 'Counting pairs or inversions during the merge step of merge sort.', 'Counts or pairs using sort steps', 'Count comparisons during sorting to avoid nested loops.', 'Extend merge step to count and record active pairs.', 'O(N log N)', 'O(N)', 'Failing to count pairs correctly during merge shifts.', 'NOT_STARTED', 8),
('a0a00000-0000-0000-0000-000000001109', 'b0a00000-0000-0000-0000-000000000011', 'Divide & Conquer on Linked List', 'Sorting or merging linked lists using divide and conquer algorithms.', 'LinkedList sorting or merging', 'Split list using fast/slow pointers, recurse, then merge.', 'Midpoint list splitting and merging.', 'O(N log N)', 'O(log N)', 'Infinite loop from incorrect list splits.', 'NOT_STARTED', 9),
('a0a00000-0000-0000-0000-000000001110', 'b0a00000-0000-0000-0000-000000000011', 'Divide & Conquer + Binary Search', 'Executing binary search variations to locate targets or bounds.', 'Rotated sorted arrays or peak points', 'Halve range using index comparisons.', 'Use binary search splits to search ranges.', 'O(log N)', 'O(1)', 'Handling boundary conditions incorrectly.', 'NOT_STARTED', 10)
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, sequence_order = EXCLUDED.sequence_order;

-- 2. Update existing D&C problems seeded under the old general layout (matching strictly by ID)
UPDATE problems SET pattern_id = 'a0a00000-0000-0000-0000-000000001101', name = 'Majority Element', purpose = 'Find majority element by dividing and merging' WHERE id = 'c0000000-0000-0000-0000-000000001101';
UPDATE problems SET pattern_id = 'a0a00000-0000-0000-0000-000000001103', name = 'Binary Search', purpose = 'Reduce search space by half recursively' WHERE id = 'c0000000-0000-0000-0000-000000001102';
UPDATE problems SET pattern_id = 'a0a00000-0000-0000-0000-000000001104', name = 'Sort an Array', purpose = '⭐ Merge Sort implementation' WHERE id = 'c0000000-0000-0000-0000-000000001103';
UPDATE problems SET pattern_id = 'a0a00000-0000-0000-0000-000000001105', name = 'Sort an Array', purpose = 'Quick Sort partition implementation alternative' WHERE id = 'c0000000-0000-0000-0000-000000001104';

-- 3. Seed remaining curated D&C practice problems
-- Pattern 1: Understand the Core D&C Pattern
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001121', 'a0a00000-0000-0000-0000-000000001101', 241, 'Different Ways to Add Parentheses', 'https://leetcode.com/problems/different-ways-to-add-parentheses/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Evaluate expressions by recursively dividing around operators'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001101' AND leetcode_number = 241);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001122', 'a0a00000-0000-0000-0000-000000001101', 95, 'Unique Binary Search Trees II', 'https://leetcode.com/problems/unique-binary-search-trees-ii/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Construct trees by recursively dividing range of values'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001101' AND leetcode_number = 95);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001123', 'a0a00000-0000-0000-0000-000000001101', 312, 'Burst Balloons', 'https://leetcode.com/problems/burst-balloons/', 'HARD', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Advanced range division with boundary constraints'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001101' AND leetcode_number = 312);

-- Pattern 2: Recursive Array Division
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001124', 'a0a00000-0000-0000-0000-000000001102', 108, 'Convert Sorted Array to Binary Search Tree', 'https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/', 'EASY', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Recursively divide sorted range at middle to build a balanced BST'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001102' AND leetcode_number = 108);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001125', 'a0a00000-0000-0000-0000-000000001102', 654, 'Maximum Binary Tree', 'https://leetcode.com/problems/maximum-binary-tree/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Recursively split array around maximum element to construct tree'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001102' AND leetcode_number = 654);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001126', 'a0a00000-0000-0000-0000-000000001102', 1763, 'Longest Nice Substring', 'https://leetcode.com/problems/longest-nice-substring/', 'EASY', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Divide and search substrings around characters violating the nice property'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001102' AND leetcode_number = 1763);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001127', 'a0a00000-0000-0000-0000-000000001102', 427, 'Construct Quad Tree', 'https://leetcode.com/problems/construct-quad-tree/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Recursively partition 2D grid into four quadrants'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001102' AND leetcode_number = 427);

-- Pattern 3: Recursion + Divide & Conquer Basics
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001128', 'a0a00000-0000-0000-0000-000000001103', 50, 'Pow(x, n)', 'https://leetcode.com/problems/powx-n/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Halve operations using binary exponentiation logic'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001103' AND leetcode_number = 50);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001129', 'a0a00000-0000-0000-0000-000000001103', 74, 'Search a 2D Matrix', 'https://leetcode.com/problems/search-a-2d-matrix/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Reduce 2D range space systematically'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001103' AND leetcode_number = 74);

-- Pattern 4: Merge Sort
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001130', 'a0a00000-0000-0000-0000-000000001104', 88, 'Merge Sorted Array', 'https://leetcode.com/problems/merge-sorted-array/', 'EASY', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Understand two-pointer merge operation'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001104' AND leetcode_number = 88);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001131', 'a0a00000-0000-0000-0000-000000001104', 21, 'Merge Two Sorted Lists', 'https://leetcode.com/problems/merge-two-sorted-lists/', 'EASY', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Revisit two-pointer merge sorting logic'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001104' AND leetcode_number = 21);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001132', 'a0a00000-0000-0000-0000-000000001104', 148, 'Sort List', 'https://leetcode.com/problems/sort-list/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Perform merge sort on linked list'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001104' AND leetcode_number = 148);

-- Pattern 5: Quick Sort / Partition
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001133', 'a0a00000-0000-0000-0000-000000001105', 215, 'Kth Largest Element in an Array', 'https://leetcode.com/problems/kth-largest-element-in-an-array/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Select kth element using partition / Quickselect'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001105' AND leetcode_number = 215);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001134', 'a0a00000-0000-0000-0000-000000001105', 378, 'Kth Smallest Element in a Sorted Matrix', 'https://leetcode.com/problems/kth-smallest-element-in-a-sorted-matrix/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Matrix partition search logic'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001105' AND leetcode_number = 378);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001135', 'a0a00000-0000-0000-0000-000000001105', 75, 'Sort Colors', 'https://leetcode.com/problems/sort-colors/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Three-way partitioning (Dutch National Flag) implementation'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001105' AND leetcode_number = 75);

-- Pattern 6: Quickselect / Kth Element
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001136', 'a0a00000-0000-0000-0000-000000001106', 215, 'Kth Largest Element in an Array', 'https://leetcode.com/problems/kth-largest-element-in-an-array/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Quickselect selection algorithm'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001106' AND leetcode_number = 215);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001137', 'a0a00000-0000-0000-0000-000000001106', 378, 'Kth Smallest Element in a Sorted Matrix', 'https://leetcode.com/problems/kth-smallest-element-in-a-sorted-matrix/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Partition-based kth element search'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001106' AND leetcode_number = 378);

-- Pattern 7: Maximum Subarray — Divide & Conquer
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001138', 'a0a00000-0000-0000-0000-000000001107', 53, 'Maximum Subarray', 'https://leetcode.com/problems/maximum-subarray/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Compute max crossing subarray sum'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001107' AND leetcode_number = 53);

-- Pattern 8: Divide & Conquer + Counting
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001139', 'a0a00000-0000-0000-0000-000000001108', 315, 'Count of Smaller Numbers After Self', 'https://leetcode.com/problems/count-of-smaller-numbers-after-self/', 'HARD', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Count smaller elements during merge sort step'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001108' AND leetcode_number = 315);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001140', 'a0a00000-0000-0000-0000-000000001108', 493, 'Reverse Pairs', 'https://leetcode.com/problems/reverse-pairs/', 'HARD', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Count double-inversions during merge sort'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001108' AND leetcode_number = 493);

-- Pattern 9: Divide & Conquer on Linked List
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001141', 'a0a00000-0000-0000-0000-000000001109', 148, 'Sort List', 'https://leetcode.com/problems/sort-list/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Find midpoint, split range, and recursively merge list nodes'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001109' AND leetcode_number = 148);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001142', 'a0a00000-0000-0000-0000-000000001109', 21, 'Merge Two Sorted Lists', 'https://leetcode.com/problems/merge-two-sorted-lists/', 'EASY', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Combine two sorted lists recursively'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001109' AND leetcode_number = 21);

-- Pattern 10: Divide & Conquer + Binary Search
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001143', 'a0a00000-0000-0000-0000-000000001110', 33, 'Search in Rotated Sorted Array', 'https://leetcode.com/problems/search-in-rotated-sorted-array/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Locate targets using range boundary splits'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001110' AND leetcode_number = 33);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001144', 'a0a00000-0000-0000-0000-000000001110', 153, 'Find Minimum in Rotated Sorted Array', 'https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Search for minimum index in rotated partitions'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001110' AND leetcode_number = 153);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001145', 'a0a00000-0000-0000-0000-000000001110', 162, 'Find Peak Element', 'https://leetcode.com/problems/find-peak-element/', 'MEDIUM', 'NOT_STARTED', '2026-08-11', NULL, 0, TRUE, 'Locate peak using local slope indicators'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001110' AND leetcode_number = 162);
