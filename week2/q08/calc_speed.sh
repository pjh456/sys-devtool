#!/bin/sh
extract_real() {
    local file="$1"
    local time_str
    time_str=$(grep '^real' "$file" | awk '{print $2}')
    if [[ -z "$time_str" ]]; then
        echo "Cannot find real in $file" >&2
        return 1
    fi
    # format: 0m0.121s or 1m30.5s
    if [[ $time_str =~ ^([0-9]+)m([0-9.]+)s$ ]]; then
        local min=${BASH_REMATCH[1]}
        local sec=${BASH_REMATCH[2]}
        echo "$min * 60 + $sec" | bc -l
    else
        echo "Unable to extract time string: '$time_str'" >&2
        return 1
    fi
}

median() {
    local arr=($(printf "%s\n" "$@" | sort -n))
    local n=${#arr[@]}
    if (( n == 0 )); then
        echo "0"
        return
    fi
    if (( n % 2 == 1 )); then
        echo "${arr[$((n/2))]}"
    else
        local left=${arr[$((n/2 - 1))]}
        local right=${arr[$((n/2))]}
        echo "($left + $right) / 2" | bc -l
    fi
}

orig_files=( original_time*.txt )
perf_files=( perf_time*.txt )

if [[ ${#orig_files[@]} -eq 0 || ! -f ${orig_files[0]} ]]; then
    echo "Cannot find original_time*.txt" >&2
    exit 1
fi
if [[ ${#perf_files[@]} -eq 0 || ! -f ${perf_files[0]} ]]; then
    echo "Cannot find perf_time*.txt" >&2
    exit 1
fi

orig_times=()
for f in "${orig_files[@]}"; do
    val=$(extract_real "$f") || exit 1
    orig_times+=("$val")
done

perf_times=()
for f in "${perf_files[@]}"; do
    val=$(extract_real "$f") || exit 1
    perf_times+=("$val")
done

orig_median=$(median "${orig_times[@]}")
perf_median=$(median "${perf_times[@]}")
speedup=$(echo "$orig_median / $perf_median" | bc -l)

printf "before version median: %.3f s\n" "${#orig_times[@]}" "$orig_median"
printf "after version median: %.3f s\n" "${#perf_times[@]}" "$perf_median"
printf "Speed up times: %.2f\n" "$speedup"
