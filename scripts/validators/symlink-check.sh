#!/bin/bash
# Broken Symlink Detection

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

BROKEN=0

echo "  Checking for broken symlinks in home directory..."

# Find all symlinks in home directory that point to dotfiles
# and check if they're broken
while IFS= read -r -d '' symlink; do
    if [ ! -e "$symlink" ]; then
        # Symlink is broken
        target=$(readlink "$symlink")
        # Only report if it was supposed to point to our dotfiles
        if [[ "$target" == *".dotfiles"* ]]; then
            echo -e "  ${RED}✗${NC} Broken symlink: $symlink -> $target"
            BROKEN=$((BROKEN + 1))
        fi
    fi
done < <(find "$HOME" -maxdepth 5 -type l -print0 2>/dev/null)

if [ $BROKEN -eq 0 ]; then
    echo -e "  ${GREEN}✓${NC} No broken dotfiles symlinks found"
    exit 0
else
    echo -e "  ${RED}✗${NC} Found $BROKEN broken symlink(s)"
    echo "  Run 'stow -R <package>' to fix them"
    exit 1
fi
