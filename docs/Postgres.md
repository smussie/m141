# To connect to the postgresql in terminal
```bash
$ psql --host=0.0.0.0 --port=5435 -U superadmin -W
```
# Listing Databases
* To show the name of all databases in the current PostgreSQL server we use __\l__ or __\list__
```bash
superadmin=# \l
                                    List of databases
    Name    |   Owner    | Encoding |  Collate   |   Ctype    |     Access privileges
------------+------------+----------+------------+------------+---------------------------
 postgres   | superadmin | UTF8     | en_US.utf8 | en_US.utf8 |
 superadmin | superadmin | UTF8     | en_US.utf8 | en_US.utf8 |
 template0  | superadmin | UTF8     | en_US.utf8 | en_US.utf8 | =c/superadmin            +
            |            |          |            |            | superadmin=CTc/superadmin
 template1  | superadmin | UTF8     | en_US.utf8 | en_US.utf8 | =c/superadmin            +
            |            |          |            |            | superadmin=CTc/superadmin
(4 rows)
```
* If we want more information about the sizes of the databases, default tablespaces, and descriptions use the following __\l+__ or __\list+__

```bash
superadmin=# \l+
                                                                      List of databases
    Name    |   Owner    | Encoding |  Collate   |   Ctype    |     Access privileges     |  Size   | Tablespace |                Description
------------+------------+----------+------------+------------+---------------------------+---------+------------+--------------------------------------------
 postgres   | superadmin | UTF8     | en_US.utf8 | en_US.utf8 |                           | 7729 kB | pg_default | default administrative connection database
 superadmin | superadmin | UTF8     | en_US.utf8 | en_US.utf8 |                           | 7877 kB | pg_default |
 template0  | superadmin | UTF8     | en_US.utf8 | en_US.utf8 | =c/superadmin            +| 7729 kB | pg_default | unmodifiable empty database
            |            |          |            |            | superadmin=CTc/superadmin |         |            |
 template1  | superadmin | UTF8     | en_US.utf8 | en_US.utf8 | =c/superadmin            +| 7729 kB | pg_default | default template for new databases
            |            |          |            |            | superadmin=CTc/superadmin |         |            |
(4 rows)
```

### To query data from the pg_database to get all databases, we can use SELECT
```sql
SELECT datname FROM pg_database;
```
  datname
------------
 postgres
 superadmin
 template1
 template0
(4 rows)

# Listing Tables
To list tables we are going to use __\c__ or __\connect__
\c <database_name>
Once we are connected to the database use \dt to list all database tables
\dt
