#!/bin/bash
APP=$1

source "$(dirname "${BASH_SOURCE[0]}")/../registry.json"

CONFIG_FILE=$(echo "$CONFIG_FILE" | sed "s|~|$HOME|")
BACKUP_FILE="${CONFIG_FILE}.bak.$(date +%Y%m%d_%H%M%S)"

if [ -f "$CONFIG_FILE" ]; then
    cp "$CONFIG_FILE" "$BACKUP_FILE"
    echo "✅ Backup created: $BACKUP_FILE"
else
    echo "ℹ️ No existing config to backup"
fi