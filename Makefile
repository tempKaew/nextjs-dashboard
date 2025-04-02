# Configuration for dev and prod environments
dc_conf=-f docker-compose.yml --env-file .env      # Configuration for the dev environment
dc_conf_prod=-f docker-compose.prod.yml --env-file .env   # Configuration for the prod environment
project_name=-p $(shell basename $(CURDIR))        # Set the project name to the current directory name

.PHONY: default
default: help  # Default target that shows the help message

.PHONY: help
help: ## Display help with available "make" commands
	@echo 'Available "make" commands:'
	@grep -E '^[a-zA-Z_-]+:(.*?## .*)*$$' $(MAKEFILE_LIST) | sed -e 's/Makefile://' -e 's/:/##/g' | sort | awk 'BEGIN {FS = "##"}; {printf "\033[36m%-30s\033[0m %-30s %s\n", $$1, $$3,$$4}'
	@echo
	@echo 'Run "make help" to see this doc'
	@echo

.PHONY: web
web: ## Run a shell inside the web container
	docker compose $(dc_conf) $(project_name) exec web sh

.PHONY: build
build: ## Build the local docker environment for dev
	docker compose $(dc_conf) $(project_name) build

.PHONY: prod-build
prod-build: ## Build the local docker environment for prod
	docker compose $(dc_conf_prod) $(project_name) build

.PHONY: prod-rebuild
prod-rebuild: ## Rebuild the Docker environment from scratch for prod (no cache)
	docker compose $(dc_conf_prod) $(project_name) build --no-cache

.PHONY: prod-down
prod-down: ## Stop and remove the local docker environment for prod
	docker compose $(dc_conf_prod) $(project_name) down

.PHONY: prod-up
prod-up: ## Start the local docker environment for prod
	docker compose $(dc_conf_prod) $(project_name) up -d

.PHONY: rebuild
rebuild: ## Rebuild the Docker environment from scratch for dev (no cache)
	docker compose $(dc_conf) $(project_name) build --no-cache

.PHONY: down
down: ## Stop and remove the local docker environment for dev
	docker compose $(dc_conf) $(project_name) down

.PHONY: up
up: ## Start the local docker environment for dev
	docker compose $(dc_conf) $(project_name) up -d

.PHONY: restart
restart: ## Restart the local docker environment for dev
	docker compose $(dc_conf) $(project_name) stop && docker compose $(dc_conf) $(project_name) up -d --build

.PHONY: reset
reset: down pull up ## Stop, remove, pull, and start the local docker environment for dev

.PHONY: ps
ps: ## Get the status of the local docker environment
	docker compose $(dc_conf) $(project_name) ps

.PHONY: pull
pull: ## Fetch the latest docker images
	docker compose $(dc_conf) $(project_name) pull

.PHONY: init-project
init-project: ## Initialize the project (copy .env.example to .env and start the environment)
	cp .env.example .env
	docker compose $(dc_conf) $(project_name) up -d
