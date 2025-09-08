# SQL Joins Queries

This directory contains advanced SQL join queries for the **Airbnb Database project**.

## Files
- `joins_queries.sql` → SQL queries using INNER JOIN, LEFT JOIN, and FULL OUTER JOIN.

## Queries
1. **INNER JOIN** → Retrieves all bookings and the respective users who made them.
2. **LEFT JOIN** → Retrieves all properties and their reviews, including properties with no reviews.
3. **FULL OUTER JOIN** → Retrieves all users and all bookings, even if a user has no booking or a booking is not linked to a user.
## Subqueries

This section contains examples of both correlated and non-correlated subqueries.

- **Non-correlated Subquery**: Finds all properties where the average rating is greater than 4.0.
- **Correlated Subquery**: Finds all users who have made more than 3 bookings.

See the file: `subqueries.sql`
## Aggregations and Window Functions

This section demonstrates the use of SQL aggregation and window functions.

1. **Aggregation Query**
   - Uses `COUNT` and `GROUP BY` to find the total number of bookings made by each user.

2. **Window Function Query**
   - Uses `RANK()` to rank properties based on the total number of bookings.
   - Helps identify the most popular properties in the system.

See the file: `aggregations_and_window_functions.sql`
