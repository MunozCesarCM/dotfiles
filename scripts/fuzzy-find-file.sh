#!/bin/sh

# Go to home directory and search for files
file=$(fd . ~ -H "${IGNORE_RULES[@]}" --type f | fzf)

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
        mp3 ) devour mpv --no-video "$file" ;;
        wav ) devour mpv --no-video "$file" ;;
        wma ) devour mpv --no-video "$file" ;;
        m4a ) devour mpv --no-video "$file" ;;
        flac) devour mpv --no-video "$file" ;;

        mp4 ) nohup mpv "$file" >/dev/null 2>&1 & ;;
        mov ) nohup mpv "$file" >/dev/null 2>&1 & ;;
        wmv ) nohup mpv "$file" >/dev/null 2>&1 & ;;
        mkv ) nohup mpv "$file" >/dev/null 2>&1 & ;;

        jpg ) devour feh "$file" ;;
        jpeg) devour feh "$file" ;;
        png ) devour feh "$file" ;;
        webp) devour feh "$file" ;;
        gif ) devour feh "$file" ;;

        pdf ) nohup zathura "$file" >/dev/null 2>&1 & ;;
        epub) nohup zathura "$file" >/dev/null 2>&1 & ;;

        *) nvim "$file"
    esac
    sleep 0.5
fi
