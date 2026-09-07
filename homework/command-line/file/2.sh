#!/bin/sh
if [ $# -lt 1 ]; then
	echo "Directory is required!" >&2
	exit 1
fi
FP=$1
if [ ! -e $FP ]; then
	echo "Directory is missing!" >&2
	exit 1
fi
find $FP -type f -printf '%T@ %p\0' | sort -rnz | cut -z -d' ' -f2- | tr '\0' '\n'
