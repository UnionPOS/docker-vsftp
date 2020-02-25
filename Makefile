export DOCKER_ORG ?= unionpos
export IMAGE_NAME ?= vsftpd

export DOCKER_IMAGE ?= $(DOCKER_ORG)/$(IMAGE_NAME)
export DOCKER_TAG ?= 3.0.3
export DOCKER_IMAGE_NAME ?= $(DOCKER_IMAGE):$(DOCKER_TAG)
export DOCKER_BUILD_FLAGS =

-include $(shell curl -sSL -o .build-harness "https://raw.githubusercontent.com/unionpos/build-harness/master/templates/Makefile.build-harness"; echo .build-harness)

build: docker/build
.PHONY: build

## update readme documents
docs: readme/deps readme
.PHONY: docs

push:
	$(DOCKER) push $(DOCKER_IMAGE_NAME)
.PHONY: push

run:
	$(DOCKER) container run --rm --attach STDOUT ${DOCKER_IMAGE_NAME}
.PHONY: run

it:
	$(DOCKER) run -it alpine:3.11 /bin/sh
.PHONY: it
