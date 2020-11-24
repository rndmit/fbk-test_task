all:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "    \033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@echo

ifeq (local,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(word 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

.PHONY: local
local: local-$(RUN_ARGS) ## Управление локальной средой разработки

local-up:
	@docker-compose -f deployments/docker-compose.yaml up -d

local-down:
	@docker-compose -f deployments/docker-compose.yaml down