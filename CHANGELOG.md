# Changelog

All notable changes to this dotfiles repository will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.1.0] - 2025-12-16

### Added
- Ventoy bootable USB preparation guide in README

### Changed
- Remove omarchy source references from hyprland.conf

## [2.0.0] - 2025-12-16

### Added
- ARCH_MINIMAL_PLAN.md: Comprehensive plan for minimal, TUI-first Arch Linux setup
  - Hyprland with no status bar for maximum minimalism
  - TUI tools: yazi, lazygit, lazydocker, btop, fzf, etc.
  - Shell: zsh + oh-my-zsh + powerlevel10k
  - Screenshot stack: grim, slurp, satty, wayfreeze
  - NVIDIA graphics configuration
  - Full package list with installation order

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

[2.1.0]: https://github.com/mayknxyz/my-dotfiles/releases/tag/v2.1.0
[2.0.0]: https://github.com/mayknxyz/my-dotfiles/releases/tag/v2.0.0
[1.1.0]: https://github.com/mayknxyz/my-dotfiles/releases/tag/v1.1.0
[1.0.0]: https://github.com/mayknxyz/my-dotfiles/releases/tag/v1.0.0
