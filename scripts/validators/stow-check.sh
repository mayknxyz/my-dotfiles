#!/bin/bash
# Stow Conflict Detection

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$DOTFILES_DIR"

CONFLICTS=0

# Get list of stow packages (directories that are not docs, scripts, .git, etc.)
PACKAGES=$(find . -maxdepth 1 -type d ! -name "." ! -name ".git" ! -name "docs" ! -name "scripts" ! -name ".*" -exec basename {} \;)

echo "  Checking for stow conflicts..."

for package in $PACKAGES; do
    if [ -d "$package" ]; then
        # Run stow in simulation mode to check for conflicts
        if ! stow -n -v "$package" 2>&1 | grep -q "WARNING\|ERROR"; then
            # No warnings or errors
            continue
        else
            # Check what the actual issue is
            output=$(stow -n -v "$package" 2>&1)
            if echo "$output" | grep -q "existing target is"; then
                echo -e "  ${YELLOW}⚠${NC} Conflict in package '$package': existing files would be overwritten"
                CONFLICTS=$((CONFLICTS + 1))
            elif echo "$output" | grep -q "WARNING\|ERROR"; then
                echo -e "  ${RED}✗${NC} Error in package '$package'"
                echo "$output" | grep "WARNING\|ERROR" | sed 's/^/    /'
                CONFLICTS=$((CONFLICTS + 1))
            fi
        fi
    fi
done

if [ $CONFLICTS -eq 0 ]; then
    echo -e "  ${GREEN}✓${NC} No stow conflicts detected"
    exit 0
else
    echo -e "  ${YELLOW}⚠${NC} Found $CONFLICTS potential conflict(s)"
    echo "  Note: These may be expected if configs are already stowed"
    exit 0  # Don't fail validation for conflicts (they might be intentional)
fi
