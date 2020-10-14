# MySQL/MariaDB

## Objective
- [DATABASE BACKUP & RESTORE](#database_backup_and_restore)
  * [mysqldump](#mysqldump)
    * [Single database backup](#SINGLE)
    * [Multiple database backup](#MULTIPLE)
    * [All database backup](#ALL)
    * [Generate backup of only database structure](#only_database_structure)
  * [External Backup tool](#External_Backup_tool)
    * [mysqldump](#mysqldump)
- [DATABASE REPAIR](#database_repair)

# <a name="database_backup_and_restore"></a>DATABASE BACKUP & RESTORE
##  <a name="mysqldump"></a>mysqldump
https://dev.mysql.com/doc/mysql-enterprise-backup/4.1/en/mysqlbackup.incremental.html

- This is the most flexible way to perform backup and restore of relatively small data size <10G

* {name}=replace it with your own
mysqldump --single-transaction --quick --skip-extended-insert \
  --routines -{username} -{password} {dbname} > /path/to/dumps/dir/dbname.dump;
rdiff-backup /path/to/dumps/dir/ /path/to/backup/dir/

-- use as well --events --routines --triggers

https://www.2daygeek.com/mysql-mariadb-database-backup-restore-in-linux/

mysql
https://sqlbackupandftp.com/blog/mariadb-backup-and-restore-overview

## BACKUP


### <a name="SINGLE">__SINGLE__ database backup
- For interactive docker shell
`$ docker exec -it <continaer_name> /bin/bash`
`mysql -u root -p`
`mysql> SHOW DATABASES;`
`mysqldump -u root -p <dbname> > /tmp/coco.sql`


- Another manner of doing this is using **docker exec**
`docker exec m141_mysql_1 sh -c 'exec mysqldump -u root -p"$MYSQL_ROOT_PASSWORD" dbname' > /some/path/db.sql`

But since mysql is exposed on port 3306 it is simply enough to do
`$ mysql -h 0.0.0.0 --port 3306 -u root -p <db_name> > /path/backup_name.sql`


### <a name="MULTIPLE">__MULTIPLE__ databases backup
`mysqldump -u root -p -databases name1 name2 > /tmp/name1_name2.sql`

### <a name="ALL">Backup __all__ databases
`mysqldump -u root -p -all-databases > /path/to/backup`

### <a name="only_database_structure">Generate backup of only database structure
`mysqldump -u root -p --no-data sakila > C:\MySQLBackup\sakila_objects_definition_20200424.sql`

> **NOTE** For compressed files,
it should be enough to do `| gzip > backupfile.sql.gz` during backup and
during restore`$ sudo gunzip < backupfile.sql.gz | mysql ... `

## <a name="External_Backup_tool"></a> External Backup tool
* Percona XtraBackup
* Mariabackup is a fork of Percona


## Restoring data from dump file
$ docker exec -i some-mysql sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD"' < /some/path/on/your/host/all-databases.sql


## RESTORE MySQL/MariaDB db
### __MULTIPLE__ DATABASES
`$ sudo mysql -u root -p dbname1 dbname2 < backedup.sql`

### __SINGLE__ DATABASE
`$ sudo mysql -u root -p dbname < single_backedup_db.sql`

### __ALL__ DATABASES
`$ sudo mysql -u root -p < all_backeup_dbs.sql`

## <a name="database_repair"></a> Database repair

### To repair a corrupted MySQL using mysqlcheck
`mysqlcheck --auto-repair -o --all-databases -uroot -p`


### To repair a corrupted MySQL using InnnoDB recovery mode
`innodb_force_recovery=3`
`innodb_purge_threads=0`
https://dev.mysql.com/doc/refman/8.0/en/forcing-innodb-recovery.html

### External repair tool
* Stellar Repair for MySQL



## RESTORE
https://www.sqlshack.com/how-to-backup-and-restore-mysql-databases-using-the-mysqldump-command/

## USERS, PRIVILEGES, GRANTS and PASSWORDS
### Show users,host,password and DISTINCT
mysql> SELECT user FROM mysql.user;
### create user
mysql> CREATE USER 'superadmin'@'localhost' IDENTIFIED BY 'password';
### Delete a user using DROP
mysql> DROP USER 'root'@'localhost';
### Update a user
UPDATE mysql.user SET Host='%' WHERE Host='localhost' AND User='superadmin';
UPDATE mysql.db SET Host='%' WHERE Host='localhost' AND User='username';

mysql> UPDATE mysql.user SET host = '%' WHERE user = 'superadmin';

ERROR 1356 (HY000): View 'mysql.user' references invalid table(s) or column(s) or function(s) or definer/invoker of view lack rights to use them

mysql> RENAME USER 'superadmin'@'localhost' TO 'superadmin'@'%';
mysql> RENAME USER 'root'@'%' TO 'root'@'localhost';
...The above worked...

### Show Privileges
mysql> SHOW GRANTS;
### Grant privileges
mysql> GRANT ALL PRIVILEGES ON * . * FROM 'superadmin'@'localhost';
GRANT ALL PRIVILEGES
       ON my_database.*
       TO 'my_user'@'localhost'
       IDENTIFIED BY 'my_password'
       WITH GRANT OPTION;

SELECT * FROM mysql.user WHERE User='superadmin'\G

### To change privileges
mysql> revoke all privileges on *.* from 'superadmin'@'localhost';
:Then go back to granting privileges as desired

### To change password
ALTER USER ‘root’@’localhost’ IDENTIFIED BY ‘your_new_password’;
SET PASSWORD FOR ‘root’@’localhost’ = PASSWORD(‘your_new_password’);


### Reload all privileges
mysql> FLUSH PRIVILEGES;

How To Grant Different User Permissions
_syntax_ GRAND <permission_type> ON <db_name>.<table_name> TO 'username'@'localhost';
Here is a short list of other common possible permissions that users can enjoy.

__ALL PRIVILEGES__- as we saw previously, this would allow a MySQL user full access to a designated database (or if no database is selected, global access across the system)
__CREATE__- allows them to create new tables or databases
__DROP__- allows them to them to delete tables or databases
__DELETE__- allows them to delete rows from tables
__INSERT__- allows them to insert rows into tables
__SELECT__- allows them to use the SELECT command to read through databases
__UPDATE__- allow them to update table rows
__GRANT OPTION__- allows them to grant or remove other users’ privileges

-------------
