# Database Seed Script

This directory contains SQL scripts to populate the Airbnb-like database with sample data.

## Files
- `seed.sql` : Contains `INSERT` statements for populating all tables (`User`, `Property`, `Booking`, `Payment`, `Review`, `Message`).

## Usage

1. Run the schema creation script first (from `database-script-0x01/schema.sql`):

   ```bash
   mysql -u root -p airbnb_clone < schema.sql
