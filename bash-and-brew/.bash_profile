# Whole session
source "${HOME}/.path"

# Interactive shell
source "${HOME}/.aliases"
source "${HOME}/.prompt"
source "${HOME}/.completions"
[[ -r "${HOME}/.private" ]] && source "${HOME}/.private"
