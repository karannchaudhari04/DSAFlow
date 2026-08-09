CREATE TABLE problem_details (
    problem_id UUID PRIMARY KEY,
    intuition TEXT NOT NULL,
    approach TEXT NOT NULL,
    code_snippet TEXT NOT NULL,
    complexity_analysis TEXT,
    what_i_learned TEXT,
    CONSTRAINT fk_details_problem FOREIGN KEY (problem_id) REFERENCES problems(id) ON DELETE CASCADE
);
