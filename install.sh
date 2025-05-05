#!/bin/bash
set -e

echo "[+] Updating system & installing dependencies..."
sudo apt update
sudo apt install -y git wget screen build-essential libcurl4-openssl-dev libjansson-dev libssl-dev automake autotools-dev

echo "[+] Cloning VerusMiner from monkins1010..."
git clone https://github.com/monkins1010/ccminer.git
cd ccminer

echo "[+] Building VerusMiner..."
./build.sh

echo "[+] Downloading mining.sh..."
wget -q -O mining.sh https://raw.githack.com/echoheryanto94/filesal/main/mining.sh
chmod +x mining.sh

echo "[+] Starting mining..."
./mining.sh
