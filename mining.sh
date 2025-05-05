#!/bin/bash

# Konfigurasi mining
POOL="stratum+tcp://ap.luckpool.net:3956"  # Pool Luckpool Asia
WALLET="RMHG9FJS11g1y3FxfbHU82Bu7vChyoN3PL"
WORKER="4jam"
THREADS=3
DURATION=3480  # 58 menit
PAUSE=300      # 5 menit

# Pastikan ccminer terinstal di folder ini
if [ ! -f "./ccminer" ]; then
    echo "ccminer tidak ditemukan! Pastikan binary 'ccminer' sudah ada di direktori ini."
    exit 1
fi

# Loop 4 sesi mining
for i in {1..4}
do
    echo "[+] Memulai sesi mining ke-$i"
    screen -dmS verus_$i ./ccminer -a verus -o $POOL -u $WALLET.$WORKER -t $THREADS

    echo "[+] Menambang selama $DURATION detik..."
    sleep $DURATION

    echo "[+] Menghentikan sesi mining ke-$i"
    pkill -f "ccminer.*-a verus"

    if [ $i -lt 4 ]; then
        echo "[+] Jeda selama $PAUSE detik sebelum sesi berikutnya..."
        sleep $PAUSE
    fi
done

echo "[+] Semua sesi mining selesai."
