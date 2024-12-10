PACKAGE      = opsduty-docs
BASE  	     = $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
NODE_MODULES = $(BASE)/node_modules

POETRY      = poetry
NPM         = npm

V = 0
Q = $(if $(filter 1,$V),,@)
M = $(shell printf "\033[34;1m▶\033[0m")

.PHONY: all
all: lint format build ; @ ## Build project
	$Q

$(POETRY): ; $(info $(M) checking POETRY…)
	$Q

$(NPM): ; $(info $(M) checking NPM…)
	$Q

$(BASE): | $(POETRY) ; $(info $(M) checking PROJECT…)
	$Q

.PHONY: lint
lint: lint-prettier | $(BASE) ; @ ## Run all linters
	$Q

.PHONY: format
format: format-prettier | $(BASE) ; @ ## Run all formatter
	$Q

# Build

.PHONY: build
build: .venv | $(BASE) ; $(info $(M) running build…) @ ## Run build
	$Q cd $(BASE) && $(POETRY) run mkdocs build

# Serve

.PHONY: serve
serve: .venv | $(BASE) ; $(info $(M) running serve…) @ ## Run serve
	$Q cd $(BASE) && $(POETRY) run mkdocs serve

# Linters

.PHONY: lint-prettier
lint-prettier: node_modules | $(BASE) ; $(info $(M) running prettier…) @ ## Run prettier linter
	$Q cd $(BASE) && $(NPM) run prettier:lint

# Formatters

.PHONY: format-prettier
format-prettier: node_modules | $(BASE) ; $(info $(M) running prettier…) @ ## Run prettier formatter
	$Q cd $(BASE) && $(NPM) run prettier:format

# Dependency management

.venv: pyproject.toml poetry.lock | $(BASE) ; $(info $(M) retrieving dependencies…) @ ## Install python dependencies
	$Q cd $(BASE) && $(POETRY) run pip install -U pip
	$Q cd $(BASE) && $(POETRY) install
	@touch $@

node_modules: package.json package-lock.json | $(BASE) ; $(info $(M) retrieving frontend dependencies…) @ ## Install nodejs dependencies
	$Q cd $(BASE) && $(NPM) ci
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
