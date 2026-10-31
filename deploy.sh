#!/usr/bin/env bash
# Upload public/ to the OVH VPS. The eighty-columns container serves it read-only,
# so new files are live as soon as the upload finishes.
# Usage: ./deploy.sh
set -euo pipefail

VPS="${VPS:-ubuntu@51.210.12.13}"
REMOTE_DIR="${REMOTE_DIR:-/home/ubuntu/eighty-columns/public}"

cd "$(dirname "$0")"
ssh "$VPS" "mkdir -p '$REMOTE_DIR'"
rsync -avz --delete public/ "$VPS:$REMOTE_DIR/"
