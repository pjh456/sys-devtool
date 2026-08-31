#!/bin/sh
awk -F "," 'NR==1{for(i=1;i<=NF;i++)h[$i]=i} NR>1 {sum+=$h["latency_ms"]} END {printf "%.2f\n", sum/(NR-1)}' access.csv
