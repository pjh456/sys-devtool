#!/bin/sh
printf 'a 50 x\nb 150 y\nc 200 z\n' | awk '$2 > 100 { print $3, $2, $1 }'
