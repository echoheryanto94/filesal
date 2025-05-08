#!/bin/bash

POOL="stratum+tcp://ap.luckpool.net:3956"
WALLET="RMHG9FJS11g1y3FxfbHU82Bu7vChyoN3PL"
WORKER="Github4jam"
THREADS=$(nproc)

BIN="./VerusMiner/verusminer"

if [ ! -f "$BIN" ]; then
    echo "❌ Binary VerusMiner tidak ditemukan di $BIN"
    exit 1
fi

$BIN -a verus -o $POOL -u ${WALLET}.${WORKER} -t $THREADS
