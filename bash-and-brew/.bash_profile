# Whole session
source "${HOME}/.path"

# Interactive shell
source "${HOME}/.aliases"
source "${HOME}/.prompt"
source "${HOME}/.completions"

# Run tmux
if [[ ! $TERM =~ screen ]]; then
    exec tmux
fi

