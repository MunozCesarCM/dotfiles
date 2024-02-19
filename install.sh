#!/bin/sh

# Remove all dead links in home directory.
rm "$HOME"/*(-@D)

# Link all dotfiles to those in this repo.
for dotfile in "$HOME"/dotfiles/home/*; do
    echo "$dotfile"
    echo "$HOME/.${dotfile##*/}"
    ln -fsnv "$dotfile" "$HOME/.${dotfile##*/}"
done

