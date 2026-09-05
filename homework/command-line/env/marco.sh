marco() {
	export MARCO_POLO_DIR="$(pwd)"
}
polo() {
	if [ -z "$MARCO_POLO_DIR" ]; then
		echo "Error: Run 'marco' first!"
		return 1
	fi
	cd "$MARCO_POLO_DIR" || echo "Error: Directory no longer exists!"
}
