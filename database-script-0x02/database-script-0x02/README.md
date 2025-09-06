# Database Seed Script

This directory contains SQL scripts to populate the database with sample data.

## Files
- `seed.sql` : Contains INSERT statements for populating the tables with realistic sample data.

## Usage
Run `schema.sql` first (from `database-script-0x01`) to create the tables, then run:

```bash
mysql -u root -p airbnb_clone < seed.sql

