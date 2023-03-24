PROJECT = $(shell basename $(shell pwd))
ID = pikesley/${PROJECT}

build:
	podman build \
		--build-arg PROJECT=${PROJECT} \
		--tag ${ID} .

run:
	podman run \
		--name ${PROJECT} \
		--hostname ${PROJECT} \
		--volume $(shell pwd):/opt/${PROJECT} \
		--interactive \
		--tty \
		--rm \
		--publish 8888:80 \
		${ID} \
		bash

exec:
	podman exec \
		--interactive \
		--tty \
		${PROJECT} \
		bash

.PHONY: sass
sass:
	./node_modules/.bin/sass --watch sass:site/css