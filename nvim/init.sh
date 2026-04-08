#!/usr/bin/env bash
set -e

NVIM_CONFIG_DIR="$HOME/.config/nvim"

install_nvim_from_url() {
    local default_path="/usr/local/bin/nvim"
    local install_path="$default_path"
    if [ -c /dev/tty ]; then
        read -rp "Install path for nvim [${default_path}]: " input_path </dev/tty
        install_path="${input_path:-$default_path}"
    fi

    echo "Installing neovim to ${install_path}..."
    local TMP_NVIM
    TMP_NVIM="$(mktemp -d)"
    curl -fsSL "https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz" \
        | tar -xz -C "$TMP_NVIM" --strip-components=1
    sudo cp "$TMP_NVIM/bin/nvim" "$install_path"
    sudo cp -r "$TMP_NVIM/lib" /usr/local/
    sudo cp -r "$TMP_NVIM/share/nvim" /usr/local/share/
    rm -rf "$TMP_NVIM"
    echo "neovim installed to ${install_path}"
}

# Install neovim if not already installed
if command -v nvim &>/dev/null; then
    echo "neovim already installed: $(nvim --version | head -1)"
else
    if command -v brew &>/dev/null; then
        brew install neovim || install_nvim_from_url
    elif command -v dnf &>/dev/null; then
        sudo dnf install -y neovim || install_nvim_from_url
    elif command -v pacman &>/dev/null; then
        sudo pacman -S --noconfirm neovim || install_nvim_from_url
    else
        install_nvim_from_url
    fi
fi

# Set neovim as default editor
SHELL_RC=""
if [[ "$SHELL" == */zsh ]]; then
    SHELL_RC="$HOME/.zshrc"
elif [[ "$SHELL" == */bash ]]; then
    SHELL_RC="$HOME/.bashrc"
fi

if [[ -n "$SHELL_RC" ]]; then
    if ! grep -q 'EDITOR=nvim' "$SHELL_RC" 2>/dev/null; then
        printf '\nexport EDITOR=nvim\nexport VISUAL=nvim\n' >> "$SHELL_RC"
        echo "Set nvim as default editor in $SHELL_RC"
    else
        echo "nvim already set as default editor in $SHELL_RC"
    fi
fi

export EDITOR=nvim
export VISUAL=nvim

# Copy config only if ~/.config/nvim does not already exist
if [[ -d "$NVIM_CONFIG_DIR" ]]; then
    echo "$HOME/.config/nvim already exists, skipping config copy."
else
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
    mkdir -p "$NVIM_CONFIG_DIR"
    cp -r "$SCRIPT_DIR"/. "$NVIM_CONFIG_DIR/"
    echo "Copied nvim config to $NVIM_CONFIG_DIR"
fi

echo "Done. Restart your shell or run: source $SHELL_RC"
