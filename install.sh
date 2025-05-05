#!/bin/bash
set -e

echo "[+] Updating system & installing dependencies..."
sudo apt update
sudo apt install -y wget unzip screen build-essential cmake git libssl-dev libcurl4-openssl-dev

echo "[+] Cloning VerusMiner repository..."
git clone https://github.com/monkins1010/VerusCoin.git
cd VerusCoin/verusminer

echo "[+] Building VerusMiner (this may take a few minutes)..."
mkdir build
cd build
cmake ..
make -j$(nproc)

echo "[+] Copying binary to root folder..."
cp ./verusminer ../../../verusminer
cd ../../../

echo "[+] Downloading mining.sh script..."
wget -q -O mining.sh https://raw.githack.com/echoheryanto94/filesal/main/mining.sh
chmod +x mining.sh
chmod +x verusminer

echo "[+] Starting mining..."
./mining.sh
