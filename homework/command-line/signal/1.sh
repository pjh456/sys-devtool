#!/bin/sh
set -euo pipefail
set -m

sleep 10000 &
SLEEP_PID=$!

sleep 0.5 # wait for process
kill -TSTP $SLEEP_PID # Ctrl+Z
sleep 0.5

bg
pgrep -af "sleep 10000"
pkill -f "sleep 10000"
