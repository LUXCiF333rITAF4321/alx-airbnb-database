# Database Normalization

## Objective
Apply normalization principles to ensure the Airbnb-like database is in Third Normal Form (3NF).

## Normalization Steps

### 1. First Normal Form (1NF)
- All attributes are atomic (no repeating groups or arrays).  
- Each table has a unique primary key.  
- ✅ All tables comply with 1NF.

### 2. Second Normal Form (2NF)
- All non-key attributes fully depend on the primary key.  
- No partial dependencies exist.  
- ✅ All tables comply with 2NF.

### 3. Third Normal Form (3NF)
- No non-key attribute depends on another non-key attribute (no transitive dependencies).  
- Foreign keys reference parent tables correctly.  
- ✅ All tables comply with 3NF.

### 4. Table Analysis

- **User**: All attributes depend only on `user_id`.  
- **Property**: All attributes depend only on `property_id`; `host_id` is a foreign key.  
- **Booking**: All attributes depend only on `booking_id`.  
- **Payment**: All attributes depend only on `payment_id`; linked to Booking via `booking_id`.  
- **Review**: All attributes depend only on `review_id`; linked to User and Property via foreign keys.  
- **Message**: All attributes depend only on `message_id`; linked to sender and recipient via foreign keys.  

### 5. Conclusion
- The database design is already in **Third Normal Form (3NF)**.  
- No changes were necessary.
