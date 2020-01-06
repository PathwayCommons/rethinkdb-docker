# rethinkdb-docker

Create a Docker image with [RethinkDB](https://rethinkdb.com/) along with dependencies for database administration (i.e. dump and restore).

## Required software

  - Docker version >19.03.05

## Running via Docker

To build the image:

`docker build -t pathwaycommons/rethinkdb .`

  - Optional
    - Use `--build-arg RETHINKDB_VERSION=<version>` to set Ubuntu 18.04 (bionic) [RethinkDB package](https://download.rethinkdb.com/apt/dists/bionic/main/binary-amd64/) (default=`2.3.7~0bionic`)

To run a container:

`docker run -d --rm --name db_container -p 8080:8080 -p 28015:28015 pathwaycommons/rethinkdb`





