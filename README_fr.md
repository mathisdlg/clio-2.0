# 🚗 Clio2.0 – Système embarqué modulaire pour véhicules OBD-II

**Clio2.0** est une plateforme **open source, modulaire** visant à enrichir l’expérience de conduite, notamment en contexte sportif ou rallye. Elle combine télémétrie moteur en temps réel, chronométrage GPS, retour lumineux dynamique, contrôle audio et interface tactile.

> 💡 Initialement développée pour une Clio 2 Phase 2, Clio2.0 est **générique** et compatible avec tout véhicule équipé d’une prise OBD-II.

---

## 🧩 Architecture matérielle

| Composant        | Rôle principal                                                   |
|------------------|------------------------------------------------------------------|
| **ESP32**         | Télémétrie OBD-II, LEDs RPM, gestion des modes, GPS course      |
| **Raspberry Pi 4**| Interface graphique, navigation, audio, OTA, système de plugins |
| **Modules GPS GT-07** | 1 pour l’ESP (zones/chrono), 1 pour le RPi (carte/Waze)     |
| **LED WS2812**    | Affichage dynamique du régime moteur                            |
| **Écran ESP**     | Turbo, RPM, température, etc.                                   |
| **Écran tactile HDMI** | Interface principale (carte, audio, chrono, alertes)      |
| **Clavier 4×4**   | Sélection des modes, enregistrement de points                   |
| **Sortie audio**  | Jack 3.5mm → autoradio d’origine                                |
| **Bouton ON/OFF** | Coupe physique de l’ESP32                                       |

---

## ⚙️ Fonctionnalités

### 🎮 Modes de conduite
- **Normal** – Télémétrie, LEDs, carte basique
- **Course** – Chrono, zones GPS, alertes
- **Setup** – Configuration zones, tests PIDs, LEDs
- **OFF** – Système éteint

### 📡 Télémétrie OBD-II
- Lecture UART de données moteur (PIDs)
- Ex : RPM, pression turbo, température, vitesse
- LEDs dynamiques
- Affichage sur écran ESP et Pi
- Extensible avec un pattern Command/Repository

### 🛰️ GPS
- ESP : zones géographiques, chrono entre 2 points
- RPi : carte temps réel + Waze via Waydroid
- Zones actives uniquement en mode Course
- Carte toujours visible sur RPi

### 🔄 OTA & Config
- MAJ OTA de l’ESP via `esptool` depuis le RPi
- Fichiers persistants : `LittleFS` (ESP), YAML/JSON (RPi)
- Communication série bidirectionnelle

### 🎧 Audio & Interface
- Interface en Python (Tkinter / PyQt / PyGame)
- Contrôle musique, égaliseur, alertes
- Sortie via jack vers autoradio d’origine

### 🧩 Système de plugins
#### ESP32
- Hooks statiques en C++
- Exemples : `onOBDData()`, `onGPSUpdate()`

#### RPi
- Chargement dynamique de modules Python
- Hooks : `on_mode_change()`, `on_zone_enter()`, etc.
- Extensible : dashcam, synchronisation mobile, logs, etc.

---

## 🛠️ Intégration physique

| Élément       | Emplacement suggéré             |
|---------------|----------------------------------|
| ESP32         | Boîte à gants / console          |
| RPi 4         | Derrière ou à la place de l’autoradio |
| LEDs          | Autour du compteur ou tableau de bord |
| Écran ESP     | Zone conducteur                  |
| Écran HDMI    | Support central ou intégré       |
| Clavier       | Console centrale / tableau       |
| GPS Modules   | Pare-brise ou planche de bord    |

---

## 🔮 Extensions prévues

- Dashcam / caméra de recul
- Appli mobile de contrôle
- Synchronisation cloud
- Commandes vocales
- Capteurs IMU (accéléro, gyro)
- Diagnostic avancé
- Analyseur de performance

---

## 🧪 Dépendances

### ESP32
- `ESP32-Arduino`
- `OBD2UART`, `NeoPixel`, `TinyGPS++`, `LittleFS`

### RPi (NixOS)
- Weston + Wayland
- Waydroid (Android → Waze)
- Python 3.x + PySerial, PyQt, Tkinter
- Outils OTA (`esptool`)
- Chargeur de plugins Python

---

## 📜 Licence

Licence MIT – libre d’usage, de modification et de distribution.  
Contributions bienvenues !

---

## 🧠 À propos

Clio2.0 est un projet personnel pour l’apprentissage, l’expérimentation électronique et la performance embarquée.  
Il a été pensé pour être **portable, extensible, maintenable**, et adaptable à n’importe quel véhicule OBD-II.

---

## 📬 Contact

- Instagram : [@mathisdlg](https://instagram.com/mathisdlg)
- Discord : `mathisdlg`
