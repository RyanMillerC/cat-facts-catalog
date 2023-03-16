IMG := quay.io/rymiller/cat-facts-catalog:latest
BUILD_OS ?= linux
BUILD_ARCH ?= amd64

.PHONY:
all: render-template validate catalog-build catalog-push

.PHONY: render-template
render-template:
	opm alpha render-template semver -o yaml < ./templates/cat-facts-operator.yaml > catalog/cat-facts-operator.yaml

.PHONY: catalog-build
catalog-build:
	docker build --platform ${BUILD_OS}/${BUILD_ARCH} --file catalog.Dockerfile --tag "${IMG}" .

.PHONY: catalog-push
catalog-push:
	docker push "${IMG}"

.PHONY: validate
validate:
	opm validate catalog
