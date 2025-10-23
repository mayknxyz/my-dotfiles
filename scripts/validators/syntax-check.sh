#!/bin/bash
# Syntax Validation for Config Files

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$DOTFILES_DIR"

ERRORS=0

# Check shell scripts
echo "  Checking shell scripts..."
while IFS= read -r -d '' script; do
    if ! bash -n "$script" 2>/dev/null; then
        echo -e "  ${RED}✗${NC} Syntax error in: $script"
        ERRORS=$((ERRORS + 1))
    fi
done < <(find . -name "*.sh" -type f -print0)

# Check Lua files (Neovim configs)
if command -v luac &> /dev/null; then
    echo "  Checking Lua files..."
    while IFS= read -r -d '' lua_file; do
        if ! luac -p "$lua_file" &>/dev/null; then
            echo -e "  ${RED}✗${NC} Syntax error in: $lua_file"
            ERRORS=$((ERRORS + 1))
        fi
    done < <(find nvim/ -name "*.lua" -type f -print0 2>/dev/null)
else
    echo -e "  ${YELLOW}⚠${NC} luac not found, skipping Lua validation"
fi

# Check TOML files (Alacritty config)
if command -v taplo &> /dev/null; then
    echo "  Checking TOML files..."
    while IFS= read -r -d '' toml_file; do
        if ! taplo check "$toml_file" &>/dev/null; then
            echo -e "  ${RED}✗${NC} Syntax error in: $toml_file"
            ERRORS=$((ERRORS + 1))
        fi
    done < <(find . -name "*.toml" -type f -print0)
elif command -v python3 &> /dev/null; then
    # Fallback to Python's toml library if taplo not available
    echo "  Checking TOML files (using Python)..."
    while IFS= read -r -d '' toml_file; do
        if ! python3 -c "import tomllib; open('$toml_file', 'rb').read(); tomllib.loads(open('$toml_file', 'rb').read().decode())" 2>/dev/null; then
            echo -e "  ${RED}✗${NC} Syntax error in: $toml_file"
            ERRORS=$((ERRORS + 1))
        fi
    done < <(find . -name "*.toml" -type f -print0)
else
    echo -e "  ${YELLOW}⚠${NC} No TOML validator found, skipping TOML validation"
fi

# Check JSON files (Zed config)
# Note: Zed uses JSONC (JSON with Comments), so we need to handle that
if command -v jq &> /dev/null; then
    echo "  Checking JSON files..."
    while IFS= read -r -d '' json_file; do
        # Check if file contains comments (JSONC format)
        if grep -q "^[[:space:]]*//" "$json_file"; then
            echo -e "  ${YELLOW}⚠${NC} Skipping JSONC file: $json_file"
            continue
        fi
        if ! jq empty "$json_file" &>/dev/null; then
            echo -e "  ${RED}✗${NC} Syntax error in: $json_file"
            ERRORS=$((ERRORS + 1))
        fi
    done < <(find zed/ -name "*.json" -type f -print0 2>/dev/null)
else
    echo -e "  ${YELLOW}⚠${NC} jq not found, skipping JSON validation"
fi

if [ $ERRORS -eq 0 ]; then
    echo -e "  ${GREEN}✓${NC} All syntax checks passed"
    exit 0
else
    echo -e "  ${RED}✗${NC} Found $ERRORS syntax error(s)"
    exit 1
fi
