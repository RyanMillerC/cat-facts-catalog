IMG := quay.io/rymiller/cat-facts-catalog:latest

.PHONY: render-template
render-template:
	opm alpha render-template semver -o yaml < ./templates/cat-facts-operator.yaml > catalog/cat-facts-operator.yaml

.PHONY: docker-build
docker-build:
	docker build -f catalog.Dockerfile -t "${IMG}" .

.PHONY: docker-push
docker-push:
	docker push "${IMG}"

.PHONY: validate
validate:
	opm validate catalog
