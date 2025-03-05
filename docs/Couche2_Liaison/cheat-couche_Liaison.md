**Chemin :**  
`docs/Couche2_Liaison/cheat-couche_Liaison.md`

```markdown
# Couche 2 (Liaison) – Attaques et Outils

**Version Testée :**
- Ettercap 0.8.x
- Bettercap 2.x
- Arpspoof (dsniff)
- Cain and Abel (Windows)

**Description :**  
Ce document recense les outils et attaques disponibles pour la couche liaison du modèle OSI. La couche 2 gère le contrôle d’accès au média et la transmission des trames sur le réseau local.  
Des attaques typiques incluent le spoofing ARP, le MITM (Man-In-The-Middle) et la modification ou l’injection de paquets.  
Le script automatisé analysera ce fichier pour :
- Lister les outils disponibles (sections marquées par **"### Outil:"**),
- Afficher, pour chaque outil, les attaques possibles (sections marquées par **"#### Attaque:"**),
- Proposer les commandes associées pour chaque attaque (commandes présentées dans des blocs de code sous **"###### Commande:"**).

Vous pourrez enrichir ce fichier ultérieurement sans modifier le script.

---

### Outil: Ettercap
**Description :**  
Ettercap est un outil puissant pour l'interception de trafic et l'exécution d'attaques MITM par ARP spoofing. Il permet de capturer, modifier et injecter du trafic réseau en temps réel.

#### Attaque: ARP Spoofing / MITM
*Détails de l'attaque :*  
Positionner l'attaquant entre la victime et la passerelle pour intercepter le trafic réseau.
##### Commandes Clés
**Commande: Lancer Ettercap en mode texte**
```bash
ettercap -T
```
Détails :
- Utilisation en mode texte pour l'interception.
  
**Commande: ARP Spoofing ciblé**
```bash
ettercap -T -M arp:remote /192.168.1.1// /192.168.1.2//
```
Détails :
- Cibler la passerelle (192.168.1.1) et la victime (192.168.1.2).
  
**Commande: Sniffer et logger**
```bash
ettercap -T -M arp -i eth0 -L logfile
```
Détails :
- Enregistrer le trafic sur l'interface eth0.

#### Attaque: Injection de paquets HTTP
*Détails de l'attaque :*  
Modifier en temps réel le trafic HTTP non chiffré pour injecter du code malveillant.
##### Commandes Clés
**Commande: Injection de scripts HTTP**
```bash
ettercap -T -M arp:remote -i eth0 -F filter.ec
```
Détails :
- Utilise un fichier de filtre (filter.ec) pour modifier le trafic HTTP.

---

### Outil: Bettercap
**Description :**  
Bettercap est un framework moderne de MITM et d'analyse réseau, offrant une interface web et des modules extensibles pour diverses attaques sur le réseau local.

#### Attaque: ARP Spoofing avancé
*Détails de l'attaque :*  
Manipuler les tables ARP pour rediriger le trafic d'une victime vers l'attaquant.
##### Commandes Clés
**Commande: Lancer Bettercap en mode interactif**
```bash
bettercap -I eth0
```
Détails :
- Utilisation de l'interface eth0.
  
**Commande: Exécuter un caplet ARP spoofing**
```bash
caplets/arp.spoof
```
Détails :
- Utiliser le caplet arp.spoof pour lancer l'attaque.
  
#### Attaque: Sniffing de paquets
*Détails de l'attaque :*  
Capturer et analyser le trafic réseau pour détecter des vulnérabilités ou informations sensibles.
##### Commandes Clés
**Commande: Capture de paquets en temps réel**
```bash
bettercap -X -I eth0
```
Détails :
- Option -X pour l'affichage en temps réel des paquets.

---

### Outil: Arpspoof (dsniff)
**Description :**  
Arpspoof, issu du paquet dsniff, est un outil simple pour effectuer du spoofing ARP et détourner le trafic dans un LAN.

#### Attaque: Détournement ARP simple
*Détails de l'attaque :*  
Rediriger le trafic réseau d'une cible en falsifiant les réponses ARP.
##### Commandes Clés
**Commande: Spoofing vers la cible**
```bash
arpspoof -i eth0 -t 192.168.1.2 192.168.1.1
```
Détails :
- Cible : 192.168.1.2, passerelle : 192.168.1.1.
  
**Commande: Spoofing vers la passerelle**
```bash
arpspoof -i eth0 -t 192.168.1.1 192.168.1.2
```
Détails :
- Inverse la cible pour rediriger le trafic dans les deux sens.

---

### Outil: Cain and Abel
**Description :**  
Cain and Abel est un outil de récupération de mots de passe pour Windows, qui inclut des fonctionnalités de spoofing ARP et de capture de trafic. (Note : Outil Windows, interface graphique)

#### Attaque: ARP Spoofing et capture d'identifiants
*Détails de l'attaque :*  
Utiliser Cain and Abel pour réaliser du spoofing ARP et récupérer des informations sensibles via l'interface graphique.
##### Commandes Clés
**Commande: Lancer Cain and Abel**
```bash
# Démarrer Cain and Abel via l'interface Windows
```
Détails :
- Utiliser l'interface graphique pour lancer l'attaque.
  
**Commande: Configurer l'ARP spoofing pour la capture d'identifiants**
```bash
# Configurer Cain and Abel pour l'ARP spoofing et la capture des mots de passe
```
Détails :
- Suivre les instructions à l'écran pour intercepter le trafic.

---

## Précautions Légales & Disclaimer
**Attention :**  
L’utilisation de ces outils et commandes doit être réalisée dans un cadre légal et exclusivement en environnement de test. Toute utilisation malveillante est strictement interdite.

---

## Références & Ressources
- [Ettercap Officiel](https://www.ettercap-project.org/)
- [Bettercap Documentation](https://www.bettercap.org/)
- [dsniff et Arpspoof](https://www.monkey.org/~dugsong/dsniff/)
- [Cain and Abel (Wikipedia)](https://en.wikipedia.org/wiki/Cain_%26_Abel)
```