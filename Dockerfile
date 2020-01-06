FROM ubuntu:18.04

# Allow configuration of variable at build-time using --build-arg flag
ARG RETHINKDB_VERSION=2.3.7~0bionic

RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget python-pip && \
  rm -rf /var/lib/apt/lists/*

RUN \
  echo "deb https://download.rethinkdb.com/apt `lsb_release -cs` main" | tee /etc/apt/sources.list.d/rethinkdb.list && \
  wget -qO- https://download.rethinkdb.com/apt/pubkey.gpg | apt-key add - && \
  apt-get -y update && \
  apt-get -y install rethinkdb=$RETHINKDB_VERSION

# Install python driver for rethinkdb
RUN pip install rethinkdb==2.3.0

WORKDIR /data

EXPOSE 8080
EXPOSE 28015

CMD ["rethinkdb", "--bind", "all"]