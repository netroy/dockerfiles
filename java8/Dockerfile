FROM netroy/base
MAINTAINER Aditya <aditya@netroy.in>

## Auto accept oracle's license
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

## Add PPA
RUN add-apt-repository ppa:webupd8team/java && apt-get -y -q update

## Install
RUN apt-get install -y -q oracle-java8-installer && apt-get -y clean && rm /var/cache/oracle-jdk8-installer/*.gz
