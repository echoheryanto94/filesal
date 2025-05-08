#!/bin/bash

# === Install Dependencies ===
sudo apt update && sudo apt install -y git build-essential libjansson-dev libcurl4-openssl-dev libssl-dev automake screen

# === Clone Miner (repo aktif yang cocok untuk Verus) ===
rm -rf ccminer
git clone https://github.com/DyerMaker/ccminer-verus.git ccminer || { echo "❌ Gagal clone repo ccminer"; exit 1; }
cd ccminer

# === Build Miner ===
chmod +x build.sh
./build.sh || { echo "❌ Gagal build ccminer"; exit 1; }

cd ..

# === Download mining.sh dari GitHub kamu ===
curl -L -o mining.sh https://raw.githubusercontent.com/echoheryanto94/filesal/main/mining.sh || { echo "❌ Gagal download mining.sh"; exit 1; }
chmod +x mining.sh

# === Jalankan miner dalam screen dengan log ===
screen -L -Logfile screen_debug.log -S verus -dm bash -c "./mining.sh"

echo "[✔] Mining telah dijalankan di screen 'verus'"
echo "[ℹ] Gunakan: screen -r verus   untuk melihat proses"
echo "[ℹ] Atau lihat log dengan: tail -f screen_debug.log"
