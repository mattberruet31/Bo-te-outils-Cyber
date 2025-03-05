# 1. docs/Couche1_Physique/cheat-couche1.md
# Couche 1 (Physique) – HackRF
**Version Testée : HackRF One v1.2**  
**Attaque Principale : Brouillage électromagnétique (EM Flood)**

*Ce document est conçu pour des expérimentations en laboratoire. Des annotations spécifiques ont été ajoutées afin de permettre l’intégration automatique avec le script de génération de rapport.*

---

## Sommaire

1. [Introduction](#introduction)
2. [Installation & Pré-requis](#installation--pré-requis)
3. [Commandes Clés](#commandes-clés)
4. [Exemples d’Utilisation](#exemples-dutilisation)
5. [Intégration avec le Script](#intégration-avec-le-script)
6. [Précautions Légales & Disclaimer](#précautions-légales--disclaimer)
7. [Références & Ressources](#références--ressources)

---

## Introduction

HackRF est un émetteur-récepteur SDR permettant de générer, scanner et analyser une large gamme de signaux radio (de 1 MHz à 6 GHz).  
Ce cheat sheet présente des scénarios d’expérimentation sur la couche physique, tels que le brouillage RF et le sniffing.

---

## Installation & Pré-requis

- **Matériel :** HackRF One (ou équivalent).  
- **Dépendances :**  
  - Installer `hackrf` et `hackrf-tools`  
  - Vérifier que `libusb` est à jour.
- **Accès :** Généralement, l’exécution nécessite les droits **root** ou une configuration des règles `udev`.

**Exemple d’installation (Debian/Ubuntu) :**
```bash
sudo apt update
sudo apt install hackrf
________________________________________
Commandes Clés
1. Scanner les fréquences
hackrf_sweep -f 2400:2500 -w 1000000 -l 32 -g 32
Détails :
•	-f 2400:2500 : plage de fréquences en MHz.
•	-w 1000000 : largeur de bande (1 MHz).
•	-l 32 et -g 32 : réglages de gain RX.
2. Générer un signal de brouillage sur 2.4 GHz (Wi-Fi)
hackrf_transfer -t noise.bin -f 2400000000 -s 20000000 -x 47
Détails :
•	-t noise.bin : fichier binaire générant un signal bruité.
•	-f 2400000000 : fréquence cible (2.4 GHz).
•	-s 20000000 : taux d’échantillonnage (20 MHz).
•	-x 47 : gain TX maximal.
3. Enregistrer un signal
hackrf_transfer -r capture.raw -f 2400000000 -s 20000000 -l 32 -g 32
Détails :
•	-r capture.raw : nom du fichier de sauvegarde.
•	-l 32 et -g 32 : gains RX.
________________________________________
Exemples d’Utilisation
•	Wi-Fi Jamming : 
1.	Générer ou récupérer un fichier noise.bin (signal bruit blanc).
2.	Émettre sur la fréquence 2.4 GHz pour saturer le canal.
•	Bluetooth Sniffing : 
o	Identifier les canaux avec hackrf_sweep puis enregistrer une capture avec hackrf_transfer.
________________________________________
Intégration avec le Script
•	Annotations :
Chaque commande est clairement identifiée et commentée pour que le script puisse : 
o	Extraire la commande et ses paramètres.
o	Enregistrer l’exécution et les options choisies.
•	Rapport automatisé :
Le script analysera les logs pour générer un rapport détaillé (ex. : "attaque EM Flood sur 2.4 GHz").
________________________________________
Précautions Légales & Disclaimer
Attention : L’utilisation de HackRF pour générer ou intercepter des signaux radio est strictement réglementée.
Réalisez ces expérimentations uniquement dans un environnement de test contrôlé (laboratoire ou cage de Faraday) et avec les autorisations nécessaires.
Disclaimer : Ce document est fourni à des fins éducatives uniquement. Toute utilisation malveillante est interdite.
________________________________________
Références & Ressources
•	HackRF Officiel GitHub
•	Documentation HackRF
•	GNU Radio

---
