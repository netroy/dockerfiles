FROM netroy/base
MAINTAINER Aditya <aditya@netroy.in>

## Install from PPA
RUN add-apt-repository ppa:chris-lea/node.js && \
    apt-get -y -q update > /dev/null && \
    apt-get install -y -q nodejs && \
    npm install -g --production forever pm2 && \
    apt-get -y clean > /dev/null && \
    rm -rf /tmp/* /var/tmp/* /usr/share/man \
           /usr/share/groff /usr/share/info /usr/share/lintian \
           /usr/share/linda /var/cache/man
