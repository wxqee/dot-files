#!/bin/bash
APP=$1
CONFIG_NAME=$2

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
PROJECT_DIR=$(dirname "$SCRIPT_DIR")

CONFIG_FILE=$(grep -o '"config_file": "[^"]*"' "$PROJECT_DIR/registry.json" | grep -A1 "\"$APP\"" | tail -1 | cut -d'"' -f4)
CONFIG_FILE=$(echo "$CONFIG_FILE" | sed "s|~|$HOME|")

if [ ! -f "$CONFIG_FILE" ]; then
    echo "❌ Config file not found: $CONFIG_FILE"
    exit 1
fi

DEST_DIR="$PROJECT_DIR/apps/$APP"
mkdir -p "$DEST_DIR"

cp "$CONFIG_FILE" "$DEST_DIR/$CONFIG_NAME.conf"
echo "✅ Configuration captured: $DEST_DIR/$CONFIG_NAME.conf"

"$SCRIPT_DIR/validate.sh" "$APP" "$CONFIG_NAME" || exit 1

echo "✅ Ready to commit!"