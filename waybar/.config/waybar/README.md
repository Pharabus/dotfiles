# Waybar Gruvbox Configuration

This configuration provides a Gruvbox-themed Waybar setup for Hyprland.

## File Structure

```
waybar/
├── config/
│   └── waybar.json          # Main configuration file
├── style/
│   └── gruvbox.css          # Gruvbox theme CSS
└── README.md                # This file
```

## Installation

1. Copy the `config` and `style` directories to your Waybar configuration directory:
   ```bash
   cp -r config style ~/.config/waybar/
   ```

2. Or alternatively, create symbolic links:
   ```bash
   ln -s $(pwd)/config/waybar.json ~/.config/waybar/config.json
   ln -s $(pwd)/style/gruvbox.css ~/.config/waybar/style.css
   ```

## Configuration Features

### Modules Included

- **Left**: Workspaces, Mode, Scratchpad
- **Center**: Window title
- **Right**: Audio, Network, CPU, Memory, Temperature, Battery, Clock, System tray

### Gruvbox Colors

- **Background**: `#282828` (Dark0)
- **Foreground**: `#ebdbb2` (Light1)
- **Accent**: `#98971a` (Green)
- **Additional colors**: Red, Orange, Yellow, Blue, Purple, Aqua for different modules

### Workspace Icons

- Workspace 1: Terminal icon
- Workspace 2: Web browser icon
- Workspace 3: Files icon
- Workspace 4: Music icon
- Workspace 5: Video icon

## Customization

### Fonts

The configuration uses JetBrains Mono and Fira Code. Make sure you have these fonts installed:

```bash
# On Arch Linux
sudo pacman -S ttf-jetbrains-mono ttf-fira-code

# On Ubuntu/Debian
sudo apt install fonts-jetbrains-mono fonts-firacode
```

### Colors

You can customize the colors by editing the CSS file. The main Gruvbox colors are:

- Dark: `#282828`, `#3c3836`, `#504945`, `#665c54`
- Light: `#ebdbb2`, `#d5c4a1`, `#bdae93`, `#a89984`
- Colors: `#fb4934` (red), `#fabd2f` (yellow), `#b8bb26` (green), `#83a598` (blue), `#d3869b` (purple), `#8ec07c` (aqua)

### Module Configuration

Edit `config/waybar.json` to:
- Add or remove modules
- Adjust module positioning
- Change format strings
- Modify tooltips and interactions

## Dependencies

Make sure you have the following installed:
- Waybar
- Font Awesome (for icons)
- JetBrains Mono or Fira Code fonts
- pavucontrol (for audio control)

## Usage

1. Restart Waybar to apply the configuration:
   ```bash
   killall waybar
   waybar &
   ```

2. Or if using a Hyprland configuration, add to your `hyprland.conf`:
   ```
   exec-once = waybar
   ```

## Troubleshooting

- If icons don't show up, install Font Awesome: `sudo pacman -S ttf-font-awesome`
- If the temperature module doesn't work, adjust the `hwmon-path` in the config
- For battery issues on desktop systems, remove the battery module from the config
- If colors don't match, ensure you're using the correct CSS file path

## License

This configuration is provided as-is. Feel free to modify and share.
