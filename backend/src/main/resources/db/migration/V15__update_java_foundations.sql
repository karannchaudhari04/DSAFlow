-- V15: Update Phase 0 (Java Foundations) Patterns and Problems

-- 1. Remove existing problems for Phase 0 patterns or matching IDs / leetcode numbers
DELETE FROM problems WHERE pattern_id IN (
  SELECT id FROM patterns WHERE phase_id = 'b0a00000-0000-0000-0000-000000000000'
) OR id IN (
  'c0000000-0000-0000-0000-000000000001',
  'c0000000-0000-0000-0000-000000000002',
  'c0000000-0000-0000-0000-000000000003',
  'c0000000-0000-0000-0000-000000000004',
  'c0000000-0000-0000-0000-000000000005',
  'c0000000-0000-0000-0000-000000000006',
  'c0000000-0000-0000-0000-000000000007',
  'c0000000-0000-0000-0000-000000000008',
  'c0000000-0000-0000-0000-000000000009',
  'c0000000-0000-0000-0000-000000000010',
  'c0000000-0000-0000-0000-000000000011',
  'c0000000-0000-0000-0000-000000000012',
  'c0000000-0000-0000-0000-000000000013',
  'c0000000-0000-0000-0000-000000000014',
  'c0000000-0000-0000-0000-000000000015'
) OR leetcode_number IN (7, 9, 136, 10001, 10002, 10003, 387, 242, 10004, 1389, 1, 217, 1046, 10005, 10006);

-- 2. Remove existing patterns for Phase 0
DELETE FROM patterns WHERE phase_id = 'b0a00000-0000-0000-0000-000000000000';

-- 3. Insert the 9 Reframed Java Foundations Patterns
INSERT INTO patterns (id, phase_id, name, sequence_order, description, time_complexity, space_complexity, intuition, generic_approach, recognition_clues, common_mistakes, mastery_status) VALUES
('a0a00000-0000-0000-0000-000000000001', 'b0a00000-0000-0000-0000-000000000000', 'Syntax, Data Types & Control Flow', 1, 'Primitives vs Wrappers, Type Casting, Loops & Stack/Heap memory allocation.', 'O(1)', 'O(1)', '', '', '', '', 'LEARNING'),
('a0a00000-0000-0000-0000-000000000002', 'b0a00000-0000-0000-0000-000000000000', 'OOP Fundamentals (4 Pillars)', 2, 'Encapsulation, Inheritance, Polymorphism, Abstraction, and Access Modifiers.', 'O(1)', 'O(1)', '', '', '', '', 'LEARNING'),
('a0a00000-0000-0000-0000-000000000003', 'b0a00000-0000-0000-0000-000000000000', 'Java Memory Model & Keywords', 3, 'Stack vs Heap memory, String Constant Pool (SCP), static, final, this, super.', 'O(1)', 'O(1)', '', '', '', '', 'LEARNING'),
('a0a00000-0000-0000-0000-000000000004', 'b0a00000-0000-0000-0000-000000000000', 'String Architecture & Immutability', 4, 'String Constant Pool, == vs .equals(), StringBuilder vs StringBuffer benchmarking.', 'O(N)', 'O(N)', '', '', '', '', 'LEARNING'),
('a0a00000-0000-0000-0000-000000000005', 'b0a00000-0000-0000-0000-000000000000', 'Arrays & Multidimensional Matrices', 5, '1D/2D Array allocations, Jagged arrays, and pass-by-value references.', 'O(N)', 'O(N)', '', '', '', '', 'LEARNING'),
('a0a00000-0000-0000-0000-000000000006', 'b0a00000-0000-0000-0000-000000000000', 'Java Collections — Lists', 6, 'ArrayList dynamic 1.5x resizing capacity, LinkedList node references.', 'O(N)', 'O(N)', '', '', '', '', 'LEARNING'),
('a0a00000-0000-0000-0000-000000000007', 'b0a00000-0000-0000-0000-000000000000', 'Java Collections — Maps & Sets', 7, 'HashMap internal buckets, hashCode, treeify threshold 8, HashSet, TreeMap.', 'O(1)', 'O(N)', '', '', '', '', 'LEARNING'),
('a0a00000-0000-0000-0000-000000000008', 'b0a00000-0000-0000-0000-000000000000', 'Java Collections — Queues & Custom Sorting', 8, 'ArrayDeque, PriorityQueue min/max heaps, Comparable vs Comparator.', 'O(log N)', 'O(N)', '', '', '', '', 'LEARNING'),
('a0a00000-0000-0000-0000-000000000009', 'b0a00000-0000-0000-0000-000000000000', 'Exception Handling & Generics', 9, 'Checked vs Unchecked exceptions, try-with-resources, Generics <T> type safety.', 'O(1)', 'O(1)', '', '', '', '', 'LEARNING');

-- 4. Insert Phase 0 Practice Problems & Drills
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve) VALUES
('c0000000-0000-0000-0000-000000000001', 'a0a00000-0000-0000-0000-000000000001', 7, 'Reverse Integer', 'https://leetcode.com/problems/reverse-integer/', 'MEDIUM', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE),
('c0000000-0000-0000-0000-000000000002', 'a0a00000-0000-0000-0000-000000000001', 9, 'Palindrome Number', 'https://leetcode.com/problems/palindrome-number/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE),
('c0000000-0000-0000-0000-000000000003', 'a0a00000-0000-0000-0000-000000000001', 136, 'Single Number', 'https://leetcode.com/problems/single-number/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE),
('c0000000-0000-0000-0000-000000000004', 'a0a00000-0000-0000-0000-000000000002', 10001, 'Bank Account System (Encapsulation Drill)', 'https://github.com/topics/java-oop', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE),
('c0000000-0000-0000-0000-000000000005', 'a0a00000-0000-0000-0000-000000000002', 10002, 'Shape Area Calculator (Polymorphism & Interface Drill)', 'https://github.com/topics/java-oop', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE),
('c0000000-0000-0000-0000-000000000006', 'a0a00000-0000-0000-0000-000000000003', 10003, 'Static Counter & Memory Allocation Drill', 'https://github.com/topics/java-memory-model', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE),
('c0000000-0000-0000-0000-000000000007', 'a0a00000-0000-0000-0000-000000000004', 387, 'First Unique Character in a String', 'https://leetcode.com/problems/first-unique-character-in-a-string/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE),
('c0000000-0000-0000-0000-000000000008', 'a0a00000-0000-0000-0000-000000000004', 242, 'Valid Anagram', 'https://leetcode.com/problems/valid-anagram/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE),
('c0000000-0000-0000-0000-000000000009', 'a0a00000-0000-0000-0000-000000000005', 10004, 'Build Custom DynamicArray Class from Scratch', 'https://github.com/topics/java-arrays', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE),
('c0000000-0000-0000-0000-000000000010', 'a0a00000-0000-0000-0000-000000000006', 1389, 'Create Target Array in the Given Order', 'https://leetcode.com/problems/create-target-array-in-the-given-order/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE),
('c0000000-0000-0000-0000-000000000011', 'a0a00000-0000-0000-0000-000000000007', 1, 'Two Sum', 'https://leetcode.com/problems/two-sum/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE),
('c0000000-0000-0000-0000-000000000012', 'a0a00000-0000-0000-0000-000000000007', 217, 'Contains Duplicate', 'https://leetcode.com/problems/contains-duplicate/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE),
('c0000000-0000-0000-0000-000000000013', 'a0a00000-0000-0000-0000-000000000008', 1046, 'Last Stone Weight', 'https://leetcode.com/problems/last-stone-weight/', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE),
('c0000000-0000-0000-0000-000000000014', 'a0a00000-0000-0000-0000-000000000008', 10005, 'Student Object Comparator Ranking Drill', 'https://github.com/topics/java-sorting', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE),
('c0000000-0000-0000-0000-000000000015', 'a0a00000-0000-0000-0000-000000000009', 10006, 'Custom Exception & Generic Box Wrapper Drill', 'https://github.com/topics/java-generics', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE);
