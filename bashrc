# aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# color terminal
force_color_prompt=yes
export TERM=screen-256color

# colors
BLUE='\[\e[1;34m\]'
WHITE='\[\e[0m\]'
GREEN='\[\e[1;32m\]'
PURPLE='\[\e[1;35m\]'

# rbenv
eval "$(rbenv init -)"

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# git
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM=auto

# prompt
export PS1="$GREEN\h: $BLUE\w$PURPLE\$(__git_ps1) 
$WHITE→ "

# history settings
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
HISTCONTROL=ignoreboth
HISTFILESIZE=10000000000
HISTSIZE=1000000

# append to the history
shopt -s histappend

# check the window size to adapt LINES and COLUMNS size
shopt -s checkwinsize

# autocomplete
[[ `which brew` && -f `brew --prefix`/etc/bash_completion ]] &&
  . `brew --prefix`/etc/bash_completion

