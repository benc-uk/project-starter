# Example and common variables
VERSION := 0.0.1
BUILD_INFO := Manual build 
#SRC_DIR := cmd
SRC_DIR := ./src

# Most likely want to override these when calling `make image`
IMAGE_REG ?= ghcr.io
IMAGE_REPO ?= change_me
IMAGE_TAG ?= latest
IMAGE_PREFIX := $(IMAGE_REG)/$(IMAGE_REPO)

.PHONY: help image push build run lint lint-fix
.DEFAULT_GOAL := help

help:  ## This help message :)
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

lint:  ## Lint & format, will not fix but sets exit code on error
	@echo "Not implemented yet!"
	#go get github.com/golangci/golangci-lint/cmd/golangci-lint; golangci-lint run $(SRC_DIR)/... --fix 
	#cd $(SRC_DIR); npm run lint

lint-fix:  ## Lint & format, will try to fix errors and modify code
	@echo "Not implemented yet!"
	#go get github.com/golangci/golangci-lint/cmd/golangci-lint && golangci-lint run $(SRC_DIR)/... --fix 
	#cd $(SRC_DIR); npm run lint-fix

image:  ## Build container image from Dockerfile
	docker build  --file ./build/Dockerfile \
	--build-arg BUILD_INFO="$(BUILD_INFO)" \
	--build-arg VERSION="$(VERSION)" \
	--tag $(IMAGE_PREFIX):$(IMAGE_TAG) . 

push:  ## Push container image to registry
	docker push $(IMAGE_PREFIX):$(IMAGE_TAG)

build:  ## Run a local build without a container
	@echo "Not implemented yet!"
	#go build -o changeme $(SRC_DIR)/...
	#cd $(SRC_DIR); npm run build

run:  ## Run application, used for local development
	@echo "Not implemented yet!"
	#go run $(SRC_DIR)/...
	#cd $(SRC_DIR); npm run start