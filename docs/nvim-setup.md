# Neovim (LazyVim) Setup

This documents my LazyVim configuration. The `nvim/` directory is ignored from git
(it's cloned from LazyVim starter), but this file tracks my customizations.

## Installation

```bash
# Clone LazyVim starter
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Open nvim - plugins install automatically
nvim
```

## Enabled Extras

Enable via `:LazyExtras` or edit `~/.config/nvim/lazyvim.json`:

### Coding
- [x] `coding.mini-surround` - Add/change/delete surroundings
- [x] `coding.yanky` - Yank history

### Editor
- [x] `editor.dial` - Increment/decrement numbers, dates
- [x] `editor.illuminate` - Highlight word under cursor
- [x] `editor.refactoring` - Extract function/variable

### Languages
- [x] `lang.docker` - Dockerfile support
- [x] `lang.git` - Git integration
- [x] `lang.json` - JSON schemas
- [x] `lang.markdown` - Markdown preview
- [x] `lang.ruby` - Ruby/Rails (solargraph LSP)
- [x] `lang.rust` - Rust (rust-analyzer, cargo)
- [x] `lang.tailwind` - Tailwind CSS
- [x] `lang.toml` - TOML (Cargo.toml)
- [x] `lang.typescript` - TypeScript/JavaScript
- [x] `lang.yaml` - YAML support

### Linting & Formatting
- [x] `linting.eslint` - ESLint for JS/TS
- [x] `formatting.prettier` - Prettier for JS/TS/CSS

### Testing & Debugging
- [x] `test.core` - Test runner (RSpec, Jest)
- [x] `dap.core` - Debug Adapter Protocol

### Utilities
- [x] `util.mini-hipatterns` - Highlight colors, TODOs

## Key Bindings

### General
| Key | Action |
|-----|--------|
| `<leader>` | Space |
| `<leader>e` | File explorer |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |

### Coding
| Key | Action |
|-----|--------|
| `gsa` | Add surrounding |
| `gsd` | Delete surrounding |
| `gsr` | Replace surrounding |
| `<C-a>` / `<C-x>` | Increment/decrement |

### LSP
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | References |
| `K` | Hover documentation |
| `<leader>ca` | Code actions |
| `<leader>cr` | Rename |

### Testing
| Key | Action |
|-----|--------|
| `<leader>tt` | Run nearest test |
| `<leader>tf` | Run file tests |
| `<leader>ts` | Toggle test summary |

### Debugging
| Key | Action |
|-----|--------|
| `<leader>db` | Toggle breakpoint |
| `<leader>dc` | Continue |
| `<leader>di` | Step into |
| `<leader>do` | Step over |
| `<leader>du` | Toggle DAP UI |

### Git
| Key | Action |
|-----|--------|
| `<leader>gg` | LazyGit |
| `<leader>gf` | Git files |
| `]h` / `[h` | Next/prev hunk |

## Custom Plugins

Add custom plugins in `~/.config/nvim/lua/plugins/init.lua`:

```lua
return {
  -- Example: add a plugin
  { "username/repo.nvim" },

  -- Example: override LazyVim defaults
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
```

## Updating

```vim
:Lazy update
```

## Themes

Installed: `tokyonight` (default), `catppuccin`

To change, add to `lua/plugins/init.lua`:
```lua
return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
```
