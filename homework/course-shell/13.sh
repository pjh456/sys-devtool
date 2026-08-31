#!/bin/sh
find . ~ -t f --exec basename {} | sed "s/.*\.//" | sort --reverse | uniq -c| sort --numeric-sort --reverse | head -5
