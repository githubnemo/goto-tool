# To be sourced in your .bashrc

# $1 godir
# [$2 directory]
goto() {
	local dir
	local ret

	if [ "$#" -eq 0 ]; then
		echo "Usage: goto <dirname> [<subpath>]"
		return 1
	fi

	dir=$(goto-tool get "$1")
	ret=$?

	if [ "$ret" -eq 0 ]; then
		goto-tool use "$1" >/dev/null

		if [ "$#" -gt 1 ]; then
			cd "$dir"/"$2"
		else
			cd "$dir"
		fi
	fi

	return $ret
}

# $1 godir
# [$2 file]
goget() {
	local DIR

	if DIR="$(goto-tool get $1)"; then
		goto-tool use $1 >/dev/null

		echo "$DIR${2:+/$2}"
	fi
}

# $1 cmd
# $2 godir
# [$3 file]
gorun() {
	local dir

	if dir="$(goget $2 $3)"; then
		$1 $dir
	fi
}
