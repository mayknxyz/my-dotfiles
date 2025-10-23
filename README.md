# Omarchy Dotfiles

My personal dotfiles for Arch Linux (Omarchy) managed with GNU Stow.

---

## About

This repository contains my configuration files for Arch Linux (Omarchy). It uses GNU Stow for symlink management, making it easy to deploy and manage configurations across systems.

---

## Installation

### Prerequisites

```bash
# Install Git and GNU Stow
sudo pacman -S git stow
```

### Setup

1. **Clone this repository**

```bash
git clone https://github.com/your-username/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

2. **Deploy configurations**

```bash
# Deploy specific package
stow nvim

# Deploy all packages
stow */
```

3. **Install system packages**

```bash
# Install official packages
sudo pacman -S --needed $(cat pacman_list.txt)

# Install AUR packages (requires yay or paru)
yay -S --needed $(cat aur_list.txt)
```

---

## Structure

This repository uses GNU Stow's directory structure:

```
~/.dotfiles/
├── nvim/          # Neovim configuration
├── zed/           # Zed editor configuration
├── CLAUDE.md      # Documentation for Claude Code
├── pacman_list.txt  # Official packages
└── aur_list.txt     # AUR packages
```

Each directory mirrors the home directory structure. For example:
- `nvim/.config/nvim/` → `~/.config/nvim/`
- `zed/.config/zed/` → `~/.config/zed/`

---

## Current Configurations

### Editors
- **Neovim** (`nvim/`) - Lua-based configuration with custom keymaps
- **Zed** (`zed/`) - Modern code editor configuration

### Planned Configurations
- Shell (Zsh) - Coming soon
- Git - Coming soon
- Terminal emulator - Coming soon
- Window manager/compositor - Coming soon

---

## Usage

### Deploy a package

```bash
cd ~/.dotfiles
stow nvim
```

### Remove a package

```bash
stow -D nvim
```

### Re-deploy after changes

```bash
stow -R nvim
```

### Test deployment (dry-run)

```bash
stow -n nvim
```

---

## Package Management

### Update package lists

```bash
# Generate fresh package list
pacman -Qqe > pacman_list.txt

# Generate AUR package list
pacman -Qqm > aur_list.txt
```

### Install packages

```bash
# Official packages
sudo pacman -S --needed $(cat pacman_list.txt)

# AUR packages
yay -S --needed $(cat aur_list.txt)
```

---

## System Restoration

When setting up a new Omarchy system:

1. Install base Arch Linux system
2. Install prerequisites: `sudo pacman -S git stow`
3. Clone dotfiles: `git clone <repo-url> ~/.dotfiles`
4. Navigate to dotfiles: `cd ~/.dotfiles`
5. Deploy packages: `stow nvim zed` (add others as configured)
6. Install packages: `sudo pacman -S --needed $(cat pacman_list.txt)`
7. Install AUR packages: `yay -S --needed $(cat aur_list.txt)`
8. Log out and back in

---

## Notes

- Always run `stow -n <package>` before deploying to check for conflicts
- Back up existing configurations before stowing
- This is a clean slate setup for Omarchy (migrated from EndeavourOS/Hyprland)
- Check CHANGELOG.md for version history

---

## License

Personal configuration files - use at your own discretion.
