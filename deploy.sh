#!/usr/bin/env bash
# The VPS pulls origin/main every 2 minutes, so `git push` is all a deploy needs.
# This pushes and then makes the server pull right away instead of waiting.
# Usage: ./deploy.sh
set -euo pipefail

VPS="${VPS:-ubuntu@51.210.12.13}"
REMOTE_DIR="${REMOTE_DIR:-eighty-columns}"

cd "$(dirname "$0")"
git push
ssh "$VPS" "cd $REMOTE_DIR && git fetch -q origin main && git reset -q --hard origin/main && git log --oneline -1"
