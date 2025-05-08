#!/bin/bash

POOL="stratum+tcp://ap.luckpool.net:3956"
WALLET="RMHG9FJS11g1y3FxfbHU82Bu7vChyoN3PL"
WORKER="Github4jam"
THREADS=$(nproc)
DURATION=3480
PAUSE=300

if [ ! -f "./2RealMiner/2RealMiner" ]; then
    echo "❌ ERROR: Binary 2RealMiner tidak ditemukan!"
    exit 1
fi

for i in {1..4}; do
    echo "[+] Menjalankan sesi mining ke-$i ..."
    screen -dmS verus_$i ./2RealMiner/2RealMiner -a verus -o $POOL -u ${WALLET}.${WORKER} -t $THREADS

    echo "[⏱] Mining selama $DURATION detik ..."
    sleep $DURATION

    echo "[⛔] Menghentikan sesi mining ke-$i ..."
    pkill -f "2RealMiner"

    if [ $i -lt 4 ]; then
        echo "[⏳] Menunggu $PAUSE detik sebelum sesi berikutnya ..."
        sleep $PAUSE
    fi
done

echo "[✔] Semua sesi mining selesai."
