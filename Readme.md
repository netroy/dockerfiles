## Collection of base docker images to build apps on top of

Base image is [ubuntu 13.10](ubuntu) with
* [upstart security checks disabled](https://github.com/dotcloud/docker/issues/1024)
* apt/deb configured to be faster & not cache anything
* `universe` enabled in the repos
* `git`, `build-essential`, `curl` & a bunch of development packages/libs
* cleaned-up & flattened for reduced footprint

#### Images

* [go](go) - Official golang 1.2.1
* [java](java) - JDK 7
* [mysql](mysql) - MySQL Server
* [nodejs](nodejs) - latest node.js from chris-lea's ppa
* [postgresql](postgresql) - PostgreSQL 9.3 from official repos
* [python](python) - Python 3.3 from ubuntu's repos + Latest official pip
* [rabbitmq](rabbitmq) - Official debian packages for rabbitmq
* [redis](redis) - latest redis from rwky's redis ppa
* [rethinkdb](rethinkdb) - Latest rethinkdb from the official ppa
* [ruby](ruby) - Ruby 1.9.3 from universe
