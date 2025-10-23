# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.4.0] - 2025-10-24
### Added
- Validation infrastructure with master validate.sh script
- Individual validators: syntax-check, stow-check, symlink-check, package-check
- Testing workflow script (test-package.sh) with guided branch management
- Claude Code integration with 5 custom slash commands:
  - /validate - Run all validation checks
  - /test-config - Start testing workflow
  - /new-adr - Create Architecture Decision Records
  - /stow-package - Safely stow with validation
  - /update-packages - Update package lists
- Architecture Decision Records (ADRs):
  - ADR-0001: Use GNU Stow
  - ADR-0002: Hyprland Compositor
  - ADR-0003: Package Structure
  - ADR template for future decisions
- CONTRIBUTING.md with development workflow and branching strategy
- Validation & Testing section in README.md
- Development Workflow section in README.md
- Architecture Decisions section in README.md
- Comprehensive updates to CLAUDE.md with validation, testing, and Claude commands

### Changed
- CLAUDE.md now includes validation commands, testing workflow, and best practices
- README.md reorganized with validation, testing, and development sections
- syntax-check.sh now properly handles JSONC files (Zed configs)

## [2.3.0] - 2025-10-24
### Added
- KEYBINDINGS.md - Complete keybindings cheat sheet for all applications
- install.sh - Automated installation script with backup functionality
- Comprehensive comments to Git configuration explaining each setting
- Documentation section in README

### Changed
- Removed Git aliases (using full commands instead)
- Changed Git default branch from 'master' to 'main'
- Updated README with automated and manual installation instructions
- README now references all documentation files

## [2.2.0] - 2025-10-24
### Added
- Hyprland compositor configuration (10 config files)
- Alacritty terminal emulator configuration
- Bash shell configuration (.bashrc, .bash_profile, .profile)
- Git configuration with aliases and user settings
- Complete Omarchy default setup now tracked in dotfiles

### Changed
- Updated README.md with new package documentation
- Reorganized configuration sections by category (Window Manager, Terminal & Shell, Development)

## [2.1.0] - 2025-10-24
### Added
- Buffer management section with navigation and cleanup shortcuts
- Fresh README.md for Omarchy setup
- Generated package lists from current Omarchy system (165 pacman, 2 AUR)

### Removed
- Old configuration packages (hypr, nvidia-settings, rclone, wallpapers, zen, zshrc, git, assets)
- All archived configs (i3, kitty, devilspie2, logseq, picom, starship)
- Cursor extension files

### Changed
- Updated README for Omarchy-specific installation and usage

## [2.0.0] - 2025-10-24
### Added
- Custom keybind cheatsheet with search functionality (<leader>mk)
- Consistent <leader>m prefix for all custom keymaps
- <leader>m as alias to open keybind menu
- <leader>mt to open terminal in vertical split (right side)
- Delete operations section (ggdG to delete all file contents)
- Insert modes reference section
- CLAUDE.md documentation for Claude Code integration

### Changed
- BREAKING: Migrated to Arch Linux (Omarchy) from EndeavourOS/Hyprland setup
- Clean slate approach - removed old configs, keeping only nvim/
- Migrated from <leader>k to <leader>mk for cheatsheet
- Reorganized keybinds with emoji headers for better readability

### Removed
- Old Hyprland, Ghostty, Thunar, Zed, Zen Browser configs (archived)
- Previous EndeavourOS-specific configurations

## [1.1.0] - 2025-06-15
### Added
- feat: Add Ghostty config
- feat: Add Thunar config
- feat: Add Zed config

### Removed
- chore: remove kitty

## [1.0.0] - 2025-05-13
### Added
- [MNZTP-1011] init: TIME TO MAKE BABY COMMITS!
- [MNZTP-1012] doc: Create a README.md
- [MNZTP-1014] chore: remove orig reference and add info to readme
- [MNZTP-1016] chore: Align shortcuts
- [MNZTP-1017] doc: Create CHANGELOG.md
