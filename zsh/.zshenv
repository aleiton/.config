# XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Cargo (Rust toolchain)
[[ -f "$XDG_DATA_HOME/cargo/env" ]] && . "$XDG_DATA_HOME/cargo/env"
