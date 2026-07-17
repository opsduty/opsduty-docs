#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

echo "berth: serving docs for slot ${BERTH_SLOT} on http://127.0.0.1:${DOCS_PORT}/"

# mkdocs serve is a single process and serves livereload on the same port, so there is no process
# group to clean up: exec replaces this shell, so berth's stop signal reaches mkdocs directly and
# leaves nothing behind.
#
# The port comes from DOCS_PORT and is never hardcoded - mkdocs would otherwise default to 8000,
# which the main checkout and every other workspace would take too.
exec uv run mkdocs serve --dev-addr "127.0.0.1:${DOCS_PORT}"
