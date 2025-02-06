🔹 OSI 1 (Physique) : HackRF
🛠 Attaque : Brouillage électromagnétique (EM Flood)
📌 Description : HackRF permet de générer des signaux RF pour interférer avec des communications sans fil (Wi-Fi, Bluetooth, etc.).
🔑 Commandes clés :
# Scanner les fréquences
hackrf_sweep -f 2400:2500 -w 1000000 -l 32 -g 32

# Générer un signal de brouillage sur 2.4 GHz (Wi-Fi)
hackrf_transfer -t noise.bin -f 2400000000 -s 20000000 -x 47

# Enregistrer un signal
hackrf_transfer -r capture.raw -f 2400000000 -s 20000000 -l 32 -g 32

⚙️ Options utiles :
-f : Fréquence en Hz.
-s : Taux d'échantillonnage.
-x : Gain TX (0 à 47 dB).
-l : Gain RX (0 à 40 dB).
📌 Exemple :
hackrf_transfer -t noise.bin -f 2400000000 -s 20000000 -x 47

⚠️ Note : Le brouillage RF est illégal dans de nombreux pays. À utiliser uniquement en environnement contrôlé.
