# Nginx Dockerfile

# Why Reverse Proxy?
The most obvious reason for using Reverse Proxy is to avoid changing ports every time you try to access different modules of the application through the same URL. Through Reverse Proxy we can reach frontend, backend, or other services without changing port through a single domain. Another important reason for using Reverse Proxy is to mask services behind a proxy and avoid dealing with CORS issues.

### Base Docker Image
* [dockerfile/ubuntu](http://dockerfile.github.io/#/ubuntu)

### Installation
1. Install [Docker](https://www.docker.com/)

### Usage

    docker run -d -p 80:80 dockerfile/nginx

#### Attach persistent/shared directories

    docker run -d -p 80:80 -v <sites-enabled-dir>:/etc/nginx/conf.d -v <certs-dir>:/etc/nginx/certs -v <log-dir>:/var/log/nginx -v <html-dir>:/var/www/html dockerfile/nginx

After few seconds, open `http://<host>` to see the welcome page.
