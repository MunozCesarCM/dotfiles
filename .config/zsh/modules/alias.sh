alias sx='sudo keyd &; startx "/home/cesar/.config/X11/xinitrc" --'
alias hp='sudo keyd &; Hyprland --'

# add color to terminal
alias ls='ls -A --color=always --group-directories-first --sort=extension'
alias ll='ls -Agh --color=always --group-directories-first --sort=extension'
alias ip='ip --color=always'
alias grep='grep --color=always'
alias diff='diff --color=always'

# improve commands
alias mv='mv -iv'
alias cp='cp -riv'
alias mkdir='mkdir -vp'
alias df='df -h'
alias du='du -h'

# quick alias
alias v='nvim'
alias r='ranger'

# quickly exit directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# scripts
alias o='~/code/bash/open-file.sh'
alias co='~/code/bash/auto-compile-cpp.sh'
alias ff='~/code/bash/fuzzy-find-file.sh'
alias fcd='~/code/bash/fuzzy-find-directory.sh'
alias chwp='~/code/bash/change-wallpaper.sh'
