#!/bin/sh
if [ $# -lt 1 ]; then
	echo "File Path is required!" >&2
	exit 1
fi

FP=$1
if [ -f $FP ]; then
	echo "File exists"
	exit 0
else
	echo "File doesn't exist"
	exit 1
fi
