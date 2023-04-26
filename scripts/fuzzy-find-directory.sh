#!/bin/sh

# Go to home directory and search for directories
cd
directory=$(fd -H \
  -E .cache \
  -E .vim \
  -E .pki \
  -E .npm \
  -E .local \
  -E .mozilla \
  -E .config/coc \
  -E .config/yarn \
  -E '**/node_modules/' \
  -E '**.git/' \
  --type d | fzf)

# Dont open anything if the user quit
if [ "$directory" != '' ]; then
  cd "$directory"
  zsh
fi

