# Docker-Compose
Docker has made it easier to set up a local development environment. However, if you want to create more than one container for your application, you have to create several Docker files. This adds on the load of maintaining them and is also quite time-consuming. 
Docker Compose solves this problem by allowing you to use a YAML file to operate multi-container applications at once. You can set the desired amount of containers counts, their builds, and storage designs, and then with a single set of commands you can build, run and configure all the containers.
Docker Compose is great for development, testing, and staging environments, as well as continuous integration workflows.
 
> **To be Clear** __Docker__ manages single containers
__Docker-Compose__ manages multiple container applications

## If not already installed

### Useful links
* [Docker compose v3](https://docs.docker.com/compose/compose-file/)
* [Docker Related](https://docs.docker.com/compose/compose-file/)
* [Concerning .dockerignore](https://devopsheaven.com/docker/dockerignore/2018/04/25/using-dockerignore.html)

## Pre-requisite

* `docker`
* `docker-compose`
- If you don't want to google this, here is a nice documentation on how to install docker and docker-compose
* [Install](https://docs.docker.com/compose/install/)


### Post install - Checking that the docker binary works

* To get docker information `$ docker info`
* To see the installed docker version `$ docker -v` __OR__ `$ docker-compose -v`
* To list all volumes `$ docker volume ls`
* To get all the list of parameters `$ docker volue`

### Build image
**alpine images** prefered
- `$ docker-compose build`

### To see all the downloaded images
`$ docker images`

### Start the application
- `$ docker-compose up -d`
__in short__ this will build and run the image
`$ docker-compose up --build`

### Stop all application
`$ docker-compose down`

### Interacting with the container
`$ docker exec -it mysql-server-80  bash -l`

### Shell access and viewing MySQL logs
```bash
$ docker exec -it some-mysql bash
$ docker logs some-mysql
```

# Advanced commands
- Lists all volumes `$ docker volume ls`
`$ docker volume inspect <volume_name>`
eg.
```docker
[
    {
        "CreatedAt": "2020-10-13T10:48:09+02:00",
        "Driver": "local",
        "Labels": {
            "com.docker.compose.project": "m141",
            "com.docker.compose.version": "1.25.0",
            "com.docker.compose.volume": "dbdata"
        },
        "Mountpoint": "/home/smussie/nobackup/docker/volumes/m141_dbdata/_data",
        "Name": "m141_dbdata",
        "Options": null,
        "Scope": "local"
    }
]
```

> **NOTE** To start fresh in case of changes in environment of docker-compose,
__remove images__ `$ docker image rm <imagename>`, __remove volume__ `$ docker volume rm <volume_name>`


## Cleaning up Images, Volumes, Containers, and Network
### For a fresh start of everything
`$ docker system prune -a` and #will this delete all other instances as well??

`$ docker volume prune`
`$ docker network prune`

#### List all images:
`$ docker images -a`
#### Remove images:
`$ docker rmi <Image_name> <Image_name>`
> **To remove all images** `$ docker rmi $(docker images -a -q)`

### Remove Containers
#### List all containers:
`$ docker ps -a`
You can filter further by the status of the container: __created__, __restarting__, __running__, __paused__ or __exited__.
We can use one or many filters.
`$ docker ps -a -f status=paused -f status=exited` **to list all exited and paused containers**

#### Remove :
`$ docker rm <ID> <ID>`
`$ docker run -rm <image_name>`
Or with some specific filter looks like this:
`$ docker rm $(docker ps -a -f status=paused -f status=exited -q)`

### Remove volumes:
#### List volumes:
`$ docker volume ls`
#### Remove docker volumes:
`$ docker volume rm <volume_name> <volume_name>`
- Or if you want to delete a container and its volume at the same time:
`$ docker rm -v <container_name>`
- Dangling volume is a volume that exists but is not connected to any container. We can see this by
`$ docker volume ls -f dangling=true`

`$ docker volume prune`
