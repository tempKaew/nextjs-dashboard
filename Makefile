dc_conf=-f docker-compose.yml --env-file .env
project_name=-p $(shell basename $(CURDIR))

.PHONY: default
default: help

.PHONY: help
help: ## This help
	@echo 'Available "make" commands:'
	@grep -E '^[a-zA-Z_-]+:(.*?## .*)*$$' $(MAKEFILE_LIST) | sed -e 's/Makefile://' -e 's/:/##/g' | sort | awk 'BEGIN {FS = "##"}; {printf "\033[36m%-30s\033[0m %-30s %s\n", $$1, $$3,$$4}'
	@echo
	@echo 'Run "make help" to see this doc'
	@echo

.PHONY: web
web: ## Run a shell inside the web container
	docker compose $(dc_conf) $(project_name) exec web sh

.PHONY: build
build: ## Start the local docker environment
	docker compose $(dc_conf) $(project_name) build

.PHONY: rebuild
rebuild: ## Rebuild the Docker environment from scratch (no cache)
	docker compose $(dc_conf) $(project_name) build --no-cache

.PHONY: down
down: ## Stop and remove the local docker environment
	docker compose $(dc_conf) $(project_name) down

.PHONY: up
up: ## Start the local docker environment
	docker compose $(dc_conf) $(project_name) up -d

.PHONY: restart
restart: ## Restart the local docker environment
	docker compose $(dc_conf) $(project_name) stop && docker compose $(dc_conf) $(project_name) up -d --build

.PHONY: reset
reset: down pull up ## Stop, remove, pull and start the local docker environment

.PHONY: ps
ps: ## Get the local docker environment status
	docker compose $(dc_conf) $(project_name) ps

.PHONY: pull
pull: ## Fetch docker images
	docker compose $(dc_conf) $(project_name) pull

.PHONY: init-project
init-project: ## Initialize the project
	cp .env.example .env
	docker compose $(dc_conf) $(project_name) up -d