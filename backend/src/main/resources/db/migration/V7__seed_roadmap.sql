-- Seed Phases
INSERT INTO phases (id, phase_number, topic, priority, status, sequence_order) VALUES
('f0a00000-0000-0000-0000-000000000000', 0, 'Java Foundations', 'TIER_1_MASTER', 'COMPLETED', 0),
('f0a00000-0000-0000-0000-000000000001', 1, 'DSA Foundations', 'TIER_1_MASTER', 'COMPLETED', 1),
('f0a00000-0000-0000-0000-000000000002', 2, 'Arrays', 'TIER_1_MASTER', 'IN_PROGRESS', 2),
('f0a00000-0000-0000-0000-000000000003', 3, 'Strings', 'TIER_1_MASTER', 'NOT_STARTED', 3),
('f0a00000-0000-0000-0000-000000000004', 4, 'Searching & Sorting', 'TIER_1_MASTER', 'NOT_STARTED', 4),
('f0a00000-0000-0000-0000-000000000005', 5, 'Hashing', 'TIER_1_MASTER', 'NOT_STARTED', 5),
('f0a00000-0000-0000-0000-000000000006', 6, 'Two Pointers', 'TIER_1_MASTER', 'NOT_STARTED', 6),
('f0a00000-0000-0000-0000-000000000007', 7, 'Sliding Window', 'TIER_1_MASTER', 'NOT_STARTED', 7),
('f0a00000-0000-0000-0000-000000000008', 8, 'Stack', 'TIER_1_MASTER', 'NOT_STARTED', 8),
('f0a00000-0000-0000-0000-000000000009', 9, 'Queue', 'TIER_1_MASTER', 'NOT_STARTED', 9),
('f0a00000-0000-0000-0000-000000000010', 10, 'Linked List', 'TIER_1_MASTER', 'NOT_STARTED', 10),
('f0a00000-0000-0000-0000-000000000011', 11, 'Divide & Conquer', 'TIER_2_STRONG', 'NOT_STARTED', 11),
('f0a00000-0000-0000-0000-000000000012', 12, 'Trees', 'TIER_2_STRONG', 'NOT_STARTED', 12),
('f0a00000-0000-0000-0000-000000000013', 13, 'BST', 'TIER_2_STRONG', 'NOT_STARTED', 13),
('f0a00000-0000-0000-0000-000000000014', 14, 'Heap / Priority Queue', 'TIER_2_STRONG', 'NOT_STARTED', 14),
('f0a00000-0000-0000-0000-000000000015', 15, 'Backtracking', 'TIER_2_STRONG', 'NOT_STARTED', 15),
('f0a00000-0000-0000-0000-000000000016', 16, 'Graphs', 'TIER_3_FUNDAMENTALS', 'NOT_STARTED', 16),
('f0a00000-0000-0000-0000-000000000017', 17, 'Dynamic Programming', 'TIER_3_FUNDAMENTALS', 'NOT_STARTED', 17),
('f0a00000-0000-0000-0000-000000000018', 18, 'Advanced DSA', 'TIER_4_ADVANCED', 'NOT_STARTED', 18);

-- Seed Patterns for Phase 0 (Java Foundations)
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000000001', 'f0a00000-0000-0000-0000-000000000000', 'Java Basics', 'Core syntax and object-oriented programming in Java.', 'Writing simple Java applications', 'Understand class structures and basic data types.', 'Learn OOP principles, variables, and control structures.', 'O(1)', 'O(1)', 'Misunderstanding reference vs value types', 'MASTERED', 1);

-- Seed Patterns for Phase 1 (DSA Foundations)
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000000101', 'f0a00000-0000-0000-0000-000000000001', 'Complexity Analysis', 'Calculating time and space complexity using Big O notation.', 'Analyzing execution limits', 'Measure execution steps relative to input size.', 'Count basic operations and nested loop depths.', 'O(1)', 'O(1)', 'Ignoring space complexity of recursion stack', 'MASTERED', 1);

-- Seed Patterns for Phase 2 (Arrays)
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000000201', 'f0a00000-0000-0000-0000-000000000002', 'Array Traversal', 'Iterating through elements of a one-dimensional array.', 'Accessing every element sequentially.', 'Look at each index one by one from start to end.', 'Use a simple for or while loop to access array elements.', 'O(N)', 'O(1)', 'Off-by-one errors on boundary indices.', 'MASTERED', 1),
('a0a00000-0000-0000-0000-000000000202', 'f0a00000-0000-0000-0000-000000000002', 'Counting', 'Keeping track of frequencies or occurrences of items.', 'Problem asks to count specific occurrences matching criteria.', 'Maintain a count variable and increment when condition matches.', 'Loop through the collection, check the filter condition, and increment counter.', 'O(N)', 'O(1)', 'Resetting the counter variable inside the loop instead of outside.', 'MASTERED', 2),
('a0a00000-0000-0000-0000-000000000203', 'f0a00000-0000-0000-0000-000000000002', 'Running Maximum', 'Maintaining the maximum or minimum value seen so far during traversal.', 'Checking for the best/highest value in a stream or array.', 'Keep a variable updated with the largest element traversed so far.', 'Initialize maxVal to MIN_VALUE or array[0], update maxVal = max(maxVal, current).', 'O(N)', 'O(1)', 'Initializing maximum variables to 0 when negative numbers are possible.', 'MASTERED', 3),
('a0a00000-0000-0000-0000-000000000204', 'f0a00000-0000-0000-0000-000000000002', '2D Array Traversal', 'Traversing elements in multi-dimensional grids.', 'Inputs are matrices or tables requiring processing.', 'Double loop: outer loop for rows, inner loop for columns.', 'Iterate accounts[i] as rows and accounts[i][j] as individual cell elements.', 'O(N * M)', 'O(1)', 'Swapping rows and columns indexing, causing OutOfBounds exceptions.', 'MASTERED', 4),
('a0a00000-0000-0000-0000-000000000205', 'f0a00000-0000-0000-0000-000000000002', 'Prefix Sum', 'Preprocessing an array to compute range sums in O(1) time.', 'Range queries, subarray sums, or relative balance calculations.', 'Prefix sum arrays map index i to the cumulative sum from index 0 to i.', 'Create new array prefix[i] = prefix[i-1] + arr[i]. range(L, R) = prefix[R] - prefix[L-1].', 'O(N) setup, O(1) query', 'O(N) or O(1) in-place', 'Handling left boundary queries (index 0) without padding checks.', 'NOT_STARTED', 5),
('a0a00000-0000-0000-0000-000000000206', 'f0a00000-0000-0000-0000-000000000002', 'In-place Modification', 'Updating array elements without allocating secondary buffers.', 'Constraint of O(1) extra space or direct input modification.', 'Use temporary variables or swap elements directly using indexing.', 'Store state in unused signs or bits, or rewrite values as you iterate.', 'O(N)', 'O(1)', 'Overwriting data before it is read by subsequent loop steps.', 'NOT_STARTED', 6),
('a0a00000-0000-0000-0000-000000000207', 'f0a00000-0000-0000-0000-000000000002', 'Matrix Traversal', 'Navigating matrices in non-standard patterns (spiral, diagonal).', 'Specific traversal sequences required.', 'Maintain boundaries (top, bottom, left, right) and shrink as you traverse.', 'Use coordinate offsets or boundary indices to guide standard traversals.', 'O(N * M)', 'O(1)', 'Infinite loops from incorrect boundary checks.', 'NOT_STARTED', 7),
('a0a00000-0000-0000-0000-000000000208', 'f0a00000-0000-0000-0000-000000000002', 'Basic Array Techniques', 'General arrays techniques like swapping, reversing, and basic sorting wrappers.', 'Requires basic rearranging of indices.', 'Iterate elements and rearrange via simple operations.', 'Utilize standard temporary swapping algorithms.', 'O(N)', 'O(1)', 'Index out of bounds on odd lengths.', 'NOT_STARTED', 8);

-- Seed Patterns for Phase 3 (Strings)
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000000301', 'f0a00000-0000-0000-0000-000000000003', 'String Traversal', 'Reading strings character by character.', 'Scanning inputs', 'Convert to charArray or use charAt(i).', 'Simple loop accessing character sequence.', 'O(N)', 'O(1)', 'Using slow concatenation operations', 'NOT_STARTED', 1);

-- Seed Patterns for Phase 4 (Searching & Sorting)
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000000401', 'f0a00000-0000-0000-0000-000000000004', 'Binary Search', 'Splitting lookup ranges in half sequentially.', 'Searching in sorted collections', 'Compare middle value, drop half of remaining elements.', 'Check mid index, update low/high index bounds.', 'O(log N)', 'O(1)', 'Integer overflow when computing (low + high)/2', 'NOT_STARTED', 1);

-- Seed Patterns for Phase 5 (Hashing)
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000000501', 'f0a00000-0000-0000-0000-000000000005', 'Frequency Counting', 'Tracking item occurrences using maps.', 'Frequency matching', 'Use HashMap to associate items with counts.', 'Map item keys to integer value accumulators.', 'O(N)', 'O(N)', 'Accessing map values before setting defaults', 'NOT_STARTED', 1);

-- Seed Patterns for Phase 6 (Two Pointers)
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000000601', 'f0a00000-0000-0000-0000-000000000006', 'Opposite Direction', 'pointers starting at edges moving inwards.', 'Sorted subarray comparisons', 'Initialize left pointer at 0 and right at end-1.', 'Adjust pointer based on conditions until they meet.', 'O(N)', 'O(1)', 'Infinite loops from missing increments', 'NOT_STARTED', 1);

-- Seed Patterns for Phase 7 (Sliding Window)
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000000701', 'f0a00000-0000-0000-0000-000000000007', 'Fixed Window', 'Scanning continuous blocks of static lengths.', 'Subarrays of size K', 'Add new element, remove sliding tail element.', 'Iterate right pointer, update state, slide left pointer.', 'O(N)', 'O(1)', 'Incorrect bounds checking during initial window load', 'NOT_STARTED', 1);

-- Seed Patterns for Phase 8 (Stack)
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000000801', 'f0a00000-0000-0000-0000-000000000008', 'Valid Parentheses', 'Matching matching scopes or open elements.', 'Nested parenthesis strings', 'Push openings, pop and verify matching on closers.', 'Utilize Deque / ArrayDeque to perform stack check.', 'O(N)', 'O(N)', 'Forgetting stack isEmpty checks before peek/pop', 'NOT_STARTED', 1);

-- Seed Patterns for Phase 9 (Queue)
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000000901', 'f0a00000-0000-0000-0000-000000000009', 'BFS Foundation', 'Exploring nodes level by level.', 'Shortest steps in grids', 'Use FIFO Queue to process nodes in level chunks.', 'Push source, while queue not empty, poll and push neighbors.', 'O(V + E)', 'O(V)', 'Queueing visited nodes repeatedly, causing memory exhaustion', 'NOT_STARTED', 1);

-- Seed Patterns for Phase 10 (Linked List)
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000001001', 'f0a00000-0000-0000-0000-000000000010', 'Linked List Reverse', 'Reversing pointer links in-place.', 'Inversing list sequence', 'Maintain pointers to prev, current, and next elements.', 'Adjust current.next = prev, step prev/current forward.', 'O(N)', 'O(1)', 'Losing list head pointer references mid-loop', 'NOT_STARTED', 1);

-- Seed Patterns for Phase 11 (Divide & Conquer)
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000001101', 'f0a00000-0000-0000-0000-000000000011', 'Divide & Conquer', 'Breaking problems into independent sub-problems.', 'Recurrence relations', 'Solve subtasks, merge results together.', 'Split task in half, call recursively, combine results.', 'O(N log N)', 'O(N)', 'Infinite recursion stack limits', 'NOT_STARTED', 1);

-- Seed Patterns for Phase 12 (Trees)
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000001201', 'f0a00000-0000-0000-0000-000000000012', 'DFS Traversal', 'Traversing tree paths root to leaf.', 'Hierarchical recursive checking', 'Search deep down current node before moving to sibling.', 'Write recursive functions for pre/in/post order views.', 'O(N)', 'O(H)', 'Null node boundary checking omissions', 'NOT_STARTED', 1);

-- Seed Patterns for Phase 13 (BST)
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000001301', 'f0a00000-0000-0000-0000-000000000013', 'BST Search/Insert', 'Using binary search property of trees.', 'Sorted structural lookups', 'Go left if value < root, else go right.', 'Recursive or iterative pointer redirection.', 'O(H)', 'O(1)', 'Treating general binary tree as BST', 'NOT_STARTED', 1);

-- Seed Patterns for Phase 14 (Heap / Priority Queue)
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000001401', 'f0a00000-0000-0000-0000-000000000014', 'Top K Elements', 'Finding the largest/smallest K items.', 'Top K query', 'Maintain min-heap of size K while scanning items.', 'Create Java PriorityQueue, filter size > K elements.', 'O(N log K)', 'O(K)', 'Using Max-heap instead of Min-heap for K largest', 'NOT_STARTED', 1);

-- Seed Patterns for Phase 15 (Backtracking)
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000001501', 'f0a00000-0000-0000-0000-000000000015', 'Subsets / Permutations', 'Generating combinations of search spaces.', 'All possible choices list', 'Build solution recursively, undo choices on returns.', 'Choose -> Recurse -> Backtrack pattern.', 'O(2^N)', 'O(N)', 'Forgot to pop choice during backtrack step', 'NOT_STARTED', 1);

-- Seed Patterns for Phase 16 (Graphs)
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000001601', 'f0a00000-0000-0000-0000-000000000016', 'Graph DFS/BFS', 'Traversing custom nodes with cycles.', 'Connected components', 'DFS/BFS using boolean visited flags.', 'Establish adj list, start traverse tracking visited.', 'O(V + E)', 'O(V)', 'Infinite loop from cyclic structures missing visit check', 'NOT_STARTED', 1);

-- Seed Patterns for Phase 17 (Dynamic Programming)
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000001701', 'f0a00000-0000-0000-0000-000000000017', '1D DP / Memoization', 'Storing duplicate recursive branches.', 'Overlapping subproblems', 'Cache computed subproblems in array/hashmap.', 'Top-down lookup checks or bottom-up fills.', 'O(N)', 'O(N)', 'Incorrect base case checks in recursive branches', 'NOT_STARTED', 1);

-- Seed Patterns for Phase 18 (Advanced DSA)
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000001801', 'f0a00000-0000-0000-0000-000000000018', 'Trie / Prefix Trees', 'Structuring string search paths by prefix.', 'Fast prefix lookups', 'Implement tree nodes with character maps/arrays.', 'Insert nodes per char path, lookup character pointers.', 'O(L)', 'O(AlphabetSize * L)', 'Creating too many duplicate nodes', 'NOT_STARTED', 1);
