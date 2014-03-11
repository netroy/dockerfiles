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