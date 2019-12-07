REPO := ulamlabs/eos-regtest
VERSION ?= 1.8.5-1
DOCKER_IMAGE ?= ${REPO}:${VERSION}

.PHONY: image, push

image:
	docker build -t current -t $(REPO) -t $(DOCKER_IMAGE) .

push:
	docker push $(DOCKER_IMAGE)
