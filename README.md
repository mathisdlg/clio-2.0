# 🚗 Clio2.0 – Modular Embedded Driving System for OBD-II Vehicles

**Clio2.0** is a **modular, extensible, open-source platform** designed to enhance the driving experience—particularly in performance or rally scenarios—through real-time telemetry, dynamic LED feedback, touchscreen navigation, GPS timing, and audio integration.

> 🔧 Originally built for a Clio 2 Phase 2, it is fully adaptable to **any OBD-II compatible vehicle**.

---

## 🧩 Architecture Overview

| Component           | Role                                                                 |
|--------------------|----------------------------------------------------------------------|
| **ESP32**           | OBD-II telemetry, shifting LEDs, GPS chrono/zones, driving mode logic |
| **Raspberry Pi 4**  | Touch UI, map, audio control, OTA updates, plugin system              |
| **GPS Modules (x2)**| GT-07 for both ESP (zones/chrono) and RPi (map/Waze)                  |
| **WS2812 LEDs**     | RPM-based dynamic shift light bar                                     |
| **ESP32 OLED/LCD**  | Displays turbo, speed, temp, RPM, and other PID data                  |
| **HDMI Touchscreen**| Main UI for map, chrono, music, system alerts                         |
| **4x4 Keypad**      | Driving mode control, GPS zone marking                                |
| **Audio Jack Out**  | Output to vehicle sound system                                        |
| **ON/OFF Button**   | Physical ESP32 power cutoff                                           |

---

## ⚙️ Features

### 🎮 Driving Modes (controlled via ESP32)
- **Normal** – Telemetry display, RPM LEDs, map-only view
- **Race** – GPS chrono, zone alerts, visual overlays
- **Setup** – Configure GPS zones, test LEDs, PID check
- **Off** – Power down ESP via physical button

### 📡 OBD-II Telemetry (ESP32)
- Reads RPM, boost, coolant temp, speed, etc. via UART
- Custom library for multi-protocol OBD-II communication
- Displayed on ESP screen & synced with Pi UI
- Command/Repository pattern for extensible PID logic
- LED shift light dynamically mapped to RPM range

### 🛰️ GPS Integration
- **ESP32**
  - GT-07 module for live zone detection
  - GPS chrono: start/stop between 2 defined points
- **Raspberry Pi**
  - Second GT-07 for map view and Waze via Waydroid
  - Race zones visible only in Race mode
  - Map view always active for orientation

### 🔄 OTA & Serial Communication
- OTA firmware updates to ESP32 via Raspberry Pi (esptool)
- Config stored in LittleFS (ESP32) & JSON/YAML (RPi)
- Full duplex serial protocol between ESP ↔ RPi for:
  - Telemetry
  - Mode sync
  - GPS events
  - Error/status feedback

### 🎵 Audio System (via Raspberry Pi)
- 3.5mm jack output to vehicle radio (AUX)
- Python GUI music player + equalizer (Tkinter, PyQt or PyGame)
- Audio alerts for chrono, GPS zone entry, engine events

---

## 💻 Plugin Architecture

### 🧩 ESP32 Plugins (C++)
- Modular command registry
- Hooks: `onOBDData()`, `onGPSUpdate()`, `onModeChange()`
- Enables new telemetry features or custom PIDs without core edits

### 🧩 Raspberry Pi Plugins (Python)
- Dynamic plugin loader (entrypoints or folder scan)
- Hook-based system:
  - `on_mode_change(mode)`
  - `on_zone_enter(zone_id)`
  - `on_obd_data(pid, value)`
- Allows devs to create:
  - Custom UI elements
  - Dashcams or rear camera handling
  - Mobile sync or logging systems

---

## 🛠️ Installation Plan

| Component       | Recommended Placement        |
|----------------|-------------------------------|
| ESP32           | Hidden behind dash/glovebox   |
| Raspberry Pi 4  | Mounted behind head unit      |
| WS2812 LED Strip| Embedded around gauge cluster |
| ESP32 Display   | Driver zone / integrated in dash |
| HDMI Touchscreen| Dashboard (integrated or mount) |
| GPS Modules     | Dashboard/windshield placement |
| Keypad          | Console area for easy access  |

---

## 🔮 Future Add-ons

- Dashcam and rear camera support
- IMU sensors (accelerometer/gyroscope)
- Advanced diagnostics panel
- Bluetooth/mobile app with sync and route logging
- Voice command system
- Cloud logging and telemetry analysis

---

## 🧪 Dependencies

### ESP32
- `ESP32-Arduino` core
- `OBD2UART` or custom OBD protocol parser
- `TinyGPS++` for GT-07 parsing
- `NeoPixel` for LED control
- `LittleFS` for config/zone storage

### Raspberry Pi (NixOS)
- Python 3.x: `PySerial`, `PyGame`, `PyQt5` or `Tkinter`
- Weston (Wayland compositor)
- Waydroid for Waze
- OTA tools (`esptool.py`)
- Plugin system (manual or via importlib)

---

## 📜 License

**MIT License** – Free to use, adapt, and distribute.  
Open hardware/software. Contributions welcome.

---

## 🧠 About

Clio2.0 is a personal side project focused on experimentation in embedded development, car telemetry, and real-world hardware/software integration.  
Designed to be **open, modular, and vehicle-independent**, it offers a great base for any advanced in-car system.

---

## 📬 Contact

- Instagram: [@mathisdlg](https://instagram.com/mathisdlg)
- Discord: `mathisdlg`
