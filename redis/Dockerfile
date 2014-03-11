FROM netroy/base
MAINTAINER Aditya <aditya@netroy.in>

## Install
RUN add-apt-repository ppa:rwky/redis && apt-get update
RUN apt-get install -y -q redis-server && apt-get -y clean

# Setup a mounted folder for data
VOLUME ["/var/lib/redis"]

## Expose Redis ports
EXPOSE 6379

# Copy over the config
ADD redis.conf /etc/redis.conf

## Start redis when container starts
CMD ["/usr/bin/redis-server", "/etc/redis.conf"]