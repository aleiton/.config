# Prompt
eval "$(starship init zsh)"
export CLICOLOR=1

# Zsh history
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export HISTSIZE=10000
export SAVEHIST=10000

# READLINE
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"

# Less
export LESSKEY="$XDG_CONFIG_HOME/less/lesskey"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"

# Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

# Cargo / Rustup
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

# RubyGems
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"

# IRB (Ruby REPL)
export IRBRC="$XDG_CONFIG_HOME/irb/irbrc"

# Bundler
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle/config"
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"

# PostgreSQL
export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
export PSQL_HISTORY="$XDG_CACHE_HOME/pg/psql_history"
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"

# Tmux auto-start DEV session
tmux has-session -t DEV 2>/dev/null
if [ $? != 0 ]; then
    tmux new-session -s DEV
fi
if [[ -z "$TMUX" ]]; then
    tmux attach -t DEV
else
    tmux switch-client -t DEV
fi

# Mise (also needed in interactive shells)
eval "$(~/.local/bin/mise activate zsh)"

# FZF - fuzzy finder (Ctrl+R for history search)
source <(fzf --zsh)

# Zsh Autosuggestions - fish-like suggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
