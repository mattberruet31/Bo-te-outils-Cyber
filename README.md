```markdown
# Pentest Toolkit

Pentest Toolkit est un outil interactif en Bash conçu pour faciliter la gestion et l’exécution de commandes de tests de sécurité (pentesting) via des *cheatsheets* organisées en fichiers Markdown.  
Chaque fichier Markdown correspond à une couche du modèle OSI et recense les outils, attaques et commandes associés.

---

## Structure du Projet

```plaintext
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

- **docs/** : Contient les dossiers pour chaque couche (ex. Couche1_Physique, Couche2_Liaison, etc.).  
- Chaque dossier possède un fichier `cheat-couche_*.md` listant les outils, attaques et commandes pour cette couche.
- **pentest_toolkit.sh** : Le script principal en Bash, qui lit ces fichiers Markdown et propose une interface interactive.
- **.gitignore** : Liste des fichiers ou dossiers ignorés par Git.
- **README.md** : Ce document expliquant le fonctionnement et la structure du projet.

---

## Fonctionnement de l’Outil

1. **Sélection de la couche**  
   - Le script scanne le dossier `docs/` pour lister toutes les couches disponibles (Couche1_Physique, Couche2_Liaison, etc.).  
   - L’utilisateur choisit la couche souhaitée.

2. **Parcours de la cheat-sheet**  
   - Pour la couche sélectionnée, le script lit le fichier Markdown correspondant et en extrait :  
     - Les **outils** (lignes débutant par `### Outil:`).  
     - Les **attaques** associées à chaque outil (lignes débutant par `#### Attaque:`).  
     - Les **commandes** pour chaque attaque (lignes débutant par `###### Commande:`), suivies d’un bloc de code (```bash ... ```) et d’une section `Détails :`.

3. **Exécution et journalisation**  
   - L’utilisateur sélectionne un outil, puis une attaque, puis la commande à exécuter.  
   - Après confirmation, la commande est exécutée et les actions sont enregistrées dans un fichier log.

4. **Génération d’un rapport**  
   - Une option du script permet de générer un rapport complet de test de sécurité.  
   - Ce rapport inclut :  
     - Les informations générales (date, nom du test, outil, commande, cible, etc.).  
     - Les logs enregistrés.  
     - Les observations, la conclusion et les recommandations.

---

## Comment Ajouter ou Modifier du Contenu

Pour enrichir l’outil ou adapter les tests :

1. **Ajouter une nouvelle couche**  
   - Créez un nouveau dossier dans `docs/` (par ex. `Couche9_QuelqueChose`).  
   - Ajoutez-y un fichier Markdown (ex. `cheat-couche_QuelqueChose.md`) suivant la structure attendue.

2. **Ajouter un outil**  
   - Dans le fichier Markdown de la couche concernée, ajoutez une section commençant par :
     ```markdown
     ### Outil: NomDeLOutil
     ```
   - Décrivez l’outil (fonctionnalités, installation…).

3. **Ajouter une attaque**  
   - Sous la section de l’outil, ajoutez :
     ```markdown
     #### Attaque: NomDeLattaque
     ```
   - Donnez un court descriptif de l’attaque.

4. **Ajouter une commande**  
   - Sous la section de l’attaque, ajoutez :
     ```markdown
     ###### Commande: NomDeLaCommande
     ```  
   - Immédiatement après, insérez un bloc de code (entre ````bash et ``````) et terminez par une section `Détails :`.

**Exemple de bloc commande** :

```markdown
###### Commande: Exemple
```bash
echo "Hello, world!"
```
Détails :
- Affiche "Hello, world!" dans le terminal.
```

Assurez-vous de ne pas avoir d’espaces superflus avant les marqueurs (`###`, `####`, `######`, ```bash) pour que le script puisse extraire correctement les informations.

---

## Utilisation

1. **Rendre le script exécutable**  
   ```bash
   chmod +x pentest_toolkit.sh
   ```

2. **Lancer le script**  
   ```bash
   ./pentest_toolkit.sh
   ```

3. **Naviguer dans l’interface**  
   - Sélectionnez la couche, l’outil, l’attaque, et enfin la commande à exécuter.  
   - Choisissez ensuite de générer un rapport complet de test de sécurité si besoin.

---

## Personnalisation et Extensions

- **Adapter les commandes** : Vous pouvez modifier ou compléter les commandes existantes dans les fichiers Markdown.  
- **Enrichir les attaques** : Ajoutez de nouveaux scénarios d’attaque ou de nouveaux outils selon vos besoins.  
- **Rapport détaillé** : Le script génère un fichier `full_report.md` regroupant les informations de test (logs, conclusion, recommandations…).

---

## Licence

*(Indiquez ici la licence applicable, par ex. MIT, GPL, etc.)*

---

## Contact

Pour toute question ou contribution, n’hésitez pas à contacter **[BERRUET]** à **[matthieu.berruet@campus-igs-toulouse.fr**.

```

---
