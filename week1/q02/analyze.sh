#!/bin/sh

if [ $# -lt 1 ]; then
	echo "input path is required" >&2
	exit 1
fi

path=$1

if [ ! -e "$path" ]; then
	echo "$path is not found" >&2
	exit 1
fi

if [ ! -f "$path" ]; then
	echo "$path is not a file" >&2
	exit 1
fi

case "$path" in
	*.csv) ;;
	*) echo "$path is not a CSV file" >&2; exit 1 ;;
esac

awk -F "," 'NR==1{for(i=1;i<=NF;i++)h[$i]=i} NR>1 && $h["status"] ~ /^5[0-9]{2}$/ {print $h["path"]}' "$path" |
	sort | uniq -c | sort -k1,1rn -k2,2 | sed 's/^ *//' | head -2

awk -F "," 'NR==1{for(i=1;i<=NF;i++)h[$i]=i} NR>1 {sum+=$h["latency_ms"]} END {printf "%.2f\n", sum/(NR-1)}' "$path"
