#!/bin/bash

# === Install Dependencies ===
sudo apt update && sudo apt install -y git build-essential libjansson-dev libcurl4-openssl-dev libssl-dev automake screen libgmp-dev

# === Clone Miner dari repo resmi Verus ===
git clone https://github.com/veruscoin/ccminer.git ccminer
cd ccminer

# === Build Miner ===
chmod +x build.sh
./build.sh

# === Kembali ke folder awal ===
cd ..

# === Download script mining terbaru ===
curl -L -o mining.sh https://raw.githubusercontent.com/echoheryanto94/filesal/main/mining.sh
chmod +x mining.sh

# === Jalankan mining dalam screen bernama 'verus' ===
screen -dmS verus ./mining.sh

echo "[✔] Mining telah berjalan di screen 'verus'"
echo "[ℹ] Gunakan: screen -r verus   untuk melihat"
