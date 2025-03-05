## 2. `docs/Couche2_Liaison/cheat-couche2.md`

```markdown
# Couche 2 (Liaison) – Ettercap
**Version Testée : Ettercap 0.8.x**  
**Attaque Ciblée : ARP Spoofing / MITM**

*Ce document détaille l’utilisation d’Ettercap pour mener des attaques de type ARP spoofing. Les annotations facilitent l’intégration avec le script automatisé pour la génération de rapports d’activité.*

---

## Sommaire

1. [Introduction](#introduction)
2. [Installation & Pré-requis](#installation--pré-requis)
3. [Commandes Clés](#commandes-clés)
4. [Scénarios Communs](#scénarios-communs)
5. [Contre-mesures](#contre-mesures)
6. [Intégration avec le Script](#intégration-avec-le-script)
7. [Références & Ressources](#références--ressources)

---

## Introduction

Ettercap est un outil d'interception (MITM) qui permet :
- Le sniffing et l’interception via ARP poisoning.
- La modification de paquets en transit.
- L’injection de scripts dans le trafic HTTP.

---

## Installation & Pré-requis

- **Installation sur Linux :**
```bash
sudo apt update
sudo apt install ettercap-graphical  # ou ettercap-text-only selon vos besoins
•	Configuration :
Une interface en mode promiscuité et les droits administrateur sont requis.
________________________________________
Commandes Clés
1. Lancer Ettercap en mode texte
ettercap -T
Option : -T active le mode texte.
2. ARP Spoofing ciblé
ettercap -T -M arp:remote /192.168.1.1// /192.168.1.2//
Détails :
•	-M arp:remote active l’ARP poisoning.
•	Les adresses IP indiquées correspondent à la passerelle et à la victime.
3. Sniffer et logger
ettercap -T -M arp -i eth0 -L logfile
Détails :
-L logfile permet d’enregistrer le log pour analyse postérieure.
________________________________________
Scénarios Communs
•	MITM sur un LAN :
Se positionner entre la passerelle et une victime pour intercepter et modifier les échanges.
•	Injection de scripts :
Modifier en temps réel les pages HTTP non chiffrées pour injecter du code.
________________________________________
Contre-mesures
•	Détection ARP Spoofing : Utilisation d’IDS/IPS ou d’outils dédiés.
•	Configuration des switches : Mise en place de port security.
•	Utilisation de protocoles chiffrés : HTTPS, SSH, etc.
________________________________________
Intégration avec le Script
•	Annotations :
Chaque commande est structurée pour que le script puisse : 
o	Identifier l’outil et la commande.
o	Enregistrer les paramètres utilisés pour le rapport final.
•	Log des actions :
Les interactions de l’utilisateur seront capturées pour un suivi détaillé.
________________________________________
Références & Ressources
•	Site Officiel Ettercap
•	GitHub Ettercap
•	ARP Spoofing – Wikipedia

---
