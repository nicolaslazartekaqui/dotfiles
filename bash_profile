# default editor
export EDITOR='vim'

# optimize ruby garbage collector
RUBY_HEAP_MIN_SLOTS=600000
RUBY_GC_MALLOC_LIMIT=59000000
RUBY_HEAP_FREE_MIN=100000

# colors to ls
export CLICOLOR=1

export GREP_OPTIONS="--color=auto"

# history
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
export HISTCONTROL=ignoreboth
export HISTFILESIZE=10000000000
export HISTSIZE=1000000

shopt -s histappend

# git stuff for prompt
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM=true

# add path to projects in cd
export CDPATH=".:~:~/Dropbox/projects:~/Projects"

# add local bin in path
export PATH=/usr/local/bin:$PATH

# load aliases
export DOTFILES=$HOME/.dotfiles
source $DOTFILES/aliases

# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# prompt
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

# use sessions in terminal
TERM=xterm; export TERM

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
