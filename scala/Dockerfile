FROM netroy/java
MAINTAINER Aditya <aditya@netroy.in>

## Dependencies
RUN apt-get -q -y install libjansi-java

## Install scala from "deb" package
RUN wget http://www.scala-lang.org/files/archive/scala-2.10.4.deb && \
    dpkg -i scala-2.10.4.deb && \
    rm -f scala-2.10.4.deb

## Install sbt from "deb" package
RUN wget http://repo.scala-sbt.org/scalasbt/sbt-native-packages/org/scala-sbt/sbt/0.13.1/sbt.deb && \
    dpkg -i sbt.deb && \
    rm -f sbt.deb