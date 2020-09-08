## If not already installed

### Issuses with Storing Data inside Containers
* containers are designed to be ephemeral (disposable)
* When containers are stopped, data is not accessible
* Containers are typically stored on each host
* The container filesystem wasn't designed for high performance I/O

Thus options for storing data
1. volumes
  * The recommended was to persist data, stored at /var/lib/docker/volumes
  * This is most recommended
2. Bind Mounts
  * Have limited functionality and must use the exact file path on the host
3. tmpfs mounts

Block Vs. Object Storage
