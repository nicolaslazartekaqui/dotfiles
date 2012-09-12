# aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# colors
BLUE='\[\e[1;34m\]'
WHITE='\[\e[0m\]'
GREEN='\[\e[1;32m\]'
PURPLE='\[\e[1;35m\]'

# git
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM=auto

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

# rbenv
eval "$(rbenv init -)"

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# prompt
PS1="$GREEN\u@\h: $BLUE\w$PURPLE\$(__git_ps1) 
$WHITE→ "

# alter terminal title
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac
