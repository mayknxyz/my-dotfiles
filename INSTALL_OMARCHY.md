# Omarchy Installation Guide

Complete setup for a fresh Omarchy system with these dotfiles.

---

## 1. Base System Setup

```bash
# Download and install latest Omarchy ISO from https://omarchy.org/
# Connect to internet (click network icon in Waybar)
# Update system: Press SUPER+ALT+SPACE
```

---

## 2. Install Packages

```bash
# Essential tools
sudo pacman -S git stow github-cli ripgrep git-delta

# Terminal and shell
sudo pacman -S ghostty zsh zsh-completions

# Editors
sudo pacman -S zed neovim

# Development tools - Install Bun globally
curl -fsSL https://bun.sh/install | bash
bun install -g live-server

# Optional tools
sudo pacman -S navi gimp yazi

# AUR packages (requires yay)
yay -S gita
```

---

## 3. Setup Directories and Clone Dotfiles

```bash
# Create project directories
mkdir -p ~/Dev/Local
mkdir -p ~/Dev/Github

# Authenticate with GitHub
gh auth login

# Clone dotfiles
cd ~
git clone https://github.com/mayknxyz/my-dotfiles.git ~/my-dotfiles
cd ~/my-dotfiles
```

---

## 4. Deploy Configurations with Stow

```bash
cd ~/my-dotfiles

# Deploy all configurations at once
stow */

# OR deploy one by one (optional)
# stow git
# stow nvim
# stow zed
# stow ghostty
# stow hypr
# stow walker
# stow omarchy
# stow waybar
# stow zsh
# stow omz
```

---

## 5. Shell Configuration

```bash
# Set Zsh as default shell
chsh -s $(which zsh)

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Re-stow omz customizations after Oh My Zsh installation
cd ~/my-dotfiles
stow omz

# Install Powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Restart terminal - Powerlevel10k configuration wizard will run automatically
```

---

## 6. Customize Appearance

```bash
# Change theme to matte-black (use Omarchy settings)
# Change wallpaper to black-ocean (use Omarchy settings or hyprpaper config)
```

---

## 7. Configure Git

```bash
# Edit git config with your information
nvim ~/.config/git/config
# Update name and email
```

---

## 8. Configure Zed Editor (Optional)

```bash
# Copy example settings and add your API keys
cp ~/my-dotfiles/zed/.config/zed/settings.json.example ~/my-dotfiles/zed/.config/zed/settings.json
nvim ~/my-dotfiles/zed/.config/zed/settings.json
```

---

## 9. Configure Hyprland Monitors (if needed)

```bash
# Edit monitors configuration
nvim ~/.config/hypr/monitors.conf
```

---

## 10. Final Steps

```bash
# Log out and log back in to apply all changes
# Or reload Hyprland: SUPER+SHIFT+R
```

---

## Troubleshooting

**Stow conflicts:** Use `stow -n <package>` to check for conflicts before deploying.

**Shell not changing:** Verify with `echo $SHELL` - should show `/bin/zsh`.

**Hyprland not loading configs:** Check `~/.local/share/hyprland/hyprland.log`.

---

For more details, see [README.md](README.md) and [CONTRIBUTING.md](CONTRIBUTING.md).
