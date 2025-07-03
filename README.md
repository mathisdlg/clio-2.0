# 🚗 Clio2.0 – Modular Embedded Driving System for OBD-II Vehicles

**Clio2.0** is an **open-source, modular embedded system** designed to enhance the driving experience—especially in motorsport or rally contexts—by combining real-time engine telemetry, GPS-based timing, dynamic LED feedback, media control, and touchscreen interaction.

> 💡 Originally developed for a Clio 2 Phase 2, Clio2.0 is **vehicle-agnostic** and works with any OBD-II compatible car.

---

## 🧩 Architecture Overview

| Component         | Role                                                                 |
|------------------|----------------------------------------------------------------------|
| **ESP32**         | OBD-II telemetry, driving mode control, LED shifting bar, GPS chrono/zones |
| **Raspberry Pi 4**| UI interface, GPS navigation, media playback, OTA updates, plugin host |
| **GPS Modules**   | GT-07 x2 (1 ESP32 for zones/chrono, 1 RPi for mapping/Waze)         |
| **WS2812 LEDs**   | Real-time engine RPM shift light                                     |
| **ESP32 OLED/LCD**| Displays turbo, RPM, temp, etc.                                      |
| **HDMI Touchscreen**| Main UI for map, audio, timers, alerts                          |
| **4x4 Keypad**    | Driving mode selection, point setting                                |
| **Audio Output**  | Via 3.5mm jack to stock head unit                                    |
| **ON/OFF Button** | Physically cuts power to ESP32                                       |

---

## ⚙️ Features

### 🎮 Driving Modes
- **Normal** – Telemetry & shifting LEDs
- **Race** – Chrono, GPS alerts, zone detection
- **Setup** – Zone config, PID testing, LED debug
- **Off** – Fully powered down

### 📡 OBD-II Telemetry
- UART-based OBD-II PID reading
- PIDs: RPM, boost pressure, coolant, speed, etc.
- Real-time LED feedback (shifting)
- Displayed on both ESP screen and Pi UI
- Structured via Command/Repository pattern for extensibility

### 🛰️ GPS Integration
- ESP32 handles timing between 2 points & geo-zones
- RPi handles map, Waze (via Waydroid), visualization
- Zones activated only in Race Mode
- Always-on map mode on RPi for orientation

### 🔄 OTA & Config
- OTA updates from Pi to ESP using `esptool`
- Persistent config via `LittleFS` (ESP) and YAML/JSON (RPi)
- Serial bi-directional communication ESP <--> RPi

### 🎵 Audio Control
- Audio output via RPi jack → car audio system
- Custom Python UI: player, equalizer, alerts
- Alerts triggered by zone entry, errors, timers

### 💻 Plugin System
#### ESP32
- Hook-based (C++)
- Handlers: `onOBDData()`, `onGPSUpdate()`, etc.

#### RPi
- Dynamic module loading in Python
- Hooks: `on_mode_change()`, `on_zone_enter()`, `on_obd_data()`
- Enables dashcam, mobile sync, performance logging, etc.

---

## 🛠️ Installation Plan

| Element       | Location                    |
|---------------|-----------------------------|
| ESP32         | Glovebox / hidden enclosure |
| RPi 4         | Behind/instead of radio     |
| LED Strip     | Around cluster / dashboard  |
| ESP Screen    | Driver zone / dashboard     |
| HDMI Display  | Central dash (mounted)      |
| Keypad        | Console or dash             |
| GPS           | Dashboard or windshield     |

---

## 🔮 Future Extensions

- Dashcam & rear camera
- Cloud sync + mobile app
- Voice commands
- IMU sensors
- Advanced diagnostics
- Route logger & performance analyzer

---

## 🧪 Dependencies

### ESP32
- `ESP32-Arduino`
- `OBD2UART`, `NeoPixel`, `TinyGPS++`, `LittleFS`

### Raspberry Pi (NixOS)
- Weston compositor
- Waydroid (Android for Waze)
- Python 3.x, `PySerial`, `PyGame`, `PyQt` or `Tkinter`
- OTA Tools (`esptool`)
- Dynamic plugin loader

---

## 📜 License

MIT License – free to use, modify, and distribute.  
Community contributions welcome!

---

## 🧠 About

Clio2.0 is an educational and experimental embedded platform designed for vehicle telemetry, navigation, and driver assistance.  
Built to be **portable, scalable, and modular**—a base for any custom in-car system project.

---

## 📬 Contact

- Instagram: [@mathisdlg](https://instagram.com/mathisdlg)
- Discord: `mathisdlg`
