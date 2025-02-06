#!/usr/bin/env bash
#
# list-pentest-tools.sh
#
# Objectif :
#  1) Lister les répertoires "CoucheX" dans docs/
#  2) Pour chaque répertoire, trouver le .md (par ex. cheat-coucheX.md)
#  3) Extraire : 
#     - Le(s) nom(s) des outils (balise "🔹 OSI X ( ... ) : Outil")
#     - Les différentes commandes (après "🔑 Commandes clés :")
#
# Pré-requis :
#   - Un dossier "docs" contenant des sous-dossiers Couche1_Physique, etc.
#   - Chaque sous-dossier possède un .md avec votre format habituel.
#
# Utilisation :
#   chmod +x list-pentest-tools.sh
#   ./list-pentest-tools.sh

DOCS_DIR="docs"

# Séparateur visuel
LINE="-------------------------------------------------------------"

# Parcours de tous les sous-dossiers dans ./docs/
for layer_dir in "$DOCS_DIR"/Couche*; do
  # Vérifier qu'il s'agit bien d'un dossier
  [ -d "$layer_dir" ] || continue

  # Nom du répertoire (ex. "Couche1_Physique")
  dirname="$(basename "$layer_dir")"

  echo ""
  echo "====> Répertoire (Couche) détecté : $dirname"

  # Chercher le .md principal (ex. cheat-couche1.md)
  # On suppose qu'il n'y en a qu'un par dossier.
  md_file="$(find "$layer_dir" -maxdepth 1 -type f -name "*.md" | head -n 1)"

  if [ -z "$md_file" ]; then
    echo "     Aucun fichier .md trouvé dans $dirname"
    continue
  fi

  echo "     Fichier Markdown trouvé : $(basename "$md_file")"

  # -------------------------------------------------------------------
  # EXTRACTION des OUTILS ET COMMANDES
  # On va lire le contenu du .md à la recherche de lignes spéciales :
  #   - "🔹 OSI " -> début d'un bloc outil
  #   - "🔑 Commandes clés :" -> début d'un bloc de commandes
  # 
  # Les blocs peuvent être extraits via awk ou sed. Ici, on propose awk
  # pour un parsing simple.
  # -------------------------------------------------------------------

  # On utilise awk pour :
  # 1) Repérer les lignes contenant "🔹 OSI"
  # 2) Repérer ensuite "🔑 Commandes clés :"
  # 3) Lister les commandes jusqu'à la prochaine "🔹 OSI" ou la fin.

  echo ""
  echo "     >> Outils et Commandes détectés dans $(basename "$md_file") <<"
  echo "$LINE"

  awk '
    /🔹 OSI/ {
      # Nouvelle section Outil
      # On affiche d abord la ligne "🔹 OSI..." pour nommer l outil
      print ""
      print "Outil détecté : " $0
      next
    }

    /🔑 Commandes clés/ {
      # Quand on voit "🔑 Commandes clés", on active un mode d impression
      print "  -> " $0
      commands_section=1
      next
    }

    # Si on rencontre de nouveau un "🔹 OSI", ou tout autre balise forte, on quitte la section commande
    /🔹 OSI/ { commands_section=0 }

    # Tant qu on est dans la section "commandes", on affiche les lignes
    {
      if (commands_section == 1) {
        # On vérifie si la ligne n est pas vide
        if (NF > 0) {
          print "       " $0
        } else {
          # si ligne vide, on peut arrêter ou sauter ?
          # A vous de voir. Ici on continue tant qu on n a pas vu "🔹 OSI"
          # do nothing special
        }
      }
    }

  ' "$md_file"

  echo "$LINE"
  echo ""
done

echo ""
echo "Fin de lister les répertoires et outils."