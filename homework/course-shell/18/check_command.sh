#!/bin/sh
cat ~/.bash_history | sort | uniq -c | sort -nk1,1 | tail -n1 | awk '{ print $2 }'
