PACKAGE      = opsduty-docs
BASE  	     = $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

POETRY      = poetry

V = 0
Q = $(if $(filter 1,$V),,@)
M = $(shell printf "\033[34;1m▶\033[0m")

.PHONY: all
all: build ; @ ## Build project
	$Q

$(POETRY): ; $(info $(M) checking POETRY…)
	$Q

$(BASE): | $(POETRY) ; $(info $(M) checking PROJECT…)
	$Q

# Build

.PHONY: build
build: .venv | $(BASE) ; $(info $(M) running build…) @ ## Run build
	$Q cd $(BASE) && $(POETRY) run mkdocs build

# Serve

.PHONY: serve
serve: .venv | $(BASE) ; $(info $(M) running serve…) @ ## Run serve
	$Q cd $(BASE) && $(POETRY) run mkdocs serve

# Dependency management

.venv: pyproject.toml poetry.lock | $(BASE) ; $(info $(M) retrieving dependencies…) @ ## Install python dependencies
	$Q cd $(BASE) && $(POETRY) run pip install -U pip
	$Q cd $(BASE) && $(POETRY) install
	@touch $@

# Misc

.PHONY: clean
clean: ; $(info $(M) cleaning…) @ ## Cleanup caches and virtual environment
	@rm -rf .eggs *.egg-info .venv test-reports node_modules
	@find . -type d -name '__pycache__' -exec rm -rf {} +
	@find . -type d -name '*pytest_cache*' -exec rm -rf {} +

.PHONY: help
help: ## This help message
	@grep -E '^[ a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' | sort
