# Partitioning Performance Report

## Objective
Optimize queries on the Booking table by using partitioning on the `start_date` column.

## Implementation
- The `Booking` table was partitioned by **range** on the `start_date`.
- Partitions were created for each year (e.g., `booking_2023`, `booking_2024`).
- Queries filtering by date ranges now only scan the relevant partition(s).

## Performance Comparison
- **Before partitioning**: Queries on `Booking` scanned the entire table regardless of date.
- **After partitioning**: Queries on a specific date range only scanned the relevant partition (e.g., `booking_2023`).
- The `EXPLAIN` plan confirmed reduced scan cost.

## Conclusion
Partitioning significantly improves query performance on large datasets when filtering by date ranges, as it limits the amount of scanned data.
