#!/bin/sh

if [ $# -lt 1 ]; then
	echo "input path is required" >&2
	return 1
fi

path=$1

if [[ ! -e "$path" ]]; then
	echo "$path is not found" >&2
	return 1
fi

if [[ ! -f "$path" ]]; then
	echo "$path is not a file" >&2
	return 1
fi

case "$path" in
	*.csv) ;;
	*) echo "$path is not a CSV file" >&2; return 1 ;;
esac

cat $path
