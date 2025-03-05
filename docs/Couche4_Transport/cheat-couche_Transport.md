## 4. `docs/Couche4_Transport/cheat-couche4.md`

```markdown
# Couche 4 (Transport) – Hydra
**Version Testée : THC Hydra 9.1**  
**Attaque Ciblée : Bruteforce de mots de passe**

*Ce document détaille l’utilisation de Hydra pour effectuer des attaques par force brute. Les annotations permettent au script de capturer l’historique des commandes pour générer un rapport final.*

---

## Sommaire

1. [Introduction](#introduction)
2. [Installation & Pré-requis](#installation--pré-requis)
3. [Commandes Clés](#commandes-clés)
4. [Modes d’Attaque](#modes-dattaque)
5. [Conseils & Contre-mesures](#conseils--contre-mesures)
6. [Intégration avec le Script](#intégration-avec-le-script)
7. [Références & Ressources](#références--ressources)

---

## Introduction

Hydra est un outil de brute force permettant de tester de nombreux protocoles (SSH, FTP, HTTP, etc.) en s’appuyant sur des listes de mots de passe ou des méthodes de force brute.

---

## Installation & Pré-requis

- **Sur Debian/Ubuntu :**
```bash
sudo apt install hydra
•	Pré-requis :
Disposer d’une wordlist (par exemple, rockyou.txt).
________________________________________
Commandes Clés
1. Bruteforce SSH
hydra -l admin -P passlist.txt ssh://192.168.1.1
Détails :
•	-l admin : login unique.
•	-P passlist.txt : fichier contenant les mots de passe.
2. Bruteforce FTP avec threads
hydra -L users.txt -P passwords.txt -t 64 ftp://192.168.1.1
Détails :
•	-L : liste de logins.
•	-P : liste de mots de passe.
•	-t 64 : nombre de threads simultanés.
3. Bruteforce HTTP POST (formulaire)
hydra -l user -P rockyou.txt 192.168.1.1 http-post-form "/login.php:user=^USER^&pass=^PASS^:Invalid"
Détails :
•	http-post-form indique l’utilisation d’un formulaire HTTP.
•	La chaîne Invalid est utilisée pour détecter un échec de connexion.
________________________________________
Modes d’Attaque
•	Dictionnaire : Utilisation de wordlists prédéfinies.
•	Brute Force Pur : Tentative de toutes les combinaisons possibles (peut être long).
•	Hybrid : Combinaison de dictionnaire avec modifications (ajouts de suffixes, majuscules, etc.).
________________________________________
Conseils & Contre-mesures
•	Pour l’attaquant : 
o	Limiter la vitesse de l’attaque pour éviter la détection par IDS.
o	Choisir des listes de mots de passe adaptées à la cible.
•	Pour le défenseur : 
o	Mettre en place une limitation des tentatives (ex : Fail2Ban).
o	Utiliser l’authentification multifactorielle.
________________________________________
Intégration avec le Script
•	Annotations :
Le script recueillera les commandes Hydra lancées et enregistrera les options sélectionnées pour créer un rapport détaillé.
•	Suivi :
Chaque tentative et résultat sera logué pour une analyse post-exécution.
________________________________________
Références & Ressources
•	THC Hydra GitHub
•	SecLists Wordlists
•	OWASP – Attaque Bruteforce

---
