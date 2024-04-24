NAME=consistency_models_2
TAG=0.1
PROJECT_DIRECTORY=$(shell pwd)

build:
	docker build --progress=plain -t ${NAME}:${TAG} -f docker/Dockerfile .

run:
	docker container run\
		--gpus all\
		--restart=always\
		-it -d \
		-v $(PROJECT_DIRECTORY):/home/${NAME}\
		-v /ext/datasets/butterflies256:/home/${NAME}/data/butterflies256\
		--name ${NAME} ${NAME}:${TAG} /bin/bash
