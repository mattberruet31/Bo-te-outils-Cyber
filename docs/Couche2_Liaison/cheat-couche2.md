# 4. `docs/Couche2_Liaison/cheat-couche2.md`

```markdown
# Couche 2 (Liaison) – Ettercap

**Attaque ciblée** : ARP Spoofing

---

## Sommaire

1. [Introduction](#introduction)
2. [Installation & Pré-requis](#installation--pré-requis)
3. [Commandes Clés](#commandes-clés)
4. [Scénarios Communs](#scénarios-communs)
5. [Contre-mesures](#contre-mesures)
6. [Références & Ressources](#références--ressources)

---

## Introduction

**Ettercap** est un outil permettant :
- Le *sniffing* sur un réseau local (ARP poisoning).
- L’interception et la modification de paquets en transit (MITM).
- Le filtrage / injection de scripts dans le trafic HTTP.

---

## Installation & Pré-requis

- **Linux** :  
  ```bash
  sudo apt update
  sudo apt install ettercap-graphical  # ou ettercap-text-only
  ```
- **Droits administrateur** : Souvent nécessaire pour configurer l’interface en mode promiscue.

---

## Commandes Clés

### 1) Lancer Ettercap en mode texte
```bash
ettercap -T
```
- `-T` : mode texte (Text mode).

### 2) ARP Spoofing ciblé
```bash
ettercap -T -M arp:remote /192.168.1.1// /192.168.1.2//
```
- `-M arp:remote` : active l’ARP poisoning.
- Les deux IP sont la passerelle et la victime.

### 3) Sniffer et logger
```bash
ettercap -T -M arp -i eth0 -L logfile
```
- `-L logfile` : enregistre dans un fichier log.

---

## Scénarios Communs

- **MITM sur un LAN** : Attaquant se positionne entre la passerelle et une victime, permettant :
  - Récupération de mots de passe en clair (HTTP, FTP…).
  - Déchiffrement potentiel de sessions mal protégées (SSLstrip, etc.).

- **Filtrage de paquets** : Ettercap peut injecter du code HTML/JS dans les pages non-HTTPS pour espionner ou altérer le contenu.

---

## Contre-mesures

- **Activation d’ARP Spoofing Detection** (sur les switches, certains IDS/IPS).  
- **Utilisation du protocole ARP sécurisé** (rarissime) ou du *port security*.  
- **Chiffrement** end-to-end (HTTPS, SSH) pour limiter l’impact d’un MITM.

---

## Références & Ressources

- [Site officiel Ettercap](https://www.ettercap-project.org/)  
- [GitHub Ettercap](https://github.com/Ettercap/ettercap)  
- [ARP Spoofing – Wikipedia](https://fr.wikipedia.org/wiki/ARP_spoofing)
