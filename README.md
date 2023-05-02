# Dotfiles

This repository contains a collection of configuration files and scripts for the Void Linux operating system. The purpose of this repository is to provide users with pre-configured files that can be used to customize their system quickly and easily.

## Configuration Files
The configuration files included in this repository are used to customize various aspects of the system. Below is a brief description of each file:

| Program   | File/Directory    | Description |
|-----------|------------------|-------------|
| X11       | xinitrc          | A file used to configure the X11 startup applications. This file can be used to set the keyboard layout, wallpaper, and other settings for X11. |
| dwm       | config.h         | A file used to configure dwm, a lightweight window manager. This file can be used to customize keyboard shortcuts, window placement, and more. |
| feh       | keys / theme     | A directory used to store wallpaper images for the desktop background. |
| mpv       | mpv.conf         | A file used to configure mpv, a media player. This file can be used to set playback options, audio and subtitle tracks, and more. |
| nvim      | init.lua         | A file used to configure neovim, a powerful text editor. This file can be used to set key bindings, plugins, and other options for neovim. |
| qutebrowser | config.py      | A file used to configure qutebrowser, a web browser. This file can be used to set key bindings, default search engines, and other options for qutebrowser. |
| ranger    | rc.conf          | A file used to configure ranger, a terminal-based file manager. This file can be used to set key bindings, color schemes, and other options for ranger. |
| st        | config.h         | A file used to configure st, a simple terminal emulator. This file can be used to set fonts, colors, and other options for st. |
| sxhkd     | sxhkdrc          | A file used to configure sxhkd, a hotkey daemon. This file can be used to set keyboard shortcuts for various actions on the system. |
| zathura   | zathurarc        | A file used to configure zathura, a document viewer. This file can be used to set key bindings, document rendering options, and other options for zathura. |
| zsh       | .zshrc           | A file used to configure zsh, a powerful shell. This file can be used to set aliases, functions, and other options for zsh. |


## Scripts
The scripts included in this repository are used to manage the configuration files and customize the system further. Below is a brief description of each script:

| Script Name               | Description                                                                                                                                                                               |
|---------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| change-keyboard-layout.sh | A script used to change the keyboard layout on the fly. This can be useful for users who frequently switch between different languages or keyboard layouts.                          |
| change-wallpaper.sh       | A script used to change the desktop wallpaper. This script allows users to quickly and easily change the desktop background without having to open the settings menu.                   |
| dwmstatus.sh              | A script used to display system information in dwm. This script can be used to show information such as CPU usage, memory usage, and disk space usage in the dwm status bar.             |
| fuzzy-find-directory.sh   | A script used to find directories using a fuzzy search algorithm. This script can be useful for users who have many directories and want to quickly navigate to a specific directory. |
| fuzzy-find-file.sh        | A script used to find files using a fuzzy search algorithm. This script can be useful for users who have many files and want to quickly open a specific file.                          |
| open-file.sh              | A script used to open any file type with a single command. This script allows users to quickly open files without having to remember the correct command or application to use for a specific file type. |
| symlink.sh                | A script used to create symlinks for the configuration files. This script allows users to quickly set up their system by creating the necessary symlinks for the configuration files included in this repository. |
