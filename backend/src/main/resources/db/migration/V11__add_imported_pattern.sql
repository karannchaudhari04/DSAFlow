-- Seed Imported Pattern for Phase 1 (DSA Foundations)
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) 
VALUES (
  'a0a00000-0000-0000-0000-000000000000', 
  'f0a00000-0000-0000-0000-000000000001', 
  'Imported from LeetCode', 
  'General solved problems imported directly from your LeetCode profile.', 
  'Imported problem', 
  'Review pattern categorization later.', 
  'Re-categorize this problem to its correct pattern.', 
  'N/A', 
  'N/A', 
  'N/A', 
  'NOT_STARTED', 
  99
) ON CONFLICT (id) DO NOTHING;
