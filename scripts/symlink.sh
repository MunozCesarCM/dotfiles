#!/bin/bash

# Set the dotfiles directory
DOTFILES_DIR="$HOME/dotfiles"

# Get a list of directories to symlink
DIRS=$(find "$DOTFILES_DIR/.config" -mindepth 1 -maxdepth 1 -type d -printf '%f\n')

# Create symlinks for each directory
for dir in $DIRS; do
  src="$DOTFILES_DIR/.config/$dir"
  dst="$HOME/.config"
  ln -sf "$src" "$dst"
  echo "Created symlink: $dst -> $src"
done

# Create a symlink for other files
ln -sf "$DOTFILES_DIR/.config/user-dirs.dirs" "$HOME/.config"

# Get a list of files to symlink
FILES=$(find "$DOTFILES_DIR/scripts" -type f -printf '%f\n')

# Create symlinks for each file
for file in $FILES; do
  src="$DOTFILES_DIR/scripts/$file"
  dst="$HOME/code/scripts"
  ln -sf "$src" "$dst"
  echo "Created symlink: $dst -> $src"
done

