IMG := quay.io/rymiller/cat-facts-catalog:latest

.PHONY:
all: render-template validate catalog-build catalog-push

.PHONY: render-template
render-template:
	opm alpha render-template semver -o yaml < ./templates/cat-facts-operator.yaml > catalog/cat-facts-operator.yaml

.PHONY: catalog-build
catalog-build:
	docker build -f catalog.Dockerfile -t "${IMG}" .

.PHONY: catalog-push
catalog-push:
	docker push "${IMG}"

.PHONY: validate
validate:
	opm validate catalog
