# Performance Monitoring Report

## Objective
Continuously monitor and refine database performance by analyzing query execution plans.

## Queries Monitored
1. Join query: bookings + users + properties + payments.
2. Aggregation query: total bookings per user.
3. Subquery: properties with average rating > 4.0.

## Analysis
- **Join query**: EXPLAIN ANALYZE showed sequential scans on `Booking` and `User`, causing high cost.
- **Aggregation query**: Performed a full scan on `Booking` before grouping.
- **Subquery**: Executed a nested scan on `Review` for each property.

## Bottlenecks Identified
- Lack of indexes on foreign key columns (`user_id`, `property_id`).
- Repeated scans on `Review` for average rating calculation.

## Implemented Changes
- Added indexes:
  - `Booking(user_id)`
  - `Booking(property_id)`
  - `Review(property_id)`
- Suggested materializing average ratings in a summary table if needed for frequent queries.
- Combined with earlier partitioning on `Booking` to limit scan ranges.

## Improvements
- Join query runtime reduced significantly due to index lookups.
- Aggregation query now uses index scans.
- Subquery improved with index on `Review(property_id)`.
- Overall query performance improved, confirmed by lower cost in EXPLAIN ANALYZE results.

## Conclusion
Indexes and schema adjustments (partitioning, precomputing aggregates) are effective in removing bottlenecks and ensuring scalability.
