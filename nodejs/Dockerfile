FROM netroy/base
MAINTAINER Aditya <aditya@netroy.in>

## Add PPA
RUN add-apt-repository ppa:chris-lea/node.js && apt-get -y -q update > /dev/null

## Install
RUN apt-get install -y -q nodejs && apt-get -y clean > /dev/null
