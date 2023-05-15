# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# vi mode
bindkey -v
export KEYTIMEOUT=1

# save history
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000000
export SAVEHIST=10000000

setopt CORRECTALL              # Try to correct the spelling of commands
setopt NOCASEGLOB              # Make command case insensitive
setopt AUTOCD AUTOPUSHD        # Change directories without cd
setopt BANG_HIST               # Treat the '!' character specially during expansion.
setopt INC_APPEND_HISTORY      # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY           # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST  # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS        # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS    # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS       # Do not display a line previously found.
setopt HIST_IGNORE_SPACE       # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS       # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS      # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY             # Don't execute immediately upon history expansion.

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete
[[ -n "${key[Tab]}"       ]] && bindkey -- "${key[Tab]}"        reverse-menu-complete

# command for recommendations
source ~/.config/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

bindkey '^f' down-line-or-select
bindkey '^r' history-incremental-search-backward

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

export FZF_DEFAULT_OPTS=" \
--color=bg+:#0D1017,bg:#0D1017,spinner:#f5e0dc,hl:#e5c07b \
--color=fg:#abb2bf,header:#e5c07b,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#fafafa,prompt:#cba6f7,hl+:#e5c07b \
--layout=reverse --info=inline --margin=3"

