################################################################################
# Variables
################################################################################

# Examples...
# VERSION := 0.0.1
# BUILD_INFO := Manual build 

# Most likely want to override these when calling `make image`
IMAGE_REG ?= ghcr.io
IMAGE_REPO ?= username/changeme
IMAGE_TAG ?= latest
IMAGE_PREFIX := $(IMAGE_REG)/$(IMAGE_REPO)

.PHONY: help image push build lint lint-fix
.DEFAULT_GOAL := help


################################################################################
help:  ## This help message :)
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'


################################################################################
lint: $(FRONTEND_DIR)/node_modules  ## Lint & format, will not fix but sets exit code on error
	go get github.com/golangci/golangci-lint/cmd/golangci-lint
	golangci-lint run $(SERVER_DIR)/...
	cd $(FRONTEND_DIR); npm run lint


################################################################################
lint-fix: $(FRONTEND_DIR)/node_modules  ## Lint & format, will try to fix errors and modify code
	go get github.com/golangci/golangci-lint/cmd/golangci-lint
	golangci-lint run $(SERVER_DIR)/... --fix 
	cd $(FRONTEND_DIR); npm run lint-fix


################################################################################
image:  ## Build container image from Dockerfile
	docker build  --file ./Dockerfile \
	--build-arg BUILD_INFO="$(BUILD_INFO)" \
	--build-arg VERSION="$(VERSION)" \
	--tag $(IMAGE_PREFIX):$(IMAGE_TAG) . 


################################################################################
push:  ## Push container image to registry
	docker push $(IMAGE_PREFIX):$(IMAGE_TAG)


################################################################################
build:  ## Run a local build without a container
	@echo "Not implemented yet!"