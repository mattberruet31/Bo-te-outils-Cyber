# 1. `docs/Couche1_Physique/README.md`

```markdown
# Couche 1 (Physique)

Ici, vous trouverez la description des attaques et outils liés à la couche physique du modèle OSI (ex: brouillage RF, interception de signaux radio, etc.).

- [cheat-couche1.md](./cheat-couche1.md) : Présentation détaillée de HackRF (scanning, émission, brouillage...).
```

---

# 2. `docs/Couche1_Physique/cheat-couche1.md`

```markdown
# Couche 1 (Physique) – HackRF

Ce document décrit l’utilisation de **HackRF**, un émetteur-récepteur SDR (Software Defined Radio) polyvalent, pour réaliser des attaques ou expérimentations sur la couche physique (ex : brouillage RF, sniffing sur certaines fréquences, etc.).

---

## Sommaire

1. [Introduction](#introduction)
2. [Installation & Pré-requis](#installation--pré-requis)
3. [Commandes Clés](#commandes-clés)
4. [Exemples d’Utilisation](#exemples-dutilisation)
5. [Précautions Légales](#précautions-légales)
6. [Références & Ressources](#références--ressources)

---

## Introduction

- **Attaque Principale** : Brouillage électromagnétique (EM Flood)  
- **Description** : HackRF permet de générer et d'enregistrer des signaux radio sur une large bande de fréquences (environ 1 MHz à 6 GHz). Cela peut servir à :
  - Scanner des fréquences (Wi-Fi, Bluetooth, GSM…).
  - Émettre un signal continu ou modulé pour perturber une communication.
  - Enregistrer et analyser des signaux pour du *Reverse Engineering* radio.

---

## Installation & Pré-requis

1. **Matériel** : Un HackRF One (ou équivalent).
2. **Pilotes / Librairies** :  
   - Sur Linux, installez `hackrf` et `hackrf-tools` (selon votre distribution).
   - Assurez-vous que `libusb` est installée et à jour.
3. **Droits d’accès** : Généralement, il faut être en **root** ou avoir configuré les règles `udev` pour accéder au matériel.

Exemple d’installation (Debian/Ubuntu) :

```bash
sudo apt update
sudo apt install hackrf
```

---

## Commandes Clés

### 1. Scanner les fréquences
```bash
hackrf_sweep -f 2400:2500 -w 1000000 -l 32 -g 32
```
- `-f 2400:2500` : plage de fréquences (MHz) à scanner.  
- `-w 1000000`   : largeur de bande (1 MHz).  
- `-l 32` et `-g 32` : réglages de gain (RX).

### 2. Générer un signal de brouillage sur 2.4 GHz (Wi-Fi)
```bash
hackrf_transfer -t noise.bin -f 2400000000 -s 20000000 -x 47
```
- `-t noise.bin` : fichier binaire contenant du « bruit » ou une porteuse.  
- `-f 2400000000` : fréquence cible (2.4 GHz).  
- `-s 20000000`   : taux d’échantillonnage (20 MHz).  
- `-x 47`         : gain TX maximal (47 dB).

### 3. Enregistrer un signal
```bash
hackrf_transfer -r capture.raw -f 2400000000 -s 20000000 -l 32 -g 32
```
- `-r capture.raw` : fichier où sera enregistré le flux IQ.  
- `-l 32` et `-g 32` : gains (RX).

---

## Exemples d’Utilisation

- **Wi-Fi Jamming (2.4 GHz)** :  
  1) Créer un fichier `noise.bin` (un signal ou bruit blanc) via des scripts ou en extrayant du bruit d’une capture antérieure.  
  2) Émettre sur 2.4 GHz avec un gain élevé pour saturer le canal choisi.

- **Bluetooth Sniffing** :  
  - Utiliser `hackrf_sweep` pour localiser les canaux Bluetooth, puis enregistrer à la fréquence correspondante pour analyse hors-ligne.

> **Attention :** Le brouillage radio est strictement encadré par la loi. Seules des expérimentations en laboratoire, dans une cage de Faraday ou sous autorisation explicite, sont permises.

---

## Précautions Légales

- Vérifiez la réglementation de votre pays. Émettre sur des bandes licenciées (GSM, LTE, TV, etc.) ou brouiller des services (Wi-Fi, Bluetooth) est **généralement illégal** sans autorisation.
- Toujours réaliser ces tests dans un environnement **isolé** ou sur une plage de fréquences attribuée à la recherche.

---

## Références & Ressources

- **Projet Officiel HackRF** : [https://github.com/mossmann/hackrf](https://github.com/mossmann/hackrf)  
- **Documentation HackRF** : [https://hackrf.readthedocs.io/en/latest/](https://hackrf.readthedocs.io/en/latest/)  
- **GNU Radio** : [https://www.gnuradio.org/](https://www.gnuradio.org/)  
- **Laws & Regulations** : Consultez l’ANFR (France) ou l’organisme équivalent dans votre pays.