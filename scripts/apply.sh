#!/bin/bash
APP=$1
CONFIG_TYPE=$2

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
PROJECT_DIR=$(dirname "$SCRIPT_DIR")

CONFIG_FILE=$(grep -o '"config_file": "[^"]*"' "$PROJECT_DIR/registry.json" | grep -A1 "\"$APP\"" | tail -1 | cut -d'"' -f4)
CONFIG_FILE=$(echo "$CONFIG_FILE" | sed "s|~|$HOME|")

SOURCE_CONFIG="$PROJECT_DIR/apps/$APP/$CONFIG_TYPE.conf"

if [ ! -f "$SOURCE_CONFIG" ]; then
    echo "❌ Config not found: $SOURCE_CONFIG"
    exit 1
fi

"$SCRIPT_DIR/backup.sh" "$APP"

cp "$SOURCE_CONFIG" "$CONFIG_FILE"
echo "✅ Config applied: $CONFIG_FILE"

POST_APPLY=$(grep -o '"post_apply": \[[^\]]*\]' "$PROJECT_DIR/registry.json" | grep -A1 "\"$APP\"" | tail -1)
if [[ "$POST_APPLY" == *"tmux source"* ]]; then
    tmux source "$CONFIG_FILE" 2>/dev/null || true
fi

echo "✅ Done!"