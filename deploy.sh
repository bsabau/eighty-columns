#!/usr/bin/env bash
# The VPS keeps a clone of this repo and serves its public/ folder.
# Deploying = push to GitHub, then have the server pull origin/main.
# Usage: ./deploy.sh
set -euo pipefail

VPS="${VPS:-ubuntu@51.210.12.13}"
REMOTE_DIR="${REMOTE_DIR:-eighty-columns}"

cd "$(dirname "$0")"
git push
ssh "$VPS" "cd $REMOTE_DIR && git fetch -q origin main && git reset -q --hard origin/main && git log --oneline -1"
