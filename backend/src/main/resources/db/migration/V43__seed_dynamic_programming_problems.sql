-- V43: Restructure and seed Dynamic Programming phase (Phase 18)

-- 1. Rename the Phase 18 topic in phases table
UPDATE phases SET topic = 'Dynamic Programming' WHERE id = 'b0a00000-0000-0000-0000-000000000017';

-- 2. Delete old problems and patterns under Phase 18 to prevent constraint violations
DELETE FROM problems WHERE pattern_id IN (SELECT id FROM patterns WHERE phase_id = 'b0a00000-0000-0000-0000-000000000017');
DELETE FROM patterns WHERE phase_id = 'b0a00000-0000-0000-0000-000000000017';

-- 3. Register the 15 DP subtopic patterns
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000001701', 'b0a00000-0000-0000-0000-000000000017', 'DP FUNDAMENTALS — 1D DP', 'Basic 1D array state transitions looking back fixed steps.', '1D array state representation checking previous one or two states.', 'Solve base cases, then iterate forward building solutions.', 'Use 1D array or variable swaps to optimize space.', 'O(N)', 'O(1) to O(N)', 'Forgetting base cases like N=0 or N=1.', 'NOT_STARTED', 1),
('a0a00000-0000-0000-0000-000000001702', 'b0a00000-0000-0000-0000-000000000017', 'HOUSE ROBBER / TAKE OR SKIP', 'Binary choice patterns involving adjacent elements exclusion.', 'Choosing to include or skip adjacent elements to maximize values.', 'Determine choice state at each step (take vs. skip).', 'Evaluate max(dp[i-2] + val, dp[i-1]) state steps.', 'O(N)', 'O(1) to O(N)', 'Overlooking circular boundary exceptions.', 'NOT_STARTED', 2),
('a0a00000-0000-0000-0000-000000001703', 'b0a00000-0000-0000-0000-000000000017', 'MAXIMUM SUBARRAY DP', 'Contiguous subsegment optimizations using Kadanes algorithm.', 'Maximum contiguous sum or product subsegment.', 'Decide whether to add active element to existing subarray or start fresh.', 'Track max_ending_here and max_so_far variables.', 'O(N)', 'O(1)', 'Incorrectly initializing max sum to 0 when negative inputs exist.', 'NOT_STARTED', 3),
('a0a00000-0000-0000-0000-000000001704', 'b0a00000-0000-0000-0000-000000000017', 'GRID / 2D DP', 'Optimizing path or boundary routes in grid coordinate systems.', 'Exploration and paths in 2D coordinate spaces.', 'Propagate solutions from top/left cells dynamically.', 'Set bounds and populate grid cells layer-by-layer.', 'O(R * C)', 'O(C) to O(R*C)', 'Confusing indices or ignoring obstacles limits.', 'NOT_STARTED', 4),
('a0a00000-0000-0000-0000-000000001705', 'b0a00000-0000-0000-0000-000000000017', 'KNAPSACK — 0/1 KNAPSACK', 'Item selections with constraints allowing single choice.', 'Item selections with constraints where each item can be chosen at most once.', 'Iterate items backwards over capacity dimension to prevent re-use.', 'Update 1D capacity array from right-to-left.', 'O(N * W)', 'O(W)', 'Iterating forwards and accidentally reusing elements.', 'NOT_STARTED', 5),
('a0a00000-0000-0000-0000-000000001706', 'b0a00000-0000-0000-0000-000000000017', 'UNBOUNDED KNAPSACK', 'Constraint selections allowing infinite duplicate items.', 'Item selections with capacity constraints allowing infinite duplicates.', 'Iterate capacity forwards to allow duplicate choices of items.', 'Update 1D capacity array from left-to-right.', 'O(N * W)', 'O(W)', 'Iterating backwards, restricting elements to single use.', 'NOT_STARTED', 6),
('a0a00000-0000-0000-0000-000000001707', 'b0a00000-0000-0000-0000-000000000017', 'SUBSET SUM / PARTITION DP', 'Partitioning arrays to match subset targets.', 'Dividing array into sets matching specific target sums.', 'Treat subsets as 0/1 Knapsack constraints.', 'Find subset target sum first, then run subset checks.', 'O(N * Sum)', 'O(Sum)', 'Processing partition arrays without checking odd totals.', 'NOT_STARTED', 7),
('a0a00000-0000-0000-0000-000000001708', 'b0a00000-0000-0000-0000-000000000017', 'STRING DP — LCS', 'Identifying common sequence configurations between multiple strings.', 'Finding common subsequences or alignments between two strings.', 'Compare character matches at index pointers dynamically.', 'Construct a 2D match grid checking matching chars.', 'O(M * N)', 'O(min(M,N))', 'Failing to handle off-by-one indexing of match matrix.', 'NOT_STARTED', 8),
('a0a00000-0000-0000-0000-000000001709', 'b0a00000-0000-0000-0000-000000000017', 'EDIT DISTANCE', 'Resolving edit operations between distinct sequences.', 'Minimum transformations (inserts, deletes, replacements) between strings.', 'Minimum of diagonal, top, and left cell transitions.', 'Compute edits on match matrix dynamically.', 'O(M * N)', 'O(min(M,N))', 'Overlooking base operations for empty string steps.', 'NOT_STARTED', 9),
('a0a00000-0000-0000-0000-000000001710', 'b0a00000-0000-0000-0000-000000000017', 'PALINDROME DP', 'Subrange computations checking boundary equalities.', 'Analyzing palindromic substrings or partitions.', 'Interval expansion checks or boolean interval lookup maps.', 'Loop over range sizes, verifying boundary matches.', 'O(N^2)', 'O(N^2)', 'Incorrect expansion direction bounds.', 'NOT_STARTED', 10),
('a0a00000-0000-0000-0000-000000001711', 'b0a00000-0000-0000-0000-000000000017', 'LIS — LONGEST INCREASING SUBSEQUENCE', 'Strictly increasing subarray length tracking.', 'Longest strictly increasing sequence of array elements.', 'Compare index with all previous indices or use binary search limits.', 'Use DP array search or binary search tail tracking.', 'O(N log N)', 'O(N)', 'Failing to keep values strictly increasing.', 'NOT_STARTED', 11),
('a0a00000-0000-0000-0000-000000001712', 'b0a00000-0000-0000-0000-000000000017', 'STOCK DP', 'State machines tracking transaction and cooldown variables.', 'Deciding buy, sell, or cooldown states to maximize profit.', 'Track state variables for holding or not holding stock.', 'Compute hold, sell, and cooldown state steps dynamically.', 'O(N)', 'O(1)', 'Ignoring cooling down constraints or max limit bounds.', 'NOT_STARTED', 12),
('a0a00000-0000-0000-0000-000000001713', 'b0a00000-0000-0000-0000-000000000017', 'INTERVAL DP', 'Subrange optimal updates by breaking ranges.', 'Solving problems on contiguous subranges/intervals.', 'Divide range at split point k and combine subinterval answers.', 'Iterate sizes, compute split bounds and minimize cuts.', 'O(N^3)', 'O(N^2)', 'Incorrect base initializes for sizes = 1 or 2.', 'NOT_STARTED', 13),
('a0a00000-0000-0000-0000-000000001714', 'b0a00000-0000-0000-0000-000000000017', 'DP ON GRAPHS / TREES', 'Subtree structural optimizations.', 'Tree traversals with choice selections.', 'Return choice pairs (include root vs exclude root) post-order.', 'Perform bottom-up DFS recursive state updates.', 'O(N)', 'O(N)', 'Including direct children values when parent is robbed.', 'NOT_STARTED', 14),
('a0a00000-0000-0000-0000-000000001715', 'b0a00000-0000-0000-0000-000000000017', 'ADVANCED DP — OPTIONAL', 'Highly complex multi-dimensional wildcard matching and range splits.', 'Complex matching strings, regular expressions, or range splits.', 'Define double-indexed states checking wildcards or split bounds.', 'Run multi-pointer coordinate matches.', 'O(M * N)', 'O(M * N)', 'Mismating star wildcards matching zero elements.', 'NOT_STARTED', 15);

-- 4. Seed all curated DP practice problems cleanly
-- Pattern 1: DP FUNDAMENTALS — 1D DP
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
('c0000000-0000-0000-0000-000000001721', 'a0a00000-0000-0000-0000-000000001701', 70, 'Climbing Stairs', 'https://leetcode.com/problems/climbing-stairs/', 'EASY', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Basic 1D DP state transition'),
('c0000000-0000-0000-0000-000000001722', 'a0a00000-0000-0000-0000-000000001701', 509, 'Fibonacci Number', 'https://leetcode.com/problems/fibonacci-number/', 'EASY', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Memoization vs tabulation comparison'),
('c0000000-0000-0000-0000-000000001723', 'a0a00000-0000-0000-0000-000000001701', 746, 'Min Cost Climbing Stairs', 'https://leetcode.com/problems/min-cost-climbing-stairs/', 'EASY', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'State transition selecting minimum cost step'),
('c0000000-0000-0000-0000-000000001724', 'a0a00000-0000-0000-0000-000000001701', 1137, 'N-th Tribonacci Number', 'https://leetcode.com/problems/n-th-tribonacci-number/', 'EASY', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Multiple previous states compilation');

-- Pattern 2: HOUSE ROBBER / TAKE OR SKIP
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
('c0000000-0000-0000-0000-000000001725', 'a0a00000-0000-0000-0000-000000001702', 198, 'House Robber', 'https://leetcode.com/problems/house-robber/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Take/skip decision patterns'),
('c0000000-0000-0000-0000-000000001726', 'a0a00000-0000-0000-0000-000000001702', 213, 'House Robber II', 'https://leetcode.com/problems/house-robber-ii/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Circular take/skip boundary handling'),
('c0000000-0000-0000-0000-000000001727', 'a0a00000-0000-0000-0000-000000001702', 740, 'Delete and Earn', 'https://leetcode.com/problems/delete-and-earn/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Transform input arrays into House Robber configurations');

-- Pattern 3: MAXIMUM SUBARRAY DP
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
('c0000000-0000-0000-0000-000000001728', 'a0a00000-0000-0000-0000-000000001703', 53, 'Maximum Subarray', 'https://leetcode.com/problems/maximum-subarray/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Kadane / 1D DP subarray tracking');

-- Pattern 4: GRID / 2D DP
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
('c0000000-0000-0000-0000-000000001729', 'a0a00000-0000-0000-0000-000000001704', 62, 'Unique Paths', 'https://leetcode.com/problems/unique-paths/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Basic 2D DP grid traversal'),
('c0000000-0000-0000-0000-000000001730', 'a0a00000-0000-0000-0000-000000001704', 63, 'Unique Paths II', 'https://leetcode.com/problems/unique-paths-ii/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Grid navigation with obstacles check'),
('c0000000-0000-0000-0000-000000001731', 'a0a00000-0000-0000-0000-000000001704', 64, 'Minimum Path Sum', 'https://leetcode.com/problems/minimum-path-sum/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Min-cost grid path sum optimization');

-- Pattern 5: KNAPSACK — 0/1 KNAPSACK
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
('c0000000-0000-0000-0000-000000001732', 'a0a00000-0000-0000-0000-000000001705', 416, 'Partition Equal Subset Sum', 'https://leetcode.com/problems/partition-equal-subset-sum/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, '0/1 Knapsack partition'),
('c0000000-0000-0000-0000-000000001733', 'a0a00000-0000-0000-0000-000000001705', 494, 'Target Sum', 'https://leetcode.com/problems/target-sum/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Knapsack transformation with sign combinations'),
('c0000000-0000-0000-0000-000000001734', 'a0a00000-0000-0000-0000-000000001705', 474, 'Ones and Zeroes', 'https://leetcode.com/problems/ones-and-zeroes/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, '2D Knapsack size limitations');

-- Pattern 6: UNBOUNDED KNAPSACK
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
('c0000000-0000-0000-0000-000000001735', 'a0a00000-0000-0000-0000-000000001706', 322, 'Coin Change', 'https://leetcode.com/problems/coin-change/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Minimum coins collection'),
('c0000000-0000-0000-0000-000000001736', 'a0a00000-0000-0000-0000-000000001706', 518, 'Coin Change II', 'https://leetcode.com/problems/coin-change-ii/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Number of coin combinations possible'),
('c0000000-0000-0000-0000-000000001737', 'a0a00000-0000-0000-0000-000000001706', 279, 'Perfect Squares', 'https://leetcode.com/problems/perfect-squares/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Unbounded-choice perfect square options');

-- Pattern 7: SUBSET SUM / PARTITION DP
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
('c0000000-0000-0000-0000-000000001738', 'a0a00000-0000-0000-0000-000000001707', 416, 'Partition Equal Subset Sum', 'https://leetcode.com/problems/partition-equal-subset-sum/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Subset sum matching target partitions'),
('c0000000-0000-0000-0000-000000001739', 'a0a00000-0000-0000-0000-000000001707', 494, 'Target Sum', 'https://leetcode.com/problems/target-sum/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Subset sum target sign transformations');

-- Pattern 8: STRING DP — LCS
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
('c0000000-0000-0000-0000-000000001740', 'a0a00000-0000-0000-0000-000000001708', 1143, 'Longest Common Subsequence', 'https://leetcode.com/problems/longest-common-subsequence/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Core LCS algorithm'),
('c0000000-0000-0000-0000-000000001741', 'a0a00000-0000-0000-0000-000000001708', 1035, 'Uncrossed Lines', 'https://leetcode.com/problems/uncrossed-lines/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'LCS mapping variation');

-- Pattern 9: EDIT DISTANCE
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
('c0000000-0000-0000-0000-000000001742', 'a0a00000-0000-0000-0000-000000001709', 72, 'Edit Distance', 'https://leetcode.com/problems/edit-distance/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Minimum string transformation steps');

-- Pattern 10: PALINDROME DP
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
('c0000000-0000-0000-0000-000000001743', 'a0a00000-0000-0000-0000-000000001710', 5, 'Longest Palindromic Substring', 'https://leetcode.com/problems/longest-palindromic-substring/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Interval DP checking outer matches'),
('c0000000-0000-0000-0000-000000001744', 'a0a00000-0000-0000-0000-000000001710', 647, 'Palindromic Substrings', 'https://leetcode.com/problems/palindromic-substrings/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Count palindromic substring intervals');

-- Pattern 11: LIS — LONGEST INCREASING SUBSEQUENCE
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
('c0000000-0000-0000-0000-000000001745', 'a0a00000-0000-0000-0000-000000001711', 300, 'Longest Increasing Subsequence', 'https://leetcode.com/problems/longest-increasing-subsequence/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Core LIS dynamic matches'),
('c0000000-0000-0000-0000-000000001746', 'a0a00000-0000-0000-0000-000000001711', 673, 'Number of Longest Increasing Subsequence', 'https://leetcode.com/problems/number-of-longest-increasing-subsequence/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'LIS count variations');

-- Pattern 12: STOCK DP
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
('c0000000-0000-0000-0000-000000001747', 'a0a00000-0000-0000-0000-000000001712', 121, 'Best Time to Buy and Sell Stock', 'https://leetcode.com/problems/best-time-to-buy-and-sell-stock/', 'EASY', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Basic single buy/sell state'),
('c0000000-0000-0000-0000-000000001748', 'a0a00000-0000-0000-0000-000000001712', 122, 'Best Time to Buy and Sell Stock II', 'https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Unlimited buy/sell transactions profit maximization'),
('c0000000-0000-0000-0000-000000001749', 'a0a00000-0000-0000-0000-000000001712', 309, 'Best Time to Buy and Sell Stock with Cooldown', 'https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'State machine buy/sell with cooldown day constraint'),
('c0000000-0000-0000-0000-000000001750', 'a0a00000-0000-0000-0000-000000001712', 123, 'Best Time to Buy and Sell Stock III', 'https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iii/', 'HARD', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Transaction limit checking at most 2 times');

-- Pattern 13: INTERVAL DP
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
('c0000000-0000-0000-0000-000000001751', 'a0a00000-0000-0000-0000-000000001713', 1130, 'Minimum Cost Tree From Leaf Values', 'https://leetcode.com/problems/minimum-cost-tree-from-leaf-values/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Interval range splits optimization'),
('c0000000-0000-0000-0000-000000001752', 'a0a00000-0000-0000-0000-000000001713', 312, 'Burst Balloons', 'https://leetcode.com/problems/burst-balloons/', 'HARD', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Advanced range partitioning and value optimization');

-- Pattern 14: DP ON GRAPHS / TREES
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
('c0000000-0000-0000-0000-000000001753', 'a0a00000-0000-0000-0000-000000001714', 337, 'House Robber III', 'https://leetcode.com/problems/house-robber-iii/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Tree DP returning pairs of choices (rob root vs. do not rob root)');

-- Pattern 15: ADVANCED DP — OPTIONAL
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
('c0000000-0000-0000-0000-000000001754', 'a0a00000-0000-0000-0000-000000001715', 115, 'Distinct Subsequences', 'https://leetcode.com/problems/distinct-subsequences/', 'HARD', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'String matching subsequences count'),
('c0000000-0000-0000-0000-000000001755', 'a0a00000-0000-0000-0000-000000001715', 10, 'Regular Expression Matching', 'https://leetcode.com/problems/regular-expression-matching/', 'HARD', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Advanced string matching with wildcard stars'),
('c0000000-0000-0000-0000-000000001756', 'a0a00000-0000-0000-0000-000000001715', 44, 'Wildcard Matching', 'https://leetcode.com/problems/wildcard-matching/', 'HARD', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Advanced wildcard string matching'),
('c0000000-0000-0000-0000-000000001757', 'a0a00000-0000-0000-0000-000000001715', 132, 'Palindrome Partitioning II', 'https://leetcode.com/problems/palindrome-partitioning-ii/', 'HARD', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Partition range checks for minimal cuts');
