PROJECT_NAME = inception

COMPOSE = docker compose
DC_FILE = -f srcs/docker-compose.yml

SERVICES = nginx wordpress
VOLUMES = nginx wordpress

GREEN  = \033[0;32m
RESET  = \033[0m

.PHONY: all build up down clean fclean re

all: up

build:
	@echo "$(GREEN)[BUILDING IMAGES]$(RESET)"
	@$(COMPOSE) $(DC_FILE) build --no-cache

up:
	@echo "$(GREEN)[STARTING CONTAINERS]$(RESET)"
	@$(COMPOSE) $(DC_FILE) up -d --build

down:
	@echo "$(GREEN)[STOPPING CONTAINERS]$(RESET)"
	@$(COMPOSE) $(DC_FILE) down

clean:
	@echo "$(GREEN)[REMOVING VOLUMES]$(RESET)"
	@docker volume ls -q --filter name=$(PROJECT_NAME)_ | xargs -r docker volume rm

fclean: down clean
	@echo "$(GREEN)[REMOVING UNUSED IMAGES]$(RESET)"
	@docker image prune -af
	@echo "$(GREEN)[REMOVING UNUSED VOLUMES]$(RESET)"
	@docker volume prune -f

re: fclean all
