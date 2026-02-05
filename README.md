# dotfiles

My XDG-compliant configuration files for macOS.

## Quick Start

```bash
# Clone to ~/.config
git clone https://github.com/aleiton/.config.git ~/.config

# Run setup (installs dependencies, creates symlinks)
~/.config/setup.sh
```

## Structure

| Path | Description |
|------|-------------|
| `setup.sh` | One-command setup script |
| `Brewfile` | Homebrew dependencies |
| `alacritty/` | Terminal emulator (OneDark, FiraCode) |
| `bat/` | Cat with syntax highlighting |
| `git/` | Git config and global ignore |
| `irb/` | Ruby REPL with custom prompt |
| `mise/` | Runtime version manager |
| `neofetch/` | System info display |
| `readline/` | Input line editing |
| `starship.toml` | Cross-shell prompt |
| `tmux/` | Terminal multiplexer |
| `zsh/` | Zsh shell config |

## Not tracked

- `nvim/` - Uses [LazyVim](https://github.com/LazyVim/starter) - see [docs/nvim-setup.md](docs/nvim-setup.md)
- `docker/` - Contains local credentials

## Shell setup

Using zsh with full XDG Base Directory support.

**Files:**
- `~/.zshenv` - Only file in $HOME, sets ZDOTDIR
- `zsh/.zshenv` - XDG variables, cargo env
- `zsh/.zprofile` - PATH, mise, nvm
- `zsh/.zshrc` - Interactive config, fzf, autosuggestions

**Symlinks:**
- `~/.tmux.conf` -> `~/.config/tmux/tmux.conf`

## Tmux Keybindings

| Key | Action |
|-----|--------|
| `prefix + r` | Reload config |
| `prefix + h/j/k/l` | Navigate panes |
| `prefix + \|` | Split vertical |
| `prefix + -` | Split horizontal |
| `prefix + [` | Copy mode (vi keys) |
| `y` (copy mode) | Copy to clipboard |

## Manual Steps

After running `setup.sh`:

1. Restart terminal or run `exec zsh`
2. In tmux, press `prefix + I` to install plugins
3. Run `neofetch` to verify setup
