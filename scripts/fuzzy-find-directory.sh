#!/bin/sh

# Go to home directory and search for directories
cd
directory=$(fd -H \
  -E .cache -E .vim -E .config/coc -E .local -E '*.git' -E .config/nvim/ -E .mozilla --type d \
  | fzf)

# Dont open anything if the user quit
if [ "$directory" != '' ]; then
  cd "$directory"
  zsh
fi

