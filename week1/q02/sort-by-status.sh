#!/bin/sh
awk -F "," 'NR==1{for(i=1;i<=NF;i++)h[$i]=i} NR>1 && $h["status"] ~ /^5[0-9]{2}$/ {print $h["path"]}' access.csv | sort | uniq -c | sort -k1,1rn -k2,2 | sed 's/^ *//'
