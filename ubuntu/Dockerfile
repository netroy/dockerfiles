FROM stackbrew/ubuntu:13.10
MAINTAINER Aditya <aditya@netroy.in>

## Disable upstart's security crap
# See https://github.com/dotcloud/docker/issues/1024
RUN dpkg-divert --local --rename --add /sbin/initctl && \
    ln -sf /bin/true /sbin/initctl

## Prevent dialogs for apt-get
ENV DEBIAN_FRONTEND noninteractive

# this forces dpkg not to call sync() after package extraction and speeds up install
RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup

# We don't need package cache in a container
RUN echo 'Acquire::http {No-Cache=True;};\nDir::Cache { srcpkgcache ""; pkgcache ""; }\nAcquire::GzipIndexes "true"; Acquire::CompressionTypes::Order:: "gz";' > /etc/apt/apt.conf.d/02compress-indexes

## Setup locales
RUN locale-gen en_US.UTF-8 && dpkg-reconfigure locales
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

## Enable universe
RUN echo "deb http://de.archive.ubuntu.com/ubuntu saucy universe\ndeb http://de.archive.ubuntu.com/ubuntu saucy-security universe\ndeb http://de.archive.ubuntu.com/ubuntu saucy-updates universe" \
          > /etc/apt/sources.list.d/universe.list

## Upgrade packages
RUN apt-get update && apt-get upgrade -y -q > /dev/null

## Install base packages
RUN apt-get install -y -q git build-essential \
            software-properties-common curl wget libmysqlclient-dev \
            libpq-dev libcurl4-openssl-dev libssl-dev zlib1g-dev \
            libxslt-dev libxml2-dev libjpeg8-dev libfreetype6-dev \
            liblcms1-dev libwebp-dev libtiff-dev libsqlite3-dev \
            libbz2-dev

## Cleanup
RUN apt-get -y clean
RUN rm -rf /tmp/* /var/tmp/* /usr/share/man \
           /usr/share/groff /usr/share/info /usr/share/lintian \
           /usr/share/linda /var/cache/man
RUN find /usr/share/locale -mindepth 1 -maxdepth 1 ! -name 'en' \
           ! -name 'de*' !  -name 'es*' ! -name 'ja*' ! -name 'fr*' \
           ! -name 'zh*' |xargs rm -r

## Native libs for gems
RUN apt-get -y -q install

# Default to bash
CMD ["/bin/bash"]