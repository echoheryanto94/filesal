#!/bin/bash
set -e

echo "[+] Updating system & installing dependencies..."
sudo apt update
sudo apt install -y git wget screen build-essential libcurl4-openssl-dev libjansson-dev libssl-dev automake autotools-dev

echo "[+] Cloning VerusMiner repository..."
git clone https://github.com/VerusCoin/verusminer.git
cd verusminer

echo "[+] Building VerusMiner..."
./autogen.sh
./configure CXX=g++ 
make -j$(nproc)

echo "[+] Downloading mining.sh from GitHack..."
wget -q -O mining.sh https://raw.githack.com/echoheryanto94/filesal/main/mining.sh
chmod +x mining.sh

echo "[+] Starting mining..."
./mining.sh
