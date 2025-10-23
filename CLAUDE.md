# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository for an Arch Linux (Omarchy) system. It uses **GNU Stow** for symlink management, where each top-level directory represents a "stow package" that mirrors the home directory structure.

### Repository Organization

**Stow Package Structure:**
- Each top-level directory (e.g., `nvim/`, `zsh/`, `hypr/`) is a stow package
- Packages mirror the target home directory structure
- Example: `nvim/.config/nvim/` → stows to `~/.config/nvim/`
- Example: `zsh/.zshrc` → stows to `~/.zshrc`
- Example: `git/.gitconfig` → stows to `~/.gitconfig`

**Active Packages:**
- `nvim/` - Neovim configuration with custom keymaps
- `zed/` - Zed editor configuration

**Package Lists:**
- `pacman_list.txt` - Official Arch/Omarchy packages
- `aur_list.txt` - AUR packages

## Common Commands

### Package Management with Stow

```bash
# Deploy a single package (creates symlinks)
stow <package-name>

# Example: Deploy neovim config
stow nvim

# Deploy all packages
stow */

# Remove a package's symlinks
stow -D <package-name>

# Simulate stow operation (dry-run to check for conflicts)
stow -n <package-name>

# Re-stow (useful after updating configs)
stow -R <package-name>
```

### System Package Management

```bash
# Install packages from pacman_list.txt
sudo pacman -S --needed $(cat pacman_list.txt)

# Install AUR packages (requires yay or paru)
yay -S --needed $(cat aur_list.txt)

# Update all packages
sudo pacman -Syu
```

### Development Workflow

```bash
# Before stowing, check for conflicts
stow -n <package-name>

# After editing configs, re-stow to update symlinks
stow -R <package-name>

# Verify symlinks point to dotfiles
ls -la ~/<target-path>
```

## Creating New Configuration Packages

When adding a new application config:

1. Create a new directory in the repository root (e.g., `zsh/`, `git/`, `tmux/`)
2. Mirror the home directory structure inside it
   - For `~/.config/app/`: create `app/.config/app/`
   - For `~/.apprc`: create `app/.apprc`
3. Add your configuration files
4. Test with dry-run: `stow -n app`
5. Deploy: `stow app`
6. Commit changes to git

**Example: Adding Zsh config**
```bash
mkdir -p zsh
touch zsh/.zshrc
# Edit zsh/.zshrc
stow -n zsh  # Check for conflicts
stow zsh     # Deploy
git add zsh
git commit -m "Add zsh configuration"
```

## Architecture Notes

### Current Configuration

**Neovim:**
- Location: `nvim/.config/nvim/`
- Configuration style: Lua-based
- Keymaps: `nvim/.config/nvim/lua/config/keymaps.lua`

**Zed:**
- Location: `zed/.config/zed/`
- Settings: `zed/.config/zed/settings.json`
- Keymaps: `zed/.config/zed/keymap.json`

### System Information

- **Distribution:** Arch Linux (Omarchy)
- **User:** mayknxyz
- **Package Manager:** pacman (official repos) + yay/paru (AUR)

## Git Commit Conventions

Use simple, descriptive commit messages:

```
Add <application> configuration
Update <application> settings
Remove <application> config
Fix <specific issue>
```

Or use conventional commits:
```
feat: Add tmux configuration
chore: Update package lists
fix: Correct nvim keybinding
docs: Update README
```

## Important Files & Locations

- `README.md` - Setup guide and documentation
- `CHANGELOG.md` - Version history
- `pacman_list.txt` - Official repository packages (165 packages)
- `aur_list.txt` - AUR packages (2 packages)
- `nvim/.config/nvim/lua/config/keymaps.lua` - Neovim keybindings
- `zed/.config/zed/settings.json` - Zed editor settings
- `zed/.config/zed/keymap.json` - Zed keybindings

## System Setup Workflow

When setting up a new Omarchy system:

1. Install base Omarchy system
2. Install git and stow: `sudo pacman -S git stow`
3. Clone repository: `git clone <repo-url> ~/.dotfiles`
4. Navigate: `cd ~/.dotfiles`
5. Stow desired packages: `stow nvim zed` (add more as configured)
6. Install system packages: `sudo pacman -S --needed $(cat pacman_list.txt)`
7. Install AUR packages: `yay -S --needed $(cat aur_list.txt)`
8. Log out and back in to apply settings

## Best Practices

**Before Stowing:**
- Always run `stow -n <package>` first to check for conflicts
- Back up any existing configs that might be overwritten
- Verify the package structure mirrors the home directory correctly

**Configuration Management:**
- Keep configs minimal and well-commented
- Document non-obvious settings in comments
- Update package lists regularly with `pacman -Qqe > pacman_list.txt`
- Test configs after changes before committing

**Security:**
- Never commit sensitive information (API keys, passwords, tokens)
- Use `.gitignore` for any credential files
- Review diffs before committing to catch accidental secrets
