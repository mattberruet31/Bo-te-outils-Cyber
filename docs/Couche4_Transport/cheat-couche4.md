# 8. `docs/Couche4_Transport/cheat-couche4.md`

```markdown
# Couche 4 (Transport) – Hydra

**Attaque ciblée** : Bruteforce de mots de passe

---

## Sommaire

1. [Introduction](#introduction)
2. [Installation & Pré-requis](#installation--pré-requis)
3. [Commandes Clés](#commandes-clés)
4. [Modes d’Attaque](#modes-dattaque)
5. [Conseils & Contre-mesures](#conseils--contre-mesures)
6. [Références & Ressources](#références--ressources)

---

## Introduction

**Hydra** est un outil de brute force supportant de nombreux protocoles :
- SSH, FTP, HTTP(S), SMB, RDP, Telnet, etc.
- Peut utiliser des dictionnaires (wordlists) ou des méthodes de force brute.

---

## Installation & Pré-requis

- Sur Debian/Ubuntu :
  ```bash
  sudo apt install hydra
  ```
- Avoir une liste de mots de passe (ex: `rockyou.txt`).

---

## Commandes Clés

### 1) Bruteforce SSH
```bash
hydra -l admin -P passlist.txt ssh://192.168.1.1
```
- `-l admin` : login (unique).  
- `-P passlist.txt` : fichier de mots de passe.

### 2) Bruteforce FTP avec threads
```bash
hydra -L users.txt -P passwords.txt -t 64 ftp://192.168.1.1
```
- `-L` : liste de logins.  
- `-P` : liste de passwords.  
- `-t 64` : 64 threads simultanés.

### 3) Bruteforce HTTP POST (formulaire)
```bash
hydra -l user -P rockyou.txt 192.168.1.1 http-post-form \
"/login.php:user=^USER^&pass=^PASS^:Invalid"
```
- `http-post-form` : protocole HTTP POST customisé.
- `Invalid` : le mot repéré indiquant un échec de connexion.

---

## Modes d’Attaque

- **Dictionnaire** : Test des combinaisons user/pass à partir de wordlists.  
- **Brute Force Pur** : Génération de combinaisons de caractères (très long).  
- **Hybrid** : Combinaison de mots de passe + modifications (suffixes, majuscules…).

---

## Conseils & Contre-mesures

- **Conseils pour l’attaquant** :  
  - Limiter la vitesse d’attaque pour éviter d’être bloqué par un IDS.  
  - Utiliser des listes de mots de passe pertinentes pour gagner du temps.

- **Contre-mesures** :  
  - Activer la limitation de tentatives (ex: Fail2Ban).  
  - Utiliser des mots de passe robustes, 2FA, etc.

---

## Références & Ressources

- [THC Hydra GitHub](https://github.com/vanhauser-thc/thc-hydra)  
- [Wordlists (SecLists)](https://github.com/danielmiessler/SecLists)  
- [Brute Force & Rainbow Tables – OWASP](https://owasp.org/www-community/attacks/Brute_Force_Attack)