-- V20: Fix Phase 0 (Java Foundations) video links with 100% verified, active YouTube URLs

-- 1. Remove existing problems for Phase 0 (Java Foundations)
DELETE FROM problems WHERE pattern_id IN (
    SELECT id FROM patterns WHERE phase_id = 'b0a00000-0000-0000-0000-000000000000'
);

-- 2. Insert corrected, working YouTube video resources for Phase 0
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, leetcode_verified) VALUES
-- Syntax, Data Types & Control Flow
('c0000000-0000-0000-0000-000000000001', 'a0a00000-0000-0000-0000-000000000001', 90001, 'Java Introduction, Variables & Input Output (Apna College)', 'https://www.youtube.com/watch?v=LusTv0RlnSU', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE, FALSE),
('c0000000-0000-0000-0000-000000000002', 'a0a00000-0000-0000-0000-000000000001', 90002, 'Conditional Statements & Switch Case (Apna College)', 'https://www.youtube.com/watch?v=I5srDu75h_M', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE, FALSE),
('c0000000-0000-0000-0000-000000000020', 'a0a00000-0000-0000-0000-000000000001', 90020, 'Loops in Java | For, While, Do-While (Apna College)', 'https://www.youtube.com/watch?v=0r1SfRoLuzU', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE, FALSE),

-- OOP Fundamentals
('c0000000-0000-0000-0000-000000000003', 'a0a00000-0000-0000-0000-000000000002', 90003, 'Java OOPs in One Shot (Apna College)', 'https://www.youtube.com/watch?v=bSrm9RXwBaI', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE, FALSE),

-- Java Memory Model
('c0000000-0000-0000-0000-000000000005', 'a0a00000-0000-0000-0000-000000000003', 90005, 'Stack And Heap Memory in Java (Telusko)', 'https://www.youtube.com/watch?v=_GK3WoFFKUE', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE, FALSE),

-- String Architecture
('c0000000-0000-0000-0000-000000000007', 'a0a00000-0000-0000-0000-000000000004', 90007, 'Strings in Java Complete Lecture (Apna College)', 'https://www.youtube.com/watch?v=vCRD36bG8xQ', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE, FALSE),

-- Arrays
('c0000000-0000-0000-0000-000000000009', 'a0a00000-0000-0000-0000-000000000005', 90009, 'Arrays Introduction in Java (Apna College)', 'https://www.youtube.com/watch?v=n67D-pP734c', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE, FALSE),
('c0000000-0000-0000-0000-000000000015', 'a0a00000-0000-0000-0000-000000000005', 90015, '2D Arrays in Java (Apna College)', 'https://www.youtube.com/watch?v=QdjjgiqhjDY', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE, FALSE),

-- Lists
('c0000000-0000-0000-0000-000000000010', 'a0a00000-0000-0000-0000-000000000006', 90010, 'ArrayList In Java + Notes (Apna College)', 'https://www.youtube.com/watch?v=liFyhzZl9uw', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE, FALSE),

-- Maps & Sets
('c0000000-0000-0000-0000-000000000011', 'a0a00000-0000-0000-0000-000000000007', 90011, 'HashMap in Java Hashing (Apna College)', 'https://www.youtube.com/watch?v=KDZ_IXvpMG4', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE, FALSE),

-- Queues & Custom Sorting
('c0000000-0000-0000-0000-000000000013', 'a0a00000-0000-0000-0000-000000000008', 90013, 'Stack Data Structure in One Video (Apna College)', 'https://www.youtube.com/watch?v=7m1DMYAbdiY', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE, FALSE),

-- Exception Handling & Generics
('c0000000-0000-0000-0000-000000000014', 'a0a00000-0000-0000-0000-000000000009', 90014, 'Errors & Exception Handling in Java (CodeWithHarry)', 'https://www.youtube.com/watch?v=kYJ4a11Yn-Y', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE, FALSE);

-- 3. Seed detail templates for these resources
INSERT INTO problem_details (problem_id, intuition, approach, code_snippet, complexity_analysis, what_i_learned)
SELECT id, 'Study theoretical fundamentals and video tutorials.', 'Watch reference videos and read official documentations.', '// Theoretical Resource Link: No code required', 'N/A', 'Fundamental concept' FROM problems 
WHERE leetcode_number >= 90000 AND leetcode_number < 90100
ON CONFLICT (problem_id) DO NOTHING;
