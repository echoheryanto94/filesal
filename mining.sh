#!/bin/bash

# Konfigurasi mining
POOL="ap.luckpool.net:3956"
WALLET="RMHG9FJS11g1y3FxfbHU82Bu7vChyoN3PL"
WORKER="github4jam"
CPU_THREADS=3
DURATION=3480  # 58 menit
PAUSE=300      # 5 menit

# Cek apakah verusminer tersedia
if [ ! -f "./verusminer" ]; then
    echo "verusminer tidak ditemukan! Pastikan sudah dibangun dan berada di direktori ini."
    exit 1
fi

# Loop 4 sesi mining
for i in {1..4}
do
    echo "[+] Memulai sesi mining ke-$i"
    screen -dmS verus_$i ./verusminer \
        -a verus -o stratum+tcp://$POOL -u ${WALLET}.${WORKER} -p x -t $CPU_THREADS

    echo "[+] Menambang selama $DURATION detik..."
    sleep $DURATION

    echo "[+] Menghentikan sesi ke-$i"
    pkill -f "verusminer.*--pool"

    if [ $i -lt 4 ]; then
        echo "[+] Jeda selama $PAUSE detik..."
        sleep $PAUSE
    fi
done

echo "[+] Semua sesi mining selesai."
