# Aerospace Config

## Quick Start

```sh
# via unified installer
curl -fsSL https://raw.githubusercontent.com/SiyangShao/dotfiles/main/install.sh | bash -s -- aerospace

# or from a local clone
bash install.sh aerospace
```

This will symlink `.aerospace.toml` to `~/.aerospace.toml`.

> **Note:** Skipped if `~/.aerospace.toml` already exists.

## Structure

```
aerospace/
├── .aerospace.toml   # Aerospace configuration (symlinked to ~/)
├── init.sh           # Setup script
└── README.md
```
