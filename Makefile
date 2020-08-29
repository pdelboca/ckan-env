IMAGE := avdata99/ckan-env
VERSION := $(shell git rev-parse --abbrev-ref HEAD)
TAG := $(shell if [ ${VERSION} = 'master' ] ; then echo 'latest' ; else echo ${VERSION} ; fi)

test:
	true

local-image:
	echo "Tag: ckan-env:${TAG}"
	docker build -t ckan-env:${TAG} .
	
push-image:
	echo "Push: ${IMAGE}:${TAG}"
	docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
	docker push ${IMAGE}:${TAG}
	
.PHONY: image push-image test