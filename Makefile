all: build up test
.PHONY: all

IMG_NAME=lambda-function
CONTAINER_NAME=python-lambda

build:
	@echo "Building image ${IMG_NAME}"
	@docker build . -t "${IMG_NAME}"

up:
	@echo "Starts container ${CONTAINER_NAME}"
	@docker run --name "${CONTAINER_NAME}" -d -p 9000:8080 "${IMG_NAME}"
	@sleep 1

test:
	@echo "Invoking lambda function"
	@curl -s -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{}' | jq 

clean:
	@docker container stop "${CONTAINER_NAME}"
	@docker container rm "${CONTAINER_NAME}"
	@docker image rm "${IMG_NAME}"
