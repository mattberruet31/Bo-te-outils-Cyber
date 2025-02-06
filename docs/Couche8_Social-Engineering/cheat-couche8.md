# 12. `docs/Couche8_SocialEngineering/cheat-couche8.md`

```markdown
# Couche 8 (Social Engineering) – Social-Engineer Toolkit (SET)

**Attaque ciblée** : Phishing / Ingénierie sociale

---

## Sommaire

1. [Introduction](#introduction)
2. [Installation & Pré-requis](#installation--pré-requis)
3. [Menu Principal & Scénarios](#menu-principal--scénarios)
4. [Exemples Concrets](#exemples-concrets)
5. [Conseils & Contre-mesures](#conseils--contre-mesures)
6. [Références & Ressources](#références--ressources)

---

## Introduction

Le **Social-Engineer Toolkit (SET)** est un outil écrit en Python, qui facilite :
- La création de pages de phishing (clonage de sites).
- L’envoi d’e-mails de phishing personnalisés.
- La génération de payloads malveillants (exécutables, macros, etc.).

---

## Installation & Pré-requis

1. **Python** 3.x requis.
2. **Cloner le repo** :
   ```bash
   git clone https://github.com/trustedsec/social-engineer-toolkit.git
   cd social-engineer-toolkit
   sudo python setup.py install
   ```
3. **Dépendances** : SET installera automatiquement les librairies nécessaires.

---

## Menu Principal & Scénarios

Lancez le toolkit :
```bash
setoolkit
```

Vous verrez un menu :
1) **Social Engineering Attacks**  
2) **Penetration Testing (Fast-Track)**  
3) **Third Party Modules**  
4) etc.

**Exemple de scénario** :  
- **1) Social Engineering Attacks**  
  - **2) Website Attack Vectors**  
    - **3) Credential Harvester** : clone d’un site web existant, récupération des identifiants envoyés.

---

## Exemples Concrets

### 1) Créer un site clone (phishing)
1. Sélectionner `Social Engineering Attacks` > `Website Attack Vectors` > `Credential Harvester`.  
2. Indiquer l’URL à cloner (ex: `https://www.facebook.com`).  
3. SET va lancer un serveur local où les victimes qui se connectent verront le site cloné.

### 2) Générer un payload malveillant
- `Social Engineering Attacks` > `Create a Payload and Listener`.
- Choisir le type de payload (Meterpreter, etc.), l’encodage, etc.

### 3) Envoyer un e-mail de phishing
- `Social Engineering Attacks` > `Mass Mailer Attack`.
- Configurer l’expéditeur, le destinataire, le contenu HTML, etc.

---

## Conseils & Contre-mesures

- **Côté Attaquant** : Personnalisez vos emails (ingénierie sociale basée sur la cible) pour augmenter le taux de clic.  
- **Côté Défenseur** : 
  - Mettez en place des **filtres anti-spam** et une sensibilisation du personnel.  
  - Utilisez l’**authentification à multiples facteurs** (2FA) pour réduire l’impact du phishing.  
  - Surveillez les journaux pour repérer d’éventuelles connexions suspectes.

---

## Références & Ressources

- [GitHub officiel de SET](https://github.com/trustedsec/social-engineer-toolkit)  
- [TrustedSec Blog](https://www.trustedsec.com/blog/)  
- [Phishing – OWASP](https://owasp.org/www-community/attacks/Phishing)

---
```

---

## Conseils Généraux pour Tous les `.md`

1. **Ajouter une section “Disclaimer Légal”** lorsque vous manipulez des outils sensibles (brouillage RF, phishing, etc.).  
2. **Inclure des images** (schémas, captures d’écran) pour illustrer le fonctionnement, si vous le souhaitez.  
3. **Lister les sources** : doc officielle, wiki, RFC, etc.  
4. **Mettre en avant la version** de l’outil testée (certains flags peuvent changer selon la version).  
5. **Utiliser un sommaire** (table of contents) pour faciliter la navigation dans chaque fichier `.md`.

---

# Conclusion

Les fichiers ci-dessus proposent un **contenu amélioré** : 

- **Sections claires** (introduction, installation, commandes clés, exemples, contre-mesures, références).  
- **Contexte** (cible, usage légal, versions).  
- **Liens** vers la documentation officielle pour aller plus loin.  

N’hésitez pas à :

- **Compléter** chaque `.md` avec vos propres retours d’expérience.  
- **Ajouter d’autres outils** sur les mêmes couches OSI.  
- **Inclure des scripts d’automatisation**, ou encore des **captures d’écran**.  

Ainsi, vous obtiendrez une **documentation plus complète** et **pratique** pour vous et vos collègues. Bonne continuation dans l’élaboration de votre boîte à outils de pentest !