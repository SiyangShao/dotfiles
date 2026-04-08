#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
SOURCE_FILE="$SCRIPT_DIR/.aerospace.toml"
TARGET_FILE="$HOME/.aerospace.toml"

if [[ -L "$TARGET_FILE" ]]; then
    echo "~/.aerospace.toml is already symlinked to $(readlink "$TARGET_FILE"), skipping."
elif [[ -e "$TARGET_FILE" ]]; then
    echo "~/.aerospace.toml already exists (not a symlink). Back it up or remove it first."
    exit 1
else
    ln -s "$SOURCE_FILE" "$TARGET_FILE"
    echo "Symlinked $TARGET_FILE -> $SOURCE_FILE"
fi

echo "Done."
