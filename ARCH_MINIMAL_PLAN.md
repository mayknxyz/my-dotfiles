# Minimal Arch Linux Setup Plan

A TUI/terminal-first Arch Linux installation focused on speed and minimalism.

## Core System

### Display & Session
| Package | Description |
|---------|-------------|
| hyprland | Wayland compositor |
| hyprlock | Screen locker |
| hypridle | Idle daemon |
| hyprsunset | Blue light filter |
| ly | Minimal TUI display manager |

### NVIDIA Graphics
| Package | Description |
|---------|-------------|
| nvidia-open-dkms | Open kernel modules |
| nvidia-utils | Driver utilities |
| lib32-nvidia-utils | 32-bit support |
| libva-nvidia-driver | Hardware video decode |
| egl-wayland | Wayland EGL support |
| egl-gbm | GBM EGL platform |
| egl-x11 | X11 EGL (for XWayland) |
| libvdpau | VDPAU library |
| linux-firmware-nvidia | Firmware files |

### Audio
| Package | Description |
|---------|-------------|
| pipewire | Modern audio server |
| wireplumber | Session manager for pipewire |
| pipewire-pulse | PulseAudio compatibility |
| pulsemixer | TUI audio mixer |
| pamixer | CLI volume control (for keybinds) |

### Networking
| Package | Description |
|---------|-------------|
| networkmanager | Network management |
| nmtui | TUI for NetworkManager (included) |
| networkmanager-openvpn | VPN support (optional) |
| bluez | Bluetooth stack |
| bluetuith | TUI bluetooth manager |

---

## Base Utilities (Not in Arch base)

### Networking
| Package | Description |
|---------|-------------|
| curl | URL transfers |
| wget | File downloads |
| openssh | SSH client/server |
| rsync | File sync |

### Archives
| Package | Description |
|---------|-------------|
| zip | Create zip files |
| unzip | Extract zip files |
| p7zip | 7z support |
| unrar | RAR extraction |

### System
| Package | Description |
|---------|-------------|
| git | Version control |
| base-devel | Build tools (gcc, make, etc.) |
| jq | JSON processor |
| man-db | Man pages |
| xdg-utils | xdg-open, etc. |
| xdg-user-dirs | Creates ~/Documents, ~/Downloads, etc. |
| polkit | Privilege escalation |
| usbutils | lsusb |
| pciutils | lspci |
| stow | Symlink farm manager (for dotfiles) |
| gnome-keyring | Secret storage |

---

## Terminal & Shell

### Terminal Emulator
| Package | Description |
|---------|-------------|
| ghostty | GPU-accelerated terminal |

### Shell
| Package | Description |
|---------|-------------|
| zsh | Z shell |
| oh-my-zsh | Zsh framework (AUR: oh-my-zsh-git) |
| powerlevel10k | Fast, customizable zsh theme (AUR: zsh-theme-powerlevel10k) |

### Text Editor
| Package | Description |
|---------|-------------|
| neovim | Modern vim - essential for TUI workflow |

---

## TUI Tools

### File & System Management
| Package | Description |
|---------|-------------|
| yazi | Terminal file manager |
| btop | System monitor |
| lazygit | Git TUI |
| lazydocker | Docker TUI |
| dust | Disk usage analyzer |

### Search & Navigation
| Package | Description |
|---------|-------------|
| fzf | Fuzzy finder |
| fd | Fast find alternative |
| ripgrep | Fast grep alternative |
| zoxide | Smarter cd |

### File Viewing
| Package | Description |
|---------|-------------|
| bat | cat with syntax highlighting |
| eza | Modern ls replacement |
| tldr | Simplified man pages |

---

## Development Tools

| Package | Description |
|---------|-------------|
| git-delta | Better git diffs |
| github-cli | GitHub from terminal |

---

## Wayland Utilities

### Launcher & Notifications
| Package | Description |
|---------|-------------|
| tofi | Minimal application launcher |
| dunst | Notification daemon |

### Clipboard
| Package | Description |
|---------|-------------|
| wl-clipboard | Clipboard utilities (wl-copy, wl-paste) |
| cliphist | Clipboard history manager |

### Screenshots
| Package | Description |
|---------|-------------|
| grim | Screenshot tool |
| slurp | Region selection |
| satty | Screenshot editing/annotation |
| wayfreeze | Freeze screen during selection |

### Screen Recording
| Package | Description |
|---------|-------------|
| wf-recorder | Screen recording for Wayland |

---

## GUI Applications

### Productivity
| Package | Description |
|---------|-------------|
| obsidian | Note-taking |
| zathura | Minimal PDF viewer |
| zathura-pdf-mupdf | PDF plugin for zathura |
| libqalculate | Calculator library |
| qalc | CLI calculator interface |

### Media
| Package | Description |
|---------|-------------|
| mpv | Video player |
| imv | Image viewer |
| obs-studio | Screen recording/streaming |
| gimp | Image editing |

### Internet
| Package | Description |
|---------|-------------|
| chromium | Web browser |
| transmission-cli | Torrent client |
| bitwarden | Password manager |

### Communication
| Package | Description |
|---------|-------------|
| slack-desktop | Slack GUI (AUR) |

---

## Fonts

| Package | Description |
|---------|-------------|
| ttf-meslo-nerd-font-powerlevel10k | MesloLGS NF - recommended for p10k (AUR) |
| noto-fonts | Unicode coverage |
| noto-fonts-emoji | Emoji support |

---

## System Utilities

### AUR Helper
| Package | Description |
|---------|-------------|
| paru | AUR helper written in Rust |

### Additional
| Package | Description |
|---------|-------------|
| fastfetch | System info (faster neofetch) |
| trash-cli | Safe rm alternative |

---

## Installation Order

1. **Base system** - archinstall or manual
2. **Base utilities** - curl, wget, git, base-devel, etc.
3. **AUR helper** - paru
4. **Graphics** - NVIDIA drivers
5. **Audio** - pipewire stack + pulsemixer
6. **Network** - networkmanager + bluetuith
7. **Display** - hyprland + ly
8. **Terminal** - ghostty + zsh + oh-my-zsh + powerlevel10k + neovim
9. **Wayland utils** - tofi, dunst, screenshot stack
10. **TUI tools** - yazi, lazygit, fzf, etc.
11. **Fonts** - MesloLGS NF, noto-fonts
12. **GUI apps** - as needed

---

## Hyprland NVIDIA Environment Variables

Add to `~/.config/hypr/hyprland.conf`:

```
env = NVD_BACKEND,direct
env = LIBVA_DRIVER_NAME,nvidia
env = __GLX_VENDOR_LIBRARY_NAME,nvidia
```

---

## Notes

### No Status Bar
Using hyprland without a status bar for maximum minimalism. Essential info can be accessed via:
- `btop` for system stats
- Keybinds for volume/brightness (pamixer)
- Notification popups via dunst

### Package Count Estimate
- ~80-90 packages for full setup
- Significantly lighter than omarchy or full DE
