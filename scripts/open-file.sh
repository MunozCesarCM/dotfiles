#!/bin/sh

if [ "$1" != '' ]; then

    # Get file extension
    extension=$(echo ${1} | awk -F . '{print $NF}')
    extension=$(echo ${extension} | awk '{print tolower($0)}')

    case $extension in
        mp3 ) mpv --no-video "$1" ;;
        wav ) mpv --no-video "$1" ;;
        wma ) mpv --no-video "$1" ;;
        m4a ) mpv --no-video "$1" ;;
        flac) mpv --no-video "$1" ;;

        mp4 ) devour mpv "$1" ;;
        mov ) devour mpv "$1" ;;
        wmv ) devour mpv "$1" ;;
        mkv ) devour mpv "$1" ;;

        jpg ) devour feh "$@" ;;
        jpeg) devour feh "$@" ;;
        png ) devour feh "$@" ;;
        webp) devour feh "$@" ;;
        gif ) devour feh "$@" ;;

        pdf ) devour zathura "$@" ;;
        epub) devour zathura "$@" ;;

        *) nvim "$@"
    esac
fi

