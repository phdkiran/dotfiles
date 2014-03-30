source "$HOME/.path"
source "$HOME/.aliases"
source "$HOME/.prompt"
source "$HOME/.completions"

# PLEASE FILL `.private` WITH YOUR DATA
[ -e "$HOME/.private" ] && source "$HOME/.private"

# Make Sublime Text the default editor
export EDITOR='subl'

# Always enable colored `grep` output
export GREP_OPTIONS='--color=auto'