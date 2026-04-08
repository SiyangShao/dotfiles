#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
TARGET_DIR="$HOME/.config/alacritty"
FILES=(alacritty.toml tokyo-night-storm.toml arch.toml)

mkdir -p "$TARGET_DIR"

for f in "${FILES[@]}"; do
    src="$SCRIPT_DIR/$f"
    dst="$TARGET_DIR/$f"
    if [[ -L "$dst" ]]; then
        echo "$dst is already symlinked, skipping."
    elif [[ -e "$dst" ]]; then
        echo "$dst already exists (not a symlink), skipping."
    else
        ln -s "$src" "$dst"
        echo "Symlinked $dst -> $src"
    fi
done

echo "Done."
