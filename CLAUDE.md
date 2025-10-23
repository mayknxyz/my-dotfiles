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
- `hypr/` - Hyprland compositor configuration
- `alacritty/` - Alacritty terminal emulator configuration
- `bash/` - Bash shell configuration
- `git/` - Git configuration with aliases
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

### Validation and Testing

```bash
# Run all validation checks (syntax, stow conflicts, symlinks, packages)
./scripts/validate.sh

# Test a package with guided workflow (creates testing branch)
./scripts/test-package.sh <package-name>

# Individual validators
./scripts/validators/syntax-check.sh    # Check config syntax
./scripts/validators/stow-check.sh      # Check for stow conflicts
./scripts/validators/symlink-check.sh   # Find broken symlinks
./scripts/validators/package-check.sh   # Verify required packages
```

### System Package Management

```bash
# Install packages from pacman_list.txt
sudo pacman -S --needed $(cat pacman_list.txt)

# Install AUR packages (requires yay or paru)
yay -S --needed $(cat aur_list.txt)

# Update all packages
sudo pacman -Syu

# Update package lists
pacman -Qqe > pacman_list.txt
pacman -Qqm > aur_list.txt
```

### Development Workflow

```bash
# 1. Create testing branch
git checkout -b testing/<package-name>

# 2. Make changes and validate
vim <package>/<config-file>
./scripts/validate.sh

# 3. Test changes
stow -R <package-name>

# 4. Commit changes
git add <package>/
git commit -m "Update <package> configuration"

# 5. Merge to main
git checkout main
git merge testing/<package-name> --no-ff
git branch -d testing/<package-name>
```

## Claude Commands

This repository includes custom Claude Code slash commands in `.claude/commands/`:

- **`/validate`** - Run all validation checks (syntax, stow conflicts, symlinks, packages)
- **`/test-config <package>`** - Create testing branch and start guided testing workflow
- **`/new-adr <title>`** - Create new Architecture Decision Record with proper numbering
- **`/stow-package <package>`** - Safely stow a package with validation checks
- **`/update-packages`** - Update pacman_list.txt and aur_list.txt, then commit changes

These commands automate common tasks and ensure best practices are followed.

## Creating New Configuration Packages

When adding a new application config:

1. Create a new directory in the repository root (e.g., `zsh/`, `git/`, `tmux/`)
2. Mirror the home directory structure inside it
   - For `~/.config/app/`: create `app/.config/app/`
   - For `~/.apprc`: create `app/.apprc`
3. Add your configuration files
4. Validate: `./scripts/validate.sh`
5. Test with dry-run: `stow -n app`
6. Deploy: `stow app`
7. Update package lists if new app installed
8. Commit changes to git

**Example: Adding Zsh config**
```bash
# Using testing branch workflow
git checkout -b testing/zsh
mkdir -p zsh
touch zsh/.zshrc
# Edit zsh/.zshrc
./scripts/validate.sh
stow -n zsh  # Check for conflicts
stow zsh     # Deploy
git add zsh
git commit -m "Add zsh configuration"
git checkout main
git merge testing/zsh --no-ff
```

## Architecture Notes

### Current Configuration

**Hyprland (Window Manager):**
- Location: `hypr/.config/hypr/`
- Main config: `hypr/.config/hypr/hyprland.conf`
- Key files:
  - `bindings.conf` - Keybindings
  - `monitors.conf` - Monitor configuration
  - `input.conf` - Input device settings
  - `looknfeel.conf` - Appearance settings
  - `autostart.conf` - Startup applications
  - `hyprlock.conf`, `hypridle.conf` - Lock screen and idle settings

**Alacritty (Terminal):**
- Location: `alacritty/.config/alacritty/`
- Config: `alacritty/.config/alacritty/alacritty.toml`

**Bash (Shell):**
- Location: `bash/`
- Files: `.bashrc`, `.bash_profile`, `.profile`

**Git:**
- Location: `git/.config/git/`
- Config: `git/.config/git/config`
- Ignore: `git/.config/git/ignore`
- Aliases: co (checkout), br (branch), ci (commit), st (status)
- User: Mike Navales <mike@mikenavales.xyz>

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

**Documentation:**
- `README.md` - Setup guide and documentation
- `CLAUDE.md` - This file - Claude Code guidance
- `docs/CONTRIBUTING.md` - Development workflow and branching strategy
- `docs/adr/` - Architecture Decision Records
- `CHANGELOG.md` - Version history

**Scripts:**
- `scripts/validate.sh` - Master validation script
- `scripts/test-package.sh` - Testing workflow helper
- `scripts/validators/` - Individual validation scripts
- `.claude/commands/` - Custom Claude Code slash commands

**Package Lists:**
- `pacman_list.txt` - Official repository packages (165 packages)
- `aur_list.txt` - AUR packages (2 packages)

**Configuration Files:**
- `hypr/.config/hypr/hyprland.conf` - Hyprland main configuration
- `hypr/.config/hypr/bindings.conf` - Hyprland keybindings
- `alacritty/.config/alacritty/alacritty.toml` - Alacritty terminal config
- `bash/.bashrc` - Bash shell configuration
- `git/.config/git/config` - Git configuration and aliases
- `nvim/.config/nvim/lua/config/keymaps.lua` - Neovim keybindings
- `zed/.config/zed/settings.json` - Zed editor settings

## System Setup Workflow

When setting up a new Omarchy system:

1. Install base Omarchy system
2. Install git and stow: `sudo pacman -S git stow`
3. Clone repository: `git clone <repo-url> ~/.dotfiles`
4. Navigate: `cd ~/.dotfiles`
5. Stow all packages: `stow hypr alacritty bash git nvim zed`
6. Install system packages: `sudo pacman -S --needed $(cat pacman_list.txt)`
7. Install AUR packages: `yay -S --needed $(cat aur_list.txt)`
8. Log out and back in to apply settings

## Best Practices

**Before Stowing:**
- Always run `./scripts/validate.sh` to check syntax and conflicts
- Use `stow -n <package>` for dry-run to check for conflicts
- Back up any existing configs that might be overwritten
- Verify the package structure mirrors the home directory correctly

**Development Workflow:**
- Use testing branches (`testing/<package>`) for experimental changes
- Run validation before committing: `./scripts/validate.sh`
- Test changes immediately after stowing: `stow -R <package>`
- Use `/test-config <package>` command for guided testing workflow
- Merge with `--no-ff` to preserve branch history

**Configuration Management:**
- Keep configs minimal and well-commented
- Document non-obvious settings in comments
- Update package lists regularly: use `/update-packages` command
- Test configs after changes before committing
- Document significant decisions in ADRs: use `/new-adr <title>` command

**Security:**
- Never commit sensitive information (API keys, passwords, tokens)
- Use `.gitignore` for any credential files
- Review diffs before committing to catch accidental secrets

**When Working with Claude Code:**
- Use provided slash commands (`/validate`, `/test-config`, etc.)
- Let Claude help with validation and testing workflows
- Ask Claude to create ADRs for architectural decisions
- Use Claude to help troubleshoot validation errors
