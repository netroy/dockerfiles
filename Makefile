all: build

build-ubuntu:
	docker build -t netroy/ubuntu ubuntu
	docker run --name netroy-ubuntu -d netroy/ubuntu /bin/bash
	docker export netroy-ubuntu | docker import - netroy/ubuntu
	docker tag netroy/ubuntu netroy/ubuntu:13.10
	docker push netroy/ubuntu

# Image Generation
build-base:
	docker build -t base base
	docker tag base netroy/base
	docker push netroy/base

build-server:
	docker build -t $(TYPE) $(TYPE)
	docker tag $(TYPE) netroy/$(TYPE)
	docker push netroy/$(TYPE)
	# docker tag $(TYPE) quay.io/netroy/$(TYPE)
	# docker push quay.io/netroy/$(TYPE)

build-ruby:
	TYPE=ruby make build-server

build-nodejs:
	TYPE=nodejs make build-server

build-java:
	TYPE=java make build-server

build-redis:
	TYPE=redis make build-server

build-postgresql:
	TYPE=postgresql make build-server

build-mysql:
	TYPE=mysql make build-server

build-rabbitmq:
	TYPE=rabbitmq make build-server

build: build-base build-ruby build-nodejs build-java build-redis build-postgresql build-mysql build-rabbitmq