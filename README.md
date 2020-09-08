# Module 141 of EPSIC

- [Objective](#Objective)
- [Docker](#docker.md)
- [Database management](Docs/mysql_mariadb_database_management.md)
- [Pre-commit](./Docs/pre-commit.md)

## Objective

* Database management
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

# <a name="docker_related"></a>Step 1: Database management

## How build
-----------------
mysql:8.0.19
# Start a MySQL container
docker run --name mysql -d -e MYSQL_ROOT_PASSWORD=my-secret-pw mysql:8.0.19

# Download phpMyAdmin 5.0.2
docker pull phpmyadmin/phpmyadmin:5.0.2
# Start a phpMyAdmin container
docker run --name phpmyadmin -d -p 8080:80 -e PMA_HOST=mysql phpmyadmin/phpmyadmin:5.0.2

-----------------------------

# Docker Related
https://docs.docker.com/compose/compose-file/

# concerning .dockerignore
https://devopsheaven.com/docker/dockerignore/2018/04/25/using-dockerignore.html

## Pre-requisite

* docker
* docker-compose
```

```

Checking that the docker binary works

`$ docker info`
`$ docker -v` __OR__ `$ docker-compose -v`
`$ docker volume ls` -to list all volumes
`$ docker volue` - to get all the list of parameters

### git pull

### Build image
**alpine images** prefered
`$ docker-compose build`
### To see all the images downloaded
`$ docker images`
### Start the application
`$ docker-compose up -d`
__in short__ this will build and run the image
`$ docker-compose up --build`
### Stop all application
`$ docker-compose down`

> **NOTE** To start fresh in case of changes in environment of docker-compose,
__remove images__ `$ docker image rm <imagename>`, __remove volume__ `$ docker volume rm <volume_name>` and so on

### Interacting with the container
docker exec -it mysql-server-80  bash -l

### Shell access and viewing MySQL logs
$ docker exec -it some-mysql bash
$ docker logs some-mysql

### For a fresh start of everything
`$ docker system prune -a` and #will this delete all other instances as well??
`$ docker volume prune`
__can we add monitoring with grafana?__

## Nginx server
> **NOTE** The
