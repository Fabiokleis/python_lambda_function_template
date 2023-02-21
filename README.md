# lambda-template
python lambda function template

# Requirements
Install docker, jq, curl, build-essential etc...

# Template lambda function
```python
## lambda function

import logging

logger = logging.getLogger()
logger.setLevel(logging.DEBUG)


# function called in Dockerfile
def lambda_handler(event, context):
    logger.info('lambda handler invoked')
    return {'message': 'Hello, World!'}

```

# Docker image
used image [public.ecr.aws/lambda/python:3.9](https://hub.docker.com/layers/amazon/aws-lambda-python/3.9/images/sha256-6ec0519235e064dc4bd53eda7481d76800ee1455e88c801062d5407026cee427?context=explore)

### Build imagem
```console
docker build . -t lambda-function
```
### Run container
```console
docker run --name python-lambda -d -p 9000:8080 lambda-function
```
# Testing
### invoke lambda function
```console
curl -s -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{}' | jq
```

# Makefile 
all: build up test
.PHONY: all

### Build image
```console
make build
```
### Run container
```console
make up
```
### Invoke lambda function
```console
make test
```
### Remove container and image
```console
make clean
```
