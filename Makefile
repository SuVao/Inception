PROJECT_NAME = inception

COMPOSE = docker-compose
DC_FILE = srcs/docker-compose.yml

SERVICES = nginx wordpress

VOLUMES = nginx wordpress

GREEN  = \033[0;32m
RESET  = \033[0m

.PHONY: all build up down clean fclean re

all: up

build:
	@echo "$(GREEN)[BUILDING IMAGES]$(RESET)"
	@$(COMPOSE) -f $(DC_FILE) build --no-cache

up:
	@echo "$(GREEN)[STARTING CONTAINERS]$(RESET)"
	@$(COMPOSE) -f $(DC_FILE) up -d --build

down:
	@echo "$(GREEN)[STOPPING CONTAINERS]$(RESET)"
	@$(COMPOSE) -f $(DC_FILE) down

clean:
	@echo "$(GREEN)[REMOVING VOLUMES]$(RESET)"
	@docker volume rm $(addprefix $(PROJECT_NAME)_, $(VOLUMES)) 2>/dev/null || true

fclean: down clean
	@echo "$(GREEN)[REMOVING UNUSED IMAGES]$(RESET)"
	@docker image prune -af

re: fclean all
