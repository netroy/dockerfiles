all: build

ubuntu:
	docker build --rm=true -t netroy/ubuntu ubuntu
	docker run --name netroy-ubuntu -d netroy/ubuntu /bin/bash
	docker export netroy-ubuntu | docker import - netroy/ubuntu
	docker tag netroy/ubuntu netroy/ubuntu:14.04
	docker push netroy/ubuntu

# Image Generation
base:
	docker build --rm=true -t base base
	docker tag base netroy/base
	docker push netroy/base

image:
	docker build --rm=true -t $(TYPE) $(TYPE)
	docker tag $(TYPE) netroy/$(TYPE)
	# docker push netroy/$(TYPE)
	# docker tag $(TYPE) quay.io/netroy/$(TYPE)
	# docker push quay.io/netroy/$(TYPE)

reset-docker:
	-docker stop $(shell docker ps -a -q)
	-docker rm $(shell docker ps -a -q)
	-docker rmi $(shell docker images -a | grep "^<none>" | awk '{print $3}')

## Languages
go:
	TYPE=go make image

ruby:
	TYPE=ruby make image

nodejs:
	TYPE=nodejs make image

python:
	TYPE=python make image

java:
	TYPE=java make image

java8:
	TYPE=java8 make image

scala:
	TYPE=scala make image

## Servers
redis:
	TYPE=redis make image

postgresql:
	TYPE=postgresql make image

mysql:
	TYPE=mysql make image

rabbitmq:
	TYPE=rabbitmq make image

rethinkdb:
	TYPE=rethinkdb make image

## Frameworks
typesafe:
	TYPE=typesafe make image

## Meta tasks
languages: go ruby nodejs python java java8 scala
servers: redis postgresql mysql rabbitmq rethinkdb
frameworks: typesafe

build: base languages servers frameworks

.PHONY: ubuntu base go ruby nodejs python java java8 scala redis postgresql mysql rabbitmq rethinkdb typesafe