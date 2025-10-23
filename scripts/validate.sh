#!/bin/bash
# Dotfiles Validation Script
# Runs all validation checks before stowing packages

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

error() {
    echo -e "${RED}[✗]${NC} $1"
}

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VALIDATORS_DIR="$SCRIPT_DIR/validators"
DOTFILES_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

# Track validation status
VALIDATION_FAILED=0

echo ""
info "Starting dotfiles validation..."
echo ""

# Run all validators
run_validator() {
    local validator_name="$1"
    local validator_script="$VALIDATORS_DIR/$validator_name"

    if [ -f "$validator_script" ]; then
        info "Running $validator_name..."
        if bash "$validator_script"; then
            success "$validator_name passed"
        else
            error "$validator_name failed"
            VALIDATION_FAILED=1
        fi
        echo ""
    else
        warning "Validator not found: $validator_name"
    fi
}

# Run all validators in sequence
run_validator "syntax-check.sh"
run_validator "stow-check.sh"
run_validator "symlink-check.sh"
run_validator "package-check.sh"

# Summary
echo "======================================"
if [ $VALIDATION_FAILED -eq 0 ]; then
    success "All validations passed!"
    exit 0
else
    error "Some validations failed"
    exit 1
fi
