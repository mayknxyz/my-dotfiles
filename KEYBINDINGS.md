# Keybindings Cheat Sheet

Quick reference for all custom keybindings across the system.

---

## Hyprland (Window Manager)

**Note:** `SUPER` = Windows/Command key

### Applications

| Keybinding | Action | Description |
|------------|--------|-------------|
| `SUPER + Enter` | Terminal | Open terminal in current directory |
| `SUPER + F` | File Manager | Open Nautilus file manager |
| `SUPER + B` | Browser | Launch default browser (Chromium) |
| `SUPER + SHIFT + B` | Chrome | Launch Google Chrome |
| `SUPER + M` | Music | Launch/focus Spotify |
| `SUPER + N` | Editor | Launch default editor |
| `SUPER + T` | Activity Monitor | Open btop system monitor |
| `SUPER + D` | Docker | Open lazydocker in terminal |
| `SUPER + G` | GitHub | Open GitHub web app |
| `SUPER + O` | Obsidian | Launch/focus Obsidian notes |
| `SUPER + /` | Passwords | Open Bitwarden password manager |
| `SUPER + Z` | Zed | Launch Zed editor |

### AI & Web Apps

| Keybinding | Action |
|------------|--------|
| `SUPER + A` | Claude AI |
| `SUPER + SHIFT + A` | Google Gemini |
| `SUPER + C` | Calendar (Hey) |
| `SUPER + E` | Email (Gmail) |
| `SUPER + Y` | YouTube |
| `SUPER + SHIFT + G` | WhatsApp Web |
| `SUPER + ALT + G` | Google Messages |
| `SUPER + X` | X (Twitter) |
| `SUPER + SHIFT + X` | X Compose Post |

---

## Git Settings

- Pull strategy: rebase (keeps history clean)
- Default branch: main
- Credential helper: GitHub CLI (`gh`)

---

## Neovim

See `nvim/.config/nvim/lua/config/keymaps.lua` for detailed Neovim keybindings including:
- Custom leader key mappings (`<leader>m*`)
- Buffer management
- Terminal integration
- Search and navigation

---

## System Information

**Terminal:** Alacritty
**Shell:** Bash
**Window Manager:** Hyprland (Wayland)
**Editor:** Neovim, Zed

For Hyprland-specific bindings (window management, workspaces, etc.), refer to Omarchy default keybindings or run `hyprctl binds`.
