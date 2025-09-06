-- Seed data for Users
INSERT INTO `User` (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('u1', 'Alice', 'Johnson', 'alice@example.com', 'hashed_password1', '1234567890', 'guest'),
('u2', 'Bob', 'Smith', 'bob@example.com', 'hashed_password2', '0987654321', 'host');

-- Seed data for Properties
INSERT INTO `Property` (property_id, host_id, name, description, location, price_per_night)
VALUES
('p1', 'u2', 'Sunny Apartment', 'A cozy apartment in downtown.', 'New York', 120.00);
