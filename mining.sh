#!/bin/bash

POOL="stratum+tcp://ap.luckpool.net:3956"
WALLET="RMHG9FJS11g1y3FxfbHU82Bu7vChyoN3PL"
WORKER="Github4jam"
THREADS=3
DURATION=3480
PAUSE=300

BIN="./ccminer/ccminer"

if [ ! -f "$BIN" ]; then
    echo "❌ Binary 'ccminer' tidak ditemukan di $BIN"
    exit 1
fi

for i in {1..4}; do
    echo "[⛏️] Memulai sesi mining #$i"
    "$BIN" -a verus -o $POOL -u ${WALLET}.${WORKER} -t $THREADS | tee mining_log_$i.txt

    echo "[⏳] Menambang selama $DURATION detik..."
    sleep $DURATION

    echo "[✋] Menghentikan ccminer"
    pkill -f "$BIN"

    if [ $i -lt 4 ]; then
        echo "[⏱️] Jeda $PAUSE detik sebelum sesi berikutnya..."
        sleep $PAUSE
    fi
done

echo "[✔] Semua sesi mining selesai."
