# dotfiles

My XDG-compliant configuration files.

## Structure

| Directory | Description |
|-----------|-------------|
| `alacritty/` | Terminal emulator config |
| `bat/` | Cat clone with syntax highlighting |
| `cargo/` | Rust package manager |
| `docker/` | Docker config |
| `git/` | Git config |
| `irb/` | Ruby REPL (IRB) config |
| `mise/` | Runtime version manager |
| `neofetch/` | System info display |
| `readline/` | Input line editing |
| `starship.toml` | Cross-shell prompt |
| `tmux/` | Terminal multiplexer |
| `zsh/` | Zsh shell config |

## Not included

- `nvim/` - Uses [LazyVim](https://github.com/LazyVim/starter) (separate repo)

## Shell setup

Using zsh with full XDG Base Directory support. The only file in `$HOME` is `~/.zshenv` which sets `ZDOTDIR` to point here.

Files:
- `zsh/.zshenv` - XDG variables, cargo env
- `zsh/.zprofile` - PATH, mise, nvm (login shells)
- `zsh/.zshrc` - Interactive shell config, fzf, autosuggestions

Symlinks from home:
- `~/.tmux.conf` -> `~/.config/tmux/tmux.conf`
