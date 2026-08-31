#!/bin/sh
if [ $# -lt 1 ]; then
	echo "File path is required!"
	exit 1
fi

FP=$1

if [ ! -f $FP ]; then
	echo "File is not found in $(FP)"
	exit 1
fi

FPP=$(dirname "$FP")
FNEXT=$(basename $FP)
FN="${FNEXT%.*}"
EXT="${FNEXT##*.}"
NFN="$FN-$(date +%Y-%m-%d).$EXT"
ABSNFP="$FPP/$NFN"

cp $FP $ABSNFP
echo "Copy $FP to $ABSNFP"
