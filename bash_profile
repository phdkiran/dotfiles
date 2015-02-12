# Whole session
source "${HOME}/.path"

# Interactive shell
source "${HOME}/.aliases"
source "${HOME}/.prompt"
source "${HOME}/.completions"

export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend
export GREP_OPTIONS='--color=auto'
export EDITOR='vim'
set -o vi
