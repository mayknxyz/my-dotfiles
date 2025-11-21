# Contributing to Dotfiles

This document outlines the workflow for making changes to your dotfiles configurations.

---

## Branching Strategy

This repository uses a **feature branch workflow** for testing configuration changes before deploying them to the main branch.

### Branch Naming Convention

Use the following pattern for testing branches:

```
testing/<package-name>
```

**Examples:**
- `testing/nvim` - Testing Neovim configuration changes
- `testing/hypr` - Testing Hyprland configuration changes
- `testing/alacritty` - Testing Alacritty terminal changes

### Why Use Testing Branches?

- **Safety:** Test changes without affecting your stable main branch
- **Experimentation:** Try different configurations and compare approaches
- **Rollback:** Easy to discard failed experiments without cluttering history
- **Documentation:** Branch names clearly indicate what's being tested

---

## Workflow

### 1. Create Testing Branch

Create a new testing branch for your changes:

```bash
git checkout -b testing/<package-name>
```

### 2. Make Changes

Edit your configuration files in the package directory:

```bash
# Example: editing nvim configs
nvim nvim/.config/nvim/lua/config/keymaps.lua
```

### 3. Test Changes

Deploy your changes and test them:

```bash
# Re-stow the package to update symlinks
stow -R <package-name>

# For shell configs
source ~/.bashrc

# For other apps
# Reload the application or restart it
```

### 4. Test Manually

Test your configuration changes manually:

- For shell configs: Open a new terminal or run `source ~/.zshrc`
- For window manager configs: Reload Hyprland or log out/in
- For editor configs: Restart the editor and test functionality
- Verify all features work as expected

### 5. Commit Changes

When satisfied with your changes:

```bash
git add <package-name>/
git commit -m "Update <package> configuration

- Change 1
- Change 2"
```

### 6. Merge to Main

After testing and committing, merge your changes to main:

```bash
# Switch to main branch
git checkout main

# Merge testing branch (no fast-forward to preserve history)
git merge testing/<package-name> --no-ff

# Delete testing branch
git branch -d testing/<package-name>
```

---

## Claude Code Integration

Use this slash command in Claude Code when documenting architectural decisions:

| Command | Description |
|---------|-------------|
| `/new-adr <title>` | Create new Architecture Decision Record |

---

## Adding New Packages

When adding a new application configuration:

### 1. Create Package Directory

Follow the stow package structure:

```bash
# For configs in ~/.config/
mkdir -p <app>/.config/<app>/

# For configs in ~/
mkdir -p <app>/
touch <app>/.<config-file>
```

**Example: Adding tmux**
```bash
mkdir -p tmux/
touch tmux/.tmux.conf
```

### 2. Add Configuration Files

Place your config files in the appropriate location within the package.

### 3. Test Deployment

```bash
# Dry run to check for conflicts
stow -n <app>

# Deploy
stow <app>
```

### 4. Commit Changes

Commit your new configuration:

```bash
git add <app>/
git commit -m "Add <app> configuration"
```

### 5. Document (Optional)

Consider creating an ADR if the choice is significant:

```bash
/new-adr "Use <app> for <purpose>"
```

---

## Best Practices

### Before Making Changes

1. **Understand what you're changing** - Read the config file and understand the current settings
2. **Backup if needed** - Manually backup important configs before major changes
3. **Use testing branches** - Don't experiment directly on main

### When Making Changes

1. **One change at a time** - Make focused, incremental changes
2. **Test immediately** - Verify each change works before moving to the next
3. **Comment your configs** - Explain non-obvious settings

### Before Committing

1. **Test thoroughly** - Ensure changes work as expected
2. **Use stow dry-run** - Run `stow -n <package>` to check for conflicts
3. **Write clear commit messages** - Explain what changed and why

### After Merging

1. **Delete testing branches** - Keep repository clean
2. **Update documentation** - If behavior changed significantly
3. **Consider an ADR** - For architectural decisions

---

## Troubleshooting

### Stow Conflicts

**Problem:** `stow` reports conflicts with existing files

**Solution:**
```bash
# Check what's conflicting
stow -n <package>

# If safe to overwrite, remove existing files first
rm ~/.config/<app>/<conflicting-file>

# Or backup first
mv ~/.config/<app> ~/.config/<app>.backup

# Then stow
stow <package>
```

### Broken Symlinks

**Problem:** Symlinks point to wrong location or are broken

**Solution:**
```bash
# Re-stow the package
stow -R <package>

# Or remove and re-create
stow -D <package>
stow <package>
```

### Syntax Errors

**Problem:** Configuration file has syntax errors

**Solution:**
```bash
# For shell scripts
bash -n <script>.sh

# For Lua files
luac -p <file>.lua

# For TOML files (if taplo is installed)
taplo check <file>.toml

# Fix the errors, then test the application
```

---

## Git Workflow Summary

```bash
# 1. Create testing branch
git checkout -b testing/<package>

# 2. Make changes
vim <package>/<config-file>

# 3. Test changes
stow -R <package>
# Manually test the configuration

# 5. Commit
git add <package>/
git commit -m "Update <package> configuration"

# 6. Merge to main
git checkout main
git merge testing/<package> --no-ff
git branch -d testing/<package>
```

---

## Questions?

If you're unsure about any workflow step, use Claude Code to ask questions or run the helper scripts for guidance.
