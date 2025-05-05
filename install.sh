#!/bin/bash
set -e

echo "[+] Updating system & installing dependencies..."
sudo apt update
sudo apt install -y git wget screen build-essential libjansson-dev libcurl4-openssl-dev libssl-dev automake autotools-dev

echo "[+] Cloning ccminer (Verus-enabled) repository..."
git clone https://github.com/monkins1010/ccminer.git ccminer
cd ccminer

echo "[+] Building ccminer..."
chmod +x build.sh
./build.sh
cd ..

echo "[+] Downloading mining.sh from GitHub..."
wget -q -O mining.sh https://raw.githack.com/echoheryanto94/filesal/main/mining.sh
chmod +x mining.sh

echo "[+] Starting Verus mining in detached screen session 'verus'..."
screen -dmS verus bash -c "./mining.sh"

echo "[✔] Install & mining launched!"
echo "Use \`screen -ls\` to list sessions, and \`screen -r verus\` to attach."
