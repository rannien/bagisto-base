.PHONY: up down prune generate_key

green=$(shell tput setaf 2)
red=$(shell tput setaf 1)
reset_color=$(shell tput setaf 9)

ifneq (,$(wildcard ./.env))
    include .env
    export
else
    include .env.example
    export
endif

_init_project:
	@bash ./docker/init.sh

up: _init_project
	@echo "$(green)Starting..$(reset_color)"
	@cd docker && COMPOSE_BAKE=true docker compose up -d --build

down:
	@echo "$(red)Stopping..$(reset_color)"
	@cd docker && docker compose down

prune:
	@echo "$(red)Pruning..$(reset_color)"
	@cd docker && docker compose down --volumes && cd ..
	@rm -f .env
		@find storage -mindepth 1 -not -name ".gitignore" -not -name "cities-data.xlsx" -delete

ps:
	@cd docker && docker compose ps

php_shell:
	@docker exec -it $(COMPOSE_PROJECT_NAME)-php-1 /bin/bash
