CREATE TABLE users (
    id UUID PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    role VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Seed a default user with username "demo_user" and password "password" (BCrypt hashed)
INSERT INTO users (id, username, password, email, role)
VALUES (
    'd0d00000-0000-0000-0000-000000000001',
    'demo_user',
    '$2a$10$tM.yF5qN9u.Y4o1v46UkeeeO/tqHjC0d1z8FpXgK/q/24.9YV1xL.',
    'demo@dsa.com',
    'ROLE_USER'
);

-- Add user_id to problems
ALTER TABLE problems ADD COLUMN user_id UUID REFERENCES users(id) ON DELETE CASCADE;

-- Link existing seeded problems to our default user
UPDATE problems SET user_id = 'd0d00000-0000-0000-0000-000000000001' WHERE user_id IS NULL;

-- Make user_id NOT NULL
ALTER TABLE problems ALTER COLUMN user_id SET NOT NULL;

-- Drop constraints
ALTER TABLE problems DROP CONSTRAINT IF EXISTS problems_leetcode_number_key;

-- Add user + leetcode constraint
ALTER TABLE problems ADD CONSTRAINT unique_user_leetcode UNIQUE (user_id, leetcode_number);
