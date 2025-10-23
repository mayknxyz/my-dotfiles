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

**Manual approach:**
```bash
git checkout -b testing/<package-name>
```

**Using helper script:**
```bash
./scripts/test-package.sh <package-name>
```

The script will:
- Create the testing branch
- Run validation checks
- Guide you through the workflow

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

### 4. Validate

Run validation before committing:

```bash
./scripts/validate.sh
```

This checks:
- Config file syntax
- Stow conflicts
- Broken symlinks
- Required packages

### 5. Commit Changes

When satisfied with your changes:

```bash
git add <package-name>/
git commit -m "Update <package> configuration

- Change 1
- Change 2"
```

### 6. Merge to Main

**Option A: Using the helper script**

Run the test-package script again and use the merge helper:

```bash
./scripts/test-package.sh <package-name>
```

**Option B: Manual merge**

```bash
# Switch to main branch
git checkout main

# Merge testing branch (no fast-forward to preserve history)
git merge testing/<package-name> --no-ff

# Delete testing branch
git branch -d testing/<package-name>
```

---

## Claude Commands

Use these slash commands in Claude Code for common tasks:

| Command | Description |
|---------|-------------|
| `/validate` | Run all validation checks |
| `/test-config <package>` | Start testing workflow for a package |
| `/new-adr <title>` | Create new Architecture Decision Record |
| `/stow-package <package>` | Safely stow a package with validation |
| `/update-packages` | Update package lists and commit changes |

---

## Validation Checks

Before stowing or committing, validation ensures your configs are correct:

### Syntax Validation
- **Shell scripts** (`.sh`) - Checked with `bash -n`
- **Lua files** (`.lua`) - Checked with `luac` (if available)
- **TOML files** (`.toml`) - Checked with `taplo` or Python's tomllib
- **JSON files** (`.json`) - Checked with `jq` (if available)

### Stow Conflict Detection
- Runs `stow -n` to check for conflicts before deploying
- Reports files that would be overwritten

### Broken Symlink Detection
- Scans home directory for broken symlinks pointing to dotfiles
- Helps identify stow deployment issues

### Package Verification
- Checks if required applications are installed
- Warns if configs exist but the application isn't installed

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

### 4. Update Package Lists

If the application is new to your system:

```bash
# Update package lists
pacman -Qqe > pacman_list.txt
pacman -Qqm > aur_list.txt

# Commit
git add pacman_list.txt aur_list.txt <app>/
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
2. **Backup if needed** - For major changes, `install.sh` creates automatic backups
3. **Use testing branches** - Don't experiment directly on main

### When Making Changes

1. **One change at a time** - Make focused, incremental changes
2. **Test immediately** - Verify each change works before moving to the next
3. **Comment your configs** - Explain non-obvious settings

### Before Committing

1. **Run validation** - Always run `./scripts/validate.sh`
2. **Test thoroughly** - Ensure changes work as expected
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

**Problem:** Validation reports syntax errors

**Solution:**
```bash
# For shell scripts
bash -n <script>.sh

# For Lua files
luac -p <file>.lua

# For TOML files
taplo check <file>.toml

# Fix the errors, then re-validate
./scripts/validate.sh
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

# 4. Validate
./scripts/validate.sh

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
