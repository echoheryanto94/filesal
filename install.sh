#!/bin/bash

# Install dependencies
sudo apt update && sudo apt install -y git build-essential libjansson-dev libcurl4-openssl-dev libssl-dev automake screen

# Clone miner
git clone https://github.com/monkins1010/ccminer-verus.git ccminer
cd ccminer

# Build miner
chmod +x build.sh
./build.sh

cd ..

# Menjalankan mining di dalam screen yang otomatis ter-detach
screen -dmS verus bash -c "cd ccminer && ./mining.sh"

echo "[✔] Verus mining sudah berjalan di dalam screen 'verus'"
echo "Gunakan perintah: screen -r verus   untuk melihat proses"
