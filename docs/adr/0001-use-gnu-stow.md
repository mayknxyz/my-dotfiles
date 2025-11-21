# 1. Use GNU Stow for Dotfiles Management

**Status:** Accepted
**Date:** 2025-10-24

---

## Context

Managing dotfiles across systems requires a systematic approach to:
- Deploy configurations to appropriate locations in the home directory
- Keep configurations version-controlled in a central repository
- Handle updates and removals cleanly
- Avoid manual copying and symlinking

Several approaches were available:
- Manual symlink management (error-prone, hard to maintain)
- Custom scripts (reinventing the wheel)
- GNU Stow (existing, battle-tested tool)
- Specialized dotfiles managers (chezmoi, yadm, bare git repo method)

## Decision

Use GNU Stow as the primary tool for managing dotfiles symlinks.

Each application configuration is organized as a "stow package" - a directory that mirrors the home directory structure. Running `stow <package>` creates symlinks from the home directory to the repository.

**Package structure example:**
```
nvim/.config/nvim/init.lua  →  stow nvim  →  ~/.config/nvim/init.lua
bash/.bashrc                →  stow bash  →  ~/.bashrc
```

## Consequences

### Positive

- **Simplicity:** Stow is a single-purpose tool that does one thing well
- **No lock-in:** Configurations remain plain text files, no special formats
- **Native to Arch:** Available in official repositories, no AUR dependency
- **Selective deployment:** Can stow individual packages without deploying everything
- **Safe operations:** Stow refuses to overwrite existing files (prevents accidents)
- **Easy removal:** `stow -D <package>` cleanly removes all symlinks
- **Dry-run capability:** `stow -n` allows testing before making changes

### Negative

- **Learning curve:** Requires understanding stow's directory structure conventions
- **Conflicts require manual resolution:** Stow will error if files already exist
- **No templating:** Cannot generate config files based on hostname/environment variables (unlike chezmoi)

### Neutral

- Stow packages must mirror home directory structure exactly
- Requires explicit stow commands for each package (not automatic)
- Repository structure is dictated by stow's expectations
