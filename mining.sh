#!/bin/bash

POOL="stratum+tcp://ap.luckpool.net:3956"
WALLET="RMHG9FJS11g1y3FxfbHU82Bu7vChyoN3PL"
WORKER="Github4jam"
THREADS=3
DURATION=3480
PAUSE=300

if [ ! -f "./ccminer/ccminer" ]; then
    echo "ERROR: Binary 'ccminer' tidak ditemukan di $(pwd)/ccminer"
    exit 1
fi

for i in {1..4}; do
    echo "[+] Memulai sesi mining #$i"
    screen -dmS verus_$i bash -c "./ccminer/ccminer -a verus -o $POOL -u ${WALLET}.${WORKER} -t $THREADS | tee mining_log_$i.txt"

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
