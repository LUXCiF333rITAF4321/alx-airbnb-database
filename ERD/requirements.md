# Entity Relationship Diagram (ERD)

This document describes the database schema for the Airbnb-like project.

## ERD Diagram
![ERD](./ERD.png)

## Entities and Attributes

### User
- PK user_id: UUID
- first_name: VARCHAR
- last_name: VARCHAR
- email: VARCHAR (UNIQUE, NOT NULL)
- password_hash: VARCHAR (NOT NULL)
- phone_number: VARCHAR (NULL)
- role: ENUM (guest, host, admin)
- created_at: TIMESTAMP (default current_timestamp)

### Property
- PK property_id: UUID
- FK host_id → User.user_id
- name: VARCHAR
- description: TEXT
- location: VARCHAR
- price_per_night: DECIMAL
- created_at: TIMESTAMP
- updated_at: TIMESTAMP

### Booking
- PK booking_id: UUID
- FK property_id → Property.property_id
- FK user_id → User.user_id
- start_date: DATE
- end_date: DATE
- total_price: DECIMAL
- status: ENUM (pending, confirmed, canceled)
- created_at: TIMESTAMP

### Payment
- PK payment_id: UUID
- FK booking_id → Booking.booking_id
- amount: DECIMAL
- payment_date: TIMESTAMP
- payment_method: ENUM (credit_card, paypal, stripe)

### Review
- PK review_id: UUID
- FK property_id → Property.property_id
- FK user_id → User.user_id
- rating: INTEGER (1–5)
- comment: TEXT
- created_at: TIMESTAMP

### Message
- PK message_id: UUID
- FK sender_id → User.user_id
- FK recipient_id → User.user_id
- message_body: TEXT
- sent_at: TIMESTAMP

## Relationships
- User (host) → Property (1:N)
- User (guest) → Booking (1:N)
- Property → Booking (1:N)
- Booking → Payment (1:N)
- Property → Review (1:N)
- User (guest) → Review (1:N)
- User ↔ User via Message (M:N)
## ERD Diagram
![ERD](./ERD.png)

