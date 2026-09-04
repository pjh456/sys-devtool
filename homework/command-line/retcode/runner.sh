#!/usr/bin/env bash
CNT=0
while true; do
	if ./worker.sh 1> stdout.log 2> stderr.log; then
		((CNT++))
	else
		cat stdout.log
		cat stderr.log
		echo "Error happens after $CNT trials"
		break
	fi
done
