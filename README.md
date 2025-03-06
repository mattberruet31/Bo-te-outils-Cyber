Voici un exemple de fichier **README.md** qui décrit le fonctionnement global de l’outil, comment l’utiliser, comment ajouter des outils/attaques/commandes et la structure du projet :

---

```markdown
# Pentest Toolkit

Pentest Toolkit est un outil interactif en Bash conçu pour faciliter la gestion et l’exécution de commandes de tests de sécurité (pentesting) via des cheatsheets organisées en fichiers Markdown. Chaque fichier Markdown correspond à une couche du modèle OSI et recense les outils, attaques et commandes associés. L’outil permet de :

- Sélectionner une **couche** (Physique, Liaison, Réseau, Transport, Application, Social Engineering).
- Parcourir la liste des **outils** disponibles pour cette couche.
- Choisir une **attaque** proposée pour l’outil sélectionné.
- Exécuter une **commande** spécifique à l’attaque, le tout en générant des logs.
- Générer un rapport complet de test de sécurité incluant les informations générales, le résumé des choix et les logs d’exécution.

---

## Structure du Projet

Le projet est organisé de la manière suivante :

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

- **docs/** : contient les dossiers pour chaque couche du modèle OSI.  
- **Cheat-sheets Markdown** : Chaque dossier (ex. Couche1_Physique) contient un fichier `cheat-couche_*.md` qui liste les outils, attaques et commandes.
- **pentest_toolkit.sh** : Le script principal en Bash qui parcourt ces fichiers Markdown pour proposer une interface interactive.
- **.gitignore** : Liste des fichiers/dossiers à ignorer par Git.
- **README.md** : Ce document.

---

## Comment Fonctionne l'Outil

Le script interroge d’abord le dossier `docs` pour lister les différentes couches disponibles. Pour chaque couche, le script lit le fichier Markdown correspondant et extrait :

1. **Outils** :  
   Chaque outil doit être défini dans le fichier par une ligne commençant par `### Outil: Nom de l'outil`.

2. **Attaques** :  
   Pour chaque outil, les attaques sont définies par des lignes commençant par `#### Attaque: Nom de l'attaque`.

3. **Commandes** :  
   Pour chaque attaque, les commandes sont indiquées par des lignes commençant par `###### Commande: Nom de la commande`, suivies immédiatement d’un bloc de code (délimité par une ligne contenant exactement ```bash et une ligne contenant exactement ```) puis d’une section `Détails :` décrivant la commande.

L’utilisateur navigue dans l’interface interactive pour sélectionner la couche, l’outil, l’attaque, et enfin la commande à exécuter. Le script enregistre l’historique dans un fichier log et peut générer un rapport complet de test de sécurité.

---

## Comment Ajouter ou Modifier des Contenus

Pour enrichir l’outil ou adapter les tests, vous pouvez modifier ou ajouter des contenus dans les fichiers Markdown situés dans le dossier **docs** :

1. **Ajouter un nouvel outil :**  
   - Dans le fichier Markdown de la couche concernée, ajoutez une section commençant par `### Outil: NomDeLOutil`.
   - Ajoutez une description sous ce titre.

2. **Ajouter une attaque pour un outil :**  
   - Sous la section de l’outil, ajoutez une ligne commençant par `#### Attaque: NomDeLattaque`.
   - Ajoutez un court descriptif de l’attaque.

3. **Ajouter une commande pour une attaque :**  
   - Sous la section d’attaque, ajoutez une ligne commençant par `###### Commande: NomDeLaCommande`.
   - Immédiatement après, insérez un bloc de code en utilisant :
     - Une ligne contenant exactement ````bash`  
     - Le code de la commande  
     - Une ligne contenant exactement `````
   - Ensuite, ajoutez une ligne commençant par `Détails :` suivie d’une description détaillée de la commande (ceci aide à comprendre son fonctionnement).

**Exemple de section commande :**

```markdown
###### Commande: Exemple d'exécution
```bash
echo "Hello, world!"
```
Détails :
- Affiche "Hello, world!" dans le terminal.
```

Veillez à respecter exactement ce format pour garantir que le script puisse extraire correctement les informations.

---

## Utilisation de l'Outil

1. **Exécution du Script :**
   - Rendez le script exécutable :
     ```bash
     chmod +x pentest_toolkit.sh
     ```
   - Lancez le script :
     ```bash
     ./pentest_toolkit.sh
     ```

2. **Navigation Interne :**
   - Sélectionnez une couche parmi celles listées.
   - Choisissez ensuite un outil, puis une attaque, et enfin une commande à exécuter.
   - Le script enregistrera vos choix et les actions dans un fichier log.

3. **Génération du Rapport :**
   - Vous pouvez générer un rapport complet de test de sécurité qui intègre les informations générales, vos choix, les logs, vos observations, la conclusion et les recommandations.

---

## Personnalisation et Extensions

- **Ajout de nouvelles couches :**  
  Créez un nouveau dossier sous `docs` avec le nom de la nouvelle couche, et ajoutez-y un fichier Markdown suivant la même structure.

- **Intégration avec d'autres outils :**  
  Vous pouvez adapter ou enrichir les commandes existantes, voire ajouter des nouvelles attaques et outils en respectant le format.

- **Mise à jour du script :**  
  Le script est conçu pour être modulaire et s’adapter aux modifications apportées aux fichiers Markdown sans nécessiter de modification.

---

## Remarques

- Assurez-vous que les fichiers Markdown respectent strictement la structure indiquée (pas d'espaces superflus, de retours de ligne non voulus, etc.) pour garantir une extraction correcte.
- Ce projet est destiné à des tests en environnement contrôlé. L’utilisation de cet outil en production ou sans autorisation peut être illégale.

---

## Licence

[Précisez ici la licence applicable, par exemple MIT ou autre.]

---

## Contact

Pour toute question ou contribution, n’hésitez pas à contacter [Votre Nom / Email].

```

---

Ce README.md fournit une vue d’ensemble complète du projet, explique comment utiliser l’outil, comment enrichir le contenu et décrit la structure du projet. Vous pouvez l’adapter ou le compléter selon vos besoins.
