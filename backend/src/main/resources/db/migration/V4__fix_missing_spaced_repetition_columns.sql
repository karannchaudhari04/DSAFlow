-- V4: Idempotent fix — ensure spaced repetition columns exist in production
-- V2 was never applied to the production DB, so these columns are missing.
-- Using IF NOT EXISTS makes this safe to run even if columns already exist locally.

ALTER TABLE problems ADD COLUMN IF NOT EXISTS ease_factor DOUBLE PRECISION DEFAULT 2.5;
ALTER TABLE problems ADD COLUMN IF NOT EXISTS repetition_count INT DEFAULT 0;
ALTER TABLE problems ADD COLUMN IF NOT EXISTS interval_days INT DEFAULT 0;

ALTER TABLE revisions ADD COLUMN IF NOT EXISTS rating INT;
ALTER TABLE revisions ADD COLUMN IF NOT EXISTS notes TEXT;
