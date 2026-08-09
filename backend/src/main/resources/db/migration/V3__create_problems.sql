CREATE TABLE problems (
    id UUID PRIMARY KEY,
    pattern_id UUID NOT NULL,
    leetcode_number INT NOT NULL UNIQUE,
    name VARCHAR(200) NOT NULL,
    url VARCHAR(500) NOT NULL,
    difficulty VARCHAR(50) NOT NULL,
    status VARCHAR(50) NOT NULL,
    date_solved DATE NOT NULL,
    time_taken_minutes INT,
    attempts_count INT NOT NULL DEFAULT 1,
    independent_solve BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_problems_pattern FOREIGN KEY (pattern_id) REFERENCES patterns(id) ON DELETE RESTRICT
);

CREATE INDEX idx_problems_pattern_id ON problems(pattern_id);
CREATE INDEX idx_problems_status ON problems(status);
CREATE INDEX idx_problems_difficulty ON problems(difficulty);
