-- V18: Reframe DSA Foundations (Phase 1) patterns and distribute problems correctly

-- 1. Remove Phase 1 problems
DELETE FROM problems WHERE pattern_id IN (
    SELECT id FROM patterns WHERE phase_id = 'b0a00000-0000-0000-0000-000000000001'
) OR id IN (
    'c0000000-0000-0000-0000-000000000101',
    'c0000000-0000-0000-0000-000000000102',
    'c0000000-0000-0000-0000-000000000103',
    'c0000000-0000-0000-0000-000000000104'
);

-- 2. Delete existing patterns for Phase 1
DELETE FROM patterns WHERE phase_id = 'b0a00000-0000-0000-0000-000000000001';

-- 3. Re-insert the 3 distinct subtopic patterns for Phase 1
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000000101', 'b0a00000-0000-0000-0000-000000000001', 'Time Complexity', 'Understanding execution step limits and calculating Time Complexity using Big O.', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'LEARNING', 1),
('a0a00000-0000-0000-0000-000000000102', 'b0a00000-0000-0000-0000-000000000001', 'Space Complexity', 'Understanding auxiliary memory space usage and avoiding Time Limit Exceeded (TLE).', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'LEARNING', 2),
('a0a00000-0000-0000-0000-000000000103', 'b0a00000-0000-0000-0000-000000000001', 'Recursion Basics', 'Understanding call stacks, base cases, and writing basic recursive functions.', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'LEARNING', 3);

-- 4. Re-insert the problems, distributing them correctly to their respective patterns
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, leetcode_verified) VALUES
-- Time Complexity (Pattern 0101)
('c0000000-0000-0000-0000-000000000101', 'a0a00000-0000-0000-0000-000000000101', 90101, 'Time Complexity & Execution Limits (Love Babbar)', 'https://youtu.be/VAu-w8lCoF8', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE, FALSE),

-- Space Complexity (Pattern 0102)
('c0000000-0000-0000-0000-000000000102', 'a0a00000-0000-0000-0000-000000000102', 90102, 'Space Complexity & Avoiding TLE Errors (Love Babbar)', 'https://youtu.be/VAu-w8lCoF8', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE, FALSE),

-- Recursion Basics (Pattern 0103)
('c0000000-0000-0000-0000-000000000103', 'a0a00000-0000-0000-0000-000000000103', 90103, 'Recursion Part 1 Introduction & Basics (Love Babbar)', 'https://youtu.be/2kS5XRW6cpY', 'EASY', 'NOT_STARTED', '2026-08-08', NULL, 1, TRUE, FALSE);

-- 5. Seed detail templates for these resources
INSERT INTO problem_details (problem_id, intuition, approach, code_snippet, complexity_analysis, what_i_learned)
SELECT id, 'Study theoretical fundamentals and video tutorials.', 'Watch reference videos and read official documentations.', '// Theoretical Resource Link: No code required', 'N/A', 'Fundamental concept' FROM problems 
WHERE leetcode_number >= 90100
ON CONFLICT (problem_id) DO NOTHING;
