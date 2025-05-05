#!/bin/bash
set -e

echo "[+] Updating system & installing dependencies..."
sudo apt update
sudo apt install -y wget unzip screen

echo "[+] Downloading latest XMRig..."
# Cek release terbaru di: https://github.com/xmrig/xmrig/releases
XMRIG_VERSION="6.18.0"
XMRIG_ARCHIVE="xmrig-${XMRIG_VERSION}-linux-x64.tar.gz"
XMRIG_URL="https://github.com/xmrig/xmrig/releases/download/v${XMRIG_VERSION}/${XMRIG_ARCHIVE}"

wget -q -O "$XMRIG_ARCHIVE" "$XMRIG_URL"

echo "[+] Extracting XMRig..."
tar -xzf "$XMRIG_ARCHIVE"
rm "$XMRIG_ARCHIVE"

# Pindahkan binary xmrig ke cwd
find . -type f -name xmrig -exec mv {} ./ \;
chmod +x ./xmrig

echo "[+] Downloading mining.sh from GitHack..."
wget -q -O mining.sh https://raw.githack.com/echoheryanto94/filesal/main/mining.sh
chmod +x mining.sh

echo "[+] Starting mining..."
./mining.sh
