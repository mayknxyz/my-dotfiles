# Omarchy Dotfiles

My personal dotfiles for Arch Linux (Omarchy) managed with GNU Stow.

---

## About

This repository contains my configuration files for Arch Linux (Omarchy). It uses GNU Stow for symlink management, making it easy to deploy and manage configurations across systems.

---

## Installation

### Quick Setup (Automated)

```bash
# Clone and run installation script
git clone https://github.com/your-username/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

The installation script will:
- ✅ Install GNU Stow if needed
- ✅ Backup existing configurations
- ✅ Deploy all dotfiles with stow
- ✅ Optionally install system packages

### Manual Setup

**Prerequisites:**
```bash
sudo pacman -S git stow
```

**Steps:**

1. **Clone this repository**

```bash
git clone https://github.com/your-username/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

2. **Deploy configurations**

```bash
# Deploy specific package
stow hypr

# Deploy all packages
stow hypr alacritty bash git nvim zed
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
├── alacritty/     # Alacritty terminal configuration
├── bash/          # Bash shell configuration
├── git/           # Git configuration
├── hypr/          # Hyprland compositor configuration
├── nvim/          # Neovim configuration
├── zed/           # Zed editor configuration
├── CLAUDE.md      # Documentation for Claude Code
├── pacman_list.txt  # Official packages
└── aur_list.txt     # AUR packages
```

Each directory mirrors the home directory structure. For example:
- `nvim/.config/nvim/` → `~/.config/nvim/`
- `hypr/.config/hypr/` → `~/.config/hypr/`
- `bash/.bashrc` → `~/.bashrc`

---

## Current Configurations

### Window Manager
- **Hyprland** (`hypr/`) - Wayland compositor with custom keybindings, monitors, and appearance settings

### Terminal & Shell
- **Alacritty** (`alacritty/`) - GPU-accelerated terminal emulator
- **Bash** (`bash/`) - Shell configuration with aliases and environment

### Development
- **Git** (`git/`) - Version control aliases and configuration
- **Neovim** (`nvim/`) - Lua-based configuration with custom keymaps
- **Zed** (`zed/`) - Modern code editor configuration

---

## Usage

### Deploy a package

```bash
cd ~/.dotfiles
stow hypr    # Deploy Hyprland config
stow alacritty  # Deploy Alacritty config
stow bash    # Deploy Bash config
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
5. Deploy packages: `stow hypr alacritty bash git nvim zed`
6. Install packages: `sudo pacman -S --needed $(cat pacman_list.txt)`
7. Install AUR packages: `yay -S --needed $(cat aur_list.txt)`
8. Log out and back in

---

## Validation & Testing

### Validate Configurations

Before deploying or committing changes, run validation:

```bash
./scripts/validate.sh
```

This checks:
- Config file syntax (shell, Lua, TOML, JSON)
- Stow conflicts
- Broken symlinks
- Required packages

### Test Changes Safely

Use the testing workflow for major changes:

```bash
./scripts/test-package.sh <package-name>
```

This creates a testing branch, validates configs, and guides you through testing and merging.

See [CONTRIBUTING.md](docs/CONTRIBUTING.md) for the complete workflow.

---

## Development Workflow

### Branching Strategy

Use feature branches for testing configuration changes:

```bash
# Create testing branch
git checkout -b testing/<package-name>

# Make changes, test, validate
vim <package>/<config-file>
stow -R <package>
./scripts/validate.sh

# Commit and merge
git add <package>/
git commit -m "Update <package> configuration"
git checkout main
git merge testing/<package> --no-ff
```

### Claude Commands

When using Claude Code, these slash commands are available:

- `/validate` - Run all validation checks
- `/test-config <package>` - Start testing workflow
- `/new-adr <title>` - Create Architecture Decision Record
- `/stow-package <package>` - Safely stow with validation
- `/update-packages` - Update package lists

---

## Architecture Decisions

Configuration choices and their rationale are documented as Architecture Decision Records (ADRs):

- [ADR-0001: Use GNU Stow](docs/adr/0001-use-gnu-stow.md)
- [ADR-0002: Hyprland Compositor](docs/adr/0002-hyprland-compositor.md)
- [ADR-0003: Package Structure](docs/adr/0003-package-structure.md)

See [docs/adr/](docs/adr/) for all ADRs.

---

## Documentation

- **[CONTRIBUTING.md](docs/CONTRIBUTING.md)** - Development workflow and branching strategy
- **KEYBINDINGS.md** - Complete keybindings cheat sheet for Hyprland, Git, and Neovim
- **CHANGELOG.md** - Version history and changes
- **CLAUDE.md** - Documentation for Claude Code integration
- **[docs/adr/](docs/adr/)** - Architecture Decision Records

## Notes

- Always run `./scripts/validate.sh` before deploying or committing
- Use testing branches for experimental changes
- Back up existing configurations before stowing
- This is a clean slate setup for Omarchy (migrated from EndeavourOS/Hyprland)
- The `install.sh` script automatically creates backups before deploying

---

## License

Personal configuration files - use at your own discretion.
