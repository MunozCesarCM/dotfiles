#!/bin/sh

# Link all dotfiles to those in this repo.
ln -fsnv "$HOME/dotfiles/home/xinitrc" "$HOME/.xinitrc"
ln -fsnv "$HOME/dotfiles/home/zshrc" "$HOME/.zshrc"

for dotfile in "$HOME"/dotfiles/home/config/*; do
    ln -fsnv "$dotfile" "$HOME/.config/${dotfile##*/}"
done

