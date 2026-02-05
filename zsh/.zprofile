# PATH setup
PATH=/usr/local/bin:$PATH
PATH=$HOME/bin:$PATH
PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
PATH="$XDG_DATA_HOME/gem/bin:$PATH"
export PATH

# Mise (modern version manager for Ruby, Node, etc.)
# Must be in .zprofile because macOS Terminal opens login shells
eval "$($HOME/.local/bin/mise activate zsh)"

# NVM (Node Version Manager)
export NVM_DIR="$XDG_DATA_HOME/nvm"
[[ -s "$(brew --prefix nvm)/nvm.sh" ]] && source "$(brew --prefix nvm)/nvm.sh"
