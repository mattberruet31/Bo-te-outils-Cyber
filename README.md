Voici une version complète du README en Markdown, formatée pour s'afficher correctement sur GitHub. Vous pouvez copier-coller ce contenu dans votre fichier `README.md` :

```markdown
# Pentest Toolkit

Pentest Toolkit est un outil interactif en Bash conçu pour faciliter la gestion et l'exécution de commandes de tests de sécurité (pentesting) via des cheatsheets organisées en fichiers Markdown. Chaque fichier Markdown correspond à une couche du modèle OSI et recense les outils, attaques et commandes associés.

---

## Structure du Projet

```
.
├── docs
│   ├── Couche1_Physique
│   │   └── cheat-couche_Physique.md
│   ├── Couche2_Liaison
│   │   └── cheat-couche_Liaison.md
│   ├── Couche3_Reseau
│   │   └── cheat-couche_Reseau.md
│   ├── Couche4_Transport
│   │   └── cheat-couche_Transport.md
│   ├── Couche5-7_Application
│   │   └── cheat-couche_Application.md
│   └── Couche8_Social-Engineering
│       └── cheat-couche_Social-Engineering.md
├── .gitignore
├── README.md
└── pentest_toolkit.sh
```

- **docs/** contient les dossiers pour chaque couche (ex. Couche1_Physique, Couche2_Liaison, etc.).
- Chaque dossier de couche contient un fichier Markdown (`cheat-couche_*.md`) qui définit les outils, attaques et commandes pour cette couche.
- **pentest_toolkit.sh** est le script principal qui lit ces fichiers Markdown pour proposer une interface interactive.
- **.gitignore** permet d'exclure certains fichiers de Git.
- Ce README vous présente l'ensemble du projet et explique comment l'utiliser et l'enrichir.

---

## Fonctionnement de l'Outil

Le script en Bash procède comme suit :

1. **Sélection de la Couche**  
   Le script parcourt le dossier `docs` pour lister toutes les couches disponibles (ex. Couche1_Physique, Couche2_Liaison, etc.).

2. **Navigation dans la Structure de la Cheat-sheet**  
   Pour la couche sélectionnée, le script lit le fichier Markdown associé et extrait :
   - Les **outils** (définis par les lignes débutant par `### Outil:`)
   - Les **attaques** pour chaque outil (définies par les lignes débutant par `#### Attaque:`)
   - Les **commandes** pour chaque attaque (définies par les lignes débutant par `###### Commande:`, suivies d'un bloc de code et d'une section `Détails :`)

3. **Exécution et Journalisation**  
   L'utilisateur sélectionne un outil, une attaque et une commande à exécuter. Le script exécute la commande (après confirmation) et enregistre les actions dans un fichier log.

4. **Génération d'un Rapport Complet**  
   Une option du script permet de générer un rapport de test de sécurité. Ce rapport intègre :
   - Des informations générales (date, nom du test, outil, attaque, commande, cible, testeur)
   - Une description du test
   - Un résumé des choix effectués
   - Les logs d'exécution
   - Des observations, conclusion et recommandations

---

## Comment Ajouter ou Modifier des Contenus

### Ajout d'un nouvel outil, attaque ou commande :

- **Outil** :  
  Dans le fichier Markdown de la couche concernée, ajoutez une section commençant par `### Outil: NomDeLOutil` suivi d'une description.

- **Attaque** :  
  Sous la section de l’outil, ajoutez une ligne commençant par `#### Attaque: NomDeLattaque` suivie d'un court descriptif.

- **Commande** :  
  Sous la section d'attaque, ajoutez une ligne débutant par `###### Commande: NomDeLaCommande`, puis immédiatement un bloc de code en utilisant :
  - Une ligne contenant exactement ````bash`  
  - Le code à exécuter  
  - Une ligne contenant exactement `````
  
  Ensuite, ajoutez une ligne commençant par `Détails :` suivie d'une description détaillée de la commande.

**Exemple :**

```markdown
###### Commande: Exemple d'exécution
```bash
echo "Hello, world!"
```
Détails :
- Affiche "Hello, world!" dans le terminal.
```

Assurez-vous que les balises sont exactes (sans espaces superflus) pour que le script puisse les détecter correctement.

---

## Utilisation

1. **Rendre le script exécutable :**

   ```bash
   chmod +x pentest_toolkit.sh
   ```

2. **Lancer le script :**

   ```bash
   ./pentest_toolkit.sh
   ```

3. **Naviguer dans le menu interactif :**  
   Sélectionnez la couche, l’outil, l’attaque, et enfin la commande à exécuter. Vous pouvez également générer un rapport complet de test de sécurité.

---

## Personnalisation

- **Ajout de nouvelles couches :**  
  Créez un nouveau dossier sous `docs` (par exemple `Couche9_NouveauType`) et ajoutez-y un fichier Markdown suivant le même format.

- **Extensions :**  
  Vous pouvez enrichir les fichiers Markdown ou adapter le script selon vos besoins spécifiques en matière de tests de sécurité.

---

## Licence

Ce projet est sous licence [Indiquez ici la licence, par exemple MIT].

---

## Contact

Pour toute question ou contribution, n’hésitez pas à contacter [Votre Nom] à [votre.email@example.com].

```

---

Ce format devrait s'afficher correctement sur GitHub, avec une indentation et une mise en forme claires. N'hésitez pas à adapter ce README selon vos besoins spécifiques.
