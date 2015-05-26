# Whole session
source "${HOME}/.path"

# Interactive shell
source "${HOME}/.aliases"
source "${HOME}/.prompt"
source "${HOME}/.completions"

GPG_TTY=`tty`
export GPG_TTY
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend
export GREP_OPTIONS='--color=auto'
export EDITOR='vim'
set -o vi
