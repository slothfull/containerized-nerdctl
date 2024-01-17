include info

build:
	DOCKER_BUILDKIT=1 docker build -t $(IMAGE_NAME):$(VERSION) --build-arg HTTP_PROXY=$(HTTP_PROXY) --build-arg HTTPS_PROXY=$(HTTPS_PROXY) .

default: build
