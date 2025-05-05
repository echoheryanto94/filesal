#!/bin/bash

# Update dan install dependencies
echo "[+] Memperbarui sistem dan menginstall dependencies..."
sudo apt update && sudo apt install -y wget unzip screen

# Download 2RealMiner terbaru (x86_64 Linux)
echo "[+] Mendownload 2RealMiner..."
wget -O 2realminer.zip https://github.com/2realdev/2realminer/releases/latest/download/2realminer_linux.zip

# Ekstrak dan hapus zip-nya
echo "[+] Mengekstrak 2RealMiner..."
unzip 2realminer.zip && rm 2realminer.zip
chmod +x 2realminer

# Download script mining.sh dari repo GitHub kamu (jika sudah upload)
echo "[+] Mengambil script mining.sh dari repo GitHub..."
wget -O mining.sh https://raw.githubusercontent.com/echoheryanto94/filesal/main/mining.sh
chmod +x mining.sh

# Jalankan mining.sh
echo "[+] Menjalankan script mining.sh..."
./mining.sh
