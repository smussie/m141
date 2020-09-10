## If not already installed

## Useful links
Docker compose v3 https://docs.docker.com/compose/compose-file/

# Docker Related https://docs.docker.com/compose/compose-file/
- Concerning .dockerignore https://devopsheaven.com/docker/dockerignore/2018/04/25/using-dockerignore.html

## Pre-requisite

* docker
* docker-compose
If you don't want to google this, here is a nice documentation on how to install docker and docker-compose
https://docs.docker.com/compose/install/


### Post install - Checking that the docker binary works

`$ docker info`
`$ docker -v` __OR__ `$ docker-compose -v`
`$ docker volume ls` -to list all volumes
`$ docker volue` - to get all the list of parameters

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
`$ docker exec -it mysql-server-80  bash -l`

### Shell access and viewing MySQL logs
```
$ docker exec -it some-mysql bash
$ docker logs some-mysql
```

### For a fresh start of everything
`$ docker system prune -a` and #will this delete all other instances as well??
`$ docker volume prune`
__can we add monitoring with grafana?__
