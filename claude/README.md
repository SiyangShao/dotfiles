# Claude Code Config

## Quick Start

```sh
# via unified installer
curl -fsSL https://raw.githubusercontent.com/SiyangShao/dotfiles/main/install.sh | bash -s -- claude

# or from a local clone
bash install.sh claude
```

This will symlink `CLAUDE.md` to `~/.claude/CLAUDE.md`.

> **Note:** Skipped if the file already exists.

## Structure

```
claude/
├── CLAUDE.md     # Global Claude Code configuration (symlinked to ~/.claude/)
├── init.sh       # Setup script
└── README.md
```
