# Omarchy Dotfiles

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Arch Linux](https://img.shields.io/badge/Arch%20Linux-1793D1?logo=arch-linux&logoColor=fff)](https://archlinux.org/)
[![Hyprland](https://img.shields.io/badge/Hyprland-Wayland-5BCEFA?logo=wayland&logoColor=white)](https://hyprland.org/)
[![Maintained](https://img.shields.io/badge/Maintained-yes-green.svg)](https://github.com/mayknxyz/my-dotfiles/graphs/commit-activity)

My personal dotfiles for Arch Linux (Omarchy) managed with GNU Stow.

---

## About

This repository contains my configuration files for Arch Linux (Omarchy). It uses GNU Stow for symlink management, making it easy to deploy and manage configurations across systems.

---

## Installation

### Setup

**Prerequisites:**

```bash
sudo pacman -S git stow
```

**Steps:**

1. **Clone this repository**

```bash
git clone https://github.com/mayknxyz/my-dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

2. **Deploy configurations**

```bash
# Deploy specific package
stow hypr

# Deploy all packages
stow ghostty git hypr nvim omarchy omz walker waybar zed zsh
```

---

## Structure

This repository uses GNU Stow's directory structure:

```
~/.dotfiles/
├── ghostty/       # Ghostty terminal configuration
├── git/           # Git configuration
├── hypr/          # Hyprland compositor configuration
├── nvim/          # Neovim configuration
├── omarchy/       # Omarchy-specific branding and settings
├── omz/           # Oh My Zsh customizations
├── walker/        # Walker application launcher
├── waybar/        # Waybar status bar
├── zed/           # Zed editor configuration
├── zsh/           # Zsh shell configuration
└── .claude/       # Claude Code integration and commands
```

Each directory mirrors the home directory structure. For example:

- `nvim/.config/nvim/` → `~/.config/nvim/`
- `hypr/.config/hypr/` → `~/.config/hypr/`
- `zsh/.zshrc` → `~/.zshrc`

---

## Current Configurations

### Window Manager & Desktop

- **Hyprland** (`hypr/`) - Wayland compositor with custom keybindings, monitors, and appearance settings
- **Waybar** (`waybar/`) - Customizable status bar for Wayland compositors
- **Walker** (`walker/`) - Application launcher with custom keybindings
- **Omarchy** (`omarchy/`) - Omarchy-specific branding and system configuration

### Terminal & Shell

- **Ghostty** (`ghostty/`) - Modern GPU-accelerated terminal emulator
- **Zsh** (`zsh/`) - Z shell configuration
- **Oh My Zsh** (`omz/`) - Zsh framework customizations

### Development

- **Git** (`git/`) - Version control aliases and configuration
- **Neovim** (`nvim/`) - Lua-based configuration with custom keymaps
- **Zed** (`zed/`) - Modern code editor configuration

---

## Usage

### Deploy a package

```bash
cd ~/.dotfiles
stow hypr     # Deploy Hyprland config
stow ghostty  # Deploy Ghostty terminal config
stow zsh      # Deploy Zsh shell config
```

### Remove a package

```bash
stow -D hypr
```

### Re-deploy after changes

```bash
stow -R hypr
```

### Test deployment (dry-run)

```bash
stow -n hypr  # Check for conflicts before deploying
```

---

## System Restoration

When setting up a new Omarchy system:

1. Install base Arch Linux system
2. Install prerequisites: `sudo pacman -S git stow zsh`
3. Clone dotfiles: `git clone https://github.com/mayknxyz/my-dotfiles.git ~/.dotfiles`
4. Navigate to dotfiles: `cd ~/.dotfiles`
5. Deploy packages: `stow ghostty git hypr nvim omarchy omz walker waybar zed zsh`
6. Set Zsh as default shell: `chsh -s $(which zsh)`
7. Log out and back in to apply all changes

---

## Development Workflow

### Branching Strategy

Use feature branches for testing configuration changes:

```bash
# Create testing branch
git checkout -b testing/<package-name>

# Make changes and test
vim <package>/<config-file>
stow -R <package>
# Test the changes manually

# Commit and merge
git add <package>/
git commit -m "Update <package> configuration"
git checkout main
git merge testing/<package> --no-ff
```

### Claude Code Integration

This repository includes Claude Code integration with custom commands:

- `/new-adr <title>` - Create Architecture Decision Record

See `.claude/` directory for Claude Code configuration and the `CLAUDE.md` file for detailed documentation on using AI assistance with this repository.

---

## Documentation

- **[CONTRIBUTING.md](CONTRIBUTING.md)** - Development workflow and branching strategy
- **CHANGELOG.md** - Version history and changes

## Notes

- Use testing branches for experimental changes
- Back up existing configurations before stowing
- This is a clean slate setup for Omarchy (migrated from EndeavourOS/Hyprland)
- Test configurations after deployment to ensure they work correctly

---

## License

MIT License - Feel free to use these configurations as inspiration for your own setup.

See [LICENSE](LICENSE) for details.
