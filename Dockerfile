FROM ubuntu:18.04

# Allow configuration of variable at build-time using --build-arg flag
ARG RETHINKDB_VERSION=2.3.7~0bionic

# Create an unprivileged user
RUN groupadd rethinkdb \
  && useradd -g rethinkdb rethinkdb --shell /bin/bash -m -d /home/rethinkdb

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

# Create directories
RUN mkdir -p /data

RUN chown rethinkdb:rethinkdb -R /data

WORKDIR /data

USER rethinkdb

# process cluster webui
EXPOSE 28015 29015 8080

COPY entrypoint.sh /

CMD ["/entrypoint.sh"]