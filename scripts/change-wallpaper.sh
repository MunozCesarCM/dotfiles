#!/bin/sh

cd ~/images/wallpaper
file=$(find -type f | cut -c 3- | fzf)
sed -i "s/wallpaper\/.*--/wallpaper\/$file --/" ~/.config/X11/xinitrc
feh --bg-fill ~/images/wallpaper/$file --no-fehbg &
