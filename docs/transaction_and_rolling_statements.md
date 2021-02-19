# Start Transaction, commit and RollBack statements
**Syntax:**
```sql
START TRANSACTION
    [transaction_characteristic [, transaction_characteristic] ...]

transaction_characteristic: {
    WITH CONSISTENT SNAPSHOT
  | READ WRITE
  | READ ONLY
}

BEGIN [WORK]
COMMIT [WORK] [AND [NO] CHAIN] [[NO] RELEASE]
ROLLBACK [WORK] [AND [NO] CHAIN] [[NO] RELEASE]
SET autocommit = {0 | 1}
```
A database transaction must be atomic, consistent, isolated and durable. Bellow we have discussed these four points.

**Atomic** : A transaction is a logical unit of work which must be either completed with all of its data modifications, or none of them is performed.

**Consistent** : At the end of the transaction, all data must be left in a consistent state.

**Isolated** : Modifications of data performed by a transaction must be independent of another transaction. Unless this happens, the outcome of a transaction may be erroneous.

**Durable** : When the transaction is completed, effects of the modifications performed by the transaction must be permanent in the system.

Often these four properties of a transaction are acronymed as __ACID__.


## Beginning a Transaction
Beginning of a transaction guarentees the atomicity of a transaction

## Committing a Transaction
By commiting the transaction is explicitly closed and any modification made by the transaction is made premanent.

## Rolling Back a Transaction
By rolling back the transaction is explicitly closed and any modification made by the transaction is discarded.

Some statements cannot be rolled back. In general, these include __data definition language (DDL)__ statements, such as those that create or drop databases, those that create, drop, or alter tables or stored routines.

**DDL** is short name of Data Definition Language, which deals with database schemas and descriptions, of how the data should reside in the database.






**DML** is short name of Data Manipulation Language which deals with data manipulation, and includes most common SQL statements such SELECT, INSERT, UPDATE, DELETE etc, and it is used to store, modify, retrieve, delete and update data in database.

**DCL** is short name of Data Control Language which includes commands such as GRANT, and mostly concerned with rights, permissions and other controls of the database system.
