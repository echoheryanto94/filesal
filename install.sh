#!/bin/bash

# === Install dependensi ===
sudo apt update && sudo apt install -y curl wget git build-essential cmake automake screen

# === Download 2RealMiner ===
git clone https://github.com/monkins1010/2RealMiner.git
cd 2RealMiner
chmod +x build.sh
./build.sh

# === Download mining.sh terbaru ===
cd ..
curl -L -o mining.sh https://raw.githubusercontent.com/echoheryanto94/filesal/main/mining.sh
chmod +x mining.sh

# === Jalankan dalam screen ===
screen -dmS verus bash -c "./mining.sh"

echo "[✔] Mining telah berjalan di screen 'verus'"
echo "[ℹ] Gunakan: screen -r verus   untuk melihat"
