#!/usr/bin/env bash
# Copy Kate config from the system into this repository.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

echo "==> Capturing from $CONFIG_HOME and $DATA_HOME"

mkdir -p "$REPO/config/kate" "$REPO/share/kxmlgui5/katebuild" "$REPO/share/kate"

cp -a "$CONFIG_HOME/katerc" "$REPO/config/katerc"
rsync -a --delete "$CONFIG_HOME/kate/" "$REPO/config/kate/"
cp -a "$DATA_HOME/kxmlgui5/katebuild/ui.rc" "$REPO/share/kxmlgui5/katebuild/ui.rc"
cp -a "$DATA_HOME/kate/anonymous.katesession" "$REPO/share/kate/anonymous.katesession"

echo "==> Capture complete"
echo "Review with: git -C \"$REPO\" status"
