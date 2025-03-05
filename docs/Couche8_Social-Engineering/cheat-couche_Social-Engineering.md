**Chemin :**  
`docs/Couche8_Social-Engineering/cheat-couche_Social-Engineering.md`

```markdown
# Couche 8 (Social Engineering) – Attaques et Outils

**Version Testée :**
- Social-Engineer Toolkit (SET) 8.x
- Gophish 0.11.x
- King Phisher 1.14.x

**Description :**  
Ce document recense les outils et attaques disponibles pour la couche Social Engineering du modèle OSI.  
Cette couche s'appuie sur la manipulation psychologique et la tromperie pour obtenir des informations sensibles ou compromettre des systèmes.  
Les outils présentés permettent de lancer des campagnes de phishing, de cloner des sites web, de générer des payloads malveillants ou de simuler des attaques d'ingénierie sociale.  
Le script automatisé analysera ce fichier pour :
- Lister les outils disponibles (sections marquées par **"### Outil:"**),
- Afficher, pour chaque outil, les attaques possibles (sections marquées par **"#### Attaque:"**),
- Proposer les commandes associées pour chaque attaque (commandes présentées dans des blocs de code sous **"###### Commande:"** avec une section "Détails :").

Vous pourrez enrichir ce fichier ultérieurement sans modifier le script.

---

### Outil: Social-Engineer Toolkit (SET)
**Description :**  
SET est un framework complet pour réaliser des attaques d'ingénierie sociale, telles que le phishing, le spear-phishing, la création de sites clones, et la génération de payloads.

#### Attaque: Phishing / Credential Harvester
*Détails de l'attaque :*  
Cloner un site web afin de capturer les identifiants des utilisateurs lorsqu'ils se connectent.
##### Commandes Clés
**Commande: Lancer SET pour Credential Harvester**
```bash
setoolkit
```
Détails :
- Dans SET, sélectionnez "Social Engineering Attacks" → "Website Attack Vectors" → "Credential Harvester Attack".
- Suivez les instructions pour cloner un site et récupérer les identifiants.

#### Attaque: Envoi de mass mail de phishing
*Détails de l'attaque :*  
Utiliser SET pour envoyer des e-mails de phishing en masse afin de tromper les destinataires et collecter leurs informations.
##### Commandes Clés
**Commande: Lancer SET pour Mass Mailer Attack**
```bash
setoolkit --mass-mailer
```
Détails :
- Configurez les paramètres d'envoi, y compris l'expéditeur, le contenu et la liste de destinataires.

---

### Outil: Gophish
**Description :**  
Gophish est une plateforme open source de phishing qui permet de créer et de gérer des campagnes de phishing de manière centralisée.

#### Attaque: Campagne de phishing
*Détails de l'attaque :*  
Créer et lancer une campagne de phishing ciblée pour récolter des informations sensibles.
##### Commandes Clés
**Commande: Lancer Gophish (serveur intégré)**
```bash
./gophish
```
Détails :
- Lancez l'interface web de Gophish, configurez votre campagne, et surveillez les résultats.

---

### Outil: King Phisher
**Description :**  
King Phisher est un outil de simulation de phishing qui permet de tester la sensibilisation aux attaques de phishing au sein d'une organisation.

#### Attaque: Simulation de phishing avancée
*Détails de l'attaque :*  
Simuler une attaque de phishing pour évaluer la vulnérabilité des utilisateurs et améliorer la formation.
##### Commandes Clés
**Commande: Lancer King Phisher Client**
```bash
king-phisher
```
Détails :
- Utilisez l'interface graphique pour configurer et lancer une campagne de phishing simulée.

---

## Précautions Légales & Disclaimer
**Attention :**  
L'utilisation de ces outils et techniques d'ingénierie sociale doit être réalisée dans un cadre légal et uniquement à des fins de tests autorisés. Toute utilisation malveillante est strictement interdite.

---

## Références & Ressources
- [Social-Engineer Toolkit GitHub](https://github.com/trustedsec/social-engineer-toolkit)
- [Gophish Project](https://getgophish.com/)
- [King Phisher GitHub](https://github.com/securestate/king-phisher)
- [OWASP Phishing](https://owasp.org/www-community/attacks/Phishing)
```