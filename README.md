# 🚗 Clio2.0 – Système embarqué intelligent et modulaire pour véhicules OBD-II

Clio2.0 est une plateforme embarquée **open hardware/software** conçue pour améliorer l’expérience de conduite, notamment dans un cadre de conduite sportive ou rallye.  
Basée sur une architecture **ESP32 + Raspberry Pi 4**, elle propose des fonctionnalités de **télémétrie moteur**, **visualisation GPS**, **chronométrage**, **affichage LED dynamique**, **musique**, et **interface utilisateur tactile**.

> 🔧 Bien que développé pour une Clio 2 Phase 2, le système est **générique et adaptable** à tout véhicule équipé d'une prise OBD-II.

---

## 🧩 Architecture matérielle

| Élément        | Rôle principal |
|----------------|----------------|
| ESP32          | Télémetrie OBD, shifting LEDs, zones GPS, affichage données moteur |
| Raspberry Pi 4 | Interface graphique, GPS, audio, communication ESP, Waydroid/Waze |
| GPS GT-07 (x2) | 1 pour ESP (zones & chrono), 1 pour RPi (carte & navigation) |
| LEDs WS2812    | Shifting LEDs (régime moteur) |
| Écran ESP32    | Affichage turbo, température, vitesse, PID |
| Écran HDMI Tactile | Interface principale (carte, audio, chrono, alertes) |
| Clavier 4×4    | Sélection modes et enregistrement zones |
| Autoradio      | Audio via jack du Raspberry |
| Bouton ON/OFF  | Coupe physique l’alimentation ESP32 |

---

## ⚙️ Fonctionnalités

### 🎮 Modes de conduite (contrôlés par l’ESP32)
- **Normal** : Affichage moteur, LEDs, carte simple
- **Course** : Chrono GPS, alertes zones, carte dynamique
- **Setup** : Configuration des zones, PIDs, test LEDs
- **OFF** : Système éteint via bouton physique

### 📡 Télémetrie & données
- Lecture OBD via UART (RPM, turbo, vitesse, etc.)
- Affichage sur écran ESP + shifting LEDs WS2812
- Répertoire de commandes OBD extensible (pattern Command/Repository)

### 🛰️ Système GPS (GT-07)
- Chronométrage entre deux points
- Détection d’entrée dans zones de course
- Carte GPS sur RPi + Waze via Waydroid
- Deux modules indépendants (ESP / RPi)

### 🎧 Audio & interface
- Interface en Python (Tkinter ou PyQt/PyGame)
- Égaliseur et gestion musicale
- Sortie audio via jack vers autoradio
- Alertes sonores pour chrono / zones / erreurs moteur

### 🔄 OTA et configuration
- Mises à jour OTA de l’ESP32 via Raspberry Pi
- LittleFS sur ESP pour zones & config persistante
- Commande série bidirectionnelle entre RPi ↔ ESP32

---

## 🔌 Dépendances logicielles

### ESP32
- `ESP32-Arduino`
- `OBD2UART`, `NeoPixel`, `TinyGPS++`, `LittleFS`, `SerialCommand`

### Raspberry Pi (NixOS)
- Weston (Wayland Compositor)
- Waydroid (Android container pour Waze)
- Python 3.x + dépendances UI (Tkinter / PyQt / PyGame)
- Communication série (PySerial)
- Outils OTA (esptool)

---

## 🛠️ Installation & Intégration

### Intégration physique (résumé)
- ESP32 : boîte à gants ou console
- RPi : derrière ou à la place de l’autoradio
- LEDs : autour du compteur
- Écran ESP : zone conducteur
- Clavier : tableau de bord ou console centrale
- Écran tactile : tableau de bord (support ou intégré)
- GPS GT-07 : sur planche de bord ou pare-brise

---

## 🧪 Extensions prévues

- Dashcam / caméra arrière
- Application mobile compagnon
- Cloud sync (logs, statistiques)
- IMU (accéléromètre, gyroscope)
- Diagnostic étendu moteur
- Enregistrement de trajets et analyse de performances

---

## 📜 Licence

Projet open-source sous licence MIT.  
Contributions, forks et adaptations bienvenus.

---

## 🧠 Auteurs

> Clio2.0 est un projet personnel développé pour l’apprentissage, l’expérimentation embarquée et la performance en conduite.  
> Pensé pour être **portatif, extensible et maintenable**, il peut servir de base à tout projet de customisation automobile électronique.

---

## 📸 Captures et schémas

- 📷 Schéma d’architecture matériel : `/docs/schematics.png`
- 🗺️ Plan d’intégration tableau de bord : `/docs/integration_dashboard.png`
- 🧠 Diagrammes des flux de données : `à venir`

---

## 💬 Contact

Pour toute question ou retour : [à compléter avec ton adresse GitHub ou email]

