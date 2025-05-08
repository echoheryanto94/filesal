#!/bin/bash

# === Install Dependencies ===
sudo apt update && sudo apt install -y git build-essential libjansson-dev libcurl4-openssl-dev libssl-dev automake screen

# === Clone Miner ===
rm -rf ccminer
git clone https://github.com/monkins1010/ccminer-verus.git ccminer || { echo "❌ Gagal clone repo ccminer"; exit 1; }
cd ccminer

# === Build Miner ===
chmod +x build.sh
./build.sh || { echo "❌ Gagal build ccminer"; exit 1; }

# === Kembali ke folder awal ===
cd ..

# === Download mining.sh terbaru ===
curl -L -o mining.sh https://raw.githubusercontent.com/echoheryanto94/filesal/main/mining.sh
chmod +x mining.sh

# === Jalankan miner dalam screen terpisah ===
screen -S verus -dm bash -c "./mining.sh > mining_output.log 2>&1"

echo "[✔] Mining telah dijalankan di screen 'verus'"
echo "[ℹ] Gunakan: screen -r verus   untuk melihat"
