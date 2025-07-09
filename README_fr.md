# 🚗 Clio2.0 – Système Embarqué Modulaire pour Véhicules OBD-II

**Clio2.0** est une **plateforme embarquée open-source, modulaire et extensible** conçue pour améliorer l’expérience de conduite, notamment en contexte sportif ou de rallye. Elle combine télémétrie moteur en temps réel, chronométrage GPS, affichage LED dynamique, navigation, contrôle audio et interface tactile.

> 💡 Développé initialement pour une Clio 2 Phase 2, le système est **compatible avec tout véhicule OBD-II**.

---

## 🧩 Vue d'ensemble de l'architecture

| Composant             | Rôle principal                                                         |
|-----------------------|------------------------------------------------------------------------|
| **ESP32**             | Télémetrie OBD-II, LEDs de shift, GPS (zones et chrono), gestion des modes |
| **Raspberry Pi 4**    | Interface tactile, navigation GPS, gestion audio, OTA, système de plugins |
| **Modules GPS GT-07** | 1 pour ESP32 (zones/chrono), 1 pour le RPi (navigation/Waze)            |
| **LEDs WS2812**       | Affichage du régime moteur (barre de shift dynamique)                   |
| **Écran ESP32**       | Affiche turbo, vitesse, température, RPM, etc.                          |
| **Écran HDMI tactile**| Interface principale : carte, chrono, musique, alertes                  |
| **Clavier 4×4**       | Contrôle des modes, enregistrement des zones GPS                        |
| **Sortie audio jack** | Connexion à l’autoradio du véhicule                                     |
| **Bouton ON/OFF**     | Interrupteur physique pour l’ESP32                                      |

---

## ⚙️ Fonctionnalités

### 🎮 Modes de conduite (gérés par l’ESP32)
- **Normal** – Affichage télémétrie, LEDs RPM, carte simple
- **Course** – Chronométrage GPS, alertes zones, superpositions dynamiques
- **Setup** – Configuration des zones, test LEDs, vérification des PIDs
- **Off** – Extinction complète via bouton physique

### 📡 Télémétrie OBD-II (ESP32)
- Lecture des PIDs via UART : RPM, boost, température, vitesse, etc.
- Affichage sur écran ESP et synchronisé avec le RPi
- LEDs WS2812 liées dynamiquement au régime moteur
- Architecture extensible via pattern Command/Repository
- Bibliothèque OBD personnalisée (multi-protocoles)

### 🛰️ Intégration GPS
- **ESP32**
  - Gestion du chrono entre deux points
  - Détection d’entrée dans les zones de course
- **Raspberry Pi**
  - Affichage de la carte via GT-07
  - Intégration de Waze via Waydroid (conteneur Android)
  - Carte toujours active, zones visibles seulement en mode Course

### 🔄 Mise à jour & communication
- Mises à jour OTA de l’ESP32 via `esptool` depuis le RPi
- Configurations persistantes via `LittleFS` (ESP) et YAML/JSON (RPi)
- Communication série bidirectionnelle ESP ↔ RPi :
  - Données OBD
  - Modes de conduite
  - Événements GPS
  - Alertes système

### 🎵 Système Audio (via le Raspberry Pi)
- Sortie audio via jack vers autoradio (AUX)
- Interface en Python avec lecteur, égaliseur, alertes
- Alertes audio pour chrono, zones, erreurs moteur

---

## 💻 Système de Plugins

### 🧩 ESP32 (C++)
- Architecture basée sur hooks :
  - `onOBDData()`, `onGPSUpdate()`, `onModeChange()`
- Permet d’ajouter des fonctionnalités PID, logiques GPS, ou effets LED sans toucher au code principal

### 🧩 Raspberry Pi (Python)
- Système de plugins dynamiques via importlib
- Hooks disponibles :
  - `on_mode_change(mode)`
  - `on_zone_enter(zone_id)`
  - `on_obd_data(pid, value)`
- Permet :
  - Dashcam, journalisation, analyse de performance
  - Synchronisation mobile
  - Extensibilité UI ou alertes spécifiques

---

## 🛠️ Plan d'installation physique

| Élément         | Emplacement recommandé             |
|-----------------|-------------------------------------|
| ESP32           | Boîte à gants / zone masquée        |
| Raspberry Pi 4  | Derrière ou à la place de l’autoradio |
| LEDs WS2812     | Autour du tableau de bord           |
| Écran ESP32     | Zone conducteur                     |
| Écran tactile   | Intégré ou monté sur le tableau de bord |
| GPS modules     | Sur la planche de bord / pare-brise |
| Clavier 4×4     | Console centrale ou tableau de bord |

---

## 🔮 Extensions prévues

- Dashcam + caméra de recul
- Synchronisation cloud + application mobile
- Commandes vocales
- Capteurs IMU (accéléro, gyroscope)
- Diagnostics moteurs avancés
- Logger de trajets + analyse de performances

---

## 🧪 Dépendances

### ESP32
- Core `ESP32-Arduino`
- `TinyGPS++`, `OBD2UART` ou implémentation custom
- `NeoPixel`, `SerialCommand`, `LittleFS`

### Raspberry Pi (NixOS)
- Python 3.x : `PySerial`, `PyGame`, `Tkinter` ou `PyQt5`
- Weston (compositeur Wayland)
- Waydroid (Waze Android dans conteneur)
- `esptool.py` pour OTA
- Gestionnaire de plugins dynamiques Python

---

## 📜 Licence

Licence **MIT** – libre d'utilisation, modification et distribution.  
Contributions et forks bienvenus !

---

## 🧠 À propos

Clio2.0 est un projet personnel d’expérimentation embarquée, pensé pour être **modulaire, extensible, portable et évolutif**. Il sert de base à tout projet de customisation automobile intégrant télémétrie, navigation et aide à la conduite.

---

## 📬 Contact

- Instagram : [@mathisdlg](https://instagram.com/mathisdlg)
- Discord : `mathisdlg`
