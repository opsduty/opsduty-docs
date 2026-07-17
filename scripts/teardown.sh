#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

echo "berth: tearing down slot ${BERTH_SLOT} (generation ${BERTH_SLOT_GEN})"

# Nothing this project creates escapes the worktree, so there is nothing here that would leak if
# teardown were skipped: no database to drop, no redis keyspace, no container, no volume, no temp
# dir outside the checkout. berth removes the worktree after this runs, which takes .venv/,
# node_modules/, site/ and .cache/ with it.
#
# We still remove them, for the case where teardown is invoked on its own (`berth run teardown`)
# and the worktree survives, and to release the disk before the slot is re-leased. The poetry and
# npm caches under $HOME are deliberately left alone: they are shared with every other project on
# this machine and are not ours to clear.
#
# Never exit non-zero: teardown must not block deletion of the workspace. Each removal reports and
# carries on, and each is idempotent because rm -rf on a missing path is a no-op - this may well
# run against a workspace whose setup never finished.
for path in .venv node_modules site .cache; do
  if [ -e "$path" ]; then
    if rm -rf "$path"; then
      echo "berth: removed $path"
    else
      echo "berth: warning - could not remove $path, continuing anyway"
    fi
  fi
done

echo "berth: teardown complete"
exit 0
