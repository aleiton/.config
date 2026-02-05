#!/usr/bin/env bash
# =============================================================================
# Dotfiles Setup Script
# Run: ~/.config/setup.sh
# =============================================================================

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

CONFIG_DIR="$HOME/.config"

# -----------------------------------------------------------------------------
# Helper Functions
# -----------------------------------------------------------------------------

info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

success() {
    echo -e "${GREEN}[OK]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# -----------------------------------------------------------------------------
# Check macOS
# -----------------------------------------------------------------------------

if [[ "$(uname)" != "Darwin" ]]; then
    error "This script is designed for macOS"
    exit 1
fi

echo ""
echo "============================================="
echo "  Dotfiles Setup"
echo "============================================="
echo ""

# -----------------------------------------------------------------------------
# Install Homebrew
# -----------------------------------------------------------------------------

if ! command -v brew &> /dev/null; then
    info "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for Apple Silicon
    if [[ -f "/opt/homebrew/bin/brew" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    success "Homebrew installed"
else
    success "Homebrew already installed"
fi

# -----------------------------------------------------------------------------
# Install Dependencies via Brewfile
# -----------------------------------------------------------------------------

info "Installing dependencies from Brewfile..."
brew bundle --file="$CONFIG_DIR/Brewfile" || warn "Some packages may have failed"
success "Dependencies installed"

# -----------------------------------------------------------------------------
# Create XDG Directories
# -----------------------------------------------------------------------------

info "Creating XDG directories..."

directories=(
    "$HOME/.local/share/zsh"
    "$HOME/.local/share/irb"
    "$HOME/.local/share/nvm"
    "$HOME/.local/share/gem"
    "$HOME/.local/share/cargo"
    "$HOME/.local/share/rustup"
    "$HOME/.local/share/bundle"
    "$HOME/.cache/zsh"
    "$HOME/.cache/gem"
    "$HOME/.cache/bundle"
    "$HOME/.cache/less"
    "$HOME/.cache/pg"
    "$CONFIG_DIR/bundle"
    "$CONFIG_DIR/pg"
    "$CONFIG_DIR/less"
)

for dir in "${directories[@]}"; do
    mkdir -p "$dir"
done

success "XDG directories created"

# -----------------------------------------------------------------------------
# Create Symlinks
# -----------------------------------------------------------------------------

info "Creating symlinks..."

# ~/.zshenv -> points zsh to XDG config
if [[ ! -f "$HOME/.zshenv" ]] || [[ ! -L "$HOME/.zshenv" ]]; then
    cat > "$HOME/.zshenv" << 'EOF'
# Point zsh to XDG config directory
# This is the only file that needs to stay in $HOME
export ZDOTDIR="$HOME/.config/zsh"

# Source the actual zshenv from the XDG location
[[ -f "$ZDOTDIR/.zshenv" ]] && source "$ZDOTDIR/.zshenv"
EOF
    success "Created ~/.zshenv"
else
    success "~/.zshenv already exists"
fi

# ~/.tmux.conf -> symlink to XDG location
if [[ -L "$HOME/.tmux.conf" ]]; then
    success "~/.tmux.conf symlink already exists"
elif [[ -f "$HOME/.tmux.conf" ]]; then
    warn "~/.tmux.conf exists as a file, backing up to ~/.tmux.conf.bak"
    mv "$HOME/.tmux.conf" "$HOME/.tmux.conf.bak"
    ln -s "$CONFIG_DIR/tmux/tmux.conf" "$HOME/.tmux.conf"
    success "Created ~/.tmux.conf symlink"
else
    ln -s "$CONFIG_DIR/tmux/tmux.conf" "$HOME/.tmux.conf"
    success "Created ~/.tmux.conf symlink"
fi

# -----------------------------------------------------------------------------
# Install Tmux Plugin Manager (TPM)
# -----------------------------------------------------------------------------

TPM_DIR="$CONFIG_DIR/tmux/plugins/tpm"

if [[ -d "$TPM_DIR" ]]; then
    success "TPM already installed"
else
    info "Installing Tmux Plugin Manager..."
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
    success "TPM installed (run 'prefix + I' in tmux to install plugins)"
fi

# -----------------------------------------------------------------------------
# Set Zsh as Default Shell
# -----------------------------------------------------------------------------

if [[ "$SHELL" != *"zsh"* ]]; then
    info "Setting zsh as default shell..."
    chsh -s "$(which zsh)"
    success "Zsh set as default shell"
else
    success "Zsh already default shell"
fi

# -----------------------------------------------------------------------------
# Setup fzf Key Bindings
# -----------------------------------------------------------------------------

if [[ ! -f "$HOME/.fzf.zsh" ]]; then
    info "Setting up fzf..."
    "$(brew --prefix)/opt/fzf/install" --key-bindings --completion --no-update-rc --no-bash --no-fish
    success "fzf configured"
else
    success "fzf already configured"
fi

# -----------------------------------------------------------------------------
# Done
# -----------------------------------------------------------------------------

echo ""
echo "============================================="
echo -e "  ${GREEN}Setup complete!${NC}"
echo "============================================="
echo ""
echo "Next steps:"
echo "  1. Restart your terminal (or run: exec zsh)"
echo "  2. Open tmux and press 'prefix + I' to install plugins"
echo "  3. Run 'neofetch' to verify everything works"
echo ""
