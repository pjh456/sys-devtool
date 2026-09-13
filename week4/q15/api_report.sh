#!/usr/bin/env bash
set -euo pipefail

URL="${1:-http://127.0.0.1:8000/packages.json}"
OUT="${2:-summary.md}"

curl -fsS "$URL" |
  jq -r '
    [ .[]
      | select(.status == "active" and .downloads >= 100)
    ]
    | sort_by([-.downloads, .name])
    | (["# Active Packages Report", "",
        "| name | version | downloads |",
        "| --- | --- | --- |"]
       + [ .[] | "| \(.name) | \(.version) | \(.downloads) |" ])
    | .[]
  ' > "$OUT"
