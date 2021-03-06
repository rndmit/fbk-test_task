all:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "    \033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@echo
	@echo 'Доступные команды для управления локальным стедом:'
	@echo 'up – запускает локальный стенд'
	@echo 'down – останавливает локальный стенд'

ifeq (local,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(word 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

.PHONY: local
local: local-$(RUN_ARGS) ## Управление локальным стендом

local-up:
	@docker-compose -f deployments/docker-compose.yaml up -d

local-down:
	@docker-compose -f deployments/docker-compose.yaml down

.PHONY: cleanup
cleanup: ## Удалить все порожденное компоузом
	@rm -rf .tmp
	@docker image rm deployments_db:latest
	@docker image rm deployments_app:latest
	@docker image rm deployments_nginx:latest

.PHONE: drop
drop: local-down cleanup