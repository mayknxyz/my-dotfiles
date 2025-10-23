# 3. Repository Package Structure and Organization

**Status:** Accepted
**Date:** 2025-10-24

---

## Context

Dotfiles repositories can be organized in multiple ways:
- Single directory with all configs mixed together
- Grouped by config location (~/.config vs ~/ root)
- Grouped by application (separate directory per app)
- Monolithic scripts that copy files

With GNU Stow as the chosen tool (see ADR-0001), the repository structure needs to:
- Support stow's package-based approach
- Be intuitive for adding new configurations
- Keep related files together
- Allow selective deployment of configurations

## Decision

Organize the repository with **one top-level directory per application**, where each directory is a stow package that mirrors the home directory structure.

**Structure:**
```
~/.dotfiles/
├── hypr/              # Hyprland package
│   └── .config/hypr/
├── alacritty/         # Alacritty package
│   └── .config/alacritty/
├── nvim/              # Neovim package
│   └── .config/nvim/
├── bash/              # Bash package
│   ├── .bashrc
│   └── .bash_profile
├── git/               # Git package
│   └── .config/git/
├── zed/               # Zed package
│   └── .config/zed/
├── docs/              # Documentation (not stowed)
├── scripts/           # Helper scripts (not stowed)
├── pacman_list.txt    # System packages (not stowed)
└── aur_list.txt       # AUR packages (not stowed)
```

**Key principles:**
- Each application has its own top-level directory
- Stow packages mirror home directory structure exactly
- Non-config files (docs, scripts, package lists) live at repository root
- Package names match application names for clarity

## Consequences

### Positive

- **Clear organization:** Each package is self-contained and obvious
- **Selective deployment:** Can stow individual apps (`stow nvim`) or all (`stow */`)
- **Easy to add new configs:** Follow the established pattern
- **Git-friendly:** Changes to one app don't affect others in commit history
- **Intuitive navigation:** `hypr/` contains all Hyprland configs, `nvim/` contains all Neovim configs
- **Documentation-friendly:** Easy to document what each package provides

### Negative

- **Directory nesting:** Files like `alacritty/.config/alacritty/alacritty.toml` have deep paths
- **Empty-looking packages:** Some packages have only one or two files
- **Stow requirement:** Structure only makes sense if you understand stow packages

### Neutral

- Repository root has both stow packages and auxiliary files
- Must remember that package directories mirror `~/` not `~/.config/`
- Adding a new config requires creating the appropriate directory structure first
