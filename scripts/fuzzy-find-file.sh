#!/bin/sh

# Go to home directory and search for files
cd
file=$(fd -H \
    -E .cache -E .vim -E .config/coc -E .local -E '*.git/' -E .mozilla --type f | fzf )

# Get file extension
extension=$(echo ${file} | awk -F . '{print $NF}')
extension=$(echo ${extension} | awk '{print tolower($0)}')

# Get file directory and cd into it
# This is so coc can work correctly
absolutedir=$(echo $file | sed 's%/[^/]*$%/%')
cd "$absolutedir"

# Strip filename
file=$(echo $file | sed "s/.*\///")

# Dont open anything if the user quit
if [ "$file" != '' ]; then
    case $extension in
        mp3 ) mpv --no-video "$file" ;;
        wav ) mpv --no-video "$file" ;;
        wma ) mpv --no-video "$file" ;;
        m4a ) mpv --no-video "$file" ;;
        flac) mpv --no-video "$file" ;;

        mp4 ) devour mpv "$file" ;;
        mov ) devour mpv "$file" ;;
        wmv ) devour mpv "$file" ;;
        mkv ) devour mpv "$file" ;;

        jpg ) devour feh "$file" ;;
        jpeg) devour feh "$file" ;;
        png ) devour feh "$file" ;;
        webp) devour feh "$file" ;;
        gif ) devour feh "$file" ;;

        pdf ) devour zathura "$file" ;;
        epub) devour zathura "$file" ;;

        *) nvim "$file"
    esac
fi
