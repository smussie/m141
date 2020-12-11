
_syntax_ to grant privileges on tables
-- MySQL GRANT Syntax
GRANT [SELECT, INSERT, DELETE, ..., GRANT] ON DATABASE_NAME TO USER_NAME;

- SELECT – To view the result set from a TABLE
- INSERT – To add records to a TABLE
- DELETE – To remove rows from a TABLE
- INDEX – To create indexes on a TABLE
- CREATE – To create tables/schemas
- ALTER – To modify tables/schemas
- DROP – To delete a TABLE
- ALL – To give ALL permissions excluding GRANT
- UPDATE – Can modify a TABLE
- GRANT – Change or Add permissions

GRANT SELECT, INSERT, DELETE, UPDATE ON EMPL TO 'JOHN'@'localhost;
