#!/bin/bash

echo "=== Installing Vim plugins ==="

VIM_DIR="$HOME/.vim"
VUNDLE_DIR="$VIM_DIR/bundle/Vundle.vim"

if [ ! -d "$VUNDLE_DIR" ]; then
    echo "Installing Vundle..."
    git clone https://github.com/VundleVim/Vundle.vim.git "$VUNDLE_DIR"
fi

echo "Installing plugins..."
vim +PluginInstall +qall

echo "✅ Vim plugins installed successfully!"