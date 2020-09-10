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
