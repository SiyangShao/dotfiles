# Neovim Config

## Quick Start

No need to clone the repo. Run this one-liner:

```sh
curl -fsSL https://raw.githubusercontent.com/SiyangShao/dotfiles/main/nvim/init.sh | bash
```

This will:
1. Install neovim using the system package manager (`brew`, `dnf`, or `pacman`)
2. Set `nvim` as the default editor (`$EDITOR` / `$VISUAL`) in your shell rc file
3. Copy this config to `~/.config/nvim`

If no supported package manager is found, or if the install fails, neovim is downloaded directly from GitHub releases. When run in an interactive terminal, you will be prompted for the install path (default: `/usr/local/bin/nvim`). When run non-interactively (e.g. piped via `curl | bash`), the default path is used automatically.

> **Note:** Neovim is skipped if already installed. The config copy is skipped if `~/.config/nvim` already exists.

## Requirements

- `curl` and `tar` (for one-liner install)
- `sudo` access (for writing to `/usr/local/bin` when installing from URL)
- Neovim >= 0.7

## Structure

```
nvim/
├── init.lua          # Entry point, loads all modules
├── init.sh           # Setup script
└── lua/
    ├── options.lua   # Editor options (tabs, UI, search, clipboard)
    ├── keymap.lua    # Key mappings
    ├── plugins.lua   # Plugin manager (lazy.nvim) and plugins
    └── color.lua     # Colorscheme
```

## Plugins

Plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim), which is auto-installed on first launch.

| Plugin | Description |
|--------|-------------|
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | Colorscheme |

## Key Mappings

| Mode | Key | Action |
|------|-----|--------|
| Normal | `Ctrl+h/j/k/l` | Navigate between splits |
| Normal | `Ctrl+Up/Down` | Resize split horizontally |
| Normal | `Ctrl+Left/Right` | Resize split vertically |
| Visual | `<` / `>` | Indent and stay in visual mode |
