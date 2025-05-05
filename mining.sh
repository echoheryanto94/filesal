#!/bin/bash

# Konfigurasi mining
POOL="de.2realminer.com:1111"
WALLET="SaLvs8RybrDMEDjH9SK34WYNZ2BgVPu5gQ3oxUC9GXF14rxYLGT7KArUbdKcBF6X9TPsnm9vtNEY4A3LWXE9o75UXK6JMCZJqWZ"
WORKER="4jam"
CPU_THREADS=3
DURATION=3480  # 58 menit
PAUSE=300      # 5 menit

# Cek apakah file 2realminer ada
if [ ! -f "./2realminer" ]; then
    echo "2RealMiner tidak ditemukan! Pastikan sudah diekstrak di folder ini."
    exit 1
fi

# Loop untuk 4 sesi mining
for i in {1..4}
do
    echo "Memulai sesi ke-$i"

    # Jalankan mining di dalam screen
    screen -dmS mining_$i ./2realminer \
      --algo verus \
      --pool $POOL \
      --wallet ${WALLET}.${WORKER} \
      --threads $CPU_THREADS

    echo "Menambang selama $DURATION detik..."
    sleep $DURATION

    # Hentikan mining
    echo "Menghentikan sesi ke-$i"
    pkill -f "2realminer.*--pool"

    # Jeda sebelum sesi berikutnya
    if [ $i -lt 4 ]; then
        echo "Jeda selama $PAUSE detik sebelum sesi berikutnya..."
        sleep $PAUSE
    fi
done

echo "Semua sesi mining selesai."
