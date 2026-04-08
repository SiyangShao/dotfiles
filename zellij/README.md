# Zellij Config

## Quick Start

```sh
# via unified installer
curl -fsSL https://raw.githubusercontent.com/SiyangShao/dotfiles/main/install.sh | bash -s -- zellij

# or from a local clone
bash install.sh zellij
```

This will symlink `config.kdl` to `~/.config/zellij/config.kdl`.

> **Note:** Skipped if the file already exists.

## Structure

```
zellij/
├── config.kdl   # Zellij configuration (symlinked to ~/.config/zellij/)
├── init.sh      # Setup script
└── README.md
```
