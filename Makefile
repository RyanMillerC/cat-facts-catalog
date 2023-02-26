IMG := quay.io/rymiller/cat-facts-catalog:latest

.PHONY: docker-build docker-push validate

docker-build:
	docker build -f catalog.Dockerfile -t "${IMG}" .

docker-push:
	docker push "${IMG}"

validate:
	opm validate catalog
