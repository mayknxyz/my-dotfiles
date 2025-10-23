# 2. Use Hyprland as Wayland Compositor

**Status:** Accepted
**Date:** 2025-10-24

---

## Context

Arch Linux (Omarchy) requires a window manager or desktop environment. The choice significantly impacts:
- Display server protocol (X11 vs Wayland)
- Performance and hardware acceleration
- Customization capabilities
- Tiling vs floating window management
- Visual effects and animations

Options considered:
- X11 window managers (i3, bspwm, awesome)
- Wayland compositors (Sway, Hyprland, River)
- Desktop environments (GNOME, KDE Plasma)

## Decision

Use Hyprland as the primary Wayland compositor.

Hyprland provides:
- Wayland-native tiling window manager
- Dynamic tiling with automatic layouts
- Extensive configuration through config files
- Built-in animations and eye candy
- Active development and community

**Configuration approach:**
- Modular config split into multiple files (bindings, monitors, input, appearance, autostart)
- All configs stored in `hypr/.config/hypr/`
- Separate configs for hyprlock (screen lock) and hypridle (idle management)

## Consequences

### Positive

- **Modern protocol:** Wayland provides better security and performance than X11
- **Smooth animations:** Built-in compositor effects without separate picom/compton
- **Active development:** Regular updates and new features
- **Configuration flexibility:** Plain text configs with hot-reload support
- **Tiling workflow:** Automatic window arrangement increases productivity
- **GPU acceleration:** Better performance on modern hardware
- **Per-monitor configuration:** Easy multi-monitor setup

### Negative

- **Wayland compatibility:** Some X11-only applications require XWayland
- **Learning curve:** Different paradigm from traditional desktop environments
- **Screen sharing:** Requires PipeWire and xdg-desktop-portal setup
- **Nvidia complications:** Historically problematic (though improving)
- **Breaking changes:** Younger project may have API changes

### Neutral

- Requires learning Hyprland-specific configuration syntax
- Must configure everything manually (no defaults from desktop environment)
- Window management requires keyboard shortcuts (less mouse-friendly)
- Arch/Omarchy provides good Hyprland support in official repositories
