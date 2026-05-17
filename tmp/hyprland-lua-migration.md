# Hyprland Lua Config Migration Plan

## Prerequisites

- Upgrade Hyprland to 0.55+ before starting (`pacman -Syu hyprland`)
- You were on **0.54.3** when this plan was written (Lua requires 0.55+)

---

## Lua Support by App

| App | Lua Support |
|---|---|
| **hyprland** | Yes (0.55+) |
| **hypridle** | No — stays as `.conf` |
| **hyprlock** | No — stays as `.conf` |
| **hyprpaper** | No — stays as `.conf` |

Only `hyprland.conf` → `hyprland.lua`. The three companion configs are unchanged.

---

## Target Module Structure

```
hypr/
├── hyprland.lua          ← entry point, only require() calls
├── modules/
│   ├── env.lua           ← XCURSOR_SIZE, HYPRCURSOR_SIZE
│   ├── monitors.lua      ← monitor= lines
│   ├── autostart.lua     ← exec-once= lines
│   ├── appearance.lua    ← general{}, decoration{}, animations{}, dwindle{}, master{}, misc{}
│   ├── input.lua         ← input{}, gestures{}, device{}
│   ├── keybindings.lua   ← all bind/bindm/bindel/bindl lines
│   └── rules.lua         ← windowrule{} blocks
├── hypridle.conf         ← unchanged
├── hyprlock.conf         ← unchanged
└── hyprpaper.conf        ← unchanged
```

`monitors.conf` and `workspaces.conf` were both empty at time of writing — drop them.

---

## Key Syntax Translation

| `.conf` | `.lua` |
|---|---|
| `$mainMod = SUPER` | `local mainMod = "SUPER"` |
| `monitor=HDMI-A-1,3840x2160@60,...` | `hyprland.monitor("HDMI-A-1,3840x2160@60,...")` |
| `exec-once = swaync` | `hyprland.exec_once("swaync")` |
| `env = XCURSOR_SIZE,24` | `hyprland.env("XCURSOR_SIZE", 24)` |
| `general { gaps_in = 5 }` | `hyprland.general({ gaps_in = 5 })` |
| `bind = $mainMod, T, exec, kitty` | `hyprland.bind(mainMod .. ", T, exec, kitty")` |
| `source = monitors.conf` | `require("modules.monitors")` |

Colors keep the same `rgba(...)` string format in Lua.

---

## Known Issues to Fix During Migration

1. **Line 245 of hyprland.conf** — `bind = $mainMod, RETURN, exec, sh -c '...'` has a mismatched quote (`"` at end of shell string). Fix this during the rewrite.
2. **`device { name = epic-mouse-v1 }`** — placeholder device that likely doesn't exist; confirm or remove.

---

## LSP Support

Hyprland 0.55+ ships auto-generated Lua stubs for editor completion, usually at:
`/usr/share/hypr/stubs/`

Add this path to your LSP config (e.g. lua-language-server `workspace.library`) for autocompletion of the `hyprland.*` API.
