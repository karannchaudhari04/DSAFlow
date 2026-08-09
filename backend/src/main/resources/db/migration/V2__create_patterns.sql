CREATE TABLE patterns (
    id UUID PRIMARY KEY,
    phase_id UUID NOT NULL,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT NOT NULL,
    recognition_clues TEXT,
    intuition TEXT,
    generic_approach TEXT,
    time_complexity VARCHAR(50),
    space_complexity VARCHAR(50),
    common_mistakes TEXT,
    mastery_status VARCHAR(50) NOT NULL,
    sequence_order INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_patterns_phase FOREIGN KEY (phase_id) REFERENCES phases(id) ON DELETE CASCADE
);

CREATE INDEX idx_patterns_phase_id ON patterns(phase_id);
CREATE INDEX idx_patterns_mastery ON patterns(mastery_status);
