all: build

build-ubuntu:
	docker build -t netroy/ubuntu ubuntu
	docker run --name netroy-ubuntu -d netroy/ubuntu /bin/bash
	docker export netroy-ubuntu | docker import - netroy/ubuntu
	docker tag netroy/ubuntu netroy/ubuntu:13.10
	docker push netroy/ubuntu

# Image Generation
build-base:
	docker build -rm=true -t base base
	docker tag base netroy/base
	docker push netroy/base

build-image:
	docker build -rm=true -t $(TYPE) $(TYPE)
	docker tag $(TYPE) netroy/$(TYPE)
	docker push netroy/$(TYPE)
	# docker tag $(TYPE) quay.io/netroy/$(TYPE)
	# docker push quay.io/netroy/$(TYPE)

build-go:
	TYPE=go make build-image

build-ruby:
	TYPE=ruby make build-image

build-nodejs:
	TYPE=nodejs make build-image

build-python:
	TYPE=python make build-image

build-java:
	TYPE=java make build-image

build-redis:
	TYPE=redis make build-image

build-postgresql:
	TYPE=postgresql make build-image

build-mysql:
	TYPE=mysql make build-image

build-rabbitmq:
	TYPE=rabbitmq make build-image

build-rethinkdb:
	TYPE=rethinkdb make build-image

build: build-base build-go build-ruby build-nodejs build-python build-java build-redis build-postgresql build-mysql build-rabbitmq rethinkdb
