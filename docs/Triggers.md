# Triggers
 In SQL Server, triggers are database objects, actually, a special kind of stored procedure, which “reacts” to certain actions we make in the database
 * Perform an action in case an event occurs.

## Syntax
´´´sql
CREATE TRIGGER [schema_name.]trigger_name
ON table_name
{FOR | AFTER | INSTEAD OF} {[INSERT] [,] [UPDATE] [,] [DELETE]}
AS
{sql_statements}
´´´

## Types

We have 3 types of triggers:

* **DML** (data manipulation language) triggers
    - We’ve already mentioned them, and they react to DML commands. These are – INSERT, UPDATE, and DELETE
    - When you want to insure a certain control are performed before or after an event.

* **DDL** (data definition language) triggers
    - As expected, triggers of this type shall react to DDL commands like – CREATE, ALTER, and DROP
* **Logon** triggers
    - The name says it all. This type reacts to LOGON events

´´´sql
DROP TRIGGER IF EXISTS t_country_insert;
GO
CREATE TRIGGER t_country_insert ON country INSTEAD OF INSERT
AS BEGIN
    DECLARE @country_name CHAR(128);
    DECLARE @country_name_eng CHAR(128);
    DECLARE @country_code  CHAR(8);
    SELECT @country_name = country_name, @country_name_eng = country_name_eng, @country_code = country_code FROM INSERTED;
    IF @country_name IS NULL SET @country_name = @country_name_eng;
    IF @country_name_eng IS NULL SET @country_name_eng = @country_name;
    INSERT INTO country (country_name, country_name_eng, country_code) VALUES (@country_name, @country_name_eng, @country_code);
END;
´´´
