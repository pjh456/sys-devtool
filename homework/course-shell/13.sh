#!/bin/sh
find . ~ -type f -exec basename {} \; | sed "s/.*\.//" | sort --reverse | uniq -c| sort --numeric-sort --reverse | head -5
