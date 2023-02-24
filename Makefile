IMG := quay.io/rymiller/cat-facts-catalog:latest

.PHONY: docker-build docker-push

docker-build:
	docker build -f catalog.Dockerfile -t "${IMG}" .

docker-push:
	docker push "${IMG}"
