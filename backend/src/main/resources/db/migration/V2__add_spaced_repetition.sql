-- V2: Add spaced repetition support columns to problems and revisions
ALTER TABLE problems ADD COLUMN ease_factor DOUBLE PRECISION DEFAULT 2.5;
ALTER TABLE problems ADD COLUMN repetition_count INT DEFAULT 0;
ALTER TABLE problems ADD COLUMN interval_days INT DEFAULT 0;

ALTER TABLE revisions ADD COLUMN rating INT;
ALTER TABLE revisions ADD COLUMN notes TEXT;
