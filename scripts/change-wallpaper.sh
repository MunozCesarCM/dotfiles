#!/bin/sh

# Check for dependencies
if ! command -v feh > /dev/null; then
  echo "Error: feh is not installed. Aborting."
  exit 1
fi

# Set directories
WALLPAPER_DIR="$HOME/images/wallpaper"
XINIT_DIR="$HOME/.config/X11/xinitrc"

# Check if wallpaper directory is empty
if [ -z "$(ls -A $WALLPAPER_DIR)" ]; then
  echo "Error: $WALLPAPER_DIR is empty. Aborting."
  exit 1
fi

# Select an image from list
SELECTED_IMAGE=$(ls $WALLPAPER_DIR | grep -E '\.(png|jpg|jpeg)$' | fzf)
SELECTED_IMAGE="$WALLPAPER_DIR/$SELECTED_IMAGE"

# Set the wallpaper
feh --bg-fill "$SELECTED_IMAGE"
sed  -i "s|feh.*|feh --bg-fill $SELECTED_IMAGE --no-fehbg \&|" "$XINIT_DIR"
