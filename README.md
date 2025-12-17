# Omarchy Dotfiles

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Arch Linux](https://img.shields.io/badge/Arch%20Linux-1793D1?logo=arch-linux&logoColor=fff)](https://archlinux.org/)
[![Hyprland](https://img.shields.io/badge/Hyprland-Wayland-5BCEFA?logo=wayland&logoColor=white)](https://hyprland.org/)

Personal dotfiles for [Omarchy](https://omarchy.com) managed with GNU Stow.

---

## Philosophy

This repository fully embraces Omarchy as the foundation rather than maintaining a custom Arch setup from scratch. By building on top of Omarchy's well-maintained defaults, I can:

- **Let the Omarchy contributors handle the hard parts** - window manager configs, system integration, and package management are maintained upstream
- **Minimize personal maintenance burden** - less time debugging system-level issues, more time being productive
- **Easy restoration on any device** - clone, stow, done

The focus here is on **adapting and extending** Omarchy's sensible defaults rather than replacing them. Modifications are made only when needed to achieve a **keyboard-first environment**.

### Keyboard-First Approach

The goal is to minimize mouse usage and keep hands on the keyboard. This is why:

- **Waybar is autokilled on startup** - the status bar is a visual distraction that encourages mouse interaction. System info can be accessed via keybindings when needed.
- **Hyprland keybindings are customized** - optimized for quick navigation between workspaces and windows
- **Custom branding** - personalized without changing core functionality

---

## Installation

**Prerequisites:**

```bash
sudo pacman -S git stow
```

**Setup:**

```bash
git clone https://github.com/mayknxyz/my-dotfiles.git ~/my-dotfiles
cd ~/my-dotfiles
stow hypr nvim omarchy
```

---

## Structure

```
~/my-dotfiles/
├── hypr/          # Hyprland tweaks (keybindings, monitors, waybar autokill)
├── nvim/          # Neovim configuration
├── omarchy/       # Omarchy branding customizations
└── archive/       # Unused/experimental configs
```

Each directory mirrors the home directory structure:

- `hypr/.config/hypr/` → `~/.config/hypr/`
- `nvim/.config/nvim/` → `~/.config/nvim/`

---

## Usage

```bash
# Deploy a package
stow hypr

# Remove a package
stow -D hypr

# Re-deploy after changes
stow -R hypr
```

---

## License

MIT License - See [LICENSE](LICENSE) for details.
