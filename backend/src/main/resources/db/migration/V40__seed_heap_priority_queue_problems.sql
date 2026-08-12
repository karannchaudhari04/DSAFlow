-- V40: Restructure and seed Heap / Priority Queue phase (Phase 15)

-- 1. Register the 11 Heap / PQ subtopic patterns
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000001401', 'b0a00000-0000-0000-0000-000000000014', 'HEAP BASICS / PRIORITY QUEUE', 'Seeding basics of Heap/PQ algorithms to track min/max elements.', 'Use Heap/PQ to dynamically track min/max elements.', 'Maintain element order dynamically with logarithmic insertions/deletions.', 'Push and pop elements into PriorityQueue.', 'O(log N)', 'O(N)', 'Failing to balance or update root correctly.', 'NOT_STARTED', 1),
('a0a00000-0000-0000-0000-000000001402', 'b0a00000-0000-0000-0000-000000000014', 'KTH LARGEST / KTH SMALLEST', 'Finding the Kth largest or smallest element in a stream or collection.', 'Find the Kth largest or smallest element in a stream or collection.', 'Use min-heap of size K for Kth largest, or max-heap of size K for Kth smallest.', 'Iterate elements and maintain heap of size K.', 'O(N log K)', 'O(K)', 'Pushing all elements to heap instead of maintaining size K.', 'NOT_STARTED', 2),
('a0a00000-0000-0000-0000-000000001403', 'b0a00000-0000-0000-0000-000000000014', 'TOP K ELEMENTS', 'Retrieving top K elements based on some criteria.', 'Find the top K elements satisfying a specific condition.', 'Use heap to store K elements and filter out the rest.', 'Keep a heap of size K to retain highest priority elements.', 'O(N log K)', 'O(K)', 'Using incorrect heap type (min vs max heap).', 'NOT_STARTED', 3),
('a0a00000-0000-0000-0000-000000001404', 'b0a00000-0000-0000-0000-000000000014', 'HEAP + HASHING / FREQUENCY', 'Combining HashMaps with Heap to rank elements by frequencies.', 'Retrieve top elements based on element frequencies.', 'Map elements to counts, then push unique elements or frequencies to Heap.', 'Populate frequency map first, then insert entries into min-heap.', 'O(N log K)', 'O(N)', 'Re-inserting elements without combining duplicates first.', 'NOT_STARTED', 4),
('a0a00000-0000-0000-0000-000000001405', 'b0a00000-0000-0000-0000-000000000014', 'TWO HEAPS', 'Utilizing two heaps to split input ranges or find medians.', 'Dynamically find the median of a stream or split elements in half.', 'Maintain lower half in max-heap and upper half in min-heap.', 'Balance two heaps during stream inserts.', 'O(log N)', 'O(N)', 'Failing to balance size difference between heaps.', 'NOT_STARTED', 5),
('a0a00000-0000-0000-0000-000000001406', 'b0a00000-0000-0000-0000-000000000014', 'MERGE K SORTED STRUCTURES', 'Merging K sorted elements using a priority queue.', 'Combine K sorted lists, arrays, or streams into one sorted output.', 'Store the head pointer/value of each sorted structure in min-heap.', 'Populate min-heap with heads, extract min, insert next element.', 'O(N log K)', 'O(K)', 'Neglecting to update next pointer references.', 'NOT_STARTED', 6),
('a0a00000-0000-0000-0000-000000001407', 'b0a00000-0000-0000-0000-000000000014', 'HEAP + GREEDY', 'Satisfying greedy selections step-by-step using Heap.', 'Make optimal step-by-step local choices dynamically.', 'Repeatedly extract the minimum/maximum element to satisfy greedy choices.', 'Extract elements from PQ to make decisions.', 'O(N log N)', 'O(N)', 'Pushing elements to heap without matching greedy constraints.', 'NOT_STARTED', 7),
('a0a00000-0000-0000-0000-000000001408', 'b0a00000-0000-0000-0000-000000000014', 'HEAP + SORTING', 'Executing partial sort or full Heap Sort.', 'Partially sort elements or retrieve sorted sequences with constraints.', 'Push all elements to heap and extract to sort, or heapify active elements.', 'Standard Heap Sort implementation.', 'O(N log N)', 'O(N)', 'Not reusing original array space in Heap Sort.', 'NOT_STARTED', 8),
('a0a00000-0000-0000-0000-000000001409', 'b0a00000-0000-0000-0000-000000000014', 'CUSTOM PRIORITY QUEUE / COMPARATOR', 'Constructing priority queues with custom sorting logic.', 'Order custom objects or elements using non-trivial sorting rules.', 'Provide custom comparators (or lambda sorting) to structure Priority Queue.', 'Instantiate PriorityQueue with customized comparator logic.', 'O(log N)', 'O(N)', 'Unstable sorting behavior from non-transitive comparators.', 'NOT_STARTED', 9),
('a0a00000-0000-0000-0000-000000001410', 'b0a00000-0000-0000-0000-000000000014', 'TASK / SCHEDULING PATTERN', 'Scheduling tasks based on runtimes, dependency order, or cooldowns.', 'Schedule tasks with dependencies, cool-down periods, or run-times.', 'Track task execution states and retrieve highest priority tasks.', 'Utilize heap to pull ready tasks dynamically.', 'O(N log N)', 'O(N)', 'Failing to handle task cooldown states.', 'NOT_STARTED', 10),
('a0a00000-0000-0000-0000-000000001411', 'b0a00000-0000-0000-0000-000000000014', 'ADVANCED HEAP PATTERNS', 'Solving complex, harder heap variations.', 'Harder variations involving sliding window bounds or complex transitions.', 'Combine heap with hash maps for lazy deletion or binary search index tracking.', 'Deploy dual heaps or lazy maps for index lookups.', 'O(N log N)', 'O(N)', 'Overcomplicating the heap structure when simpler solutions apply.', 'NOT_STARTED', 11)
ON CONFLICT (id) DO UPDATE SET 
    name = EXCLUDED.name, 
    description = EXCLUDED.description, 
    recognition_clues = EXCLUDED.recognition_clues, 
    intuition = EXCLUDED.intuition, 
    sequence_order = EXCLUDED.sequence_order;

-- 2. Move existing Heap/PQ problems strictly by ID
UPDATE problems SET pattern_id = 'a0a00000-0000-0000-0000-000000001402', name = 'Kth Largest Element in a Stream', purpose = 'Track kth element dynamically in stream' WHERE id = 'c0000000-0000-0000-0000-000000001401';
UPDATE problems SET pattern_id = 'a0a00000-0000-0000-0000-000000001403', name = 'Top K Frequent Elements', purpose = 'Count frequencies and find top k elements using a min-heap' WHERE id = 'c0000000-0000-0000-0000-000000001402';
UPDATE problems SET pattern_id = 'a0a00000-0000-0000-0000-000000001406', name = 'Merge k Sorted Lists', purpose = 'Extract min list nodes dynamically using min-heap' WHERE id = 'c0000000-0000-0000-0000-000000001405';

-- 3. Seed remaining practice problems
-- Pattern 1: HEAP BASICS / PRIORITY QUEUE
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001421', 'a0a00000-0000-0000-0000-000000001401', 1046, 'Last Stone Weight', 'https://leetcode.com/problems/last-stone-weight/', 'EASY', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Repeatedly smash two heaviest stones using a max-heap'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001401' AND leetcode_number = 1046);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001420', 'a0a00000-0000-0000-0000-000000001401', 703, 'Kth Largest Element in a Stream', 'https://leetcode.com/problems/kth-largest-element-in-a-stream/', 'EASY', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Keep track of the kth largest element using a min-heap of size k'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001401' AND leetcode_number = 703);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001422', 'a0a00000-0000-0000-0000-000000001401', 2558, 'Take Gifts From the Richest Pile', 'https://leetcode.com/problems/take-gifts-from-the-richest-pile/', 'EASY', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Pick richest pile and replace with square root of gifts repeatedly'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001401' AND leetcode_number = 2558);

-- Pattern 2: KTH LARGEST / KTH SMALLEST
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001423', 'a0a00000-0000-0000-0000-000000001402', 215, 'Kth Largest Element in an Array', 'https://leetcode.com/problems/kth-largest-element-in-an-array/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Retrieve kth largest element using a min-heap of size k'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001402' AND leetcode_number = 215);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001424', 'a0a00000-0000-0000-0000-000000001402', 378, 'Kth Smallest Element in a Sorted Matrix', 'https://leetcode.com/problems/kth-smallest-element-in-a-sorted-matrix/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Traverse matrix partitions using a heap of row pointers'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001402' AND leetcode_number = 378);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001425', 'a0a00000-0000-0000-0000-000000001402', 703, 'Kth Largest Element in a Stream', 'https://leetcode.com/problems/kth-largest-element-in-a-stream/', 'EASY', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Track kth element dynamically in stream'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001402' AND leetcode_number = 703);

-- Pattern 3: TOP K ELEMENTS
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001450', 'a0a00000-0000-0000-0000-000000001403', 347, 'Top K Frequent Elements', 'https://leetcode.com/problems/top-k-frequent-elements/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Count frequencies and find top k elements using a min-heap'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001403' AND leetcode_number = 347);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001426', 'a0a00000-0000-0000-0000-000000001403', 973, 'K Closest Points to Origin', 'https://leetcode.com/problems/k-closest-points-to-origin/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Track k closest coordinates using distance comparator in max-heap'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001403' AND leetcode_number = 973);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001427', 'a0a00000-0000-0000-0000-000000001403', 692, 'Top K Frequent Words', 'https://leetcode.com/problems/top-k-frequent-words/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Retrieve top k words sorted by count and lexicographical order'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001403' AND leetcode_number = 692);

-- Pattern 4: HEAP + HASHING / FREQUENCY
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001428', 'a0a00000-0000-0000-0000-000000001404', 347, 'Top K Frequent Elements', 'https://leetcode.com/problems/top-k-frequent-elements/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Map elements to counts, then filter top elements using heap'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001404' AND leetcode_number = 347);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001429', 'a0a00000-0000-0000-0000-000000001404', 692, 'Top K Frequent Words', 'https://leetcode.com/problems/top-k-frequent-words/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Map words to frequencies, then insert into lexicographical heap'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001404' AND leetcode_number = 692);

-- Pattern 5: TWO HEAPS
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001430', 'a0a00000-0000-0000-0000-000000001405', 295, 'Find Median from Data Stream', 'https://leetcode.com/problems/find-median-from-data-stream/', 'HARD', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Maintain stream split between lower max-heap and upper min-heap'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001405' AND leetcode_number = 295);

-- Pattern 6: MERGE K SORTED STRUCTURES
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001452', 'a0a00000-0000-0000-0000-000000001406', 23, 'Merge k Sorted Lists', 'https://leetcode.com/problems/merge-k-sorted-lists/', 'HARD', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Extract min list nodes dynamically using min-heap'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001406' AND leetcode_number = 23);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001431', 'a0a00000-0000-0000-0000-000000001406', 632, 'Smallest Range Covering Elements from K Lists', 'https://leetcode.com/problems/smallest-range-covering-elements-from-k-lists/', 'HARD', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Maintain range bounds of active pointers from k sorted lists using min-heap'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001406' AND leetcode_number = 632);

-- Pattern 7: HEAP + GREEDY
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001432', 'a0a00000-0000-0000-0000-000000001407', 2542, 'Maximum Subsequence Score', 'https://leetcode.com/problems/maximum-subsequence-score/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Keep track of maximum sum elements using min-heap of size k while iterating'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001407' AND leetcode_number = 2542);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001433', 'a0a00000-0000-0000-0000-000000001407', 1167, 'Minimum Cost to Connect Sticks', 'https://leetcode.com/problems/minimum-cost-to-connect-sticks/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Repeatedly combine two shortest sticks using a min-heap'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001407' AND leetcode_number = 1167);

-- Pattern 8: HEAP + SORTING
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001434', 'a0a00000-0000-0000-0000-000000001408', 912, 'Sort an Array', 'https://leetcode.com/problems/sort-an-array/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Sort an array using standard Heap Sort algorithm'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001408' AND leetcode_number = 912);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001435', 'a0a00000-0000-0000-0000-000000001408', 451, 'Sort Characters By Frequency', 'https://leetcode.com/problems/sort-characters-by-frequency/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Sort characters in string based on their frequency using a heap'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001408' AND leetcode_number = 451);

-- Pattern 9: CUSTOM PRIORITY QUEUE / COMPARATOR
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001436', 'a0a00000-0000-0000-0000-000000001409', 23, 'Merge k Sorted Lists', 'https://leetcode.com/problems/merge-k-sorted-lists/', 'HARD', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Merge k sorted lists using custom node comparator in PQ'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001409' AND leetcode_number = 23);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001437', 'a0a00000-0000-0000-0000-000000001409', 767, 'Reorganize String', 'https://leetcode.com/problems/reorganize-string/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Reorganize string characters using custom frequency comparator'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001409' AND leetcode_number = 767);

-- Pattern 10: TASK / SCHEDULING PATTERN
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001438', 'a0a00000-0000-0000-0000-000000001410', 621, 'Task Scheduler', 'https://leetcode.com/problems/task-scheduler/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Manage task cooldowns using max-heap and queue tracking'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001410' AND leetcode_number = 621);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001439', 'a0a00000-0000-0000-0000-000000001410', 1834, 'Single-Threaded CPU', 'https://leetcode.com/problems/single-threaded-cpu/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Queue tasks by execution time and index to process CPU schedule'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001410' AND leetcode_number = 1834);

-- Pattern 11: ADVANCED HEAP PATTERNS
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001440', 'a0a00000-0000-0000-0000-000000001411', 480, 'Sliding Window Median', 'https://leetcode.com/problems/sliding-window-median/', 'HARD', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Maintain median within sliding window using dual balance heaps'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001411' AND leetcode_number = 480);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001441', 'a0a00000-0000-0000-0000-000000001411', 502, 'IPO', 'https://leetcode.com/problems/ipo/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Maximize capital using capital min-heap and profit max-heap'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001411' AND leetcode_number = 502);

INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose)
SELECT 'c0000000-0000-0000-0000-000000001442', 'a0a00000-0000-0000-0000-000000001411', 871, 'Minimum Number of Refueling Stops', 'https://leetcode.com/problems/minimum-number-of-refueling-stops/', 'HARD', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Keep track of fuel stations using greedy choice max-heap'
WHERE NOT EXISTS (SELECT 1 FROM problems WHERE pattern_id = 'a0a00000-0000-0000-0000-000000001411' AND leetcode_number = 871);
