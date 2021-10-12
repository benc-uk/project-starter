# Common variables
VERSION := 0.0.1
BUILD_INFO := Manual build 
#SRC_DIR := cmd
SRC_DIR := ./src

# Most likely want to override these when calling `make image`
IMAGE_REG ?= ghcr.io
IMAGE_REPO ?= __CHANGE_ME__
IMAGE_TAG ?= latest
IMAGE_PREFIX := $(IMAGE_REG)/$(IMAGE_REPO)

# Things you don't want to change
REPO_DIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
GOLINT_PATH := $(REPO_DIR)/bin/golangci-lint # Remove if not using Go

.PHONY: help image push build run lint lint-fix
.DEFAULT_GOAL := help

help:  ## This help message :)
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

lint:  ## Lint & format, will not fix but sets exit code on error
	@echo "Not implemented yet!"; exit 1
	@$(GOLINT_PATH) > /dev/null || curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh
	cd $(SRC_DIR); $(GOLINT_PATH) run --modules-download-mode=mod *.go
	cd $(SRC_DIR); npm run lint

lint-fix:  ## Lint & format, will try to fix errors and modify code
	@echo "Not implemented yet!"; exit 1
	@$(GOLINT_PATH) > /dev/null || curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh
	cd $(SRC_DIR); golangci-lint run --modules-download-mode=mod *.go --fix
	cd $(SPA_DIR); npm run lint-fix

image:  ## Build container image from Dockerfile
	docker build --file ./build/Dockerfile \
	--build-arg BUILD_INFO="$(BUILD_INFO)" \
	--build-arg VERSION="$(VERSION)" \
	--tag $(IMAGE_PREFIX):$(IMAGE_TAG) . 

push:  ## Push container image to registry
	docker push $(IMAGE_PREFIX):$(IMAGE_TAG)

build:  ## Run a local build without a container
	@echo "Not implemented yet!"
	#go build -o __CHANGE_ME__ $(SRC_DIR)/...
	#cd $(SRC_DIR); npm run build

run:  ## Run application, used for local development
	@echo "Not implemented yet!"
	#air -c .air.toml
	#cd $(SRC_DIR); npm run start