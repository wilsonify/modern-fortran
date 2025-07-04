# Makefile for building and testing the Fortran Docker environment

IMAGE_NAME = modern-fortran-dev
CONTAINER_NAME = modern-fortran-test
DOCKERFILE = Dockerfile
USERNAME = backus

.PHONY: build run test shell clean

## Build the Docker image
build:
	docker build -t $(IMAGE_NAME) -f $(DOCKERFILE) .

## Run a container interactively
shell:
	docker run --rm -it --name $(CONTAINER_NAME) $(IMAGE_NAME) bash

## Run tests (assumes a test script or `make test` exists inside container)
test:
	docker run --rm -it --name $(CONTAINER_NAME) $(IMAGE_NAME) bash -c "cd /home/$(USERNAME) && make test"

## Clean dangling images and containers
clean:
	docker container prune -f
	docker image prune -f
