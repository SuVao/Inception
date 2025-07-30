NAME = inception

COMPOSE_FILE = srcs/docker-compose.yml
VOLUME_PATH = /home/$(USER)/data

DOCKER_COMPOSE = docker-compose -f $(COMPOSE_FILE)

all: up

up:
	@sudo mkdir -p $(VOLUME_PATH)/mariadb $(VOLUME_PATH)/wordpress
	@$(DOCKER_COMPOSE) up -d --build

down:
	@$(DOCKER_COMPOSE) down

stop:
	@$(DOCKER_COMPOSE) stop

start:
	@$(DOCKER_COMPOSE) start

restart: down up

logs:
	@$(DOCKER_COMPOSE) logs -f

clean: down
	@sudo docker system prune -af
	@sudo docker volume rm $$(sudo docker volume ls -q 2>/dev/null) 2>/dev/null || true

fclean: clean
	@sudo rm -rf $(VOLUME_PATH)
	@echo "🔥 Todos os volumes e containers removidos!"

re: fclean all

.PHONY: all up down stop start restart logs clean fclean re
