#!/bin/bash
# Dotfiles Installation Script for Arch Linux (Omarchy)
# Usage: ./install.sh

set -e  # Exit on error

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
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running on Arch Linux
if [ ! -f /etc/arch-release ]; then
    error "This script is designed for Arch Linux (Omarchy)"
    exit 1
fi

# Ensure we're in the dotfiles directory
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DOTFILES_DIR"
info "Dotfiles directory: $DOTFILES_DIR"

# Step 1: Check for required tools
info "Checking for required tools..."
if ! command -v stow &> /dev/null; then
    warning "GNU Stow not found. Installing..."
    sudo pacman -S --needed --noconfirm stow
    success "GNU Stow installed"
else
    success "GNU Stow is already installed"
fi

# Step 2: Backup existing configs
info "Creating backup of existing configurations..."
BACKUP_DIR="$HOME/dotfiles-backup-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP_DIR"

# Backup each config if it exists
[ -d ~/.config/hypr ] && cp -r ~/.config/hypr "$BACKUP_DIR/" && info "Backed up hypr"
[ -d ~/.config/alacritty ] && cp -r ~/.config/alacritty "$BACKUP_DIR/" && info "Backed up alacritty"
[ -d ~/.config/git ] && cp -r ~/.config/git "$BACKUP_DIR/" && info "Backed up git"
[ -d ~/.config/nvim ] && cp -r ~/.config/nvim "$BACKUP_DIR/" && info "Backed up nvim"
[ -d ~/.config/zed ] && cp -r ~/.config/zed "$BACKUP_DIR/" && info "Backed up zed"
[ -f ~/.bashrc ] && cp ~/.bashrc "$BACKUP_DIR/" && info "Backed up .bashrc"
[ -f ~/.bash_profile ] && cp ~/.bash_profile "$BACKUP_DIR/" && info "Backed up .bash_profile"
[ -f ~/.profile ] && cp ~/.profile "$BACKUP_DIR/" && info "Backed up .profile"

success "Backup created at: $BACKUP_DIR"

# Step 3: Remove existing configs (only if they're not symlinks)
info "Removing existing configurations..."
[ -d ~/.config/hypr ] && [ ! -L ~/.config/hypr ] && rm -rf ~/.config/hypr
[ -d ~/.config/alacritty ] && [ ! -L ~/.config/alacritty ] && rm -rf ~/.config/alacritty
[ -d ~/.config/git ] && [ ! -L ~/.config/git ] && rm -rf ~/.config/git
[ -d ~/.config/zed ] && [ ! -L ~/.config/zed ] && rm -rf ~/.config/zed
[ -f ~/.bashrc ] && [ ! -L ~/.bashrc ] && rm ~/.bashrc
[ -f ~/.bash_profile ] && [ ! -L ~/.bash_profile ] && rm ~/.bash_profile
[ -f ~/.profile ] && [ ! -L ~/.profile ] && rm ~/.profile

success "Existing configs removed"

# Step 4: Stow all packages
info "Deploying dotfiles with GNU Stow..."
PACKAGES=(hypr alacritty bash git nvim zed)

for package in "${PACKAGES[@]}"; do
    if [ -d "$package" ]; then
        stow "$package"
        success "Stowed: $package"
    else
        warning "Package not found: $package (skipping)"
    fi
done

# Step 5: Install system packages
echo ""
info "Ready to install system packages"
echo -e "${YELLOW}This will install packages from pacman_list.txt and aur_list.txt${NC}"
read -p "Do you want to install system packages? (y/N): " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    if [ -f "pacman_list.txt" ]; then
        info "Installing official packages..."
        sudo pacman -S --needed $(cat pacman_list.txt)
        success "Official packages installed"
    fi

    if [ -f "aur_list.txt" ]; then
        if command -v yay &> /dev/null; then
            info "Installing AUR packages..."
            yay -S --needed $(cat aur_list.txt)
            success "AUR packages installed"
        else
            warning "yay not found. Skipping AUR packages."
            info "Install yay manually, then run: yay -S --needed \$(cat aur_list.txt)"
        fi
    fi
else
    info "Skipping package installation"
fi

# Done!
echo ""
success "==================================="
success "Dotfiles installation complete!"
success "==================================="
echo ""
info "Backup location: $BACKUP_DIR"
info "Please log out and back in for all changes to take effect"
echo ""
info "To manually deploy a package: cd $DOTFILES_DIR && stow <package-name>"
info "To remove a package: cd $DOTFILES_DIR && stow -D <package-name>"
