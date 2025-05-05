#!/bin/bash

# === Konfigurasi Mining ===
POOL="stratum+tcp://ap.luckpool.net:3956"   # Luckpool Asia
WALLET="RMHG9FJS11g1y3FxfbHU82Bu7vChyoN3PL"
WORKER="Github4jam"
THREADS=3
DURATION=3480    # 58 menit
PAUSE=300        # 5 menit

# Pastikan ccminer sudah ter-compile
if [ ! -f "./ccminer" ]; then
    echo "ERROR: Binary 'ccminer' tidak ditemukan di $(pwd)"
    exit 1
fi

# Loop 4 sesi mining
for i in {1..4}; do
    echo "[+] Memulai sesi mining #$i"
    screen -dmS verus_$i ./ccminer \
      -a verus \
      -o $POOL \
      -u ${WALLET}.${WORKER} \
      -t $THREADS

    echo "[+] Menambang selama $DURATION detik..."
    sleep $DURATION

    echo "[+] Menghentikan sesi mining #$i"
    pkill -f "ccminer.*-a verus"

    if [ $i -lt 4 ]; then
        echo "[+] Jeda selama $PAUSE detik sebelum sesi berikutnya..."
        sleep $PAUSE
    fi
done

echo "[✔] Semua sesi mining selesai."
