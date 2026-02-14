#!/bin/bash
set -e

echo "=== Running as user: $(whoami) ==="
echo "=== HOME: $HOME ==="

# Add safe directory to bypass ownership check
git config --global --add safe.directory /github/workspace

# Show git config (for debugging)
echo "=== Git config ==="
git config --list --show-origin || true

echo "=== Local .git/config ==="
cat /github/workspace/.git/config || true

echo "=== Checking credential file exists ==="
ls -la /github/runner_temp/ || echo "Cannot list /github/runner_temp/"

# Try to fetch
echo "=== Attempting git fetch ==="
cd /github/workspace
git fetch origin
