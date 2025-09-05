# Database Normalization

## Objective
Apply normalization principles to ensure the database is in Third Normal Form (3NF).

## Steps Taken

### 1. Review of Schema
- Entities: User, Property, Booking, Payment, Review, Message
- Checked attributes and relationships for redundancy and dependency issues.

### 2. First Normal Form (1NF)
- Ensured all attributes are atomic (no repeating groups or arrays).
- Each table has a unique primary key.
- ✅ All tables comply with 1NF.

### 3. Second Normal Form (2NF)
- Checked that there are no partial dependencies on a composite primary key.
- All tables have single-column primary keys or composite keys with no partial dependencies.
- ✅ All tables comply with 2NF.

### 4. Third Normal Form (3NF)
- Checked that no non-key attribute depends on another non-key attribute (no transitive dependencies).
- All foreign keys correctly reference parent tables.
- ✅ All tables comply with 3NF.

### 5. Conclusion
- The current database design is already in **Third Normal Form (3NF)**.
- No changes were necessary.
