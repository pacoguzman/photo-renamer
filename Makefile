SHELL := $(shell which bash)
OSTYPE := $(shell uname)

help: ## Show this help
	@echo "Help"
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "    \033[36m%-20s\033[93m %s\n", $$1, $$2}'

.PHONY: default
default: help

.PHONY: compile
compile: ## Compile binary
	./build-go.sh

.PHONY: test
test: ## Test library
	go test ./... -v

.PHONY: build
build: ## Build docker image
	./build-docker.sh
