CREATE TABLE revisions (
    id UUID PRIMARY KEY,
    problem_id UUID NOT NULL,
    revision_number INT NOT NULL,
    due_date DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    completed_date DATE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_revisions_problem FOREIGN KEY (problem_id) REFERENCES problems(id) ON DELETE CASCADE
);

CREATE INDEX idx_revisions_problem_id ON revisions(problem_id);
CREATE INDEX idx_revisions_due_date_status ON revisions(due_date, status);
