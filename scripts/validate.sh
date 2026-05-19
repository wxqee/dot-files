#!/bin/bash
APP=$1
CONFIG_TYPE=$2

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
PROJECT_DIR=$(dirname "$SCRIPT_DIR")
CONFIG_FILE="$PROJECT_DIR/apps/$APP/$CONFIG_TYPE.conf"

if [ ! -f "$CONFIG_FILE" ]; then
    echo "❌ Config file not found: $CONFIG_FILE"
    exit 1
fi

if grep -E -i '(password|token|secret|api[_-]?key|access[_-]?key)' "$CONFIG_FILE" > /dev/null; then
    echo "❌ Found sensitive data in config!"
    exit 1
fi

echo "✅ Validation passed!"