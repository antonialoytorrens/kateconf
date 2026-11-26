#!/usr/bin/env bash
# Install Kate config from this repository onto the system.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

echo "==> Installing from $REPO"

mkdir -p "$CONFIG_HOME/kate" "$DATA_HOME/kxmlgui5/katebuild" "$DATA_HOME/kate"

cp -a "$REPO/config/katerc" "$CONFIG_HOME/katerc"
rsync -a --delete "$REPO/config/kate/" "$CONFIG_HOME/kate/"
cp -a "$REPO/share/kxmlgui5/katebuild/ui.rc" "$DATA_HOME/kxmlgui5/katebuild/ui.rc"
cp -a "$REPO/share/kate/anonymous.katesession" "$DATA_HOME/kate/anonymous.katesession"

echo "==> Install complete"
