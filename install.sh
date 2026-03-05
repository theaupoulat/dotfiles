#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
HOME_DIR="$HOME"

# Symlink dotfiles
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME_DIR/.zshrc"
ln -sf "$DOTFILES_DIR/.tmux.conf" "$HOME_DIR/.tmux.conf"

# Symlink .config entries
mkdir -p "$HOME_DIR/.config"
for item in "$DOTFILES_DIR/.config/"*; do
  ln -sf "$item" "$HOME_DIR/.config/$(basename "$item")"
done

echo "Dotfiles installed."
