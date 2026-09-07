pidwait() {
	if [ $# -lt 1 ]; then
		echo "Usage: pidwait <pid>" >&2
		return 1
	fi

	local PID=$1
	while kill -0 $PID 2>/dev/null; do
		sleep 1
	done
}
