FROM netroy/ubuntu:14.04
MAINTAINER Aditya <aditya@netroy.in>

## Prevent dialogs for apt-get
ENV DEBIAN_FRONTEND noninteractive

## Enable universe
ADD universe.list /etc/apt/sources.list.d/universe.list

RUN apt-get update && apt-get upgrade -y -q > /dev/null && \
    apt-get install -y -q mercurial \
            libmysqlclient-dev libsqlite3-dev libpq-dev\
            libcurl4-openssl-dev \
            libxslt-dev libxml2-dev libfreetype6-dev liblcms1-dev \
            libjpeg8-dev libwebp-dev libtiff-dev && \
    apt-get -y clean && \
    rm -rf /tmp/* /var/tmp/* /usr/share/man \
           /usr/share/groff /usr/share/info /usr/share/lintian \
           /usr/share/linda /var/cache/man

## Setup locales
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Default to bash
CMD ["/bin/bash"]
