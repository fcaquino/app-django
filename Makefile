DOCKER_IMG = app-django
DOCKER_CONTAINER = app-django

build:
	docker build . --tag $(DOCKER_IMG)

run:
	docker run -it \
	-v $(shell pwd):/code \
	-w /code \
	-p 8000:8000 \
	--name $(DOCKER_IMG) $(DOCKER_CONTAINER) /bin/bash

start:
	docker start $(DOCKER_CONTAINER)

enter:
	docker exec -it $(DOCKER_CONTAINER) /bin/bash

develop_server:
	python manage.py runserver 0.0.0.0:8000