# Rainmeter Skins

A small collection of custom [Rainmeter](https://www.rainmeter.net/) skins for Windows: cyberpunk-style system and network HUDs, plus rotating wireframe shapes drawn live with Lua. Made for fun by **Ryan Boe**.

<!-- Add screenshots to images/ and show them here, for example: ![PerfMonitor](images/perfmonitor.png) -->

## The skins

| Skin | Folder | What it is |
|---|---|---|
| **PerfMonitor** (Cyberpunk Edition) | `skins/Pref-MK4 Neo laptop/` | Compact single-panel system monitor with a neon HUD look: CPU, RAM, swap, disk and network usage, plus CPU/GPU temperature and GPU load |
| **Network HUD** | `skins/NetworkHUD/` | Cyberpunk-style WiFi signal strength and network speed HUD, in normal and compact sizes |
| **Network HUD (Distance)** | `skins/Network Meter/` | Same HUD with an estimated distance (in meters) to the connected router, calculated from the signal strength, in normal and compact sizes |
| **Tesseract** | `skins/Rotate-T-MK2/` | A rotating 4D hypercube (tesseract) drawn live with Rainmeter's Lua scripting and Shape meter. No plugins needed |
| **RotatingCube** | `skins/Rotate-C-MK1/` | A small rotating wireframe cube, also pure Lua + Shape meter. No plugins needed |

## Install

1. Install [Rainmeter](https://www.rainmeter.net/).
2. Copy the skin folders you want from `skins/` into your Rainmeter skins folder, usually `Documents\Rainmeter\Skins`.
3. Right-click the Rainmeter icon in the system tray, choose **Refresh all**, then load the skin from **Skins**.

## Extra setup

- **PerfMonitor temperatures and GPU load** need [LibreHardwareMonitor](https://github.com/LibreHardwareMonitor/LibreHardwareMonitor) running in the background and the [LibreHardwareMonitor Rainmeter plugin](https://github.com/mallardduck/Rainmeter-LibreHardwareMonitor). The CPU, RAM, swap, disk and network readings work without them. Full steps are in the comments at the top of the skin file.
- **Network HUD (Distance)**: the distance is an estimate from signal strength. Calibrate it by standing about 1 m from your router and setting `TxAt1m` to the signal you see (the setup notes are in the file).
- **Tesseract and RotatingCube**: speed, size, perspective and colors can be changed in the `.lua` files and the `[Variables]` section of each `.ini`.

## License

The Network HUD skins state `Creative Commons BY-NC-SA 3.0` in their file headers. See each skin's `[Metadata]` section for its details.
