FROM netroy/base
MAINTAINER Aditya <aditya@netroy.in>

## Install
RUN add-apt-repository ppa:rethinkdb/ppa && apt-get update
RUN apt-get install -y -q rethinkdb && apt-get -y clean

# Setup a mounted folder for data
VOLUME ["/var/lib/rethinkdb"]

## Expose rethinkdb ports
EXPOSE 8080 29015 28015

## Start rethinkdb when container starts
ADD run.sh /bin/rethinkdb
RUN chmod +x /bin/rethinkdb
ENTRYPOINT ["/bin/rethinkdb"]
CMD []
