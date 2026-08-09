CREATE TABLE mistakes (
    id UUID PRIMARY KEY,
    problem_id UUID NOT NULL,
    pattern_id UUID NOT NULL,
    description TEXT NOT NULL,
    correct_understanding TEXT NOT NULL,
    date_created DATE NOT NULL,
    is_resolved BOOLEAN NOT NULL DEFAULT FALSE,
    revision_count INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_mistakes_problem FOREIGN KEY (problem_id) REFERENCES problems(id) ON DELETE CASCADE,
    CONSTRAINT fk_mistakes_pattern FOREIGN KEY (pattern_id) REFERENCES patterns(id) ON DELETE RESTRICT
);

CREATE INDEX idx_mistakes_problem_id ON mistakes(problem_id);
CREATE INDEX idx_mistakes_pattern_id ON mistakes(pattern_id);
CREATE INDEX idx_mistakes_is_resolved ON mistakes(is_resolved);
