-- Seed initial problems
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve) VALUES
('b0a00000-0000-0000-0000-000000000001', 'a0a00000-0000-0000-0000-000000000202', 1295, 'Find Numbers with Even Number of Digits', 'https://leetcode.com/problems/find-numbers-with-even-number-of-digits/', 'EASY', 'MASTERED', '2026-08-01', 15, 1, TRUE),
('b0a00000-0000-0000-0000-000000000002', 'a0a00000-0000-0000-0000-000000000203', 485, 'Maximum Consecutive Ones', 'https://leetcode.com/problems/max-consecutive-ones/', 'EASY', 'MASTERED', '2026-08-02', 20, 2, TRUE),
('b0a00000-0000-0000-0000-000000000003', 'a0a00000-0000-0000-0000-000000000204', 1672, 'Richest Customer Wealth', 'https://leetcode.com/problems/richest-customer-wealth/', 'EASY', 'MASTERED', '2026-08-03', 10, 1, TRUE),
('b0a00000-0000-0000-0000-000000000004', 'a0a00000-0000-0000-0000-000000000202', 2798, 'Number of Employees Who Met the Target', 'https://leetcode.com/problems/number-of-employees-who-met-the-target/', 'EASY', 'MASTERED', '2026-08-04', 10, 1, TRUE);

-- Seed initial problem_details
INSERT INTO problem_details (problem_id, intuition, approach, code_snippet, complexity_analysis, what_i_learned) VALUES
('b0a00000-0000-0000-0000-000000000001', 
 'Convert each number to a string and check its length, or divide by 10 repeatedly to count digits.', 
 'Iterate through the array. For each number, determine its digit count. If digit count is even, increment count.', 
 'class Solution {\n    public int findNumbers(int[] nums) {\n        int count = 0;\n        for (int num : nums) {\n            if (String.valueOf(num).length() % 2 == 0) {\n                count++;\n            }\n        }\n        return count;\n    }\n}', 
 'Time Complexity: O(N * K) where K is number of digits, Space Complexity: O(1)', 
 'Dividing by 10 is mathematically cleaner than converting to string, but string conversion is fast to implement.'),

('b0a00000-0000-0000-0000-000000000002', 
 'Maintain current count of ones. When 0 is met, update max count and reset current count.', 
 'Iterate array. If 1, count++. If 0, max = Math.max(max, current), count = 0. Update max once more at the end.', 
 'class Solution {\n    public int findMaxConsecutiveOnes(int[] nums) {\n        int max = 0;\n        int current = 0;\n        for (int num : nums) {\n            if (num == 1) {\n                current++;\n            } else {\n                max = Math.max(max, current);\n                current = 0;\n            }\n        }\n        return Math.max(max, current);\n    }\n}', 
 'Time Complexity: O(N), Space Complexity: O(1)', 
 'Be careful to perform a final Math.max comparison after the loop ends to capture trailing segments.'),

('b0a00000-0000-0000-0000-000000000003', 
 'For each customer (row), compute sum of accounts (columns). Maintain running maximum of these sums.', 
 'Outer loop i through rows. Inner loop j through columns. Sum account[i][j]. Compare with max wealth.', 
 'class Solution {\n    public int maximumWealth(int[][] accounts) {\n        int maxWealth = 0;\n        for (int[] customer : accounts) {\n            int wealth = 0;\n            for (int bank : customer) {\n                wealth += bank;\n            }\n            maxWealth = Math.max(maxWealth, wealth);\n        }\n        return maxWealth;\n    }\n}', 
 'Time Complexity: O(N * M) where N = customers, M = banks. Space Complexity: O(1)', 
 'For a 2D array: accounts[i] = row/customer, accounts[i][j] = individual value.'),

('b0a00000-0000-0000-0000-000000000004', 
 'Iterate through hours list and count elements >= target.', 
 'Simple single-pass traversal. If hours[i] >= target, increment targetMet count.', 
 'class Solution {\n    public int numberOfEmployeesWhoMetTarget(int[] hours, int target) {\n        int count = 0;\n        for (int hr : hours) {\n            if (hr >= target) {\n                count++;\n            }\n        }\n        return count;\n    }\n}', 
 'Time Complexity: O(N), Space Complexity: O(1)', 
 'Simple array filter mapping matching items to a cumulative integer sum.');

-- Seed initial mistakes (Problem 2 had a mistake)
INSERT INTO mistakes (id, problem_id, pattern_id, description, correct_understanding, date_created, is_resolved, revision_count) VALUES
('e0a00000-0000-0000-0000-000000000001', 'b0a00000-0000-0000-0000-000000000002', 'a0a00000-0000-0000-0000-000000000203', 
 'Initially returned the current count instead of the maximum count.', 
 'When finding a maximum across segments, maintain a separate best/max variable and update it.', 
 '2026-08-02', TRUE, 1);

-- Seed initial completed revisions (so they don''t clutter active lists, since they are mastered)
INSERT INTO revisions (id, problem_id, revision_number, due_date, status, completed_date) VALUES
('30a00000-0000-0000-0000-000000000011', 'b0a00000-0000-0000-0000-000000000001', 1, '2026-08-02', 'COMPLETED', '2026-08-02'),
('30a00000-0000-0000-0000-000000000012', 'b0a00000-0000-0000-0000-000000000001', 2, '2026-08-08', 'COMPLETED', '2026-08-08'),
('30a00000-0000-0000-0000-000000000013', 'b0a00000-0000-0000-0000-000000000001', 3, '2026-08-31', 'PENDING', NULL),
('30a00000-0000-0000-0000-000000000021', 'b0a00000-0000-0000-0000-000000000002', 1, '2026-08-03', 'COMPLETED', '2026-08-03'),
('30a00000-0000-0000-0000-000000000022', 'b0a00000-0000-0000-0000-000000000002', 2, '2026-08-09', 'PENDING', NULL),
('30a00000-0000-0000-0000-000000000023', 'b0a00000-0000-0000-0000-000000000002', 3, '2026-09-01', 'PENDING', NULL),
('30a00000-0000-0000-0000-000000000031', 'b0a00000-0000-0000-0000-000000000003', 1, '2026-08-04', 'COMPLETED', '2026-08-04'),
('30a00000-0000-0000-0000-000000000032', 'b0a00000-0000-0000-0000-000000000003', 2, '2026-08-10', 'PENDING', NULL),
('30a00000-0000-0000-0000-000000000033', 'b0a00000-0000-0000-0000-000000000003', 3, '2026-09-02', 'PENDING', NULL),
('30a00000-0000-0000-0000-000000000041', 'b0a00000-0000-0000-0000-000000000004', 1, '2026-08-05', 'COMPLETED', '2026-08-05'),
('30a00000-0000-0000-0000-000000000042', 'b0a00000-0000-0000-0000-000000000004', 2, '2026-08-11', 'PENDING', NULL),
('30a00000-0000-0000-0000-000000000043', 'b0a00000-0000-0000-0000-000000000004', 3, '2026-09-03', 'PENDING', NULL);
