export DOTFILES=$HOME/.dotfiles

export projects=$HOME/Projects

export EDITOR='vim'

# Optimize ruby garbage collector
RUBY_HEAP_MIN_SLOTS=600000
RUBY_GC_MALLOC_LIMIT=59000000
RUBY_HEAP_FREE_MIN=100000

# Colors to ls
export CLICOLOR=1

# History
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
export HISTCONTROL=ignoreboth
export HISTFILESIZE=10000000000
export HISTSIZE=1000000

# git stuff for prompt
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM=true

export CDPATH=".:~:~/Dropbox/projects:~/projects"

export PATH=/usr/local/bin:$PATH

source $DOTFILES/aliases

if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

shopt -s histappend

build_ps1() {
  local blue='\[\e[0;34m\]'
  local red='\[\e[0;31m\]'
  local yellow='\[\e[0;33m\]'
  local reset='\[\e[00m\]'
  local green='\[\e[0;32m\]'
  local bred='\[\e[1;31m\]'
  local bwhite='\[\e[1;0m\]'

  local git_ps1=$bred'$(__git_ps1 "(%s)")'
  local pwd_ps1=$blue"\W"
  local prompt_ps1="$([[ ${EUID} == 0 ]] && echo $red'#' || echo $green'$')"

  export PS1="$pwd_ps1$git_ps1 $prompt_ps1 $reset"
}; build_ps1

TERM=xterm; export TERM
