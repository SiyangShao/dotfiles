# Karabiner Config

## Quick Start

```sh
# via unified installer
curl -fsSL https://raw.githubusercontent.com/SiyangShao/dotfiles/main/install.sh | bash -s -- karabiner

# or from a local clone
bash install.sh karabiner
```

This will symlink `karabiner.json` to `~/.config/karabiner/karabiner.json`.

> **Note:** Skipped if the file already exists. Karabiner's `assets/` and `automatic_backups/` directories are left untouched.

## Structure

```
karabiner/
├── karabiner.json   # Karabiner configuration (symlinked to ~/.config/karabiner/)
├── init.sh          # Setup script
└── README.md
```
