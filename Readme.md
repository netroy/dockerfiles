## Collection of base docker images to build apps on top of

Base image is ubuntu 13.10 with
* [upstart security checks disabled](https://github.com/dotcloud/docker/issues/1024)
* apt/deb configured to be faster & not cache anything
* `universe` enabled in the repos
* `git`, `build-essential`, `curl` & a few dev libs
* cleaned-up & flattened for reduced footprint

#### Images

* [java](java) - JDK 7
* [mysql](mysql) - MySQL Server
* [node](nodejs) - latest node.js from chris-lea's ppa
* [postgresql](postgresql) - PostgreSQL 9.3 from official repos
* [rabbitmq](rabbitmq) - Official debian packages for rabbitmq
* [redis](redis) - latest redis from rwky's redis ppa
* [ruby](ruby) - Ruby 1.9.3 from universe
