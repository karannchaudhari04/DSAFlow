-- V3: Add user settings table for mobile number and SMS notifications
CREATE TABLE IF NOT EXISTS user_settings (
    id UUID PRIMARY KEY,
    mobile_number VARCHAR(20),
    sms_notifications_enabled BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Seed default settings row
INSERT INTO user_settings (id, mobile_number, sms_notifications_enabled)
VALUES ('e0a00000-0000-0000-0000-000000000001', NULL, TRUE)
ON CONFLICT (id) DO NOTHING;
