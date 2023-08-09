# development settings
DOCKER_COMPOSE_FILE="`pwd`/docker-compose.yaml"
DOCKER_COMPOSE_PROJECT=oil-labs
DOCKER_COMPOSE_CMD=docker-compose -p $(DOCKER_COMPOSE_PROJECT) -f $(DOCKER_COMPOSE_FILE)


run:
	$(DOCKER_COMPOSE_CMD) up --force-recreate --remove-orphans $(filter-out $@,$(MAKECMDGOALS))
stop:
	$(DOCKER_COMPOSE_CMD) stop $(filter-out $@,$(MAKECMDGOALS))

build_and_run:
	$(DOCKER_COMPOSE_CMD) up --force-recreate --build

build:
	$(DOCKER_COMPOSE_CMD) build $(filter-out $@,$(MAKECMDGOALS))

clean:
	docker ps -qa -f status=exited | xargs docker rm
	docker images -q | xargs docker rmi -f

deploy:
	$(DOCKER_COMPOSE_CMD) up --force-recreate --build -d
