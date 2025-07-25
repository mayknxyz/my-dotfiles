# My Arch Hyprland Dotfiles

* * *

## Table of Contents

*   **About These Dotfiles**
*   **Installation & Setup (with GNU Stow)**
*   **Key Features & Customizations**
    *   **Included PackagesCore System Packages**
    *   **Applications & Tools**
*   **Notes & Reminders**
*   **Restoration Checklist**
*   **License**

* * *

## About These Dotfiles

This repository is my personal collection of configuration files for my Arch Linux setup running the Hyprland Wayland compositor. Its primary purpose is to maintain a consistent and efficient computing environment across installations and to serve as a reliable backup of my current configurations.

* * *

## Installation & Setup (with GNU Stow)

**Caution**: Always back up your existing configurations before applying these dotfiles.

This setup uses **GNU Stow** to manage symlinks, which makes deploying and organizing dotfiles straightforward.

1. **Install GNU Stow:** If Stow isn't already installed, grab it with pacman:
2. Bash
3.

```plain
sudo pacman -S stow
```

1. **Clone the repository:** Clone this repository into your home directory, typically as `~/.dotfiles`.
2. Bash
3.

```plain
git clone https://github.com/your-username/dotfiles.git ~/.dotfiles
```

1. (Remember to replace `your-username` with the actual path if you've named your private repo differently.)
2. **Navigate to the dotfiles directory:**
3. Bash
4.

```plain
cd ~/.dotfiles
```

1. **Stow the dotfiles:** From within the `~/.dotfiles` directory, use `stow` for each configuration group. Each top-level directory in `~/.dotfiles` (e.g., `hypr`, `zsh`, `nvim`) should correspond to a package you want to symlink.
2. For example:
3. Bash
4.

```plain
stow hypr
stow zsh
stow nvim
stow alacritty # If you switch to Alacritty later# ... and so on for all your main configuration directories
```

1. Stow will create symbolic links from your home directory to the respective files and directories within `~/.dotfiles`. For instance, `~/.dotfiles/hypr/.config/hypr` will be symlinked to `~/.config/hypr`.
2. **Install necessary packages:** After symlinking, you'll need the actual software packages. Refer to the "Included Packages" sections below. On Arch, use `pacman`:
3. Bash
4.

```cs
sudo pacman -Syu hyprland [other-packages-as-needed]
```

1. **Reboot or re-login:** Log out and back in, or reboot your system, to ensure all changes take effect.

* * *

## Key Features & Customizations

These dotfiles provide:

*   **Hyprland Wayland Compositor:** My personalized keybindings, workspace management, and window layouts for a highly efficient tiling workflow with modern Wayland support.
*   **Zsh:** Custom prompt, aliases, functions, and plugin setup for a powerful and productive shell experience.
*   **Terminal Emulators:** Ghostty and Kitty terminal emulators with tailored appearance and behavior.
*   **Wayland Settings:** Specific configurations for display, input devices, and keyboard layouts optimized for Wayland.
*   **Appearance:** Cohesive theming and font selections across applications with modern blur effects and animations.

* * *

## Included Packages

This section lists the key packages and applications that these dotfiles are configured to work with. This isn't every single package on the system, but rather those essential for the intended setup and user experience.

### Core System Packages

These are the foundational packages, often part of a minimal Arch Linux and Hyprland setup, that provide the base environment for the dotfiles.

*   `hyprland`: The Hyprland Wayland compositor itself.
*   `hyprpaper`: Wallpaper daemon for Hyprland.
*   `hyprlock`: Screen locker for Hyprland.
*   `hyprpolkitagent`: Polkit authentication agent for Hyprland.
*   `xdg-desktop-portal-hyprland`: Desktop portal for Hyprland integration.
*   `pipewire`: Modern audio system for Wayland.
*   `wireplumber`: Session manager for PipeWire.
*   `brightnessctl`: Brightness control utility.
*   `playerctl`: Media player control utility.
*   `wofi`: Application launcher and menu for Wayland.
*   `flameshot`: Screenshot tool.
*   `nm-applet`: NetworkManager applet for system tray.
*   `systemd-boot`: Bootloader for UEFI systems.
*   `LUKS`: Disk encryption.
*   `yay`: AUR helper for installing packages from the Arch User Repository.

### Applications & Tools

These are my frequently used applications and command-line tools that often have their configurations managed by these dotfiles.

#### **Web Browsers & Communication**
*   **Google Chrome Stable:** My primary web browser.
*   **Zen Browser:** Alternative browser for privacy-focused browsing.
*   **Discord:** My communication platform.
*   **Slack:** Team communication platform.

#### **Development & Code Editing**
*   **Cursor:** My preferred code editor (based on VS Code).
*   **Neovim:** My main text editor for terminal-based tasks.
*   **Git:** Version control system.

#### **Productivity & Organization**
*   **Obsidian:** My note-taking and knowledge management application.
*   **Gmail:** Email client (web app).
*   **Google Calendar:** Calendar application (web app).
*   **Google Drive:** Cloud storage and file synchronization.
*   **Bitwarden Desktop:** My password manager.

#### **File Management**
*   **Yazi:** Modern terminal file manager.
*   **Thunar:** GUI file manager.
*   **fd, find:** File finders.
*   **eza, ls:** File listers.
*   **bat, cat:** File viewers.

#### **Terminal & System Tools**
*   **Ghostty:** My primary terminal emulator.
*   **Kitty:** Alternative terminal emulator.
*   **btop, htop:** System monitors.
*   **ripgrep, grep:** Text searchers.
*   **nano:** Simple text editor.

#### **Media & Content Creation**
*   **OBS Studio:** Screen recording and streaming.
*   **CameraCtrls:** Webcam control application.
*   **imv:** Image viewer.

#### **System & Utilities**
*   **Pavucontrol:** PulseAudio volume control.
*   **Timeshift:** System restore utility.
*   **Arch Wiki Chrome App:** Quick access to Arch documentation.
*   **Umami:** Analytics platform.
*   **UptimeKuma:** Monitoring tool.
*   **Gemini:** AI/LLM interface.

#### **Network & Connectivity**
*   **NetworkManager:** Network connection management.
*   **NetworkManager Applet:** System tray network indicator.

#### **System Monitoring & Maintenance**
*   **Syncthing:** File synchronization (commented in config).
*   **man-db:** Manual pages database.

* * *

## Notes & Reminders

*   **Wallpaper:** Remember to set the wallpaper using `hyprpaper` as configured in the Hyprland setup.
*   **GTK Themes/Icons:** After `lxappearance` is set up, make sure to apply the themes and icons.
*   **Font Installation:** Install all necessary fonts (Nerd Fonts, etc.) for proper display in terminal, etc.
*   **Hardware-Specific Configs:** Double-check configurations in `~/.config/hypr/hyprland.conf` for any hardware-specific settings (e.g., monitor names, touchpad settings) that might need adjustment on a new machine.
*   **Permissions:** Ensure scripts or executables have correct permissions (`chmod +x`).
*   **AUR Helpers:** If installing AUR packages, remember to use your preferred AUR helper (e.g., `yay`, `paru`).
*   **Wayland Compatibility:** Ensure all applications are Wayland-compatible or have proper XWayland support.

* * *

## Restoration Checklist

When setting up a new Arch Hyprland system or reinstalling:

1. \[ \] Install Arch Linux base system.
2. \[ \] Install `git` and `stow`.
3. \[ \] Clone this dotfiles repository: `git clone` [`https://github.com/your-username/dotfiles.git`](https://github.com/your-username/dotfiles.git) `~/.dotfiles`
4. \[ \] `cd ~/.dotfiles`
5. \[ \] Run `stow` for all relevant packages (e.g., `stow hypr`, `stow zsh`, `stow nvim`).
6. \[ \] Install **Core System Packages** listed above via `pacman`.
7. \[ \] Install **Applications & Tools** listed above via `pacman` or your AUR helper.
8. \[ \] Install desired fonts (Nerd Fonts, etc.).
9. \[ \] Set wallpaper using `hyprpaper`.
10. \[ \] Configure GTK theme and icons with `lxappearance`.
11. \[ \] Check `hyprland.conf` for display output names and adjust if necessary.
12. \[ \] Test all keybindings and application launchers.
13. \[ \] Configure `nm-applet` if using NetworkManager.
14. \[ \] Import any necessary GnuPG keys or SSH keys.
15. \[ \] Log out and back in to ensure all settings are applied.
16. \[ \] Verify Wayland compatibility of all applications.

* * *

## License

[Add your license information here]
