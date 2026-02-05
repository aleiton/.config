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

# Mise (runtime version manager)
eval "$(~/.local/bin/mise activate zsh)"

# FZF - fuzzy finder (Ctrl+R for history search)
source <(fzf --zsh)

# Zsh Autosuggestions - fish-like suggestions (right arrow to accept)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#5c6370'  # OneDark comment gray

# Zsh Syntax Highlighting - colors commands as you type
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Aliases
alias reload='exec zsh'

# Tmux auto-start DEV session (at end to not interfere with plugins)
if command -v tmux &>/dev/null; then
    if [[ -z "$TMUX" ]]; then
        tmux has-session -t DEV 2>/dev/null || tmux new-session -d -s DEV
        tmux attach -t DEV
    fi
fi
