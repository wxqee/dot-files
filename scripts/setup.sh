#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
PROJECT_DIR=$(dirname "$SCRIPT_DIR")

echo "=== Dot-File Setup Wizard ==="
echo ""

PS3="Choose which application to setup: "
options=("tmux" "zsh" "vim" "git" "All" "Exit")
select opt in "${options[@]}"; do
    case $opt in
        "tmux")
            echo "Setting up tmux..."
            "$PROJECT_DIR/scripts/apply.sh" tmux vim-style
            ;;
        "zsh")
            echo "Setting up zsh..."
            "$PROJECT_DIR/scripts/install-oh-my-zsh.sh"
            "$PROJECT_DIR/scripts/apply.sh" zsh default
            ;;
        "vim")
            echo "Setting up vim..."
            "$PROJECT_DIR/scripts/apply.sh" vim default
            "$PROJECT_DIR/scripts/install-vim-plugins.sh"
            ;;
        "git")
            echo "Setting up git..."
            "$PROJECT_DIR/scripts/apply.sh" git default
            echo "⚠️  Please update your git config with your name and email:"
            echo "   git config --global user.name \"Your Name\""
            echo "   git config --global user.email \"your@email.com\""
            ;;
        "All")
            echo "Setting up all applications..."
            "$PROJECT_DIR/scripts/apply.sh" tmux vim-style
            "$PROJECT_DIR/scripts/install-oh-my-zsh.sh"
            "$PROJECT_DIR/scripts/apply.sh" zsh default
            "$PROJECT_DIR/scripts/apply.sh" vim default
            "$PROJECT_DIR/scripts/install-vim-plugins.sh"
            "$PROJECT_DIR/scripts/apply.sh" git default
            echo ""
            echo "✅ All applications setup complete!"
            echo ""
            echo "⚠️  Don't forget to:"
            echo "   1. Update git config: git config --global user.name/email"
            echo "   2. Restart your terminal"
            ;;
        "Exit")
            break
            ;;
        *)
            echo "Invalid option $REPLY"
            ;;
    esac
    echo ""
done