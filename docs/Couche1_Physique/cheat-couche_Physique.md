### 1. Fichier Markdown finalisé  
**Chemin :** `docs/Couche1_Physique/cheat-couche_Physique.md`

```markdown
# Couche 1 (Physique) – Attaques et Outils

**Version Testée :**
- HackRF One v1.2
- RTL-SDR

**Description :**  
Ce document recense les outils et attaques disponibles pour la couche physique du modèle OSI. Il présente les outils de pentesting associés à cette couche, ainsi que les attaques potentielles et les commandes clés à exécuter pour chaque attaque.  
Le script automatisé analysera ce fichier pour :
- Lister les outils disponibles (sections marquées par **"### Outil:"**),
- Afficher, pour chaque outil, les attaques possibles (sections marquées par **"#### Attaque:"**),
- Proposer les commandes associées pour chaque attaque (commandes présentées dans des blocs de code sous **"###### Commande:"**).

Vous pourrez enrichir ce fichier ultérieurement sans modifier le script.

---

### Outil: HackRF
**Description :**  
HackRF est un émetteur-récepteur SDR polyvalent, capable de générer, scanner et analyser des signaux radio de 1 MHz à 6 GHz.

#### Attaque: Brouillage électromagnétique (EM Flood)
*Détails de l'attaque :*  
Saturer une bande de fréquence en émettant un signal bruité pour perturber les communications.

##### Commandes Clés
###### Commande: Scanner les fréquences
```bash
hackrf_sweep -f 2400:2500 -w 1000000 -l 32 -g 32
```
Détails :
- Plage de fréquences : 2400–2500 MHz.
- Largeur de bande : 1 MHz.
- Réglages de gain RX : 32.

###### Commande: Générer un signal de brouillage
```bash
hackrf_transfer -t noise.bin -f 2400000000 -s 20000000 -x 47
```
Détails :
- Fichier de bruit : noise.bin.
- Fréquence cible : 2.4 GHz.
- Taux d’échantillonnage : 20 MHz.
- Gain TX : 47.

###### Commande: Enregistrer un signal
```bash
hackrf_transfer -r capture.raw -f 2400000000 -s 20000000 -l 32 -g 32
```
Détails :
- Fichier de capture : capture.raw.
- Réglages de gain RX : 32.

#### Attaque: Sniffing radio
*Détails de l'attaque :*  
Capturer et analyser les signaux radio pour réaliser du reverse engineering ou identifier des transmissions spécifiques.

##### Commandes Clés
###### Commande: Capturer une fréquence spécifique
```bash
hackrf_transfer -r capture_sniff.raw -f 2450000000 -s 20000000 -l 32 -g 32
```
Détails :
- Capture sur 2.45 GHz.

---

### Outil: RTL-SDR
**Description :**  
RTL-SDR est un récepteur radio abordable utilisé pour la réception passive des signaux radio et l’analyse spectrale.

#### Attaque: Surveillance des signaux
*Détails de l'attaque :*  
Surveiller une plage de fréquences pour détecter des transmissions ou des activités suspectes.

##### Commandes Clés
###### Commande: Lancer rtl_power pour surveiller une plage
```bash
rtl_power -f 100e6:200e6:1e6 -g 50 output.csv
```
Détails :
- Plage : 100–200 MHz avec incréments de 1 MHz.
- Gain : 50.
- Sortie : fichier CSV.

#### Attaque: Capture de signal
*Détails de l'attaque :*  
Capturer et enregistrer des signaux radio pour une analyse ultérieure.

##### Commandes Clés
###### Commande: Enregistrer un signal avec rtl_fm
```bash
rtl_fm -f 101.1e6 -s 22050 - | aplay -r 22050 -f S16_LE
```
Détails :
- Capture sur 101.1 MHz.

---

## Précautions Légales & Disclaimer
**Attention :**  
L’utilisation de ces outils et commandes doit être réalisée dans un cadre légal et exclusivement en environnement de test. Toute utilisation malveillante est strictement interdite.

---

## Références & Ressources
- [HackRF Officiel GitHub](https://github.com/mossmann/hackrf)
- [RTL-SDR Blog](https://www.rtl-sdr.com/)
- [GNU Radio](https://www.gnuradio.org/)
```
