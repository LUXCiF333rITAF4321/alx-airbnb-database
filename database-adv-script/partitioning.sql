-- Drop table if exists for testing
DROP TABLE IF EXISTS Booking CASCADE;

-- Create partitioned Booking table
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Create partitions by year
CREATE TABLE booking_2023 PARTITION OF Booking
FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE booking_2024 PARTITION OF Booking
FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Example query to test performance on partitioned table
EXPLAIN
SELECT * 
FROM Booking
WHERE start_date BETWEEN '2023-06-01' AND '2023-06-30'; 
