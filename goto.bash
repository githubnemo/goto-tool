# To be sourced in your .bashrc

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

goget() {
	DIR=$(goto-tool get $1) && goto-tool use $1 >/dev/null && echo $DIR${2:+/$2}
}
