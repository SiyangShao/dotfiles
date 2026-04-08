# Alacritty Config

## Quick Start

```sh
# via unified installer
curl -fsSL https://raw.githubusercontent.com/SiyangShao/dotfiles/main/install.sh | bash -s -- alacritty

# or from a local clone
bash install.sh alacritty
```

This will symlink config files to `~/.config/alacritty/`.

> **Note:** Existing files are not overwritten.

## Structure

```
alacritty/
├── alacritty.toml          # Main config
├── tokyo-night-storm.toml  # Colorscheme
├── arch.toml               # Config for Arch Linux remote sessions
├── init.sh                 # Setup script
└── README.md
```
