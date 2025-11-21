# Omarchy System Installation Guide

Complete guide for setting up a fresh Omarchy system with these dotfiles.

---

## Table of Contents

1. [Base System Installation](#base-system-installation)
2. [Essential Packages](#essential-packages)
3. [Development Tools](#development-tools)
4. [Dotfiles Installation](#dotfiles-installation)
5. [Shell Configuration](#shell-configuration)
6. [Desktop Environment](#desktop-environment)
7. [Optional Tools](#optional-tools)
8. [Post-Installation](#post-installation)

---

## Base System Installation

### 1. Install Omarchy

Download and install the latest Omarchy ISO from [omarchy.org](https://omarchy.org/)

Follow the installation wizard to complete the base system installation.

### 2. Connect to Internet

```bash
# For WiFi, use iwctl
iwctl

# In iwctl:
device list
station wlan0 scan
station wlan0 get-networks
station wlan0 connect <SSID>
quit
```

### 3. Update System

```bash
sudo pacman -Syu
```

---

## Essential Packages

Install core utilities needed for this dotfiles setup:

```bash
# Version control and dotfiles management
sudo pacman -S git stow

# GitHub CLI for authentication
sudo pacman -S github-cli

# Essential development tools
sudo pacman -S base-devel ripgrep fd bat eza fzf

# Git diff tool
sudo pacman -S git-delta
```

---

## Development Tools

### Terminal and Shell

```bash
# Ghostty terminal emulator
sudo pacman -S ghostty

# Zsh shell
sudo pacman -S zsh zsh-completions

# Starship prompt (optional but recommended)
sudo pacman -S starship
```

### Code Editors

```bash
# Neovim
sudo pacman -S neovim

# Zed editor
sudo pacman -S zed

# VS Code (optional)
# yay -S visual-studio-code-bin
```

---

## Dotfiles Installation

### 1. Authenticate with GitHub

```bash
gh auth login
# Follow the prompts to authenticate
```

### 2. Create Directory Structure

```bash
# Create project directories
mkdir -p ~/Dev/Local
mkdir -p ~/Dev/Github
```

### 3. Clone Dotfiles

```bash
# Clone to home directory
cd ~
git clone https://github.com/mayknxyz/my-dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

### 4. Backup Existing Configs (if any)

**IMPORTANT:** Before stowing, backup any existing configurations:

```bash
# Backup existing Hyprland config
if [ -d ~/.config/hypr ]; then
    mv ~/.config/hypr ~/.config/hypr.backup
fi

# Backup existing git config
if [ -f ~/.config/git/config ]; then
    mv ~/.config/git ~/.config/git.backup
fi

# Backup existing nvim config
if [ -d ~/.config/nvim ]; then
    mv ~/.config/nvim ~/.config/nvim.backup
fi
```

### 5. Deploy Configurations with Stow

```bash
cd ~/.dotfiles

# Deploy all packages
stow git
stow nvim
stow zed
stow ghostty

# NOTE: Don't stow hypr, waybar, walker, omarchy, zsh, omz yet -
# we'll do those after setting up prerequisites
```

### 6. Configure Git

Edit `~/.config/git/config` and update with your information:

```bash
nvim ~/.config/git/config
# Update name and email
```

### 7. Configure Zed Editor (if using Context7 or other extensions with API keys)

```bash
# Copy the example settings
cp ~/.dotfiles/zed/.config/zed/settings.json.example ~/.dotfiles/zed/.config/zed/settings.json

# Edit and add your API keys
nvim ~/.dotfiles/zed/.config/zed/settings.json
```

---

## Shell Configuration

### 1. Install Oh My Zsh

```bash
# Install Oh My Zsh (this will switch your shell to zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# The installer will ask if you want to change your default shell to zsh - say yes
```

### 2. Deploy Shell Configs

```bash
cd ~/.dotfiles

# Deploy zsh config
stow zsh

# Deploy Oh My Zsh customizations
stow omz
```

### 3. Install Powerlevel10k Theme (included in omz configs)

```bash
# Clone Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Restart your terminal
# Powerlevel10k configuration wizard will run automatically
```

### 4. Restart Terminal

Close and reopen your terminal, or run:

```bash
exec zsh
```

---

## Desktop Environment

### 1. Install Hyprland and Dependencies

Omarchy comes with Hyprland pre-installed, but ensure you have all dependencies:

```bash
# Hyprland compositor (usually pre-installed on Omarchy)
sudo pacman -S hyprland hyprpaper hyprlock hypridle

# Waybar status bar
sudo pacman -S waybar

# Walker application launcher
yay -S walker-bin  # or walker-git

# Additional tools
sudo pacman -S wl-clipboard grim slurp          # Screenshots
sudo pacman -S polkit-gnome                      # Authentication agent
sudo pacman -S qt5-wayland qt6-wayland           # Qt apps support
```

### 2. Deploy Desktop Configurations

```bash
cd ~/.dotfiles

# Deploy Omarchy-specific configs
stow omarchy

# Deploy Hyprland configuration
stow hypr

# Deploy Waybar
stow waybar

# Deploy Walker launcher
stow walker
```

### 3. Configure Monitors (if needed)

Edit `~/.config/hypr/monitors.conf` to match your monitor setup:

```bash
nvim ~/.config/hypr/monitors.conf
```

### 4. Restart Hyprland

Log out and log back in, or reload Hyprland:

```
SUPER + SHIFT + R  (default reload binding)
```

---

## Optional Tools

These tools enhance the development experience but are not required:

### File Managers and Navigation

```bash
# Yazi - Terminal file manager
sudo pacman -S yazi

# Navi - Interactive cheatsheet tool
sudo pacman -S navi
```

### Development Tools

```bash
# Live server for web development
sudo pacman -S nodejs npm
npm install -g live-server

# Gita - Manage multiple git repositories
yay -S gita

# After installing gita, if you have multiple repos in ~/Dev/Github:
cd ~/Dev/Github
gita add -a */
```

### Graphics and Media

```bash
# GIMP - Image editor
sudo pacman -S gimp

# Image viewers
sudo pacman -S imv          # Wayland-native image viewer
sudo pacman -S mpv          # Video player
```

### System Utilities

```bash
# Better system monitoring
sudo pacman -S btop htop

# Network tools
sudo pacman -S wget curl openssh

# Archive tools
sudo pacman -S unzip unrar p7zip
```

---

## Post-Installation

### 1. Verify Stow Deployments

Check that symlinks were created correctly:

```bash
ls -la ~/.config/hypr        # Should be a symlink
ls -la ~/.config/nvim        # Should be a symlink
ls -la ~/.zshrc              # Should be a symlink
```

### 2. Test Hyprland Keybindings

Open Hyprland and test key bindings (see `~/.config/hypr/bindings.conf`):

- `SUPER + RETURN` - Launch terminal (Ghostty)
- `SUPER + D` - Launch Walker (app launcher)
- `SUPER + Q` - Close window
- `SUPER + F` - Toggle fullscreen
- `SUPER + SPACE` - Toggle floating

### 3. Configure Wallpaper

```bash
# Place your wallpaper in ~/Pictures/
cp /path/to/your/wallpaper.png ~/Pictures/

# Edit hyprpaper config
nvim ~/.config/hypr/hyprpaper.conf
```

### 4. Install Additional Fonts (if needed)

```bash
# Nerd Fonts for terminal icons
sudo pacman -S ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono

# Popular programming fonts
sudo pacman -S ttf-jetbrains-mono ttf-fira-code
```

### 5. Set Up Browser and Web Apps

```bash
# Install browsers
sudo pacman -S chromium firefox

# Login to your web services:
# - GitHub
# - Cloud services
# - Development platforms
```

### 6. Configure Theme (Optional)

If you want to customize the Omarchy theme:

```bash
# Install theme tools
sudo pacman -S nwg-look          # GTK theme selector
sudo pacman -S qt5ct qt6ct       # Qt theme configuration

# Popular themes
sudo pacman -S materia-gtk-theme papirus-icon-theme
```

---

## Troubleshooting

### Stow Conflicts

If stow reports conflicts:

```bash
# Check what's conflicting
stow -n hypr

# Remove or backup the conflicting file
mv ~/.config/hypr ~/.config/hypr.backup

# Try stow again
stow hypr
```

### Shell Not Changing to Zsh

```bash
# Manually set zsh as default shell
chsh -s $(which zsh)

# Verify
echo $SHELL
```

### Hyprland Not Starting

```bash
# Check Hyprland logs
cat ~/.local/share/hyprland/hyprland.log

# Verify dependencies
pacman -Qs hyprland
```

### Walker Not Launching

```bash
# Make sure the script is executable
chmod +x ~/.local/bin/omarchy-custom-keybinds

# Check walker installation
which walker
```

---

## Next Steps

1. **Customize Keybindings** - Edit `~/.config/hypr/bindings.conf`
2. **Set Up Neovim Plugins** - Open nvim and let plugin manager install plugins
3. **Configure Zed** - Add your preferred extensions and settings
4. **Explore Configurations** - Review dotfiles and adjust to your preferences
5. **Read Documentation** - Check README.md and CONTRIBUTING.md

---

## Maintenance

### Update Dotfiles

```bash
cd ~/.dotfiles
git pull origin main

# Re-stow updated packages
stow -R hypr nvim zsh  # etc.
```

### Update System

```bash
# Update official packages
sudo pacman -Syu

# Update AUR packages
yay -Syu
```

---

## Resources

- **Omarchy Documentation**: https://omarchy.org/docs
- **Hyprland Wiki**: https://wiki.hyprland.org
- **This Repository**: https://github.com/mayknxyz/my-dotfiles
- **Arch Wiki**: https://wiki.archlinux.org

---

## Support

If you encounter issues:

1. Check the Troubleshooting section above
2. Review the repository README.md
3. Check Omarchy community forums
4. Open an issue on GitHub

---

**Note**: This guide assumes a fresh Omarchy installation. If you're migrating from another system, additional steps may be needed to preserve your existing data and configurations.
