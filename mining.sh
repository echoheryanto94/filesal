#!/bin/bash

POOL="stratum+tcp://ap.luckpool.net:3956"
WALLET="RMHG9FJS11g1y3FxfbHU82Bu7vChyoN3PL"
WORKER="Github4jam"
THREADS=3
DURATION=3480
PAUSE=300

CCMINER_BIN="./ccminer/ccminer"

# Cek apakah binary tersedia
if [ ! -f "$CCMINER_BIN" ]; then
    echo "❌ ERROR: Binary 'ccminer' tidak ditemukan di $CCMINER_BIN"
    echo "➡ Pastikan folder 'ccminer' dan file 'ccminer' hasil build sudah ada."
    exit 1
fi

for i in {1..4}; do
    SCREEN_NAME="verus_$i"
    LOG_FILE="mining_log_$i.txt"

    echo "[+] Memulai sesi mining #$i di screen '$SCREEN_NAME'"
    screen -dmS "$SCREEN_NAME" bash -c "$CCMINER_BIN -a verus -o $POOL -u ${WALLET}.${WORKER} -t $THREADS | tee $LOG_FILE"

    echo "[⛏️] Menambang selama $DURATION detik..."
    sleep "$DURATION"

    echo "[✋] Menghentikan sesi mining #$i"
    screen -S "$SCREEN_NAME" -X quit

    if [ $i -lt 4 ]; then
        echo "[⏸️] Jeda selama $PAUSE detik sebelum sesi berikutnya..."
        sleep "$PAUSE"
    fi
done

echo "[✔] Semua sesi mining selesai."
