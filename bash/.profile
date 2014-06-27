source "$HOME/.path"
source "$HOME/.aliases"
source "$HOME/.prompt"
source "$HOME/.completions"

# PLEASE FILL `.private` WITH YOUR DATA
[ -e "$HOME/.private" ] && source "$HOME/.private"

# Make Vim the default editor
export EDITOR='vim'
alias e="$EDITOR ."

# Use Vi to edit command line
set -o vi

# Always enable colored `grep` output
export GREP_OPTIONS='--color=auto'
