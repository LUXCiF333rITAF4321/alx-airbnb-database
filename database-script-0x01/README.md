# Database Schema Script (0x01)

This directory contains the SQL script to create the Airbnb-like database schema.

## Files
- `schema.sql` — Creates tables, primary keys, foreign keys, constraints, and indexes.

## How to Use (MySQL/MariaDB)
1. Create a database (optional): `CREATE DATABASE airbnb_db; USE airbnb_db;`
2. Run `schema.sql` in your SQL client (Workbench, phpMyAdmin, or CLI).
3. Verify tables were created and indexes exist.

> Notes:
> - The script uses `ENUM` and `ON UPDATE CURRENT_TIMESTAMP` (MySQL/MariaDB syntax).
> - UUIDs are stored as `CHAR(36)`; you can generate them in app code or with `UUID()` in MySQL.
