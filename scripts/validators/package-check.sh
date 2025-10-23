#!/bin/bash
# Required Package Verification

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$DOTFILES_DIR"

MISSING=0

echo "  Checking for required packages..."

# Define packages required for each config
declare -A REQUIRED_PACKAGES=(
    ["hypr"]="hyprland"
    ["alacritty"]="alacritty"
    ["nvim"]="neovim"
    ["zed"]="zed"
    ["bash"]="bash"
    ["git"]="git"
)

# Get list of stow packages
PACKAGES=$(find . -maxdepth 1 -type d ! -name "." ! -name ".git" ! -name "docs" ! -name "scripts" ! -name ".*" -exec basename {} \;)

for package in $PACKAGES; do
    if [ -d "$package" ]; then
        required="${REQUIRED_PACKAGES[$package]}"

        if [ -n "$required" ]; then
            # Check if package is installed
            if ! command -v "$required" &> /dev/null && ! pacman -Q "$required" &> /dev/null; then
                echo -e "  ${YELLOW}⚠${NC} Package '$required' not installed (needed for $package/)"
                MISSING=$((MISSING + 1))
            fi
        fi
    fi
done

if [ $MISSING -eq 0 ]; then
    echo -e "  ${GREEN}✓${NC} All required packages are installed"
    exit 0
else
    echo -e "  ${YELLOW}⚠${NC} $MISSING package(s) not installed"
    echo "  Note: Stowing will still work, but configs may not be used"
    exit 0  # Don't fail validation for missing packages (might install them later)
fi
