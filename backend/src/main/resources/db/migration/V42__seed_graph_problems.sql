-- V42: Restructure and seed Graphs phase (Phase 17)

-- 1. Rename the Phase 17 topic in phases table
UPDATE phases SET topic = 'Graphs' WHERE id = 'b0a00000-0000-0000-0000-000000000016';

-- 2. Delete old problems and patterns under Phase 17 to prevent primary key/unique constraint violations
DELETE FROM problems WHERE pattern_id IN (SELECT id FROM patterns WHERE phase_id = 'b0a00000-0000-0000-0000-000000000016');
DELETE FROM patterns WHERE phase_id = 'b0a00000-0000-0000-0000-000000000016';

-- 3. Register the 14 Graph subtopic patterns
INSERT INTO patterns (id, phase_id, name, description, recognition_clues, intuition, generic_approach, time_complexity, space_complexity, common_mistakes, mastery_status, sequence_order) VALUES
('a0a00000-0000-0000-0000-000000001601', 'b0a00000-0000-0000-0000-000000000016', 'GRAPH REPRESENTATION & BASICS', 'Converting edges or vertices into adjacency lists/matrices.', 'Converting edges or vertices into adjacency lists/matrices.', 'Find center or degrees of graph structures.', 'Build map of lists or arrays tracking indegree/outdegree.', 'O(V + E)', 'O(V + E)', 'Confusing 0-based vs 1-based indexing.', 'NOT_STARTED', 1),
('a0a00000-0000-0000-0000-000000001602', 'b0a00000-0000-0000-0000-000000000016', 'DFS — DEPTH FIRST SEARCH', 'Deep exploration of graph paths or grid cells.', 'Deep exploration of graph paths or grid cells.', 'Traverse nodes recursively, marking visited status.', 'Implement DFS functions tracking a visited boolean set.', 'O(V + E)', 'O(V)', 'Failing to track visited status, resulting in infinite loops.', 'NOT_STARTED', 2),
('a0a00000-0000-0000-0000-000000001603', 'b0a00000-0000-0000-0000-000000000016', 'BFS — BREADTH FIRST SEARCH', 'Level-by-level traversal of graphs/grids.', 'Level-by-level traversal of graphs/grids.', 'Queue-based exploration for shortest path or multi-source propagation.', 'Incorporate a tracking queue and pop elements layer-by-layer.', 'O(V + E)', 'O(V)', 'Forgetting to mark nodes as visited when pushing to the queue.', 'NOT_STARTED', 3),
('a0a00000-0000-0000-0000-000000001604', 'b0a00000-0000-0000-0000-000000000016', 'CONNECTED COMPONENTS', 'Finding isolated groups or sets of connected vertices.', 'Find isolated groups or sets of connected vertices.', 'Count traversals required to visit all nodes.', 'Loop over vertices, launching traversals for unvisited nodes.', 'O(V + E)', 'O(V)', 'Failing to iterate through all possible component roots.', 'NOT_STARTED', 4),
('a0a00000-0000-0000-0000-000000001605', 'b0a00000-0000-0000-0000-000000000016', 'CYCLE DETECTION — UNDIRECTED GRAPH', 'Checking if undirected graph contains loops/cycles.', 'Check if undirected graph contains loops/cycles.', 'Track parent nodes in DFS/BFS or use Union-Find.', 'Implement DFS/BFS checking if neighbor is visited and not the parent.', 'O(V + E)', 'O(V)', 'Mistaking parent edges for cycle paths.', 'NOT_STARTED', 5),
('a0a00000-0000-0000-0000-000000001606', 'b0a00000-0000-0000-0000-000000000016', 'CYCLE DETECTION — DIRECTED GRAPH', 'Checking for loops/dependency cycles in directed paths.', 'Check for loops/dependency cycles in directed paths.', 'DFS recursion stack backtracking or Kahn''s topological sort.', 'Track visited recursion paths in DFS, backtracking on exit.', 'O(V + E)', 'O(V)', 'Failing to reset stack states when backtracking.', 'NOT_STARTED', 6),
('a0a00000-0000-0000-0000-000000001607', 'b0a00000-0000-0000-0000-000000000016', 'TOPOLOGICAL SORT', 'Linear ordering of vertices matching dependency order.', 'Linear ordering of vertices matching dependency order.', 'Kahn''s BFS degree reduction or DFS post-order stack.', 'Process zero-indegree elements in Kahn''s queue BFS.', 'O(V + E)', 'O(V)', 'Attempting topological sorting on cyclic graphs.', 'NOT_STARTED', 7),
('a0a00000-0000-0000-0000-000000001608', 'b0a00000-0000-0000-0000-000000000016', 'BIPARTITE GRAPH / 2-COLORING', 'Dividing vertices into two independent sets with no intra-set edges.', 'Divide vertices into two independent sets with no intra-set edges.', 'DFS/BFS node coloring alternating between 0 and 1.', 'Traverse graph coloring nodes alternatively and checking constraints.', 'O(V + E)', 'O(V)', 'Failing to validate coloring on disconnected graph segments.', 'NOT_STARTED', 8),
('a0a00000-0000-0000-0000-000000001609', 'b0a00000-0000-0000-0000-000000000016', 'SHORTEST PATH — UNWEIGHTED GRAPH', 'Minimum distance in graphs with uniform edge weights.', 'Minimum distance in graphs with uniform edge weights.', 'BFS traversal layer count.', 'Implement queue BFS and track layer steps.', 'O(V + E)', 'O(V)', 'Using DFS instead of BFS for unweighted shortest paths.', 'NOT_STARTED', 9),
('a0a00000-0000-0000-0000-000000001610', 'b0a00000-0000-0000-0000-000000000016', 'DIJKSTRA — WEIGHTED SHORTEST PATH', 'Shortest path in graphs with non-negative edge weights.', 'Shortest path in graphs with non-negative edge weights.', 'Min-heap Priority Queue greedily choosing minimum weight edges.', 'Use a min-heap PQ to relax node distances greedily.', 'O(E log V)', 'O(V)', 'Failing to skip processing when a shorter distance is already found.', 'NOT_STARTED', 10),
('a0a00000-0000-0000-0000-000000001611', 'b0a00000-0000-0000-0000-000000000016', 'UNION-FIND / DISJOINT SET UNION', 'Dynamic connectivity, grouping, and set merges.', 'Dynamic connectivity, grouping, and set merges.', 'Find root leaders with path compression and rank union.', 'Implement find and union operations with connectivity compressed.', 'O(alpha(V))', 'O(V)', 'Failing to compress path branches during search.', 'NOT_STARTED', 11),
('a0a00000-0000-0000-0000-000000001612', 'b0a00000-0000-0000-0000-000000000016', 'MINIMUM SPANNING TREE — MST', 'Connecting all vertices with minimum total edge weight.', 'Connect all vertices with minimum total edge weight.', 'Kruskal''s DSU sorting or Prim''s heap vertex connection.', 'Sort edges and link nodes using DSU checking cycles.', 'O(E log E)', 'O(V)', 'Assuming MST is unique or has paths matching shortest paths.', 'NOT_STARTED', 12),
('a0a00000-0000-0000-0000-000000001613', 'b0a00000-0000-0000-0000-000000000016', 'FLOOD FILL / GRID AS GRAPH', 'Flood fill, components, or BFS search on 2D coordinates.', 'Flood fill, components, or BFS search on 2D coordinates.', 'Treat cells as vertices and adjacent directions as edges.', 'Recursively traverse 4/8-direction ranges checking bounds.', 'O(R * C)', 'O(R * C)', 'Infinite recursions due to boundary check errors.', 'NOT_STARTED', 13),
('a0a00000-0000-0000-0000-000000001614', 'b0a00000-0000-0000-0000-000000000016', 'ADVANCED GRAPH PATTERNS', 'Eulerian paths, bridge connections, or double-directed sorts.', 'Eulerian paths, bridge connections, or double-directed sorts.', 'Apply advanced DFS (Tarjan''s) or hierarchical state transitions.', 'Implement Tarjan''s low-link tracking or Hierholzer''s post-order list.', 'O(V + E)', 'O(V)', 'Failing to track discovery times properly.', 'NOT_STARTED', 14);

-- 4. Seed all curated Graph practice problems cleanly
-- Pattern 1: GRAPH REPRESENTATION & BASICS
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
('c0000000-0000-0000-0000-000000001621', 'a0a00000-0000-0000-0000-000000001601', 1791, 'Find Center of Star Graph', 'https://leetcode.com/problems/find-center-of-star-graph/', 'EASY', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Understand graph edges and vertex connectivity'),
('c0000000-0000-0000-0000-000000001622', 'a0a00000-0000-0000-0000-000000001601', 997, 'Find the Town Judge', 'https://leetcode.com/problems/find-the-town-judge/', 'EASY', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Degree tracking and basic graph representation');

-- Pattern 2: DFS — DEPTH FIRST SEARCH
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
('c0000000-0000-0000-0000-000000001623', 'a0a00000-0000-0000-0000-000000001602', 733, 'Flood Fill', 'https://leetcode.com/problems/flood-fill/', 'EASY', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Basic DFS recursion on grid coordinates'),
('c0000000-0000-0000-0000-000000001624', 'a0a00000-0000-0000-0000-000000001602', 200, 'Number of Islands', 'https://leetcode.com/problems/number-of-islands/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'DFS exploration of 2D grid components'),
('c0000000-0000-0000-0000-000000001625', 'a0a00000-0000-0000-0000-000000001602', 695, 'Max Area of Island', 'https://leetcode.com/problems/max-area-of-island/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'DFS traversal tracking component size sum'),
('c0000000-0000-0000-0000-000000001626', 'a0a00000-0000-0000-0000-000000001602', 1971, 'Find if Path Exists in Graph', 'https://leetcode.com/problems/find-if-path-exists-in-graph/', 'EASY', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'DFS traversal on adjacency list representation');

-- Pattern 3: BFS — BREADTH FIRST SEARCH
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
('c0000000-0000-0000-0000-000000001627', 'a0a00000-0000-0000-0000-000000001603', 102, 'Binary Tree Level Order Traversal', 'https://leetcode.com/problems/binary-tree-level-order-traversal/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'BFS fundamentals using queues'),
('c0000000-0000-0000-0000-000000001628', 'a0a00000-0000-0000-0000-000000001603', 200, 'Number of Islands', 'https://leetcode.com/problems/number-of-islands/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'BFS exploration on grids'),
('c0000000-0000-0000-0000-000000001629', 'a0a00000-0000-0000-0000-000000001603', 994, 'Rotting Oranges', 'https://leetcode.com/problems/rotting-oranges/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Multi-source BFS propagation tracking time levels'),
('c0000000-0000-0000-0000-000000001630', 'a0a00000-0000-0000-0000-000000001603', 542, '01 Matrix', 'https://leetcode.com/problems/01-matrix/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Multi-source BFS tracking distances from multiple zeros');

-- Pattern 4: CONNECTED COMPONENTS
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
('c0000000-0000-0000-0000-000000001631', 'a0a00000-0000-0000-0000-000000001604', 547, 'Number of Provinces', 'https://leetcode.com/problems/number-of-provinces/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Find connected component count in adjacency matrix'),
('c0000000-0000-0000-0000-000000001632', 'a0a00000-0000-0000-0000-000000001604', 200, 'Number of Islands', 'https://leetcode.com/problems/number-of-islands/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Identify distinct grid components'),
('c0000000-0000-0000-0000-000000001633', 'a0a00000-0000-0000-0000-000000001604', 841, 'Keys and Rooms', 'https://leetcode.com/problems/keys-and-rooms/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Reachability checks using graph traversal');

-- Pattern 5: CYCLE DETECTION — UNDIRECTED GRAPH
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
('c0000000-0000-0000-0000-000000001634', 'a0a00000-0000-0000-0000-000000001605', 261, 'Graph Valid Tree', 'https://leetcode.com/problems/graph-valid-tree/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'DFS traversal verifying cycle-free undirected connectivity'),
('c0000000-0000-0000-0000-000000001635', 'a0a00000-0000-0000-0000-000000001605', 684, 'Redundant Connection', 'https://leetcode.com/problems/redundant-connection/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Cycle detection using Disjoint Set Union (DSU)');

-- Pattern 6: CYCLE DETECTION — DIRECTED GRAPH
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
('c0000000-0000-0000-0000-000000001636', 'a0a00000-0000-0000-0000-000000001606', 207, 'Course Schedule', 'https://leetcode.com/problems/course-schedule/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Directed cycle detection using DFS recursion stack states'),
('c0000000-0000-0000-0000-000000001637', 'a0a00000-0000-0000-0000-000000001606', 210, 'Course Schedule II', 'https://leetcode.com/problems/course-schedule-ii/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Cycle verification alongside topological vertex ordering');

-- Pattern 7: TOPOLOGICAL SORT
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
('c0000000-0000-0000-0000-000000001638', 'a0a00000-0000-0000-0000-000000001607', 207, 'Course Schedule', 'https://leetcode.com/problems/course-schedule/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Topological ordering checks'),
('c0000000-0000-0000-0000-000000001639', 'a0a00000-0000-0000-0000-000000001607', 210, 'Course Schedule II', 'https://leetcode.com/problems/course-schedule-ii/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Produce linear ordering list using topological sort'),
('c0000000-0000-0000-0000-000000001640', 'a0a00000-0000-0000-0000-000000001607', 2115, 'Find All Possible Recipes from Given Supplies', 'https://leetcode.com/problems/find-all-possible-recipes-from-given-supplies/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Dependency graph resolution using topological sort');

-- Pattern 8: BIPARTITE GRAPH / 2-COLORING
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
('c0000000-0000-0000-0000-000000001641', 'a0a00000-0000-0000-0000-000000001608', 785, 'Is Graph Bipartite?', 'https://leetcode.com/problems/is-graph-bipartite/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'BFS/DFS vertex coloring checks'),
('c0000000-0000-0000-0000-000000001642', 'a0a00000-0000-0000-0000-000000001608', 886, 'Possible Bipartition', 'https://leetcode.com/problems/possible-bipartition/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, '2-coloring checks on dislike constraint graphs');

-- Pattern 9: SHORTEST PATH — UNWEIGHTED GRAPH
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
('c0000000-0000-0000-0000-000000001643', 'a0a00000-0000-0000-0000-000000001609', 1091, 'Shortest Path in Binary Matrix', 'https://leetcode.com/problems/shortest-path-in-binary-matrix/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'BFS shortest path calculation on 8-directional grid'),
('c0000000-0000-0000-0000-000000001644', 'a0a00000-0000-0000-0000-000000001609', 127, 'Word Ladder', 'https://leetcode.com/problems/word-ladder/', 'HARD', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'BFS shortest transformation steps between words');

-- Pattern 10: DIJKSTRA — WEIGHTED SHORTEST PATH
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
('c0000000-0000-0000-0000-000000001645', 'a0a00000-0000-0000-0000-000000001610', 743, 'Network Delay Time', 'https://leetcode.com/problems/network-delay-time/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Dijkstra shortest path calculation on weighted directed graph'),
('c0000000-0000-0000-0000-000000001646', 'a0a00000-0000-0000-0000-000000001610', 1631, 'Path With Minimum Effort', 'https://leetcode.com/problems/path-with-minimum-effort/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Dijkstra variant minimizing maximum absolute difference'),
('c0000000-0000-0000-0000-000000001647', 'a0a00000-0000-0000-0000-000000001610', 787, 'Cheapest Flights Within K Stops', 'https://leetcode.com/problems/cheapest-flights-within-k-stops/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Weighted shortest path with stops count constraint');

-- Pattern 11: UNION-FIND / DISJOINT SET UNION
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
('c0000000-0000-0000-0000-000000001648', 'a0a00000-0000-0000-0000-000000001611', 684, 'Redundant Connection', 'https://leetcode.com/problems/redundant-connection/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'DSU fundamentals checking edge connectivity'),
('c0000000-0000-0000-0000-000000001649', 'a0a00000-0000-0000-0000-000000001611', 547, 'Number of Provinces', 'https://leetcode.com/problems/number-of-provinces/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'DSU set merging to count component leaders'),
('c0000000-0000-0000-0000-000000001650', 'a0a00000-0000-0000-0000-000000001611', 721, 'Accounts Merge', 'https://leetcode.com/problems/accounts-merge/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'DSU union merges with name mapping groupings');

-- Pattern 12: MINIMUM SPANNING TREE — MST
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
('c0000000-0000-0000-0000-000000001651', 'a0a00000-0000-0000-0000-000000001612', 1584, 'Min Cost to Connect All Points', 'https://leetcode.com/problems/min-cost-to-connect-all-points/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'MST calculation using Kruskal''s or Prim''s algorithm'),
('c0000000-0000-0000-0000-000000001652', 'a0a00000-0000-0000-0000-000000001612', 1135, 'Connecting Cities With Minimum Cost', 'https://leetcode.com/problems/connecting-cities-with-minimum-cost/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'MST calculation connecting nodes with minimum edge cost');

-- Pattern 13: FLOOD FILL / GRID AS GRAPH
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
('c0000000-0000-0000-0000-000000001653', 'a0a00000-0000-0000-0000-000000001613', 733, 'Flood Fill', 'https://leetcode.com/problems/flood-fill/', 'EASY', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Basic grid DFS coordinate changes'),
('c0000000-0000-0000-0000-000000001654', 'a0a00000-0000-0000-0000-000000001613', 200, 'Number of Islands', 'https://leetcode.com/problems/number-of-islands/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Grid components identification'),
('c0000000-0000-0000-0000-000000001655', 'a0a00000-0000-0000-0000-000000001613', 994, 'Rotting Oranges', 'https://leetcode.com/problems/rotting-oranges/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Multi-source BFS tracking rotting expansion'),
('c0000000-0000-0000-0000-000000001656', 'a0a00000-0000-0000-0000-000000001613', 79, 'Word Search', 'https://leetcode.com/problems/word-search/', 'MEDIUM', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'DFS + backtracking grid path verification');

-- Pattern 14: ADVANCED GRAPH PATTERNS
INSERT INTO problems (id, pattern_id, leetcode_number, name, url, difficulty, status, date_solved, time_taken_minutes, attempts_count, independent_solve, purpose) VALUES
('c0000000-0000-0000-0000-000000001657', 'a0a00000-0000-0000-0000-000000001614', 127, 'Word Ladder', 'https://leetcode.com/problems/word-ladder/', 'HARD', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'BFS word mutation search'),
('c0000000-0000-0000-0000-000000001658', 'a0a00000-0000-0000-0000-000000001614', 332, 'Reconstruct Itinerary', 'https://leetcode.com/problems/reconstruct-itinerary/', 'HARD', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'DFS + Eulerian path verification using post-order traversal'),
('c0000000-0000-0000-0000-000000001659', 'a0a00000-0000-0000-0000-000000001614', 269, 'Alien Dictionary', 'https://leetcode.com/problems/alien-dictionary/', 'HARD', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Topological sorting on alien character dependencies'),
('c0000000-0000-0000-0000-000000001660', 'a0a00000-0000-0000-0000-000000001614', 1192, 'Critical Connections in a Network', 'https://leetcode.com/problems/critical-connections-in-a-network/', 'HARD', 'NOT_STARTED', '2026-08-12', NULL, 0, TRUE, 'Tarjan''s bridge finder algorithm');
