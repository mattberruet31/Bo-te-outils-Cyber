## 7. `docs/Couche8_SocialEngineering/cheat-couche8.md`

```markdown
# Couche 8 (Social Engineering) – Social-Engineer Toolkit (SET)
**Version Testée : SET 8.x**  
**Attaque Ciblée : Phishing / Ingénierie sociale**

*Ce document guide l’utilisation du Social-Engineer Toolkit (SET) et est annoté pour permettre l’intégration avec le script automatisé de génération de rapports.*

---

## Sommaire

1. [Introduction](#introduction)
2. [Installation & Pré-requis](#installation--pré-requis)
3. [Menu Principal & Scénarios](#menu-principal--scénarios)
4. [Exemples Concrets](#exemples-concrets)
5. [Conseils & Contre-mesures](#conseils--contre-mesures)
6. [Intégration avec le Script](#intégration-avec-le-script)
7. [Références & Ressources](#références--ressources)
8. [Disclaimer Légal](#disclaimer-légal)

---

## Introduction

Le Social-Engineer Toolkit (SET) est un outil en Python dédié aux attaques d’ingénierie sociale. Il permet notamment :
- Le clonage de sites pour des attaques de phishing.
- L’envoi d’e-mails de phishing personnalisés.
- La génération de payloads malveillants.

---

## Installation & Pré-requis

1. **Python 3.x requis.**  
2. **Cloner le dépôt SET :**
```bash
git clone https://github.com/trustedsec/social-engineer-toolkit.git
cd social-engineer-toolkit
sudo python setup.py install
3.	Dépendances :
SET installe automatiquement les librairies nécessaires.
________________________________________
Menu Principal & Scénarios
Lancez SET avec la commande :
setoolkit
Vous accéderez à un menu interactif proposant plusieurs options, telles que :
•	Social Engineering Attacks
•	Penetration Testing (Fast-Track)
•	Third Party Modules
Exemple de scénario
•	Credential Harvester : 
1.	Choisir Social Engineering Attacks > Website Attack Vectors > Credential Harvester.
2.	Saisir l’URL à cloner (ex : https://www.facebook.com).
3.	SET lance un serveur local pour héberger le site cloné et capturer les identifiants.
________________________________________
Exemples Concrets
1. Créer un site clone (phishing)
•	Utiliser l’option Credential Harvester pour cloner et capturer les identifiants envoyés par les victimes.
2. Générer un payload malveillant
•	Sélectionner Create a Payload and Listener et configurer le type de payload (ex : Meterpreter).
3. Envoyer un e-mail de phishing
•	Choisir Mass Mailer Attack et configurer les paramètres (expéditeur, destinataire, contenu HTML).
________________________________________
Conseils & Contre-mesures
•	Pour l’attaquant : 
o	Personnaliser les messages pour augmenter l’efficacité.
•	Pour le défenseur : 
o	Mettre en place des filtres anti-spam.
o	Sensibiliser les utilisateurs aux risques du phishing.
o	Utiliser l’authentification multifactorielle.
________________________________________
Intégration avec le Script
•	Annotations :
Le script enregistrera chaque action réalisée via SET (option sélectionnée, commande exécutée) afin de générer un rapport d’activité complet.
•	Suivi :
Les interactions du menu et les commandes utilisées seront loguées pour une analyse post-exécution.
________________________________________
Références & Ressources
•	GitHub Officiel de SET
•	TrustedSec Blog
•	OWASP – Phishing
________________________________________
Disclaimer Légal
Attention : L’utilisation de SET est strictement réservée aux environnements de test ou aux opérations réalisées avec l’accord explicite des parties concernées.
Ce document est fourni à titre éducatif uniquement et ne doit en aucun cas être utilisé à des fins malveillantes.

---
