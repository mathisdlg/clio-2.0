# 🚗 Clio2.0 – Intelligent and Modular Embedded System for OBD-II Vehicles

**Clio2.0** is an **open hardware/software embedded platform** designed to enhance the driving experience, particularly for motorsport or rally use.  
Based on an **ESP32 + Raspberry Pi 4** architecture, it offers features such as **engine telemetry**, **GPS visualization**, **timing system**, **dynamic LED display**, **audio playback**, and a **touchscreen user interface**.

> 🔧 Originally developed for a Clio 2 Phase 2, the system is **fully generic and adaptable** to any vehicle equipped with an OBD-II port.

---

## 🧩 Hardware Architecture

| Component        | Main Role |
|------------------|-----------|
| ESP32            | OBD telemetry, shifting LEDs, GPS zones, engine data display |
| Raspberry Pi 4   | UI, GPS map, audio, ESP communication, Waydroid/Waze |
| GPS GT-07 (x2)   | 1 for ESP (zones & timing), 1 for RPi (map/navigation) |
| WS2812 LEDs      | Shifting LEDs (RPM indicator) |
| ESP32 Display    | Turbo pressure, temp, speed, and PID visualization |
| HDMI Touchscreen | Main interface (map, music, timing, alerts) |
| 4×4 Keypad       | Mode selection and GPS zone registration |
| Car Radio        | Audio output via Raspberry Pi's jack |
| ON/OFF Button    | Physical ESP32 power cut-off |

---

## ⚙️ Features

### 🎮 Driving Modes (controlled by ESP32)
- **Normal**: Engine data, LEDs, static map
- **Race**: GPS timer, zone alerts, dynamic display
- **Setup**: Zone/PID configuration, LED test
- **OFF**: System shutdown via hardware switch

### 📡 Telemetry & Engine Data
- OBD data via UART (RPM, turbo, speed, etc.)
- Displayed on ESP32 screen + WS2812 LEDs
- Modular OBD command system (Command/Repository pattern)

### 🛰️ GPS System (GT-07 modules)
- Timing between GPS waypoints
- Auto zone entry detection
- GPS map on RPi + Waze via Waydroid container
- Two independent modules (ESP & RPi)

### 🎧 Audio & UI
- Python GUI (Tkinter or PyQt/PyGame)
- Built-in equalizer and music player
- Audio via 3.5mm jack to car stereo
- Sound alerts (zones, engine errors, timer)

### 🔄 OTA & Config Management
- OTA updates for ESP32 via RPi
- Persistent zone/config storage using LittleFS
- Serial communication between ESP32 ↔ RPi

---

## 🔌 Software Stack

### ESP32
- `ESP32-Arduino`
- `OBD2UART`, `NeoPixel`, `TinyGPS++`, `LittleFS`, `SerialCommand`

### Raspberry Pi (NixOS)
- Weston (Wayland compositor)
- Waydroid (Android container for Waze)
- Python 3.x + GUI libs (Tkinter / PyQt / PyGame)
- Serial communication (PySerial)
- OTA tools (`esptool`, etc.)

---

## 🛠️ Installation & Physical Integration

### Overview
- **ESP32**: glovebox or central console
- **RPi**: behind or in place of the car radio
- **LEDs**: around the dashboard cluster
- **ESP screen**: driver's side display
- **Keypad**: dashboard or center console
- **Touchscreen**: integrated or mounted to dashboard
- **GPS Modules**: dashboard or windshield mount

---

## 🧪 Future Extensions

- Dashcam / rear-view camera integration
- Companion mobile app
- Cloud sync (logs, performance tracking)
- IMU integration (accelerometer, gyroscope)
- Advanced engine diagnostics
- Trip logging and post-race analysis

---

## 📜 License

Open-source project under the MIT License.  
Forks, contributions, and community feedback are welcome.

---

## 🧠 Author Notes

> Clio2.0 is a personal project built for learning, embedded experimentation, and enhanced driving performance.  
> Designed to be **portable, extensible, and maintainable**, it serves as a solid foundation for broader automotive electronics projects.

---

## 💬 Contact

For questions or contributions:  
- **Instagram**: @mathisdlg  
- **Discord**: mathisdlg
