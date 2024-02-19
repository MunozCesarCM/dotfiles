#!/bin/sh

# Get the ignore rules
source "$HOME/dotfiles/scripts/constants/ignore-rules.sh"

# Go to home directory and search for directories
directory=$(fd . ~ -H "${IGNORE_RULES[@]}" --type d | fzf)

# Dont open anything if the user quit
if [ -n "$directory" ]; then
  cd "$directory"
  zsh
fi

