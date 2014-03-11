FROM netroy/base
MAINTAINER Aditya <aditya@netroy.in>

## RUBY
RUN apt-get install -y -q ruby1.9.1 ruby1.9.1-dev rubygems1.9.1 \
            irb1.9.1 libopenssl-ruby1.9.1 libmysql-ruby \
            && apt-get -y clean > /dev/null

## Install bundler
RUN gem install bundler --no-ri --no-rdoc && gem cleanup