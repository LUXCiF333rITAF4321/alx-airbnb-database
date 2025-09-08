-- Initial query: retrieve all bookings with user, property, and payment details
SELECT b.booking_id, u.name, p.title, pay.amount, pay.status
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.booking_id IS NOT NULL
AND u.user_id IS NOT NULL;

-- Analyze performance using EXPLAIN
EXPLAIN
SELECT b.booking_id, u.name, p.title, pay.amount, pay.status
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.booking_id IS NOT NULL
AND u.user_id IS NOT NULL;
