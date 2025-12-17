# Changelog

All notable changes to this dotfiles repository will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.4.0] - 2025-12-17

### Changed
- Updated workspace-to-monitor assignments in Hyprland config
  - HDMI-A-1: workspaces 1, 2, 3, 4
  - eDP-1: workspaces 7, 8, 9
  - DP-1: workspaces 6, 0

## [1.3.1] - 2025-12-17

### Fixed
- Increased waybar autokill delay from 0.5s to 2s in Hyprland autostart to fix timing issue

## [1.3.0] - 2025-12-17

### Added
- Neovim Kickstart configuration (`nvim-kickstarter/`) for stow management
- Neovim LazyVim configuration (`nvim-lazyvim/`) for stow management

## [1.2.1] - 2025-12-17

### Fixed
- Claude Code statusline git indicator now shows green ✓ when working directory is clean
- Claude Code statusline git indicator only shows red ✗ when there are unstaged/untracked files

### Added
- Claude Code statusline configuration

## [1.2.0] - 2025-12-17

### Changed
- Simplified Hyprland autostart.conf to only kill waybar (keyboard-first workflow)
- Updated monitors.conf configuration

### Removed
- Removed redundant Hyprland config files (envs.conf, hyprland.conf, input.conf, looknfeel.conf)

## [1.1.0] - 2025-11-22

### Changed
- Removed Neovim configuration from dotfiles (now managed separately at ~/.config/nvim)
- Enhanced Walker keybindings viewer with git command reminders (gst, ga, gcmsg, gsw, gswc, gwta, gwtls, gwtmv, gwtrm)
- Enhanced Walker keybindings viewer with nvim command reminders (motions, operators, search, terminal commands, Telescope integration)

### Removed
- nvim/.config/nvim directory (migrated to standalone repository)

## [1.0.0] - 2025-11-21

### Added
- Initial public release of Omarchy dotfiles
- Hyprland compositor configuration with custom keybindings and layouts
- Waybar status bar configuration
- Walker application launcher setup
- Ghostty terminal emulator configuration
- Zsh shell configuration with Oh My Zsh integration
- Git configuration with useful aliases
- Neovim configuration with custom keymaps
- Zed editor configuration
- Omarchy-specific branding and system settings
- Claude Code integration with custom slash commands
- Comprehensive documentation (README, CONTRIBUTING)
- MIT License

### Changed
- Migrated from Custom Arch Setup to Omarchy
- Replaced Alacritty with Ghostty terminal
- Replaced Bash with Zsh as default shell
- Streamlined configuration management workflow

### Security
- Implemented .gitignore to prevent sensitive files from being committed
- Removed API keys from version control
- Added security best practices to documentation

## [Unreleased]

### Planned
- Additional desktop environment configurations
- More custom scripts and automation
- Enhanced documentation with screenshots
- CI/CD for configuration validation

---

[1.3.1]: https://github.com/mayknxyz/my-dotfiles/releases/tag/v1.3.1
[1.3.0]: https://github.com/mayknxyz/my-dotfiles/releases/tag/v1.3.0
[1.2.1]: https://github.com/mayknxyz/my-dotfiles/releases/tag/v1.2.1
[1.2.0]: https://github.com/mayknxyz/my-dotfiles/releases/tag/v1.2.0
[1.1.0]: https://github.com/mayknxyz/my-dotfiles/releases/tag/v1.1.0
[1.0.0]: https://github.com/mayknxyz/my-dotfiles/releases/tag/v1.0.0
