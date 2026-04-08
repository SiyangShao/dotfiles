#!/usr/bin/env bash
set -e

CLAUDE_DIR="$HOME/.claude"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
SOURCE_FILE="$SCRIPT_DIR/CLAUDE.md"
TARGET_FILE="$CLAUDE_DIR/CLAUDE.md"

mkdir -p "$CLAUDE_DIR"

if [[ -e "$TARGET_FILE" ]]; then
    if [[ -L "$TARGET_FILE" ]]; then
        echo "~/.claude/CLAUDE.md is already symlinked to $(readlink "$TARGET_FILE"), skipping."
    else
        echo "~/.claude/CLAUDE.md already exists (not a symlink). Back it up or remove it first."
        exit 1
    fi
else
    ln -s "$SOURCE_FILE" "$TARGET_FILE"
    echo "Symlinked $TARGET_FILE -> $SOURCE_FILE"
fi

echo "Done."
