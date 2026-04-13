#!/usr/bin/env bash
set -e

REPO="SiyangShao/dotfiles"
BRANCH="main"
DOTFILES_DIR="$HOME/.dotfiles"
ALL_COMPONENTS=(claude nvim aerospace alacritty ghostty karabiner zellij)

# Ensure we are inside the dotfiles repo
ensure_repo() {
    local script_dir
    script_dir="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" 2>/dev/null && pwd || echo "")"

    # Already running from a local clone
    if [[ -f "$script_dir/install.sh" ]]; then
        DOTFILES_DIR="$script_dir"
        return
    fi

    # Use existing clone
    if [[ -d "$DOTFILES_DIR/.git" ]]; then
        echo "Using existing dotfiles at $DOTFILES_DIR"
        cd "$DOTFILES_DIR"
        git pull --ff-only || true
        return
    fi

    # Fresh clone
    echo "Cloning dotfiles to $DOTFILES_DIR..."
    git clone "https://github.com/$REPO.git" "$DOTFILES_DIR"
}

usage() {
    echo "Usage: $0 [component ...]"
    echo ""
    echo "Components: ${ALL_COMPONENTS[*]}"
    echo "If no component is specified, all components are installed."
}

ensure_repo

components=("$@")
if [[ ${#components[@]} -eq 0 ]]; then
    components=("${ALL_COMPONENTS[@]}")
fi

for comp in "${components[@]}"; do
    init_script="$DOTFILES_DIR/$comp/init.sh"
    if [[ -f "$init_script" ]]; then
        echo ""
        echo "=== Setting up $comp ==="
        bash "$init_script"
    else
        echo "Warning: $comp/init.sh not found, skipping."
    fi
done

echo ""
echo "All done!"
