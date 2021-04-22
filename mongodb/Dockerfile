#
# Mongodb Docker file
#

FROM mongo:latest

EXPOSE 27017

COPY ./initdb.d /docker-entrypoint-initdb.d/
COPY ./mongod.conf /etc/mongod.conf

CMD ["-f", "/etc/mongod.conf"]
