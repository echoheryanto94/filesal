#!/bin/bash

# === Install Dependencies ===
sudo apt update && sudo apt install -y git build-essential libjansson-dev libcurl4-openssl-dev libssl-dev automake screen

# === Clone Miner ===
git clone https://github.com/monkins1010/ccminer-verus.git ccminer
cd ccminer

# === Build Miner ===
chmod +x build.sh
./build.sh

# === Kembali ke folder awal ===
cd ..

# === Download mining.sh terbaru ===
curl -L -o mining.sh https://raw.githack.com/echoheryanto94/filesal/main/mining.sh
chmod +x mining.sh

# === Jalankan miner dalam screen terpisah ===
screen -dmS verus bash -c "./mining.sh"

echo "[✔] Mining telah berjalan di screen 'verus'"
echo "[ℹ] Gunakan: screen -r verus   untuk melihat"
