# Module 141 of EPSIC
---

## Objective

* Database management for educational purpose of EPSIC module 141
  * Creating Database
  * Backing up and restoring Database
  * Restoring Database
    - mysql dumps
    -
  * Repairing database
  * Deploying Database
* Going further with docker
  * Without **phpMyAdmin** or **MySQL\\MariaDB**
    - Download and run both through docker
    - Configure them
    - Have local phpMyAdmin webserver running
    - Connected to a MySQL Database


## Documentations
- [Docker](./docs/docker.md)
- [Database management](./docs/mysql_mariadb_database_management.md)
- [Pre-commit](./docs/pre-commit.md)
- [Markdown](./docs/markdown.md)

##
If the pre-requirements are met then you can clone and use this project without any errors on your own by the following steps:
<details>
 <summary><b>Steps  🔨 </b></summary>

 1. Clone or fork this repository
 1. Go to the cloned folder
 1. You can comment out the things you don't want in the `docker-compose.yml` file
 1. You can change the variables in `.env` file to meet your needs, like
    * Password __ROOT_PW__ , __POSTGRESS_PASSWORD__, PGADMIN_DEFAULT_PASSWORD
    * Username __POSTGRESS_USER__
    * Email __PGADMIN_DEFAULT_EMAIL__
 1. Once you are done you can start it up with `docker` see the docker [doc](./docs/docker.md) for more.
 1. That's about it. Have fun

</details>


<br>


**Contributions are welcomed!**
- Follow this [Contribution_doc](./docs/contributing.md) as a general guideline

**Made with { :heart: }!**

ToDO:
__can we add monitoring with grafana?__
