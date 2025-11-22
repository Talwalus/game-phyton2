#!/usr/bin/env bash
set -euo pipefail

# Run script for the project: activate or create venv and serve over HTTP
WORKDIR="$(cd "$(dirname "$0")" && pwd)"
cd "$WORKDIR"

if [ -d ".venv" ]; then
  # activate existing venv
  # shellcheck disable=SC1091
  source .venv/bin/activate
else
  # create venv and activate
  python -m venv .venv
  # shellcheck disable=SC1091
  source .venv/bin/activate
  pip install --upgrade pip
fi

PORT=${1:-8000}
echo "Serving http://localhost:$PORT from $WORKDIR (press Ctrl+C to stop)"
python -m http.server "$PORT"
