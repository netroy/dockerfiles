FROM netroy/scala
MAINTAINER Aditya <aditya@netroy.in>

## Setup typesafe's repo
# RUN wget http://apt.typesafe.com/repo-deb-build-0002.deb && dpkg -i repo-deb-build-0002.deb && rm -f repo-deb-build-0002.deb && apt-get update && apt-get install -q -y typesafe-stack && apt-get -y clean
RUN wget http://downloads.typesafe.com/typesafe-activator/1.0.13/typesafe-activator-1.0.13.zip && \
    unzip *.zip -d /opt && \
    rm *.zip