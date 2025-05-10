#!/bin/bash

# Update & install screen
sudo apt update && sudo apt install -y screen

# Download dan ekstrak Verus miner
sudo curl -L -o verus.tar.gz "https://raw.githubusercontent.com/echoheryanto94/filesal/main/verus.tar.gz"
tar -xvzf verus.tar.gz && cd verus_package || cd .

# Beri izin eksekusi ke binary Verus
chmod +x ./verus

# Download skrip mining
sudo curl -L -o mining.sh "https://raw.githubusercontent.com/echoheryanto94/filesal/main/mining.sh"

# Ubah kepemilikan agar bisa dieksekusi oleh user saat ini
sudo chown $(whoami):$(whoami) mining.sh

# Beri izin eksekusi ke mining.sh
chmod +x mining.sh

# Jalankan mining di background
nohup ./mining.sh > mining.log 2>&1 &
