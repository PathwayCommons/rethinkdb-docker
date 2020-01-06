# rethinkdb-docker

Create a Docker image with [RethinkDB](https://rethinkdb.com/) along with dependencies for database administration (i.e. dump and restore).

## Required software

  - Docker version >19.03.05

## Running via Docker

To build the image:

`docker build -t pathwaycommons/rethinkdb .`

  - options
    - Use `--build-arg RETHINKDB_VERSION=<version>` to set Ubuntu package version (defaults to `2.3.7~0bionic`)

To run a container:

`docker run -d --rm --name db_container -p 8080:8080 -p 28015:28015 pathwaycommons/rethinkdb`





