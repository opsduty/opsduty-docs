#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

echo "berth: setting up slot ${BERTH_SLOT} (generation ${BERTH_SLOT_GEN}), docs port ${DOCS_PORT}"

# This site names no resource after the slot, and that is a finding rather than an oversight: it
# is a static mkdocs-material build with no database, no redis, no queue and no .env. The only
# value that differs per workspace is the port, and run.sh passes that on the command line.
# Everything setup creates (.venv/, node_modules/) lives inside the worktree, so it is already
# private to this workspace and cannot be inherited from the slot's previous tenant.
#
# Both installs are idempotent and safe to re-run: uv reconciles .venv against uv.lock, and
# npm ci deletes node_modules outright before restoring it from package-lock.json.

# uv reads .python-version and downloads that interpreter if it is missing, so this does not
# depend on what the shell's python happens to be. berth hooks run non-interactively, where a
# version manager's global would otherwise leak in and pick the wrong python.
# --locked fails rather than silently re-resolving if uv.lock has drifted from pyproject.toml.
echo "berth: installing python dependencies…"
uv sync --locked

# Only prettier, i.e. only `make lint`, needs this. Installed here so a fresh workspace can lint
# without a second manual step.
echo "berth: installing node dependencies…"
npm ci

# The social plugin renders cards through cairosvg, which binds libcairo via cffi. That native lib
# is machine level (brew), not per-workspace, so setup checks rather than installs it: failing here
# with a clear message beats failing later inside a build, since mkdocs.yml sets strict: true.
# Probe cairosvg specifically - importing it is what actually dlopens libcairo.
if ! uv run python -c "import cairosvg" >/dev/null 2>&1; then
  echo "berth: warning - cairosvg is not importable, so the 'social' plugin will fail on build."
  echo "berth: install the native libs with: brew install cairo freetype libffi libjpeg libpng zlib"
fi

echo "berth: setup complete. Start the site with: berth run"
