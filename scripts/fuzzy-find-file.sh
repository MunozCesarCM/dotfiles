#!/bin/sh

# Go to home directory and search for files
file=$(fd . ~ -H \
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
  --type f | fzf )

# Get file extension
extension=${file##*.}
extension=${extension,,}

# Get file directory and cd into it
absolutedir=${file%/*}/
cd "$absolutedir"

# Strip filename
file=${file##*/}

# Dont open anything if the user quit
if [ "$file" != '' ]; then
  case $extension in
    mp3 ) mpv --no-video "$file" ;;
    wav ) mpv --no-video "$file" ;;
    wma ) mpv --no-video "$file" ;;
    m4a ) mpv --no-video "$file" ;;
    flac) mpv --no-video "$file" ;;

    mp4 ) nohup mpv "$file" >/dev/null 2>&1 & ;;
    mov ) nohup mpv "$file" >/dev/null 2>&1 & ;;
    wmv ) nohup mpv "$file" >/dev/null 2>&1 & ;;
    mkv ) nohup mpv "$file" >/dev/null 2>&1 & ;;

    jpg ) feh "$file" ;;
    jpeg) feh "$file" ;;
    png ) feh "$file" ;;
    webp) feh "$file" ;;
    gif ) feh "$file" ;;

    pdf ) nohup zathura "$file" >/dev/null 2>&1 & ;;
    epub) nohup zathura "$file" >/dev/null 2>&1 & ;;

    *) nvim "$file"
  esac

  sleep 0.5
fi
