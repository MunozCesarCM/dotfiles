# Transient prompt with newline before prompt
[[ -c /dev/null ]]  ||  return
zmodload zsh/system ||  return

setopt PROMPT_SUBST
THEME_PROMPT_PREFIX=${THEME_PROMPT_PREFIX:-''}
THEME_VI_INS_MODE_SYMBOL=${THEME_VI_INS_MODE_SYMBOL:-'%F{white}%B$'}
THEME_VI_CMD_MODE_SYMBOL=${THEME_VI_CMD_MODE_SYMBOL:-'%F{green}%Bλ'}

# Set symbol for the initial mode
THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"

# on keymap change, define the mode and redraw prompt
zle-keymap-select() {
if [ "${KEYMAP}" = 'vicmd' ]; then
  THEME_VI_MODE_SYMBOL="${THEME_VI_CMD_MODE_SYMBOL}"
else
  THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"
fi
zle reset-prompt
}
zle -N zle-keymap-select

# reset to default mode at the end of line input reading
zle-line-finish() {
THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"
}
zle -N zle-line-finish

# Fix a bug when you C-c in CMD mode, you'd be prompted with CMD mode indicator
# while in fact you would be in INS mode.
# Fixed by catching SIGINT (C-c), set mode to INS and repropagate the SIGINT,
# so if anything else depends on it, we will not break it.
TRAPINT() {
  THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"
  return $(( 128 + $1 ))
}

## Set the transient prompt PROMPT here -
NEWLINE=$'\n'
TRANSIENT_PROMPT='${NEWLINE}%B$ '

zsh_prompt_home() {
  if [ $(pwd) = /home/cesar ]; then
    echo "home"
  else
    basename $(pwd)
  fi
}

zsh_prompt_size() {
  du -sch | head -1 | awk '{print $1}'
}

function set_prompt {
  PROMPT='%B${NEWLINE}%F{blue} $(ls -l | grep "^-" | wc -l | tr -d " ")F %F{white}| %F{yellow}$(ls -l | grep "^d" | wc -l | tr -d " ")D %F{white}| %F{green}$(zsh_prompt_home)${NEWLINE} %(?.$THEME_VI_MODE_SYMBOL.$THEME_VI_MODE_SYMBOL)%F{white}%B  '
  #PROMPT='%B${NEWLINE}%F{blue} $(ls -l | grep "^-" | wc -l | tr -d " ")F %F{white}| %F{yellow}$(ls -l | grep "^d" | wc -l | tr -d " ")D %F{white}| %F{magenta}$(zsh_prompt_size) %F{white}| %F{green}$(zsh_prompt_home)${NEWLINE} %(?.$THEME_VI_MODE_SYMBOL.$THEME_VI_MODE_SYMBOL) %F{white} '
  RPROMPT='%(?.%F{blue} .%F{red} )'
}

typeset -g _transient_prompt_newline=
function _transient_prompt_set_prompt {
  set_prompt
  PROMPT='$_transient_prompt_newline'$PROMPT
}; _transient_prompt_set_prompt

zle -N clear-screen _transient_prompt_widget-clear-screen
function _transient_prompt_widget-clear-screen {
_transient_prompt_newline=
zle .clear-screen
}

zle -N send-break _transient_prompt_widget-send-break
function _transient_prompt_widget-send-break {
_transient_prompt_widget-zle-line-finish
zle .send-break
}

zle -N zle-line-finish _transient_prompt_widget-zle-line-finish
function _transient_prompt_widget-zle-line-finish {
(( ! _transient_prompt_fd )) && {
  sysopen -r -o cloexec -u _transient_prompt_fd /dev/null
  zle -F $_transient_prompt_fd _transient_prompt_restore_prompt
}
zle && PROMPT=$TRANSIENT_PROMPT RPROMPT= zle reset-prompt && zle -R
}

function _transient_prompt_restore_prompt {
  exec {1}>&-
  (( ${+1} )) && zle -F $1
  _transient_prompt_fd=0
  _transient_prompt_set_prompt
  zle reset-prompt
  zle -R
}

(( ${+precmd_functions} )) || typeset -ga precmd_functions
(( ${#precmd_functions} )) || {
  do_nothing() {true}
  precmd_functions=(do_nothing)
}

precmd_functions+=_transient_prompt_precmd
function _transient_prompt_precmd {
  # We define _transient_prompt_precmd in this way because we don't want
  # _transient_prompt_newline to be defined on the very first precmd.
  TRAPINT() {zle && _transient_prompt_widget-zle-line-finish; return $(( 128 + $1 ))}
  function _transient_prompt_precmd {
    TRAPINT() {zle && _transient_prompt_widget-zle-line-finish; return $(( 128 + $1 ))}
    _transient_prompt_newline=$'\n'
  }
}

