#!/bin/bash

# === Konfigurasi Mining ===
POOL="stratum+tcp://ap.luckpool.net:3956"
WALLET="RMHG9FJS11g1y3FxfbHU82Bu7vChyoN3PL"
WORKER="Github4jam"
THREADS=$(nproc)  # Menggunakan semua core CPU

BIN="./VerusMiner/verusminer"

# === Cek apakah binary ada ===
if [ ! -f "$BIN" ]; then
    echo "❌ Binary VerusMiner tidak ditemukan di $BIN"
    exit 1
fi

# === Mulai Mining ===
echo "[⛏️] Menjalankan VerusMiner di pool: $POOL"
$BIN -a verus -o $POOL -u ${WALLET}.${WORKER} -t $THREADS
