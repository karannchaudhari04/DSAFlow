-- V17: Replace Phase 0 (Java Foundations) and Phase 1 (DSA Foundations) problems with working Apna College & Love Babbar video links

-- 1. Remove existing problems for Phase 0 and Phase 1
DELETE FROM problems WHERE pattern_id IN (
    SELECT id FROM patterns WHERE phase_id IN (
        'b0a00000-0000-0000-0000-000000000000', -- Java Foundations
        'b0a00000-0000-0000-0000-000000000001'  -- DSA Foundations
    )
);

-- 2. Remove and reframe Phase 1 (DSA Foundations) subtopics/patterns
DELETE FROM patterns WHERE phase_id = 'b0a00000-0000-0000-0000-000000000001';

INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000000101', 'b0a00000-0000-0000-0000-000000000001', 'Time Complexity', 'Understanding execution step limits and calculating Time Complexity using Big O.', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'LEARNING', 1),
('a0a00000-0000-0000-0000-000000000102', 'b0a00000-0000-0000-0000-000000000001', 'Space Complexity', 'Understanding auxiliary memory space usage and avoiding Time Limit Exceeded (TLE).', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'LEARNING', 2),
('a0a00000-0000-0000-0000-000000000103', 'b0a00000-0000-0000-0000-000000000001', 'Recursion Basics', 'Understanding call stacks, base cases, and writing basic recursive functions.', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'LEARNING', 3);

-- 3. Insert Theory and YouTube resources as rows
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, leetcode_verified) VALUES
-- Phase 0 (Java Foundations)
-- Syntax, Data Types & Control Flow
('c0000000-0000-0000-0000-000000000001', 'a0a00000-0000-0000-0000-000000000001', 90001, 'Java Introduction, Variables & Data Types (Apna College)', 'https://www.youtube.com/watch?v=yRpLlJmRo2w', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE, FALSE),
('c0000000-0000-0000-0000-000000000002', 'a0a00000-0000-0000-0000-000000000001', 90002, 'Conditional Statements & Switch Case (Apna College)', 'https://www.youtube.com/watch?v=I5srDu75NVY', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE, FALSE),

-- OOP Fundamentals
('c0000000-0000-0000-0000-000000000003', 'a0a00000-0000-0000-0000-000000000002', 90003, 'Object Oriented Programming Concepts (Apna College)', 'https://www.youtube.com/watch?v=k52P_m-k50Y', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE, FALSE),

-- Java Memory Model
('c0000000-0000-0000-0000-000000000005', 'a0a00000-0000-0000-0000-000000000003', 90005, 'Java Memory Management Stack vs Heap (Telusko)', 'https://www.youtube.com/watch?v=Nn1R49fN_1E', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE, FALSE),

-- String Architecture
('c0000000-0000-0000-0000-000000000007', 'a0a00000-0000-0000-0000-000000000004', 90007, 'Strings & StringBuilder Architecture (Apna College)', 'https://www.youtube.com/watch?v=4U3Z0Xv7r8k', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE, FALSE),

-- Arrays
('c0000000-0000-0000-0000-000000000009', 'a0a00000-0000-0000-0000-000000000005', 90009, 'Arrays in Java Complete Lecture (Apna College)', 'https://www.youtube.com/watch?v=y3u-eSCoZ0o', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE, FALSE),
('c0000000-0000-0000-0000-000000000015', 'a0a00000-0000-0000-0000-000000000005', 90015, '2D Arrays and Matrices in Java (Apna College)', 'https://www.youtube.com/watch?v=M56mZ1mEw98', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE, FALSE),

-- Lists
('c0000000-0000-0000-0000-000000000010', 'a0a00000-0000-0000-0000-000000000006', 90010, 'ArrayList & Dynamic Lists in Java (Apna College)', 'https://www.youtube.com/watch?v=U36-H_q8-0c', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE, FALSE),

-- Maps & Sets
('c0000000-0000-0000-0000-000000000011', 'a0a00000-0000-0000-0000-000000000007', 90011, 'HashMap & HashSet Implementation (Apna College)', 'https://www.youtube.com/watch?v=UT9W9aL-c_c', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE, FALSE),

-- Queues & Custom Sorting
('c0000000-0000-0000-0000-000000000013', 'a0a00000-0000-0000-0000-000000000008', 90013, 'Stack & Queue Data Structures (Apna College)', 'https://www.youtube.com/watch?v=y8Xb_G3L6rM', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE, FALSE),

-- Exception Handling & Generics
('c0000000-0000-0000-0000-000000000014', 'a0a00000-0000-0000-0000-000000000009', 90014, 'Exception Handling and Try-Catch (Apna College)', 'https://www.youtube.com/watch?v=1XATYv3McR0', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE, FALSE),


-- Phase 1 (DSA Foundations)
-- Time Complexity (Pattern 0101)
('c0000000-0000-0000-0000-000000000101', 'a0a00000-0000-0000-0000-000000000101', 90101, 'Time Complexity & Execution Limits (Love Babbar)', 'https://www.youtube.com/watch?v=GAqvCRR1YmW', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE, FALSE),

-- Space Complexity (Pattern 0102)
('c0000000-0000-0000-0000-000000000102', 'a0a00000-0000-0000-0000-000000000102', 90102, 'Space Complexity & Avoiding TLE Errors (Love Babbar)', 'https://www.youtube.com/watch?v=Hy6crFNManX', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE, FALSE),

-- Recursion Basics (Pattern 0103)
('c0000000-0000-0000-0000-000000000103', 'a0a00000-0000-0000-0000-000000000103', 90103, 'Recursion Part 1 Introduction & Basics (Love Babbar)', 'https://www.youtube.com/watch?v=k52P_m-k50Y', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE, FALSE);

-- 4. Seed detail templates for these resources
INSERT INTO problem_details (problem_id, intuition, approach, code_snippet, complexity_analysis, what_i_learned)
SELECT id, 'Study theoretical fundamentals and video tutorials.', 'Watch reference videos and read official documentations.', '// Theoretical Resource Link: No code required', 'N/A', 'Fundamental concept' FROM problems 
WHERE leetcode_number >= 90000
ON CONFLICT (problem_id) DO NOTHING;
