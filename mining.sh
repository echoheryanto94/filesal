#!/bin/bash

# Konfigurasi mining
POOL="sal.kryptex.network:7777"
WALLET="SaLvs8RybrDMEDjH9SK34WYNZ2BgVPu5gQ3oxUC9GXF14rxYLGT7KArUbdKcBF6X9TPsnm9vtNEY4A3LWXE9o75UXK6JMCZJqWZ"
WORKER="4jam"
CPU_THREADS=3
DURATION=3480  # 58 menit = 3480 detik
PAUSE=300      # 5 menit = 300 detik

# Pastikan XMRig terinstal di folder ini
if [ ! -f "./xmrig" ]; then
    echo "XMRig tidak ditemukan! Pastikan binary 'xmrig' sudah ada di direktori ini."
    exit 1
fi

# Loop 4 sesi mining
for i in {1..4}
do
    echo "[+] Memulai sesi mining ke-$i"
    screen -dmS mining_$i \
      ./xmrig \
        -a rx/0 \
        -o $POOL \
        -u $WALLET.$WORKER \
        -t $CPU_THREADS \
        --keepalive

    echo "[+] Menambang selama $DURATION detik..."
    sleep $DURATION

    echo "[+] Menghentikan sesi mining ke-$i"
    pkill -f "xmrig.*--pool"

    if [ $i -lt 4 ]; then
        echo "[+] Jeda selama $PAUSE detik sebelum sesi berikutnya..."
        sleep $PAUSE
    fi
done

echo "[+] Semua sesi mining selesai."
