# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
