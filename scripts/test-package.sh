#!/bin/bash
# Package Testing Helper Script
# Usage: ./scripts/test-package.sh <package-name>

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

info() { echo -e "${BLUE}[INFO]${NC} $1"; }
success() { echo -e "${GREEN}[✓]${NC} $1"; }
warning() { echo -e "${YELLOW}[WARNING]${NC} $1"; }
error() { echo -e "${RED}[✗]${NC} $1"; }

# Check arguments
if [ $# -eq 0 ]; then
    error "Usage: $0 <package-name>"
    echo ""
    echo "Example: $0 nvim"
    echo ""
    echo "This script will:"
    echo "  1. Create a testing branch (testing/<package-name>)"
    echo "  2. Run validation checks"
    echo "  3. Guide you through testing and merging"
    exit 1
fi

PACKAGE="$1"
BRANCH_NAME="testing/$PACKAGE"

# Get to dotfiles directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$DOTFILES_DIR"

# Check if package exists
if [ ! -d "$PACKAGE" ]; then
    error "Package '$PACKAGE' not found in dotfiles directory"
    exit 1
fi

echo ""
info "Package Testing Workflow for: $PACKAGE"
echo "======================================"
echo ""

# Check current git status
if [ -n "$(git status --porcelain)" ]; then
    warning "Working directory has uncommitted changes"
    git status --short
    echo ""
    read -p "Continue anyway? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        info "Aborting"
        exit 0
    fi
fi

# Get current branch
CURRENT_BRANCH=$(git branch --show-current)

# Check if testing branch already exists
if git show-ref --verify --quiet "refs/heads/$BRANCH_NAME"; then
    info "Testing branch '$BRANCH_NAME' already exists"
    read -p "Switch to it? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git checkout "$BRANCH_NAME"
        success "Switched to $BRANCH_NAME"
    fi
else
    # Create testing branch
    info "Creating testing branch: $BRANCH_NAME"
    git checkout -b "$BRANCH_NAME"
    success "Created and switched to $BRANCH_NAME"
fi

echo ""
info "Running validation checks..."
echo ""

# Run validation
if bash "$SCRIPT_DIR/validate.sh"; then
    success "Validation passed!"
else
    warning "Validation found issues - review and fix before merging"
fi

echo ""
echo "======================================"
info "Testing Workflow Guide"
echo "======================================"
echo ""
echo "1. Make your changes to $PACKAGE/ configs"
echo "2. Test the changes:"
echo "   - Re-stow: stow -R $PACKAGE"
echo "   - Reload configs in the application"
echo "   - Verify everything works"
echo ""
echo "3. When satisfied, commit your changes:"
echo "   git add $PACKAGE/"
echo "   git commit -m \"Update $PACKAGE configuration\""
echo ""
echo "4. Merge back to main:"
echo "   git checkout $CURRENT_BRANCH"
echo "   git merge $BRANCH_NAME"
echo "   git branch -d $BRANCH_NAME"
echo ""
echo "Or run this merge helper:"
echo "======================================"
echo ""

read -p "Do you want to run the merge helper now? (y/N): " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo ""
    info "Merge Helper"
    echo ""

    # Check if there are changes to commit
    if [ -n "$(git status --porcelain)" ]; then
        warning "You have uncommitted changes"
        git status --short
        echo ""
        read -p "Commit them now? (y/N): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            read -p "Commit message: " commit_msg
            git add "$PACKAGE/"
            git commit -m "$commit_msg"
            success "Changes committed"
        else
            info "Skipping merge - commit your changes first"
            exit 0
        fi
    fi

    # Merge to main
    echo ""
    info "Switching to $CURRENT_BRANCH and merging..."
    git checkout "$CURRENT_BRANCH"
    git merge "$BRANCH_NAME" --no-ff -m "Merge testing changes for $PACKAGE"
    success "Merged $BRANCH_NAME into $CURRENT_BRANCH"

    echo ""
    read -p "Delete testing branch? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git branch -d "$BRANCH_NAME"
        success "Deleted branch $BRANCH_NAME"
    fi

    echo ""
    success "Testing workflow complete!"
else
    info "You're on branch $BRANCH_NAME - make your changes and commit them"
    info "Run this script again when ready to merge"
fi

echo ""
