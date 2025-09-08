# Optimization Report

## Initial Query
The initial query joined **Booking**, **User**, **Property**, and **Payment** using only `JOIN`.  
This caused:
- Full table scans
- High execution time on large datasets
- Rows being excluded when no payment existed

## Analysis with EXPLAIN
- The execution plan showed sequential scans on Booking and Payment.
- No indexes were used on foreign keys.
- Payments `JOIN` was dropping rows for bookings without payments.

## Optimizations Applied
1. Added indexes:
   - `Booking(user_id)`
   - `Booking(property_id)`
   - `Payment(booking_id)`

2. Changed `JOIN Payment` → `LEFT JOIN Payment` to include bookings without payments.

## Refactored Query
The optimized query reduced execution time by avoiding unnecessary scans and ensuring indexes are used.  
It is more scalable for large datasets.
