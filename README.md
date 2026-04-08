# Dotfiles

Personal configuration files managed with symlinks.

## Quick Start

Install all components:

```sh
curl -fsSL https://raw.githubusercontent.com/SiyangShao/dotfiles/main/install.sh | bash
```

Install a single component:

```sh
curl -fsSL https://raw.githubusercontent.com/SiyangShao/dotfiles/main/install.sh | bash -s -- claude
```

Install multiple components:

```sh
curl -fsSL https://raw.githubusercontent.com/SiyangShao/dotfiles/main/install.sh | bash -s -- claude alacritty zellij
```

If you've already cloned the repo:

```sh
bash install.sh              # all components
bash install.sh claude       # single component
bash install.sh claude nvim  # multiple components
```

## Components

| Component | Target | Description |
|-----------|--------|-------------|
| [aerospace](aerospace/) | `~/.aerospace.toml` | Tiling window manager |
| [alacritty](alacritty/) | `~/.config/alacritty/` | Terminal emulator |
| [claude](claude/) | `~/.claude/CLAUDE.md` | Global Claude Code config |
| [karabiner](karabiner/) | `~/.config/karabiner/karabiner.json` | Keyboard customizer |
| [nvim](nvim/) | `~/.config/nvim/` | Neovim editor (copies, not symlinks) |
| [zellij](zellij/) | `~/.config/zellij/config.kdl` | Terminal multiplexer |

> **Note:** Existing files are never overwritten. Remove or back up the target first if you want to re-link.
