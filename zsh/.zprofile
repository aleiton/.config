# PATH setup
PATH=/usr/local/bin:$PATH
PATH=$HOME/bin:$PATH
PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
PATH="$XDG_DATA_HOME/gem/bin:$PATH"
export PATH

# Mise (modern version manager for Ruby, Node, etc.)
# Must be in .zprofile because macOS Terminal opens login shells
eval "$($(brew --prefix)/bin/mise activate zsh)"

