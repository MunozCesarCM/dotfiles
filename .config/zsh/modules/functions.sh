# archive extractor
ex() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# ls after cd
chpwd() {
  pwd                  # Show current path
  pwd | sed 's/./─/g'  # Draw a line of the current path length
  ls
}

# Show a greeting screen or an ls depending on where the terminal starts
if [ $(pwd) = $HOME ]; then
  # neofetch
  # pokemon-colorscripts --random 1-4 --no-title
  # $HOME/code/bash/pokepersonal.sh
else
  pwd
  pwd | sed 's/./─/g'
  ls -A --color=always --group-directories-first --sort=extension
  echo ""
fi

